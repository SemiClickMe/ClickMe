package org.clickMe.recomment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.RecommentDTO;
import org.clickMe.recomment.model.service.RecommentService;

@WebServlet("/recomment/insert")
public class InsertRecommentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/WEB-INF/views/recomment/recommentForm.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}

	private static final long serialVersionUID = 3142845665793143549L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String recommentContent = request.getParameter("recommentContent");
		
		RecommentDTO newRecomment = new RecommentDTO();
		newRecomment.setReCommentContent(recommentContent);
		
		RecommentService recommentService = new RecommentService();
		int result = recommentService.insertRecomment(newRecomment);
		
		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/cmt/cmtlist.jsp";
			System.out.println("입력성공");
			request.setAttribute("message", "등록 성공");
			request.setAttribute("signupUser", "1:1문의 등록 성공했어요!");
		} else {
			System.out.println("기능동작안함");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
