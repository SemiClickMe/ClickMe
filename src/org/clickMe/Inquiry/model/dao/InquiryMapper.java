package org.clickMe.Inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.ImgFileDTO;
import org.clickMe.common.model.dto.InquiryDTO;

public interface InquiryMapper {

	List<InquiryDTO> selectNotAnsweredInquiry();

	int insertInquiry(InquiryDTO newInquiry);

	List<InquiryDTO> selectAnsweredInquiry();

	InquiryDTO selectinquiryDetail(int code);

	int updateInquiry(Map<String, Object> answer);

	List<InquiryDTO> selectAllInquiry();

	int insertInqwithImage(InquiryDTO image);

	int insertAttachment(ImgFileDTO imgFileDTO);
}
