package org.clickMe.Inquiry;

import static org.clickMe.common.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.common.model.dto.InquiryDTO;

public class InquiryService {

	private InquiryMapper mapper;
	
	public void selectAllInquiry() {
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
	}	
}


