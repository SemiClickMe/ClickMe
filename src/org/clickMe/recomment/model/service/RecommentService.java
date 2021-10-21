package org.clickMe.recomment.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.RecommentDTO;
import org.clickMe.recomment.model.dao.RecommentMapper;

public class RecommentService {
	
	/*대댓글 작성*/
	public int insertRecomment(RecommentDTO recomment) {
		SqlSession sqlSession = getSqlSession();
		RecommentMapper recommentMapper = sqlSession.getMapper(RecommentMapper.class);
		
		int result = recommentMapper.insertRecomment(recomment);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result;
	}
	
	/* 대댓글 블라인드 */
	public boolean blindRecomment(Map<String, Object> param) {
		SqlSession sqlSession = getSqlSession();
		RecommentMapper recommentMapper = sqlSession.getMapper(RecommentMapper.class);
		
		int result = recommentMapper.blindRecomment(param);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result > 0 ? true : false;

	}
}
