package org.clickMe.common.post;

import java.util.Scanner;

import org.clickMe.common.post.controller.PostController;
import org.clickMe.common.post.model.dto.SearchOption;

public class PostUnitTestApplication {
	
	public static void main(String[] args) {
		PostController postController = new PostController();
		Scanner sc = new Scanner(System.in);
		
		do {
			System.out.println("========== 게시글 단위 테스트 ==========");
			System.out.println("1. 게시글 전체 조회");
			System.out.println("2. 게시글 검색 조회 (개발중)");
			System.out.println("3. 게시글 생성 (개발중)");
			System.out.println("4. 게시글 삭제 (개발중)");
			System.out.println("5. 게시글 수정 (개발중)");
			System.out.println("9. 게시글 단위 테스트 종료");
			System.out.print("Enter the Unit Test number you want : ");
			
			int num = sc.nextInt();
			
			switch (num) {
			case 1: postController.selectAllPost(); break;
			case 2: postController.selectPostBySearchOption(getSearchOption()); break;
			case 9: System.out.println("게시글 단위 테스트 종료."); return;
			default: System.out.println("올바르지 않은 번호를 입력하였습니다! : " + num);
			}
		} while (true);
		
	}

	private static SearchOption getSearchOption() {
		Scanner sc = new Scanner(System.in);
		SearchOption searchOption = new SearchOption();
		
		System.out.println("게시글을 검색할 검색 옵션을 입력해 주세요."
				+ " 선택 가능한 검색 옵션은 다음과 같습니다.");
		System.out.println("▷ 작성자");
		System.out.println("▷ 제목");
		System.out.println("▷ 내용");
		System.out.print("검색 옵션 : ");
		searchOption.setOption(sc.nextLine());
		
//		String option = sc.nextLine();
//		
//		switch (option) {
//		case "작성자": searchOption.setOption(""); break;
//		case "제목":  break;
//		case "내용":  break;
//		default: System.out.println("올바르지 않은 검색 옵션을 입력하였습니다."); return;
//		}
		
		System.out.print("검색할 게시글의 " + searchOption.getOption() + "을 입력해 주세요 : ");
		searchOption.setValue(sc.nextLine());
		
		return searchOption;
	}
}
