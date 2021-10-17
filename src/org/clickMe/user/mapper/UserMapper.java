package org.clickMe.user.mapper;

import java.util.List;

import org.clickMe.common.model.dto.UserDTO;

/**   
	* @packageName : org.clickMe.user.mapper 
	* @Class : UserMapper
    * @Comment : UserMapper
	* @fileName : UserMapper.java 
	* @author : Hansoo Lee
    * @History : 2021.10.08 Hansoo Lee 작성함 
*/
public interface UserMapper {
	
	List<UserDTO> selectAllUser();

	UserDTO selectUser(int code);
	
	int insertUser(UserDTO user);

	int modifyUserInfor(UserDTO user);

	int modifyUserEntCode(UserDTO user);

	List<UserDTO> findId(UserDTO user);

	String findIds(UserDTO user);

	List<UserDTO> userListPage();

	String selectEncryptedPwd(UserDTO requestMember);

	UserDTO selectLoginMember(UserDTO requestMember);


}
