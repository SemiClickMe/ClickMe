package org.clickMe.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;


/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserModifyServlet
    * @Comment :유저 수정 페이지 서블렛 운영자용
	* @fileName : UserModifyServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.13 작성
    * @see 참고할 class나 외부 url
*/
@WebServlet("/user/statusPageAdmin")
public class UserStatusForAdminServlet extends HttpServlet {
	
	private static final long serialVersionUID = 3927309967423553406L;
	UserService  userService = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자 정보 두포스트 검색");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("userNum"));
		System.out.println(code);
		UserDTO user1= userService.selectUser(code);
		
		String page="";
		
		if (code != 0) {
			page = "/WEB-INF/views/user/userStatusForAdmin.jsp";
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
