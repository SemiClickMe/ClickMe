package org.clickMe.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.dto.DetailPostDTO;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/list/detail")
public class SelectSinglePostServlet extends HttpServlet {
	private static final long serialVersionUID = -6870548463362924569L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		DetailPostDTO detailPost = new DetailPostDTO();
		
		System.out.println(SelectSinglePostServlet.class.getName() + " is successfully called.");
		
		int code = Integer.valueOf(request.getParameter("code"));
		System.out.println("code from front-end : " + code);
		
		detailPost = postService.selectSinglePost(code);
		
		String forwardingPath = "";
		if (detailPost != null) {
			forwardingPath = "/WEB-INF/views/post/detailPostForAdmin.jsp";
			System.out.println(detailPost);
			request.setAttribute("detailPost", detailPost);
			resultView.printSuccessMessage("openSinglePost");
		} else {
			resultView.printErrorMessage("openSinglePost");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
