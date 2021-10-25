package org.clickMe.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.NoticeResultView;
import org.clickMe.notice.model.dto.NoticeSearch;
import org.clickMe.notice.model.service.NoticeService;

//공지사항 검색 조회
@WebServlet("/notice/list/searchNotice")
public class SearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		  NoticeService noticeService = new NoticeService(); 
		  NoticeResultView noticeResultView = new NoticeResultView(); 
		  NoticeSearch noticeSearch = new NoticeSearch();
		  
		  noticeSearch.setOption(request.getParameter("searchOption"));
		  noticeSearch.setValue(request.getParameter("searchValue"));
		  
		  System.out.println(noticeSearch);
		  
		  List<NoticeDTO> searchedNoticeList = noticeService.selectNoticeByNoticeSearch(noticeSearch);
		  
		  String forwardingPath = "/WEB-INF/views/notice/SearchedNoticeList.jsp"; 
		  
		  if (!searchedNoticeList.isEmpty()) {
		  forwardingPath = "/WEB-INF/views/notice/SearchedNoticeList.jsp";
		  request.setAttribute("searchedNoticeList", searchedNoticeList); } 
		  
		  else {
		  noticeResultView.printErrorMessage("selectListWithSearchOption"); }
		  request.getRequestDispatcher(forwardingPath).forward(request, response);
		  
	}
}
