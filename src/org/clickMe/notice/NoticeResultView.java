package org.clickMe.notice;

import java.util.List;

import org.clickMe.common.model.dto.NoticeDTO;

public class NoticeResultView {
	
	public void printNoticeList(List<NoticeDTO> noticeList) {
		System.out.println("[Success] 공지사항 조회를 성공했습니다. ");
		for(NoticeDTO list : noticeList) {
			System.out.println(list);
		}
	}
	
	public void printSuccessMessage(String successCode) {
		String successMessage= "";
		
		switch(successCode) {
		case "search" : successMessage = "[Success] 공지사항 조회 성공";break;
		case "selectListWithSearchOption" : successMessage = "[Suceess] 공지사항 검색 조회 성공";break;
		case "insert" : successMessage = "[Success] 신규 공지사항 등록 성공"; break;
		case "update" : successMessage = "[Success] 공지사항 수정 완료";break;
		case "delete" : successMessage = "[Success] 공지사항 삭제 완료";break;
		}
		System.out.println(successMessage);
	}
	
	public void printErrorMessage(String errorCode) {
		String errorMessage = "";
		
		switch(errorCode) {
		case "search" : errorMessage = "[Error] 공지사항 조회 실패";break;
		case "selectListWithSearchOption" : errorMessage = "[Suceess] 공지사항 검색 조회 실패";break;
		case "insert" : errorMessage = "[Error] 공지사항 등록 실패";break;
		case "update" : errorMessage = "[Error] 공지사항 수정 실패";break; 
		case "delete" : errorMessage = "[Error] 공지사항 삭제 실패";break;
		}
		System.out.println(errorMessage);
	}
}
 