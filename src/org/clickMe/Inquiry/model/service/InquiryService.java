package org.clickMe.Inquiry.model.service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.Inquiry.model.dao.InquiryMapper;
import org.clickMe.Inquiry.model.dto.InquirySearchCriteria;
import org.clickMe.common.model.dto.ImgFileDTO;
import org.clickMe.common.model.dto.InquiryDTO;

public class InquiryService {

	private InquiryMapper mapper;
	
	/* 모든 1:1문의 조회 */
	public List<InquiryDTO> selectAllInquiry() {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		List<InquiryDTO> inquiryList = mapper.selectAllInquiry();
		
		if (!inquiryList.isEmpty()) {
			for (InquiryDTO inquiry : inquiryList) {
				System.out.println(inquiry);
			}
		} else {
			System.out.println("검색 결과가 존재하지 않습니다.");
		}
		sqlSession.close();
		
		return inquiryList;
	}

	/* 아직 답변이 되지않은 1:1문의 조회 */
	public List<InquiryDTO> selectNotAnsweredInquiry() {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		List<InquiryDTO> inquiryList = mapper.selectNotAnsweredInquiry();
		
		if (!inquiryList.isEmpty()) {
			for (InquiryDTO inquiry : inquiryList) {
				System.out.println(inquiry);
			}
		} else {
			System.out.println("검색 결과가 존재하지 않습니다.");
		}
		sqlSession.close();
		
		return inquiryList;
	}	
	
	/* 답변이 완료된 1:1문의 조회 */
	public List<InquiryDTO> selectAnsweredInquiry() {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		List<InquiryDTO> inquiryList = mapper.selectAnsweredInquiry();
		
		if (!inquiryList.isEmpty()) {
			for (InquiryDTO inquiry : inquiryList) {
				System.out.println(inquiry);
			}
		} else {
			System.out.println("검색 결과가 존재하지 않습니다.");
		}
		sqlSession.close();
		
		return inquiryList;
	}	
	
	/* 1:1문의 작성 */
	public int insertInquiry(InquiryDTO newInquiry) {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		int result = mapper.insertInquiry(newInquiry);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}
	
	/* 1:1문의 상세보기용 메소드 */
	public InquiryDTO selectNoticeDetail(int code) {
		SqlSession sqlSession = getSqlSession();
		InquiryDTO inquiryDetail = null;
		mapper = sqlSession.getMapper(InquiryMapper.class);
		inquiryDetail = mapper.selectinquiryDetail(code);

		if(inquiryDetail != null) {
			sqlSession.commit();
			} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return inquiryDetail;
	}
	
	/* 1:1문의 답변 작성 */
	public int updateInquiry(Map<String, Object> answer) {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		int result = mapper.updateInquiry(answer);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}
	
	public List<InquiryDTO> selectInquiryBySearchOption(InquirySearchCriteria searchCriteria) {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		List<InquiryDTO> searchedInquiryList = mapper.selectInquiryBySearchOption(searchCriteria);
		
		sqlSession.close();
		
		return searchedInquiryList;
	}
	
	public int insertInqwithImage(InquiryDTO image) {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		int result = 0;
		int inqResult = mapper.insertInqwithImage(image);
		
		System.out.println("inquiryResult : " + inqResult);
		
		List<ImgFileDTO> fileList = image.getImgFileList();
		
		for(int i = 0; i < fileList.size(); i++) {
			fileList.get(i).setInqCode(image.getCode());
		}
		
		int attachmentResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			attachmentResult += mapper.insertAttachment(fileList.get(i));
		}
		
		if(inqResult > 0 && attachmentResult == fileList.size()) {
			sqlSession.commit();
			result = 1;
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}
	
	public List<InquiryDTO> selectInquiryUserCode(int code) {
		SqlSession sqlSession = getSqlSession();
		mapper = sqlSession.getMapper(InquiryMapper.class);
		
		List<InquiryDTO> inquiryList = mapper.selectInquiryUserCode(code);
		
		if (!inquiryList.isEmpty()) {
			for (InquiryDTO inquiry : inquiryList) {
				System.out.println(inquiry);
			}
		} else {
			System.out.println("검색 결과가 존재하지 않습니다.");
		}
		sqlSession.close();
		
		return inquiryList;
	}
	
	public InquiryDTO selectNoticeDetailForUser(int code) {
		SqlSession sqlSession = getSqlSession();
		InquiryDTO inquiryDetail = null;
		mapper = sqlSession.getMapper(InquiryMapper.class);
		inquiryDetail = mapper.selectNoticeDetailForUser(code);

		if(inquiryDetail != null) {
			sqlSession.commit();
			} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return inquiryDetail;
	}


}
