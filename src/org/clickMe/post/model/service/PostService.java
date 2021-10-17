package org.clickMe.post.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dao.PostMapper;
import org.clickMe.post.model.dto.DetailPostDTO;
import org.clickMe.post.model.dto.PostForAdminDTO;
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

	public List<PostForAdminDTO> selectPostForAdmin(Map<String, Object> parameter) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		List<PostForAdminDTO> postList = postMapper.selectPostforAdmin(parameter);
		
		sqlSession.close();
		
		return postList;
	}
	
	public DetailPostDTO selectSinglePost(int code) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		DetailPostDTO post = postMapper.selectSinglePost(code);
		
		sqlSession.close();
		
		return post;
	}
	
	public boolean insertNewPost(PostDTO post) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.insertNewPost(post);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

	public boolean deletePostByCode(int code) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.deletePostByCode(code);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

	public boolean blindPostByCode(int code) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.blindPostByCode(code);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

	public boolean modifyPost(Map<String, Object> parameter) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.modifyPost(parameter);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

	public boolean modifyPostBlind(Map<String, Object> postInfo) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.modifyPostBlind(postInfo);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

	public boolean modifyPostAdmin(Map<String, Object> parameter) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.modifyPostAdmin(parameter);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

}
