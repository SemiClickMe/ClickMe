package org.clickMe.user.controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.SendMail.SendMail;
import org.clickMe.user.service.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserPswResetServlet
    * @Comment : 비밀번호 초기화, 메일보내는게 관건, 다른건 수월하다.
	* @fileName : UserPswResetServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.18 Hansoo Lee 처음 작성함 
    * @see 참고할 class나 외부 url
*/
@WebServlet("/user/pswReset")
public class UserPswResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		System.out.println("비번 리셋 두포스트 오나요?");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		
		/* 비밀번호 초기화를 위한 새로운 비밀번호 생성코드
		 * r이 암호화 되기 전의 초기화 비밀번호
		 * PWEncrypt 그것을 암호화한 비밀번호
		 * 여기에선 필터가 듣지 않으니 직점 생성해주자!
		 * */
		Random secureBox = new SecureRandom();
		String r = "";
		for (int i = 0 ; i < 10 ; i++ ) {
			
			 String t = Character.valueOf((char)(secureBox.nextInt(90) + 33)).toString();
			 if( t.equals("<") ) {
				 i--;
			} else {
				r += t;
			}

		}
		
		System.out.println(r);

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String PWEncrypt = passwordEncoder.encode(r);
		
		System.out.println(PWEncrypt);
		
		System.out.println(passwordEncoder.matches(r, PWEncrypt));
		
		
		UserDTO userPWResetCode = new UserDTO();
		userPWResetCode.setId(id);
		userPWResetCode.setName(name);
		userPWResetCode.setEmail(email);
		userPWResetCode.setPsw(PWEncrypt);
		System.out.println(userPWResetCode);
		
		String page = "";

		if (userService.userPasswordReseter(userPWResetCode)) {
			SendMail sendmail = new SendMail();
			try {
				sendmail.mailSender(email, r);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("입력성공");
			request.setAttribute("message", "초기화 성공");
			request.setAttribute("userList", userPWResetCode);

		} else {

			page = "/WEB-INF/views/user/result.jsp";
			System.out.println("입력실패");
			request.setAttribute("message", "초기화 실패!");
		}

		request.getRequestDispatcher(page).forward(request, response);

		
	}

}
