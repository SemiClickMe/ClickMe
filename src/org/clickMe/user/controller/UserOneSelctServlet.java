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
	* @Class : UserOneSelctServlet
    * @Comment : 사용자 1명만 코드로 검색
	* @fileName : UserOneSelctServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.10 Hansoo Lee 
*/
@WebServlet("/user/oneSelct")
public class UserOneSelctServlet  extends HttpServlet {

	private static final long serialVersionUID = -5703032335912762246L;
	UserService  userService = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("셀렉트 1명 두포스트");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("userNum"));
		System.out.println(code);
		
		UserDTO user1= userService.selectUser(code);
		
		
		String page="";
		
		if (code != 0) {
			page = "/WEB-INF/views/user/userlist.jsp";
			System.out.println("조회성공");
			request.setAttribute("userList", user1);
			request.setAttribute("typeNo", 1);
			
		} else {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회실패");
			request.setAttribute("message", "회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

}
