package org.clickMe.cmt;

import java.util.Scanner;

import org.clickMe.cmt.model.Service.CmtService;

public class CmtTestApplication {

	public static void main(String[] args) {
		
		CmtService cmtService = new CmtService();
		
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("========= 댓글 단위테스트 =========");
			System.out.println("1.댓글 조회");
			System.out.println("2.댓글 작성");
			System.out.println("3.댓글 삭제");
			System.out.println("9. 댓글기능 종료하기");
			System.out.println("테스트할 기능을 입력하세요 : ");
			
			int no = sc.nextInt();
			
			switch(no) {
			case 1:cmtService.selectAllCode(); break;
			case 9: System.out.println("단위 테스트 종료."); return;
			} 
		} while(false);
	}

}
