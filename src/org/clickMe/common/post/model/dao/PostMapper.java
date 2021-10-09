package org.clickMe.common.post.model.dao;

import java.util.List;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.common.post.model.dto.SearchOption;

public interface PostMapper {

	List<PostDTO> selectAllPost();

	List<PostDTO> selectPostBySearchOption(SearchOption searchOption);

}
