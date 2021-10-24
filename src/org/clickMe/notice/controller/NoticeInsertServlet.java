package org.clickMe.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.NoticeResultView;
import org.clickMe.notice.model.service.NoticeService;
//공지사항 동록
@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = -5348982071398553725L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/notice/NoticeInsert.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeService noticeService = new NoticeService();
		NoticeResultView noticeResultView = new NoticeResultView();
		NoticeDTO notice = new NoticeDTO();
		
		request.setCharacterEncoding("UTF-8");
		
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		
		String forwardingPath = "";
		if (noticeService.registNotice(notice)) {
			forwardingPath = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertNotice");
		} else {
			forwardingPath = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorCode", "insertNotice");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}
}
