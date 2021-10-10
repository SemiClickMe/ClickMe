package org.clickMe.post;

import java.util.List;

import org.clickMe.common.model.dto.PostDTO;

public class PostUnitTestResultView {

	public void printPostList(List<PostDTO> postList) {
		for (PostDTO list : postList) {
			System.out.println(list);
		}
	}
	
	public void printSuccessMessage(String successCode) {
		String successMessage = "";
		
		switch (successCode) {
		case "insert": successMessage = "신규 메뉴 등록을 성공했습니다."; break;
		case "update": successMessage = "기존 메뉴 수정을 성공했습니다."; break;
		case "delete": successMessage = "기존 메뉴 삭제를 성공했습니다."; break;
		}
		
		System.out.println(successMessage);
	}

	public void printErrorMessage(String errorCode) {
		String errorMessage = "";
		
		switch (errorCode) {
		case "selectList": errorMessage = "전체 게시글 목록 조회에 실패했습니다."; break;
		case "selectListWithSearchOption": errorMessage = "게시글 목록 검색에 실패했습니다."; break;
		}
		
		System.out.println(errorMessage);
	}

}
