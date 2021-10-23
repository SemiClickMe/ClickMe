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
	* @Class : UserEntModifyServlet
    * @Comment : 사용자의 활동상태를 바꿔주는 서블릿
	* @fileName : UserEntModifyServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.15 Hansoo Lee 처음 작성함 
    * @see : 관리자용 회원정보 수정 페이지에서 사용
*/
@WebServlet("/user/entModify")
public class UserEntModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService  userService = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] userModifyList = request.getParameterValues("userNum");
		
		UserDTO user = new UserDTO();
		
		int entCode = Integer.valueOf(request.getParameter("entCode"));
		
		user.setEntCode(entCode);
		String page = "";
		for (String c : userModifyList) {
			System.out.println(c);
			int code = Integer.valueOf(c);
			user.setCode(code);

		if (userService.modifyUserEntCode(user)) {

			page = "/WEB-INF/views/user/userListForAdmin.jsp";
			System.out.println("입력성공");
			request.setAttribute("userModifyalert", "수정 성공");

		} else {
			System.out.println("입력실패");
			request.setAttribute("userModifyalert", "수정 실패!");
		}
		
		}
		
		request.getRequestDispatcher(page).forward(request, response);

	
	}

}
