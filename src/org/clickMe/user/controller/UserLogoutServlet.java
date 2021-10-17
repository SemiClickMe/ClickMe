package org.clickMe.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;

@WebServlet("/user/logout")
public class UserLogoutServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/* doGet()가 호출되면 Request객체와 Response객체를 호출해서 인자로 전달한다. */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* getContextPath()를 이용해 프로젝트 Path만 가져온다. */
		String path = request.getContextPath();
		
		/*  invalidate() = 호출한 클라이언트 윈도우의 화면을 무효화시킨다 */
		request.getSession().invalidate();
		
		/* response.sendRedirect()를 이용해 매개변수로 이동시킨다. */
		response.sendRedirect(request.getContextPath());
		

		
	}

}
