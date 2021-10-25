package org.clickMe.post.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.dto.PostForAdminDTO;
import org.clickMe.post.model.service.PostService;
import org.clickMe.post.paging.PostPageCriteria;
import org.clickMe.post.paging.PostPagenationForAdmin;

@WebServlet("/post/list/admin")
public class SelectPostForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 6309250133151449527L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		
		System.out.println(SearchPostServlet.class.getName() + " is successfully called.");
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;	// default start page
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.valueOf(currentPage);
		}
		
		/* 사용자가 검색한 검색 옵션 parameter 가져오기 */
		String sellerId = request.getParameter("sellerId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String blindYn = request.getParameter("blindYn");
		
		System.out.println("======(Validation : null parameter check)======");
		String authCodeStr = request.getParameter("authCode");
		int authCode = 0;
		if (authCodeStr != null && !"default".equals(authCodeStr)) {
			authCode = Integer.valueOf(authCodeStr);
			System.out.println("authCodeStr is not null and empty.");
		} else {
			System.out.println("authCodeStr is null or empty.");
		}
		System.out.println(authCodeStr + " / " + authCode);
		System.out.println("===============================================");
		
		/* 검색 옵션 및 값들을 저장할 Map 생성 */
		Map<String, Object> searchOption = new HashMap<>();
		searchOption.put("sellerId", sellerId);
		searchOption.put("title", title);
		searchOption.put("content", content);
		searchOption.put("authCode", authCode);
		searchOption.put("blindYn", blindYn);
		
		System.out.println("searchOption Map = " + searchOption);
		
		/* 검색 옵션들이 저장된 조건의 게시글이 '몇 개'인지 SELECT */
		int totalPostCount = postService.selectTotalPostCount(searchOption);
		System.out.println("검색 조건으로 검색된 총 게시글 수 : " + totalPostCount);
		
		int limitPostNumPerPage = 10;	// 페이지 당 조회되는 게시글 수
		int buttonAmount = 5;			// 페이징 버튼 수
		
		PostPageCriteria postPageCriteria = null;
		
		if (title != null && !"".equals(title)
				|| content != null && !"".equals(content)
				|| authCodeStr != null && !"".equals(authCodeStr)
				|| sellerId != null && !"".equals(sellerId)
				|| blindYn != null && !"".equals(blindYn)) {
			
			/* 화면단의 검색 옵션들 중, 단 하나라도 parameter로 넘어왔을 때. */
			postPageCriteria = PostPagenationForAdmin.getPostPageCriteria(pageNo, totalPostCount, limitPostNumPerPage, buttonAmount,
					title, content, authCode, sellerId, blindYn);
		} else {
			
			/* 화면단의 검색 옵션들 중, 단 하나도 parameter로 넘어오지 않았을 때. = 게시판 처음 들어왔을 때. */
			postPageCriteria = PostPagenationForAdmin.getPostPageCriteria(pageNo, totalPostCount, limitPostNumPerPage, buttonAmount);
		}
		
		System.out.println(postPageCriteria);
		
		/* 페이징이 적용된 게시글 SELECT */
		List<PostForAdminDTO> postListForAdmin = postService.selectPostForAdmin(postPageCriteria);
		System.out.println("postListForAdmin : " + postListForAdmin);
		
		/* have to forward to postManagement.jsp anyway whether ResultSet is empty or not. */
		String forwardingPath = "";
		if (postListForAdmin != null) {
			System.out.println("postListForAdmin is not null.");
			forwardingPath = "/WEB-INF/views/post/postManageMain.jsp";
			request.setAttribute("postList", postListForAdmin);
			request.setAttribute("postPageCriteria", postPageCriteria);
		} else {
			System.out.println("postListForAdmin is null.");
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "listPostForAdmin");
		}
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
