package org.clickMe.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
    * @Comment : 사용자 1명만 코드로 검색, 아이작스 아이디 중복체크 get추가
	* @fileName : UserOneSelctServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.10 Hansoo Lee 
    * @see : 회원 가입페이지에서 사용
*/
@WebServlet("/user/oneSelect")
public class UserOneSelctServlet  extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService  userService = new UserService();	
		String getIdInput = request.getParameter("userId");
		System.out.println(getIdInput);

		int idcheck = userService.idChecker(getIdInput);

		PrintWriter out = response.getWriter();
		out.print(idcheck);
		out.flush();
		out.close();

	}
	private static final long serialVersionUID = -5703032335912762246L;
	UserService  userService = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("셀렉트 1명 두포스트");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("userNum"));
		System.out.println(code);
		UserDTO user1= userService.selectUser(code);
		System.out.println(user1);
		
		
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
