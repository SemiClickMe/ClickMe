package org.clickMe.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.notice.NoticeResultView;
import org.clickMe.notice.model.service.NoticeService;
//공지사항 수정
@WebServlet("/notice/modify")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		NoticeService noticeService = new NoticeService();
		NoticeResultView noticeResultView = new NoticeResultView();
		Map<String, Object> noticeInfo = new HashMap<>();
		
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.valueOf(request.getParameter("code"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		noticeInfo.put("code", code);
		noticeInfo.put("title", title);
		noticeInfo.put("content", content);
		
		String forwardingPath = "/WEB-INF/views/notice/NoticeModify.jsp";
		if (noticeService.modifyNotice(noticeInfo)) {
			noticeResultView.printSuccessMessage("update");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			noticeResultView.printErrorMessage("update");
			request.setAttribute("isDMLSuccess", "fail");
		}
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

}
