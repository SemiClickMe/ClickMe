package org.clickMe.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserModifyServlet
    * @Comment :유저 수정 페이지 서블렛 jsp
	* @fileName : UserModifyServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.13 작성
    * @see 참고할 class나 외부 url
*/
@WebServlet("/userModify")
public class UserModifyServlet extends HttpServlet {
	
	private static final long serialVersionUID = 3927309967423553406L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("블랙리스트 두포스트");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.valueOf(request.getParameter("userNum"));
	
	
	}

}
