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

@WebServlet("/post/modify/admin")
public class ModifyPostAdminServlet extends HttpServlet {
	private static final long serialVersionUID = -3050291238982127078L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> parameter = new HashMap<>();
		
		System.out.println(ModifyPostAdminServlet.class.getName() + " is successfully called.");
		
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.valueOf(request.getParameter("code"));
		int authCode = Integer.valueOf(request.getParameter("authStatus"));
		String blindYn = request.getParameter("blindYn");
		int catCode = Integer.valueOf(request.getParameter("catName"));
		
		parameter.put("code", code);
		parameter.put("authCode", authCode);
		parameter.put("blindYn", blindYn);
		parameter.put("catCode", catCode);
		
		String forwardingPath = "/WEB-INF/views/post/detailPostForAdmin.jsp";
		if (postService.modifyPostAdmin(parameter)) {
			resultView.printSuccessMessage("update");
		} else {
			resultView.printErrorMessage("update");
		}

		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
