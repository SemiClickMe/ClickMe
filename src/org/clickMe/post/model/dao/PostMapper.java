package org.clickMe.post.model.dao;

import java.util.List;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dto.SearchOption;

public interface PostMapper {

	List<PostDTO> selectAllPost();

	List<PostDTO> selectPostBySearchOption(SearchOption searchOption);

	int insertNewPost(PostDTO post);

	int deletePostByCode(int code);

}
