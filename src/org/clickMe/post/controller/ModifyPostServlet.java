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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> postInfo = new HashMap<>();
		
		System.out.println(ModifyPostServlet.class.getName() + " is successfully called.");
		
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.valueOf(request.getParameter("code"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		/* 
		 * when wrap the parameter come from front-end from String to integer(Integer),
		 * need to decide whether the parameter is empty("") to avoid NumberFormatException.
		 */
		String itemPriceStr = request.getParameter("itemPrice");
		int itemPrice = 0;		// value 0 is filtered by SQL query in mapper.
		if (!itemPriceStr.isEmpty()) {
			itemPrice = Integer.valueOf(itemPriceStr);
		}
		
		postInfo.put("code", code);
		postInfo.put("title", title);
		postInfo.put("content", content);
		postInfo.put("itemPrice", itemPrice);
		System.out.println("parameter : " + postInfo);
		
		String forwardingPath = "/WEB-INF/views/post/modifyPost.jsp";
		if (postService.modifyPost(postInfo)) {
			resultView.printSuccessMessage("update");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			resultView.printErrorMessage("update");
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
