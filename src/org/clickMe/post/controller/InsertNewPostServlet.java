package org.clickMe.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/insert")
public class InsertNewPostServlet extends HttpServlet {
	private static final long serialVersionUID = -8778735518639133878L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		PostDTO post = new PostDTO();
		
		System.out.println(SelectAllPostServlet.class.getName() + " is successfully called.");
		
		request.setCharacterEncoding("UTF-8");
		
		post.setSellerCode(Integer.valueOf(request.getParameter("sellerCode")));
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		post.setItemPrice(Integer.valueOf(request.getParameter("itemPrice")));
		
		String forwardingPath = "/WEB-INF/views/post/insertPost.jsp";
		if (postService.insertNewPost(post)) {
			resultView.printSuccessMessage("insert");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			resultView.printErrorMessage("insert");
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
