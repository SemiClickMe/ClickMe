package org.clickMe.user.controller;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;


/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserOneSelectPicServlet
    * @Comment : 사용자ㅓ 1명의 사진만 불러오는 서블렛
	* @fileName : UserOneSelectPicServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.22 Hansoo Lee 처음 작성함 
*/
@WebServlet("/user/oneSelectPic")
public class UserOneSelectPicServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	UserService  userService = new UserService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("셀렉트 사진 1명 겟");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("userNum"));
		System.out.println(code);
		UserDTO user1= userService.selectUserPic(code);
		
		
		String page="";
		
		if (code != 0) {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("사진 조회성공");
			request.setAttribute("message", "회원 조회 성공!");
			request.setAttribute("user1Pic", user1);

			
		} else {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회실패");
			request.setAttribute("message", "회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	
	
	}


}
