package org.clickMe.post;

import java.util.List;

import org.clickMe.common.model.dto.PostDTO;

public class PostUnitTestResultView {

	public void printPostList(List<PostDTO> postList) {
		System.out.println("[Success] 게시글 조회를 성공했습니다.");
		for (PostDTO list : postList) {
			System.out.println(list);
		}
	}
	
	public void printSuccessMessage(String successCode) {
		String successMessage = "";
		
		switch (successCode) {
		case "insert": successMessage = "[Success] 신규 게시글 등록을 성공했습니다."; break;
		case "update": successMessage = "[Success] 기존 게시글 수정을 성공했습니다."; break;
		case "delete": successMessage = "[Success] 기존 게시글 삭제를 성공했습니다."; break;
		case "blind": successMessage = "[Success] 게시글 블라인드 처리를 성공했습니다."; break;
		}
		
		System.out.println(successMessage);
	}

	public void printErrorMessage(String errorCode) {
		String errorMessage = "";
		
		switch (errorCode) {
		case "selectList": errorMessage = "[Error] 전체 게시글 목록 조회에 실패했습니다."; break;
		case "selectListWithSearchOption": errorMessage = "[Error] 게시글 목록 검색에 실패했습니다."; break;
		case "delete": errorMessage = "[Error] 게시글 삭제에 실패했습니다."; break;
		case "blind": errorMessage = "[Error] 게시글 블라인드 처리에 실패했습니다."; break;
		}
		
		System.out.println(errorMessage);
	}

}
