package org.clickMe.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/delete")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = -7923101865376518182L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		
		System.out.println(DeletePostServlet.class.getName() + " is successfully called.");
		
		int code = Integer.valueOf(request.getParameter("code"));
		System.out.println("Delete post code : " + code);
		
		String forwardingPath = "";
		if (postService.deletePost(code)) {
			forwardingPath = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deletePost");
			request.setAttribute("code", code);
		} else {
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "deletePost");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		PostService postService = new PostService();
//		PostUnitTestResultView resultView = new PostUnitTestResultView();
//		
//		System.out.println(DeletePostServlet.class.getName() + " is successfully called.");
//		
//		request.setCharacterEncoding("UTF-8");
//		
//		int code = Integer.valueOf(request.getParameter("code"));
//		
//		String forwardingPath = "/WEB-INF/views/post/deletePost.jsp";
//		if (postService.deletePostByCode(code)) {
//			resultView.printSuccessMessage("delete");
//			request.setAttribute("isDMLSuccess", "success");
//		} else {
//			resultView.printErrorMessage("delete");
//			request.setAttribute("isDMLSuccess", "fail");
//		}
//		
//		request.getRequestDispatcher(forwardingPath).forward(request, response);
//	}

}
