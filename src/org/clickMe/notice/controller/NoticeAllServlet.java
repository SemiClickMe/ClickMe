package org.clickMe.notice.controller;
//공지사항 전체 조회
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.NoticeResultView;
import org.clickMe.notice.model.service.NoticeService;

@WebServlet("/notice/list/allNotice")
public class NoticeAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		NoticeService noticeService = new NoticeService();
		NoticeResultView noticeResultView = new NoticeResultView();
		
		/* NoticeDTO에 담긴 정보를 NoticeService에 있는 selectAllNotice()메소드와 연결 */
		List<NoticeDTO> noticeList = noticeService.selectAllNotice();
		
		for(NoticeDTO notice : noticeList) {
			System.out.println(notice);
		}
		
		String forwardingPath = "";
		if(!noticeList.isEmpty()) {
			forwardingPath = "/WEB-INF/views/notice/NoticeAllList.jsp";
			/* request 형식으로 받는데, "noticeList"를 noticeList라는 값으로 저장 */
			/* 죽, noticeList가 비어 있지 않다면 그대로 출력 */
			request.setAttribute("noticeList", noticeList);
		} else {
			noticeResultView.printErrorMessage("search");
		}
		/*  getRequestDispatcher() =  페이지출력, 페이지전환 및 특정 url로 재 요청 */
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}
}
