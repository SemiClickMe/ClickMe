package org.clickMe.post.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.ImgFileDTO;
import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.model.dao.PostMapper;
import org.clickMe.post.model.dto.DetailPostDTO;
import org.clickMe.post.model.dto.PostForAdminDTO;
import org.clickMe.post.model.dto.PostForUserDTO;
import org.clickMe.post.model.dto.SearchOption;
import org.clickMe.post.paging.PostPageCriteria;

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
	
	public List<PostForUserDTO> selectPostForUser(PostPageCriteria postPageCriteria) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		List<PostForUserDTO> postList = postMapper.selectPostForUser(postPageCriteria);
		
		sqlSession.close();
		
		return postList;
	}

	public List<PostForAdminDTO> selectPostForAdmin(PostPageCriteria postPageCriteria) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		List<PostForAdminDTO> postList = postMapper.selectPostforAdmin(postPageCriteria);
		
		sqlSession.close();
		
		return postList;
	}

	public int selectTotalPostCount(Map<String, Object> searchOption) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int totalPostCount = postMapper.selectTotalPostCount(searchOption);
		
		sqlSession.close();
		
		return totalPostCount;
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

	public boolean insertPost(PostDTO post) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = 0;	// 두 DML 작업이 모두 성공될 때 1이 되는 결과값
		
		/* 1. PostDTO 내의 게시글 정보부터 INSERT */
		int postResult = postMapper.insertPost(post);
		
		System.out.println("POST table INSERT result : " + postResult);
		
		/* 2. 다음은 PostDTO 내의 이미지 파일 리스트 INSERT */
		List<ImgFileDTO> imgFileList = post.getImgFileList();
		
		/* 이미지 파일이 종속되어 있는 게시글의 번호는 Mapper에서 <selectKey> 요소를 사용해 구한다. */
		
		int imgFileResult = 0;
		for (int i = 0; i < imgFileList.size(); i++) {	// 이미지 파일 갯수만큼 loop
			imgFileResult += postMapper.insertImgFile(imgFileList.get(i));
		}
		
		System.out.println("The number of files : " + imgFileList.size());
		System.out.println("IMG_FILE table INSERT result : " + imgFileResult);
		
		if (postResult > 0 && imgFileResult == imgFileList.size()) {
			sqlSession.commit();
			result = 1;
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	public DetailPostDTO selectDetailPostForUser(int code) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.increasePostViews(code);
		
		DetailPostDTO detailPost = null;
		if (result > 0) {
			detailPost = postMapper.selectDetailPostForUser(code);
			
			if (detailPost != null) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return detailPost;
	}

	public boolean deletePost(int code) {
		SqlSession sqlSession = getSqlSession();
		
		PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
		
		int result = postMapper.deletePost(code);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}

}
