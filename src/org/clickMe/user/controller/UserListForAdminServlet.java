package org.clickMe.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;


/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserListForAdminServlet
    * @Comment : 관리자용 회원 관리 페이지
	* @fileName : UserListForAdminServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.14 Hansoo Lee 처음 작성함 
*/
@WebServlet("/user/listForAdmin")
public class UserListForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService  userService = new UserService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("관리자 회원 리스트 두겟");
		List<UserDTO> userListOnPage = userService.userListPage();
		System.out.println(userListOnPage);
	

		for(UserDTO us : userListOnPage) {
			System.out.println(us);
		}
		
		String page="";
		
		if (!userListOnPage.isEmpty()) {
			page = "/WEB-INF/views/user/userListForAdmin.jsp";
			System.out.println("조회성공");
			request.setAttribute("message", "회원 조회 성공! <br> 관리자용 회원 관리 페이지");
			request.setAttribute("userList", userListOnPage);
			
		} else {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회실패");
			request.setAttribute("message", "회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


}
