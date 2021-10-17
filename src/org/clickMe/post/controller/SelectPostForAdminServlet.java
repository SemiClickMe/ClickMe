package org.clickMe.post.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.dto.PostForAdminDTO;
import org.clickMe.post.model.service.PostService;

@WebServlet("/post/list/admin")
public class SelectPostForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 6309250133151449527L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		PostUnitTestResultView resultView = new PostUnitTestResultView();
		Map<String, Object> parameter = new HashMap<>();
		
		System.out.println(SearchPostServlet.class.getName() + " is successfully called.");
		
		String sellerId = request.getParameter("sellerId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		/* need to avoid NumberFormatException */
		String authCodeStr = request.getParameter("authCode");
		int authCode = 0;
		if (null != authCodeStr && !authCodeStr.equals("default")) {
			authCode = Integer.valueOf(authCodeStr);
		}
		String blindYn = request.getParameter("blindYn");
		
		parameter.put("sellerId", sellerId);
		parameter.put("title", title);
		parameter.put("content", content);
		parameter.put("authCode", authCode);
		parameter.put("blindYn", blindYn);
		
		System.out.println("parameter=" + parameter);
		
		List<PostForAdminDTO> postList = postService.selectPostForAdmin(parameter);
		
		/* have to forward to postManagement.jsp anyway whether ResultSet is empty or not. */
		String forwardingPath = "/WEB-INF/views/post/postManageMain.jsp";
		if (!postList.isEmpty()) {
			request.setAttribute("postList", postList);
		} else {
			resultView.printErrorMessage("selectListWithSearchOption");
		}
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
