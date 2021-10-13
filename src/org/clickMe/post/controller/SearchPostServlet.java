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
import org.clickMe.post.model.dto.SearchOption;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/list/searchPost")
public class SearchPostServlet extends HttpServlet {
	private static final long serialVersionUID = -7475133994662430240L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		SearchOption searchOption = new SearchOption();
		
		System.out.println(SelectAllPostServlet.class.getName() + " is successfully called.");
		
		searchOption.setOption(request.getParameter("searchOption"));
		searchOption.setValue(request.getParameter("searchValue"));
		
		System.out.println(searchOption);
		
		List<PostDTO> searchedPostList = postService.selectPostBySearchOption(searchOption);
		
		String forwardingPath = "";
		if (!searchedPostList.isEmpty()) {
			forwardingPath = "/WEB-INF/views/post/searchedPostList.jsp";
			request.setAttribute("searchedPostList", searchedPostList);
		} else {
			resultView.printErrorMessage("selectListWithSearchOption");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
