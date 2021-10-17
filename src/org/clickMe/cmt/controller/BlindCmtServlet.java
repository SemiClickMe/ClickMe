package org.clickMe.cmt.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.cmt.model.Service.CmtService;



@WebServlet("/cmt/blind")
public class BlindCmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/WEB-INF/views/cmt/cmtblind.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CmtService cmtService = new CmtService();
		Map<String, Object> blindCmt = new HashMap<>();
		
		blindCmt.put("code", Integer.valueOf(request.getParameter("code")));
		blindCmt.put("Yn", request.getParameter("yn"));
		
		String forwardingPath = "/WEB-INF/views/cmt/cmtblind.jsp";
		if (cmtService.blindCmt(blindCmt)) {
			request.setAttribute("isDMLSuccess", "success");
		} else {
			request.setAttribute("isDMLSuccess", "fail");
		}
			

		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}


}
