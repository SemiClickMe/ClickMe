package org.clickMe.post.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/list/allPost")
public class SelectAllPostServlet extends HttpServlet {
	private static final long serialVersionUID = 8694622948947377402L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		
		System.out.println(SelectAllPostServlet.class.getName() + " is successfully called.");
		
		List<PostDTO> postList = postService.selectAllPost();
		
		for (PostDTO post : postList) {
			System.out.println(post);
		}
		
		String forwardingPath = "";
		if (!postList.isEmpty()) {
			forwardingPath = "/WEB-INF/views/post/postListTest.jsp";
			request.setAttribute("postList", postList);
		} else {
			resultView.printErrorMessage("selectList");
		}
		
//		if (postList != null) {
//			System.out.println("3. postList != null test");
//		} else {
//			System.out.println("4. postList != null test");
//		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
