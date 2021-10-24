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

import org.clickMe.post.model.dto.PostForUserDTO;
import org.clickMe.post.model.service.PostService;
import org.clickMe.post.paging.PostPageCriteria;
import org.clickMe.post.paging.PostPagenationForUser;

@WebServlet("/post/list")
public class SelectPostForUserServlet extends HttpServlet {
	private static final long serialVersionUID = 2961979011781918667L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PostService postService = new PostService();
		
		System.out.println(SelectPostForUserServlet.class.getName() + " is successfully called.");
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;	// default start page
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.valueOf(currentPage);
		}
		
		/* 사용자가 검색한 검색 옵션 parameter 가져오기 */
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("======(Validation : null parameter check)======");
		String authCodeStr = request.getParameter("authCode");
		int authCode = 0;
		if (authCodeStr != null && !"".equals(authCodeStr)) {
			System.out.println("authCodeStr is not null and empty.");
			authCode = Integer.valueOf(authCodeStr);
		} else {
			System.out.println("authCodeStr is null or empty.");
		}
		System.out.println(authCodeStr + " / " + authCode);
		
		String itemPriceRangeMinStr = request.getParameter("itemPriceRangeMin");
		int itemPriceRangeMin = -1;
		if (itemPriceRangeMinStr != null && !"".equals(itemPriceRangeMinStr)) {
			System.out.println("itemPriceRangeMinStr is not null and empty.");
			itemPriceRangeMin = Integer.valueOf(itemPriceRangeMinStr);
		} else {
			System.out.println("itemPriceRangeMinStr is null or empty.");
		}
		System.out.println(itemPriceRangeMinStr + " / " + itemPriceRangeMin);
		
		String itemPriceRangeMaxStr = request.getParameter("itemPriceRangeMax");
		int itemPriceRangeMax = -1;
		if (itemPriceRangeMaxStr != null && !"".equals(itemPriceRangeMaxStr)) {
			System.out.println("itemPriceRangeMaxStr is not null and empty.");
			itemPriceRangeMax = Integer.valueOf(itemPriceRangeMaxStr);
		} else {
			System.out.println("itemPriceRangeMaxStr is null or empty.");
		}
		System.out.println(itemPriceRangeMaxStr + " / " + itemPriceRangeMax);
		System.out.println("===============================================");
		
		if (itemPriceRangeMin == -1 && itemPriceRangeMax > 0) {itemPriceRangeMin = 0;}
		if (itemPriceRangeMin >= 0 && itemPriceRangeMax == -1) {itemPriceRangeMax = 999999999;}
		
		/* 검색 옵션 및 값들을 저장할 Map 생성 */
		Map<String, Object> searchOption = new HashMap<>();
		searchOption.put("title", title);
		searchOption.put("content", content);
		searchOption.put("authCode", authCode);
		searchOption.put("itemPriceRangeMin", itemPriceRangeMin);
		searchOption.put("itemPriceRangeMax", itemPriceRangeMax);
		
		System.out.println("searchOption Map = " + searchOption);
		
		/* 검색 옵션들이 저장된 조건의 게시글이 '몇 개'인지 SELECT */
		int totalPostCount = postService.selectTotalPostCount(searchOption);
		System.out.println("검색 조건으로 검색된 총 게시글 수 : " + totalPostCount);
		
		int limitPostNumPerPage = 6;	// 페이지 당 조회되는 게시글 수
		int buttonAmount = 5;			// 페이징 버튼 수
		
		PostPageCriteria postPageCriteria = null;
		
		if (title != null && !"".equals(title)
				|| content != null && !"".equals(content)
				|| authCodeStr != null && !"".equals(authCodeStr)
				|| itemPriceRangeMinStr != null && !"".equals(itemPriceRangeMinStr)
				|| itemPriceRangeMaxStr != null && !"".equals(itemPriceRangeMaxStr)) {
			
			/* 화면단의 검색 옵션들 중, 단 하나라도 parameter로 넘어왔을 때. */
			postPageCriteria = PostPagenationForUser.getPostPageCriteria(pageNo, totalPostCount, limitPostNumPerPage, buttonAmount,
					title, content, authCode, itemPriceRangeMin, itemPriceRangeMax);
		} else {
			
			/* 화면단의 검색 옵션들 중, 단 하나도 parameter로 넘어오지 않았을 때. = 게시판 처음 들어왔을 때. */
			postPageCriteria = PostPagenationForUser.getPostPageCriteria(pageNo, totalPostCount, limitPostNumPerPage, buttonAmount);
		}
		
		System.out.println(postPageCriteria);
		
		/* 페이징이 적용된 게시글 SELECT */
		List<PostForUserDTO> postListForUser = postService.selectPostForUser(postPageCriteria);
		System.out.println("postListForUser : " + postListForUser);
		
		String forwardingPath = "";
		if (postListForUser != null) {
			System.out.println("postListForUser is not null.");
			forwardingPath = "/WEB-INF/views/post/postList.jsp";
			request.setAttribute("postList", postListForUser);
			request.setAttribute("postPageCriteria", postPageCriteria);
		} else {
			System.out.println("postListForUser is null.");
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "listPostForUser");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
