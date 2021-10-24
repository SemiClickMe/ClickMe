package org.clickMe.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;

@WebServlet("/user/testViewMyPage")
public class ViewMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	doPost(request, response);
	System.out.println("사용자 정보 두포스트 검색");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자 정보 두포스트 검색");
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession(true);
		UserDTO user = (UserDTO) httpSession.getAttribute("loginUser");
		System.out.println(user);

		if( user == null) {
			System.out.println("음");
			
			request.setAttribute("message", "비정상적인 접근입니다.");
			
			request.getRequestDispatcher("/WEB-INF/views/user/result.jsp").forward(request, response);
		}
		
		int code = user.getCode();
		
		UserService  userService = new UserService();
		System.out.println("사용자 정보 두포스트 검색");
		request.setCharacterEncoding("UTF-8");
		System.out.println(code);
		UserDTO user1= userService.selectUser(code);
		
		String page="";
		
		if (code != 0) {
			page = "/WEB-INF/views/user/userStatus.jsp";
			System.out.println("조회성공");
			request.setAttribute("userList", user1);
			
		} else {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회실패");
			request.setAttribute("message", "회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}
	
}
