package org.clickMe.notice.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.Inquiry.model.dao.InquiryMapper;
import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.controller.NoticeController;
import org.clickMe.notice.model.dao.NoticeMapper;
import org.clickMe.notice.model.dto.NoticeForAdminDTO;
import org.clickMe.notice.model.dto.NoticeSearch;

public class NoticeService {
	
	private NoticeMapper mapper;
	
	/* 공지사항 전체 조회 */
	public List<NoticeDTO> selectAllNotice() {
		SqlSession sqlSession = getSqlSession();
		
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		List<NoticeDTO> noticeList = noticeMapper.selectNoticeList();
		System.out.println(noticeList);
		
		sqlSession.close();
		
		return noticeList;
	}

	/* 검색 옵션에 따른 게시물 조회 */
	public List<NoticeDTO> selectNoticeByNoticeSearch(NoticeSearch noticeSearch) {
		SqlSession sqlSession = getSqlSession();
		
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		List<NoticeDTO> searchedNoticeList = noticeMapper.selectNoticeByNoticeSearch(noticeSearch);
		
		sqlSession.close();
		
		return searchedNoticeList;
	
	}
	
	/* 신규 공지 사항 등록용 메소드 */
	public boolean registNotice(NoticeDTO notice) {
		SqlSession sqlSession = getSqlSession();
		
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		int result = noticeMapper.registNotice(notice);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}
	/* 공지사항 수정 메소드 */
	public boolean modifyNotice(Map<String, Object> parameter) {
		SqlSession sqlSession = getSqlSession();

		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		int result = noticeMapper.modifyNotice(parameter);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		return result > 0 ? true : false;
	}
	/* 공지사항 삭제 메소드 */
	public boolean deleteNotice(int code) {
		SqlSession sqlSession = getSqlSession();
		
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		int result = noticeMapper.deleteNotice(code);
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		return result > 0 ? true : false;
	}
	/* 공지사항 상세보기 메소드 */
	public NoticeDTO selectNoticeDetail(int code) {
		
		SqlSession sqlSession = getSqlSession();
		NoticeDTO noticeDetail = null;
		
		mapper = sqlSession.getMapper(NoticeMapper.class);
		noticeDetail = mapper.selectNoticeDetail(code);

		if(noticeDetail != null) {
			sqlSession.commit();
			} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return noticeDetail;


	}	

}
