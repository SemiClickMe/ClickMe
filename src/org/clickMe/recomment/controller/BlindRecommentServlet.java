package org.clickMe.recomment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.recomment.model.service.RecommentService;

@WebServlet("/recomment/blind")
public class BlindRecommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/WEB-INF/views/recomment/recommentBlind.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RecommentService recommentService = new RecommentService();
		Map<String, Object> blindRecomment = new HashMap<>();
		
		blindRecomment.put("code", Integer.valueOf(request.getParameter("code")));
		blindRecomment.put("Yn", request.getParameter("yn"));
		
		String forwardingPath = "/WEB-INF/views/recomment/recommentBlind.jsp";
		if (recommentService.blindRecomment(blindRecomment)) {
			request.setAttribute("isDMLSuccess", "success");
		} else {
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
