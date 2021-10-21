package org.clickMe.Inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.clickMe.Inquiry.model.service.InquiryService;
import org.clickMe.common.model.dto.InquiryDTO;
import org.clickMe.common.model.dto.UserDTO;

@WebServlet("/inquiry/select/user")
public class SelectInquiryUserCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(true);
		UserDTO user = (UserDTO) httpSession.getAttribute("loginUser");
		System.out.println(user);
		int no = user.getCode();
		System.out.println("유저코드 : " + no);
		InquiryService inquiryService = new InquiryService();
		List<InquiryDTO> inquiryList = inquiryService.selectInquiryUserCode(no);
		
		System.out.println("inquiryList : " + inquiryList);
		
		String path = "";
		if(inquiryList != null) {
			path = "/WEB-INF/views/inquiry/selectInquiryForUser.jsp";
			request.setAttribute("inquiry", inquiryList);
		} else {
			System.out.println("기능동작안함");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}


}


