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

@WebServlet("/post/list/admin")
public class SelectPostForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 6309250133151449527L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> parameter = new HashMap<>();
		
		System.out.println(SearchPostServlet.class.getName() + " is successfully called.");
		
		String sellerId = request.getParameter("sellerId");
//		System.out.println("sellerId:" + sellerId);
		String title = request.getParameter("title");
//		System.out.println("title:" + title);
		String content = request.getParameter("content");
//		System.out.println("content:" + content);
		/* need to avoid NumberFormatException */
		String authCodeStr = request.getParameter("authCode");
//		System.out.println("authCode:" + authCodeStr);
		int authCode = 0;
		if (null != authCodeStr && !authCodeStr.equals("default")) {
			authCode = Integer.valueOf(authCodeStr);
		}
		String blindYn = request.getParameter("blindYn");
//		System.out.println("blind:" + blindYn);
//		String itemPriceMinStr = request.getParameter("itemPriceMin");
//		int itemPtriceMin = 0;
//		if (!itemPriceMinStr.isEmpty()) {
//			itemPtriceMin = Integer.valueOf(itemPriceMinStr);
//		}
//		String itemPriceMaxStr = request.getParameter("itemPriceMax");
//		int itemPtriceMax = 0;
//		if (!itemPriceMaxStr.isEmpty()) {
//			itemPtriceMax = Integer.valueOf(itemPriceMaxStr);
//		}
		
		parameter.put("sellerId", sellerId);
		parameter.put("title", title);
		parameter.put("content", content);
		parameter.put("authCode", authCode);
		parameter.put("blindYn", blindYn);
//		parameter.put("itemPtriceMin", itemPtriceMin);
//		parameter.put("itemPtriceMax", itemPtriceMax);
		
		System.out.println("parameter=" + parameter);
		
		List<PostForAdminDTO> postList = postService.selectPostForAdmin(parameter);
		
		String forwardingPath = "/WEB-INF/views/post/postManagement.jsp";
		if (!postList.isEmpty()) {
//			forwardingPath = "/WEB-INF/views/post/postManagement.jsp";
//			request.setAttribute("postList", postList);
		} else {
			resultView.printErrorMessage("selectListWithSearchOption");
		}
		request.setAttribute("postList", postList);
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
