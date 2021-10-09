package org.clickMe.post.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dao.PostMapper;
import org.clickMe.post.model.dto.SearchOption;

public class PostService {

	public List<PostDTO> selectAllPost() {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		List<PostDTO> postList = postMapper.selectAllPost();
		
		sqlSession.close();
		
		return postList;
	}

	public List<PostDTO> selectPostBySearchOption(SearchOption searchOption) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		List<PostDTO> searchedPostList = postMapper.selectPostBySearchOption(searchOption);
		
		sqlSession.close();
		
		return searchedPostList;
	}

}
