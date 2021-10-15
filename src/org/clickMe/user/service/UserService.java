package org.clickMe.user.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.mapper.UserMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**   
	* @packageName : org.clickMe.member.service 
	* @Class : UserService
    * @Comment : UserService 작업에 관한 클래스, 세션은 항상 닫아주자!!
	* @fileName : UserService.java 
	* @author : Hansoo Lee
    * @History : 2021.10.08 Hansoo Lee 처음 작성함 
*/
public class UserService {

	 /**
	  * @return 여러명이기 때문에 List로 반환
	  */
	public List<UserDTO> selectAllUserList() {
		
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		List<UserDTO> userList = userMapper.selectAllUser();
		/* 매퍼 인터페이스 활용 remix */
		System.out.println(userList);

		sqlSession.close();
		/* 세션은 항상 닫아주자!! */
		return userList;
	}
	
	public boolean insertUser(UserDTO user) {
		
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		int result = userMapper.insertUser(user);
		
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	 /**
	  * @return 한명이 출력되기때문에 DTO로 반환한다.
	  */
	public UserDTO selectUser(int code) {
		
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		UserDTO user1 = userMapper.selectUser(code);
		
		sqlSession.close();
		
		return user1;
	}
	
	
	public boolean modifyUserInfor(UserDTO user) {
		
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		int result = userMapper.modifyUserInfor(user);
		System.out.println("회원정보 수정 service");   // 서비스가 잘싱행되는지 확인 출력
		
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	public boolean modifyUserEntCode(UserDTO user) {
		
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		int result = userMapper.modifyUserEntCode(user);
		System.out.println("블랙리스트 수정 service");
		
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	 /**
	  * @return 한명이 같은 이메일로 여러번 가입이 가능하기 때문에 List로 반환
	  */
	public List<UserDTO> findUserId(UserDTO user) {
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		List<UserDTO> findUserId = userMapper.findId(user);
		
		sqlSession.close();
		System.out.println(findUserId);
		
		return findUserId;
	}

	public List<UserDTO> userListPage() {
		SqlSession sqlSession = getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		List<UserDTO> userListOnPage = userMapper.userListPage();
		/* 매퍼 인터페이스 활용 remix */
		System.out.println(userListOnPage);

		sqlSession.close();
		/* 세션은 항상 닫아주자!! */
		return userListOnPage;
		
	}
	
	public UserDTO loginCheck(UserDTO requestMember) {
		SqlSession session = getSqlSession();
		UserMapper userMapper = session.getMapper(UserMapper.class);
		UserDTO loginMember = null;
		
		String encPwd = userMapper.selectEncryptedPwd(requestMember);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(passwordEncoder.matches(requestMember.getPsw(), encPwd)) {
			/* 비밀번호가 일치하는 경우에만 회원 정보를 조회해온다. */
			loginMember = userMapper.selectLoginMember(requestMember);
		}
		
		session.close();
		
		return loginMember;
	}
}
