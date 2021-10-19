package org.clickMe.cmt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.cmt.model.Service.CmtService;
import org.clickMe.common.model.dto.CmtDTO;

@WebServlet("/cmt/insert")
public class InsertCmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/WEB-INF/views/cmt/cmtForm.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
		
		CmtDTO newCmt = new CmtDTO();
		newCmt.setContent(content);
		
		CmtService cmtService = new CmtService();		
		int result = cmtService.insertCmt(newCmt);


		String path = "";
		if (result > 0) {
			path = "/WEB-INF/views/cmt/cmtlist.jsp";
			System.out.println("Insert Success");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			System.out.println("Insert Fail");
			request.setAttribute("isDMLSuccess", "fail");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

}
