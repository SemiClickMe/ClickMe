package org.clickMe.user.service;

import static org.clickMe.common.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.mapper.UserMapper;


/**   
	* @packageName : org.clickMe.user.service 
	* @Class : UserSignupService
    * @Comment : 회원가입 서비스를 빼봤으나 합쳐 놓는것이 나을듯, 조만간 사라질 클래스
	* @fileName : UserSignupService.java 
	* @author : Hansoo Lee
    * @History : 2021.10.13 Hansoo Lee 처음 작성함 
*/

public class UserSignupService{
	
	public boolean userSignup(UserDTO user) {
		
		
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
	

}
