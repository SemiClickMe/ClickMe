package org.clickMe.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.model.dto.DetailPostDTO;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/list/detail")
public class DetailPostServlet extends HttpServlet {
	private static final long serialVersionUID = 6593863185353777621L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		
		System.out.println(DetailPostServlet.class.getName() + " is successfully called.");
		
		int code = Integer.valueOf(request.getParameter("code"));
		System.out.println("Code of detail post : " + code);
		
		DetailPostDTO detailPost = postService.selectDetailPostForUser(code);
		System.out.println(detailPost);
		
		String forwardingPath = "";
		if (detailPost != null) {
			forwardingPath = "/WEB-INF/views/post/detailPostForUser.jsp";
			request.setAttribute("detailPost", detailPost);
		} else {
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "selectDetailPost");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
