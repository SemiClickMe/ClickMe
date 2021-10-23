package org.clickMe.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.NoticeDTO;
import org.clickMe.notice.model.dto.NoticeForAdminDTO;
import org.clickMe.notice.model.dto.NoticeSearch;

public interface NoticeMapper {

	List<NoticeDTO> selectNoticeList();

	List<NoticeDTO> selectNoticeByNoticeSearch(NoticeSearch noticeSearch);

	NoticeDTO selectNoticeDetail(int code);

	int registNotice(NoticeDTO notice);

	int modifyNotice(Map<String, Object> parameter);

	int deleteNotice(int code);

	NoticeDTO selectinquiryDetail(int code);

}
