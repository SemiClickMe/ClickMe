package org.clickMe.Inquiry;

import java.util.List;

import org.clickMe.common.model.dto.InquiryDTO;

public interface InquiryMapper {

	List<InquiryDTO> selectAllInquiry();
}
