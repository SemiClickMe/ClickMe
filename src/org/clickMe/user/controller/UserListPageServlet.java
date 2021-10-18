package org.clickMe.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;
import org.clickMe.user.userPaging.UserPageCriteria;
import org.clickMe.user.userPaging.UserPaging;


/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : UserListPageServlet
    * @Comment : 사용자 목록을 페이징해서 보여준다.
	* @fileName : UserListPageServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.15 Hansoo Lee 처음 작성함 
    * @see 참고할 class나 외부 url
*/
@WebServlet("/user/listPage")
public class UserListPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService  userService = new UserService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}

		String searchUserCondition = request.getParameter("searchUserCondition");
		String searchUserValue = request.getParameter("searchUserValue");
		String userListEntCondition = request.getParameter("userListEntCondition");
		
		if (userListEntCondition == null) {
		userListEntCondition = "all";}
		/* 아무것도 선택되지 않았다면 초기값은 all로 */
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchUserCondition", searchUserCondition);
		searchMap.put("searchUserValue", searchUserValue);
		searchMap.put("userListEntCondition", userListEntCondition);
		/* 검색조건 및 검색 값 Map으로 */
		int totalUserCount = userService.selectTotalUserCount(searchMap);
		

		System.out.println(totalUserCount);
		
		int limitUserNum = 10;		
		
		int buttonAmount = 5;
		
		
		System.out.println(userListEntCondition);
		UserPageCriteria userPageCriteria = null;
		
		
		if(searchUserCondition != null && !"".equals(searchUserCondition)) {
			userPageCriteria = UserPaging.getSelectCriteria(pageNo, totalUserCount, limitUserNum, buttonAmount, searchUserCondition, searchUserValue, userListEntCondition);
		} else {
			userPageCriteria = UserPaging.getSelectCriteria(pageNo, totalUserCount, limitUserNum, buttonAmount);
		}
		
		userPageCriteria.setUserListEntCondition(userListEntCondition);
		System.out.println(userPageCriteria);
		
		List<UserDTO> userList = userService.selectUserListPage(userPageCriteria);
		
		
		
		for(UserDTO us : userList) {
			System.out.println(us);
		}

		String page="";
		page = "/WEB-INF/views/user/userListForAdmin.jsp";
		request.setAttribute("userList", userList);
		request.setAttribute("userPageList", userPageCriteria);
		
		request.getRequestDispatcher(page).forward(request, response);
	
		
	}
	
}
