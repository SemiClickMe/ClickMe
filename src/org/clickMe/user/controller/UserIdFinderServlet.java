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
	* @Class : UserIdFinderServlet
    * @Comment : 아이디 찾기, 보안을 위해서는 이메일로 아이디를 보내주는것도 고려해볼것
	* @fileName : UserIdFinderServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.14 Hansoo Lee 처음 작성함 
*/
@WebServlet("/UserIdFinder")
public class UserIdFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService  userService = new UserService();
	
	/**
	 * @param request 우리 웹페이지는 이름과 이메일 번호를 조회하는것으로 아이디정보를 출력해준다.
     * @return 여러명이기 때문에 List로 반환
     */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("사용자 아이디 두포스트 검색");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		UserDTO findUserId = new UserDTO();

		findUserId.setName(name);
		findUserId.setEmail(email);

		List<UserDTO> findedUserId = userService.findUserId(findUserId);
		System.out.println(findUserId);
		String page="";
		
		if (!findedUserId.isEmpty()) {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회성공");
			request.setAttribute("message", "조회성공");
			request.setAttribute("userList", findedUserId);
			
		} else {
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("조회실패");
			request.setAttribute("message", "회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

}
