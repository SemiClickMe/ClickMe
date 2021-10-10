package org.clickMe.post;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.clickMe.post.controller.PostController;
import org.clickMe.post.model.dto.SearchOption;

public class PostUnitTestApplication {
	
	public static void main(String[] args) {
		PostController postController = new PostController();
		Scanner sc = new Scanner(System.in);
		
		do {
			System.out.println("========== 게시글 단위 테스트 ==========");
			System.out.println("1. 게시글 전체 조회");
			System.out.println("2. 게시글 검색 조회");
			System.out.println("3. 게시글 생성");
			System.out.println("4. 게시글 삭제 (개발중)");
			System.out.println("5. 게시글 수정 (개발중)");
			System.out.println("9. 게시글 단위 테스트 종료");
			System.out.print("Enter the Unit Test number you want : ");
			
			int num = sc.nextInt();
			
			switch (num) {
			case 1: postController.selectAllPost(); break;
			case 2: postController.selectPostBySearchOption(getSearchOption()); break;
			case 3: postController.insertNewPost(getPostInfo()); break;
			case 4: postController.deletePostByCode(getPostCode()); break;
			case 5: break;
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
		System.out.print("검색할 게시글의 " + searchOption.getOption() + "을 입력해 주세요 : ");
		searchOption.setValue(sc.nextLine());
		
		return searchOption;
	}
	
	private static Map<String, String> getPostInfo() {
		Scanner sc = new Scanner(System.in);
		Map<String, String> parameter = new HashMap<>();
		
		System.out.println("게시글을 등록하기 위해 등록할 게시글의 정보를 수집합니다.");
		System.out.print("게시글의 작성자 코드를 입력해 주세요 : ");
		String sellerCode = sc.nextLine();
		System.out.print("게시글의 제목을 입력해 주세요 : ");
		String title = sc.nextLine();
		System.out.print("게시글의 내용을 입력해 주세요 : ");
		String content = sc.nextLine();
		System.out.print("게시글에 등록할 물품의 가격을 입력해 주세요 : ");
		String itemPrice = sc.nextLine();
		
		parameter.put("sellerCode", sellerCode);
		parameter.put("title", title);
		parameter.put("content", content);
		parameter.put("itemPrice", itemPrice);
		
		return parameter;
	}
	
	private static Map<String, String> getPostCode() {
		Scanner sc = new Scanner(System.in);
		Map<String, String> parameter = new HashMap<>();
		
		System.out.print("삭제하고자 하는 게시글의 코드를 입력해 주세요 : ");
		String code = sc.nextLine();
		parameter.put("code", code);
		
		return parameter;
	}
}
