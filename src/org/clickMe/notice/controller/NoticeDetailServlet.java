package org.clickMe.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.model.service.NoticeService;

@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("code"));
		System.out.println("공지사항 코드 : " + no);
		NoticeService noticeService = new NoticeService();
		NoticeDTO noticeDetail = noticeService.selectNoticeDetail(no);
		
		System.out.println("noticeDetail : " + noticeDetail);
		
		String path = "";
		if(noticeDetail != null) {
			path = "/WEB-INF/views/notice/NoticeDetail.jsp";
			request.setAttribute("notice", noticeDetail);
		} else {
			System.out.println("기능동작안함");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
