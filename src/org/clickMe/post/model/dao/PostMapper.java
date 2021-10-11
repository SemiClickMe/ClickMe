package org.clickMe.post.model.dao;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dto.SearchOption;

public interface PostMapper {

	List<PostDTO> selectAllPost();

	List<PostDTO> selectPostBySearchOption(SearchOption searchOption);

	int insertNewPost(PostDTO post);

	int deletePostByCode(int code);

	int blindPostByCode(int code);

	int modifyPost(Map<String, Object> parameter);

}
