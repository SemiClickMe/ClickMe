package org.clickMe.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;

/**   @dummy : !더미데이터
	* @packageName : org.clickMe.user.controller 
	* @Class : UserListForAdminServlet
    * @Comment : 관리자용 회원 관리 페이지, 전체 회원을 한페이지에 보여주느 페이지, 이제 거의 쓸일은 없어보인다.
	* @fileName : UserListForAdminServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.14 Hansoo Lee 처음 작성함 
*/
@WebServlet("/user/listForAdmin")
public class UserListForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService  userService = new UserService();
		System.out.println("관리자 회원 리스트 두겟");
		
		HttpSession httpSession = request.getSession(true);
		UserDTO user = (UserDTO) httpSession.getAttribute("loginUser");
		
		/*  null 체크는 !=null로 비교하는게 맞다고 들었지만,
		 *  공부하는중이니까 참고 차 해봄
		 *  근데 된다.
		 */

		if ( user == null) {
			System.out.println("음");
			
			request.setAttribute("message", "비정상적인 접근입니다.");
			
			request.getRequestDispatcher("/WEB-INF/views/user/result.jsp").forward(request, response);
		}
		
		System.out.println(user==null);
		String authority = user.getAuthority();
		System.out.println(authority);
		/*
		 * 권한이 있는 사람만 접근이 가능하게 한다.
		 * 
		 */
		if (authority.equals("Y")) {
			System.out.println("오나요");
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
			
			} else  {
				
				String page="";
				page = "/WEB-INF/views/user/result.jsp";
				System.out.println("권한없음");
				request.setAttribute("message", "권한이 없습니다!");
				request.getRequestDispatcher(page).forward(request, response);
	
			}
			
		
	
		
	}


}
