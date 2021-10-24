package org.clickMe.post.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/modify")
public class ModifyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 6515299156555403651L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, Object> postInfo = new HashMap<>();
		
		System.out.println(ModifyPostServlet.class.getName() + " is successfully called.");
		
		int code = Integer.valueOf(request.getParameter("code"));
		String catName = request.getParameter("catName");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int itemPrice = Integer.valueOf(request.getParameter("itemPrice"));
		
		postInfo.put("code", code);
		postInfo.put("catName", catName);
		postInfo.put("title", title);
		postInfo.put("content", content);
		postInfo.put("itemPrice", itemPrice);
		System.out.println("post info from detail post : " + postInfo);
		
		request.setAttribute("postInfo", postInfo);
		
		String forwardingPath = "/WEB-INF/views/post/modifyPostForm.jsp";
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> postInfo = new HashMap<>();
		
		System.out.println(ModifyPostServlet.class.getName() + " is successfully called.");
		
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.valueOf(request.getParameter("code"));
		int catCode = Integer.valueOf(request.getParameter("catCode"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		/* 
		 * when wrap the parameter come from front-end from String to integer(Integer),
		 * need to decide whether the parameter is empty("") to avoid NumberFormatException.
		 */
//		String itemPriceStr = request.getParameter("itemPrice");
//		int itemPrice = 0;		// value 0 is filtered by SQL query in mapper.
//		if (!itemPriceStr.isEmpty()) {
//			itemPrice = Integer.valueOf(itemPriceStr);
//		}
		int itemPrice = Integer.valueOf(request.getParameter("itemPrice"));
		
		postInfo.put("code", code);
		postInfo.put("catCode", catCode);
		postInfo.put("title", title);
		postInfo.put("content", content);
		postInfo.put("itemPrice", itemPrice);
		System.out.println("post info from modfiy post form" + postInfo);
		
		String forwardingPath = "";
		if (postService.modifyPost(postInfo)) {
			forwardingPath = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "modifyPost");
			request.setAttribute("code", code);
		} else {
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "modifyPost");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
