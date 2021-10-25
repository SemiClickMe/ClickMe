package org.clickMe.cmt.model.Service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.cmt.model.dao.CmtMapper;
import org.clickMe.common.model.dto.CmtDTO;

public class CmtService {
	

	/*댓글 조회*/
	public List<CmtDTO> selectAllCode() {
		SqlSession sqlSession = getSqlSession();
		CmtMapper cmtmapper = sqlSession.getMapper(CmtMapper.class);
		
		List<CmtDTO> cmtAllList = cmtmapper.selectAllCode();
		
		if (!cmtAllList.isEmpty()) {
			for (CmtDTO cmt : cmtAllList) {
				System.out.println(cmt);
			}
		} else {
			System.out.println("검색 결과가 존재하지 않습니다.");
		}
		sqlSession.close();
		
		return cmtAllList;
	}
	
	/*댓글 작성*/
	public boolean insertCmt(CmtDTO cmt) {
		SqlSession sqlSession = getSqlSession();
		CmtMapper cmtmapper = sqlSession.getMapper(CmtMapper.class);
		
		int result = cmtmapper.insertCmt(cmt);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	/* 댓글 블라인드 하기 */
	public boolean blindCmt(Map<String, Object> param) {
		SqlSession sqlSession = getSqlSession();
		CmtMapper cmtmapper = sqlSession.getMapper(CmtMapper.class);
		
		int result = cmtmapper.blindCmt(param);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result > 0 ? true : false;
	}


}
