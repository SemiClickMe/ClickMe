package org.clickMe.cmt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.cmt.model.Service.CmtService;
import org.clickMe.common.model.dto.CmtDTO;

@WebServlet("/cmt/list")
public class SelectAllCmtCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CmtService cmtService = new CmtService();
		List<CmtDTO> cmtList = cmtService.selectAllCode();

		String path = "";
		if (cmtList != null) {
			path = "/WEB-INF/views/cmt/cmtlist.jsp";
			request.setAttribute("cmtList", cmtList);
		} else {
			System.out.println("실패");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

}
