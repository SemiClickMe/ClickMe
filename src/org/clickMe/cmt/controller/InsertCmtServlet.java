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



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int postCode = Integer.valueOf(request.getParameter("postCode"));
		String content = request.getParameter("content");
		
		CmtDTO newCmt = new CmtDTO();
		newCmt.setContent(content);
		newCmt.setPostCode(postCode);
		
		CmtService cmtService = new CmtService();		
		


		String forwardingPath = "";
		if (cmtService.insertCmt(newCmt)) {
			forwardingPath = "/WEB-INF/views/common/success.jsp";
			System.out.println("Insert Success");
			request.setAttribute("successCode", "insertCmt");
		} else {
			forwardingPath = "/WEB-INF/views/common/fail.jsp";
			System.out.println("Insert Fail");
			request.setAttribute("errorCode", "insertCmt");
		}

		request.getRequestDispatcher(forwardingPath).forward(request, response);
		

	}

}
