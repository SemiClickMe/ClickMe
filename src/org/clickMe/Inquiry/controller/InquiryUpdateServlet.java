package org.clickMe.Inquiry.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.Inquiry.model.service.InquiryService;
import org.clickMe.common.model.dto.InquiryDTO;

@WebServlet("/inquiry/update")
public class InquiryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int code = Integer.parseInt(request.getParameter("code"));
		String ansContent = request.getParameter("ansContent");
		System.out.println("code : " + code);
		System.out.println("ansContent : " + ansContent);
		
		Map<String, Object> answer = new HashMap<>();
		answer.put("ansContent", ansContent);
		answer.put("code", code);
		
		InquiryService inquiryService = new InquiryService();
		
		String path = "";
		if(inquiryService.updateInquiry(answer) > 0) {
			path = "/WEB-INF/views/user/result.jsp";
			System.out.println("입력성공");
			request.setAttribute("message", "등록 성공");
			request.setAttribute("signupUser", "1:1문의 답변 등록 성공했어요!");
		} else {
			System.out.println("1:1문의 답변 기능 구현 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
}


