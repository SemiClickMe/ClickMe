package org.clickMe.notice;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.clickMe.notice.controller.NoticeController;
import org.clickMe.notice.model.dto.NoticeSearch;

public class Application {
	
	public static void main(String[] args) {
		NoticeController noticeController = new NoticeController();
		Scanner sc= new Scanner(System.in);
		
		do {
			System.out.println("=====공지사항 단위테스트=====");
			System.out.println("1. 공지사항 전체 조회");
			System.out.println("2. 공지사항 검색 조회");
			System.out.println("3. 공지사항 등록 - 관리자용");
			System.out.println("4. 공지사항 수정 - 관리자용");
			System.out.println("5. 공지사항 삭제 - 관리자용");
			System.out.println("9. 공지사항 단위 테스트 종료");
			
			int no = sc.nextInt();
			
			switch(no) {
			/* 공지사항 전체 조회 -- 기능 테스트 구현 완료*/
			case 1 : noticeController.selectAllNotice();break;
			/* 공지사항 세부 조회 -- 기능 테스트 구현 완료*/
			case 2 : noticeController.selectNoticeByNoticeSearch(getNoticeSearch());break;
			/* 공지사항 등록 -- 기능 테스트 구현 완료*/
			case 3 : noticeController.registNotice(getRegistNotice());break;
			/* 공지사항 수정 -- 기능 테스트 구현 완료*/
			case 4 : noticeController.modifyNotice(getModifyNotice());break;
			/* 공지사항 삭제 -- 기능 테스트 구현 완료*/
			case 5 : noticeController.deleteNotice(getDeleteNotice());break;
			/* 공지사항 단위 테스트 종료 */
			case 9 : System.out.println("공지사항 단위 테스트 종료");break;
			}
		} while (true);
	}

	/* 공지사항 검색 조회--기능 테스트 완료*/
	private static NoticeSearch getNoticeSearch() {
		Scanner sc = new Scanner(System.in);
		NoticeSearch noticeSearch = new NoticeSearch();
		
		System.out.println("공지사항을 검색할 검색 옵션을 입력해주세요" + 
							"선택 가능한 검색 옵션은 다음과 같습니다.");
		System.out.println("코드 = \'code\' 를 입력하세요");
		System.out.println("제목 = \'title\' 를 입력하세요.");
		System.out.println("내용 = \'content\' 를 입력하세요. ");
		System.out.println("검색 옵션 : ");
		noticeSearch.setOption(sc.nextLine());
		System.out.println("검색할 공지사항의 " + noticeSearch.getOption() + "을 입력해주세요 : ");
		noticeSearch.setValue(sc.nextLine());
		
		return noticeSearch;
	}
	/* 공지사항 등록--단위테스트 완료 */
	private static Map<String, String> getRegistNotice() {
		Scanner sc = new Scanner(System.in);
		Map<String, String> parameter = new HashMap<>();
		
		System.out.println("어떤 제목으로 등록하시겠습니다?");
		String title = sc.nextLine();
		System.out.println("어떤 내용으로 등록하시겠습니까?");
		String content = sc.nextLine();
		
		parameter.put("title", title);
		parameter.put("content", content);
		
		return parameter;
		
	}
	/* 공지사항 수정--단위테스트 완료 */
	private static Map<String, Object> getModifyNotice() {
		Scanner sc = new Scanner(System.in);
		Map<String, Object> parameter = new HashMap<>();
		
		System.out.println("공지사항을 수정하기 위해 몇 가지 정보를 수집합니다.");
		System.out.println("수정할 게시글의 코드를 입력해주세요");
		int code = sc.nextInt();
		sc.nextLine();
		System.out.println("해당 공지사항의 '제목'을 어떻게 수정하시겠습니까? :");
		String title = sc.nextLine();
		System.out.println("해당 공지사항의 '내용'을 어떻게 수정하시겠습니까? :");
		String content = sc.nextLine();
		sc.nextLine();
		
		parameter.put("code", code);
		parameter.put("title", title);
		parameter.put("content", content);
		
		return parameter;
		
	}
	/* 공지사항 삭제--단위테스트 완료 */
	private static Map<String, String> getDeleteNotice() {
		Scanner sc = new Scanner(System.in);
		Map<String, String> parameter = new HashMap<>();
		
		System.out.println("삭제할 공지사항의 코드를 입력해주세요.");
		String code = sc.nextLine();
		parameter.put("code", code);
		
		return parameter;
	}
}