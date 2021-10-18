/**
 * 
 */
package org.clickMe.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;
import org.clickMe.user.userPaging.UserPageCriteria;
import org.clickMe.user.userPaging.UserPaging;

/**
 * @packageName : org.clickMe.member.controller
 * @Class : UserController
 * @Comment : UserController에서는 될 수 있으면 관련변수들은 UserDTO형식으로 서비스에 전달하자.
 * @fileName : UserController.java
 * @author : Hansoo Lee
 * @History : 2021.10.08 Hansoo Lee 처음 작성함
 */

public class UserController {
	UserService userService = new UserService();

	public void selectAllUserList() {

		List<UserDTO> userList = userService.selectAllUserList();

		if (!userList.isEmpty()) {
			for (UserDTO user : userList) {
				System.out.println(user);
			}
		} else {
			System.out.println("못불러옴");
		}
	}

	public void insertUser(UserDTO signup) {

		System.out.println(signup);

		if (userService.insertUser(signup)) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
	}
	
	 /**
	  * @param Map으로 회원 코드 번호를 매개변수로 받음
	  * @return UserDTO로 반환한다.
	  */

	public UserDTO codeSelectUser(Map<String, String> codeSelect) {

		int code = Integer.parseInt(codeSelect.get("code"));
		UserDTO user1 = userService.selectUser(code);

		if (user1 != null) {
			System.out.println("불러옴");
			System.out.println(user1);

		} else {
			System.out.println("못불러옴");
		}

		return user1;

	}

	public void modifyUserInfor(UserDTO user) {
		System.out.println(user);

		if (userService.modifyUserInfor(user)) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}

	}

	public void modifyUserEntCode(UserDTO user) {
		System.out.println(user);

		if (userService.modifyUserEntCode(user)) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}

	}

	 /**
	  * @param Map으로 이름과 이메일을 매개변수로 전달
	  */
	public List<UserDTO> findUserId(Map<String, String> findId) {

		String name = findId.get("name");
		String email = findId.get("email");
		UserDTO findUserId = new UserDTO();

		findUserId.setName(name);
		findUserId.setEmail(email);

		List<UserDTO> findedUserId = userService.findUserId(findUserId);

		if (!findedUserId.isEmpty()) {
			System.out.println("불러옴");
			System.out.println("검색된 아이디");
			for (UserDTO user : findedUserId) {
				System.out.println(user.getId());
				/* 아이디만 foreach문으로 확인차 출력해본다. */
			}
		} else {
			System.out.println("못불러옴");
		}
		return findedUserId;
	}

	public List<UserDTO> userListPaging(int pageNo) {
		UserPageCriteria userPageCriteria = null;

		int inputPageNo = pageNo;
		Map<String, String> searchMap = new HashMap<>();
		
		int totalUserCount = userService.selectTotalUserCount(searchMap);
		
		System.out.println(totalUserCount);
		
		int limitUserNum = 10;		
		int buttonAmount = 5;
		
		String searchUserCondition = "id";    // 검색 조건
		String searchUserValue = "1";        // 검색어
		String userListEntCondition = null;
		
//		userPageCriteria = UserPaging.getSelectCriteria(inputPageNo, totalUserCount, limitUserNum, buttonAmount);
		userPageCriteria = UserPaging.getSelectCriteria(inputPageNo, totalUserCount, limitUserNum, buttonAmount, searchUserCondition, searchUserValue, userListEntCondition);
		
		List<UserDTO> userListPage = userService.selectUserListPage(userPageCriteria);
		
		for(UserDTO us : userListPage) {
			System.out.println(us);
		}
		
		return userListPage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
