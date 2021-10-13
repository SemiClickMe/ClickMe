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

@WebServlet("/post/modify/blind")
public class ModifyPostBlindServlet extends HttpServlet {
	private static final long serialVersionUID = -2736173940537605744L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> postInfo = new HashMap<>();
		
		System.out.println(ModifyPostBlindServlet.class.getName() + " is successfully called.");
		
		request.setCharacterEncoding("UTF-8");
		
		postInfo.put("code", Integer.valueOf(request.getParameter("code")));
		postInfo.put("blindYn", request.getParameter("blindYn"));
		
		String forwardingPath = "/WEB-INF/views/post/modifyPostBlind.jsp";
		if (postService.modifyPostBlind(postInfo)) {
			resultView.printSuccessMessage("blind");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			resultView.printErrorMessage("blind");
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
