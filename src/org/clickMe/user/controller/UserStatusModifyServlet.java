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
	* @Class : UserStatusModifyServlet
    * @Comment : 사용자 정보 조회및 정보 수정, 일단 사용자용으로 구성
	* @fileName : UserStatusModifyServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.13 Hansoo Lee 처음 작성함 
*/
@WebServlet("/user/statusModify")
public class UserStatusModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("code"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNum");
		String name = request.getParameter("name");
		java.sql.Date bdate = java.sql.Date.valueOf(request.getParameter("bdate"));
		String gender = request.getParameter("gender");
		int deposit = Integer.valueOf(request.getParameter("deposit"));

		UserDTO statusModifyUser = new UserDTO();
		statusModifyUser.setCode(code);
		statusModifyUser.setEmail(email);
		statusModifyUser.setPhone(phone);
		statusModifyUser.setName(name);
		statusModifyUser.setDate(bdate);
		statusModifyUser.setGender(gender);
		statusModifyUser.setDeposit(deposit);

		String page = "";

		if (userService.modifyUserInfor(statusModifyUser)) {

			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("입력성공");
			request.setAttribute("message", "등록 성공");
			request.setAttribute("signupUser", statusModifyUser);

		} else {

			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("입력실패");
			request.setAttribute("message", "회원 가입 실패!");
		}

		request.getRequestDispatcher(page).forward(request, response);

	}

}
