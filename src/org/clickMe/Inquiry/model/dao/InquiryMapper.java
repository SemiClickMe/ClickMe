package org.clickMe.Inquiry.model.dao;

import java.util.List;

import org.clickMe.common.model.dto.InquiryDTO;

public interface InquiryMapper {

	List<InquiryDTO> selectAllInquiry();
	
	List<InquiryDTO> selectNotAnsweredInquiry();

	int insertInquiry(InquiryDTO newInquiry);

	List<InquiryDTO> selectAnsweredInquiry();
}
