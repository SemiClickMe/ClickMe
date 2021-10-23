package org.clickMe.notice.controller;

import java.io.IOException;
import java.sql.Date;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeService noticeService = new NoticeService();
		NoticeResultView noticeResultView = new NoticeResultView();
		NoticeDTO notice = new NoticeDTO();
		
		request.setCharacterEncoding("UTF-8");
		
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		
		String forwardingPath = "/WEB-INF/views/notice/NoticeInsert.jsp";
		if (noticeService.registNotice(notice)) {
			noticeResultView.printSuccessMessage("insert");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			noticeResultView.printErrorMessage("insert");
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
		System.out.println("야호");
	}
}
