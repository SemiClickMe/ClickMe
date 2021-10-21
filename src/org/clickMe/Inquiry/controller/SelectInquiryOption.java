package org.clickMe.Inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.InquiryDTO;
import org.clickMe.Inquiry.model.dto.InquirySearchCriteria;
import org.clickMe.Inquiry.model.service.InquiryService;

@WebServlet("/inquiry/list/option")
public class SelectInquiryOption extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InquiryService inquiryService = new InquiryService();
		InquirySearchCriteria searchCriteria = new InquirySearchCriteria();
		
		searchCriteria.setOption(request.getParameter("searchOption"));
		searchCriteria.setValue(request.getParameter("searchValue"));
		
		System.out.println(searchCriteria);
		
		List<InquiryDTO> searchedInquiryList = inquiryService.selectInquiryBySearchOption(searchCriteria);
		
		String path = "";
		if (searchedInquiryList != null) {
			path = "/WEB-INF/views/inquiry/allInquiry.jsp";
			request.setAttribute("inqList", searchedInquiryList);
		} else {
			System.out.println("기능동작안함");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
