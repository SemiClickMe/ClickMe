package org.clickMe.post.model.dao;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dto.DetailPostDTO;
import org.clickMe.post.model.dto.PostForAdminDTO;
import org.clickMe.post.model.dto.SearchOption;

public interface PostMapper {

	List<PostDTO> selectAllPost();

	List<PostDTO> selectPostBySearchOption(SearchOption searchOption);

	int insertNewPost(PostDTO post);

	int deletePostByCode(int code);

	int blindPostByCode(int code);	// used in level.1 unit test

	int modifyPost(Map<String, Object> parameter);

	int modifyPostBlind(Map<String, Object> postInfo);	// used in level.2 unit test

	List<PostForAdminDTO> selectPostforAdmin(Map<String, Object> parameter);

	DetailPostDTO selectSinglePost(int code);

	int modifyPostAdmin(Map<String, Object> parameter);

}
