package org.clickMe.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.clickMe.common.model.dto.UserDTO;

/**   
	* @packageName : org.clickMe.user.controller 
	* @Class : Application
    * @Comment : 사용자 단위 테스트 Application
	* @fileName : Application.java 
	* @author : Hansoo Lee
    * @History : 2021.10.08 Hansoo Lee 처음 작성함 
*/
public class Application {
	UserController userController = new UserController();
	public static void main(String[] args) {

		UserController userController = new UserController();

		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("========= 유저조회 단위테스트 =========");
			System.out.println("1. 다 조회해보기");
			System.out.println("2. 회원입력");
			System.out.println("3. 회원정보 수정, 블랙리스트 등록, 회원삭제 (안보이게)");
			System.out.println("4. 아이디 찾기");
			System.out.println("5. 코드로 회원정보 조회");
			System.out.println("6. 비밀번호 초기화 (마지막에)");
			System.out.println("7. 페이징 처리");
			System.out.print("메뉴를 선택하세요 : ");
			int no = sc.nextInt();

			switch (no) {
			case 1:
				userController.selectAllUserList();
				break;

			case 2:
				userController.insertUser(signup());
				break;

			case 3:
				modifyUser();
				break;

			case 4:
				userController.findUserId(findId());
				break;
				
			case 5:
				userController.codeSelectUser(codeSelect());
				break;
				
			case 6:
				break;
				
			case 7:
				userController.userListPaging(pageNo());
				break;

			}
		} while (true);
	}



	private static int pageNo() {
		Scanner sc = new Scanner(System.in);
		System.out.print("페이지 넘버 : ");
		int pageNo = sc.nextInt();
		
		System.out.println(pageNo + "번 페이지 조회시 나오는 Row");
		
		return pageNo;
	}



	private static UserDTO signup() {
		Scanner sc = new Scanner(System.in);
		System.out.print("아이디");
		String id = sc.nextLine();
		System.out.print("비번");
		String pwd = sc.nextLine();
		System.out.print("이멜");
		String email = sc.nextLine();
		System.out.print("폰번");
		String phone = sc.nextLine();
		System.out.print("이름");
		String name = sc.nextLine();
		java.sql.Date bdate = java.sql.Date.valueOf("2002-06-22");
		System.out.print("남여 : ");
		String gender = sc.nextLine();

		UserDTO signupUser = new UserDTO();
		signupUser.setId(id);
		signupUser.setPsw(pwd);
		signupUser.setEmail(email);
		signupUser.setPhone(phone);
		signupUser.setName(name);
		signupUser.setDate(bdate);
		signupUser.setGender(gender);

		System.out.println("memberController requestMember : " + signupUser);

		return signupUser;
	}

	private static void modifyUser() {
		UserController userController = new UserController();
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("========= 회원정보 수정 단위테스트 =========");
			System.out.println("1. 코드로 회원정보 수정");
			System.out.println("2. 코드로 블랙리스트 등록");
			System.out.println("3. 코드로 탈퇴 or 휴면상태로 등록");
			System.out.println("9. 이전메뉴로");
			System.out.print("메뉴를 선택하세요 : ");
			int no = sc.nextInt();

			switch (no) {
			case 1:
				modifyUserinfor(userController.codeSelectUser(codeSelect()));
				break;

			case 2:
				registBlackUser(userController.codeSelectUser(codeSelect()));
				break;

			case 3:
				registDeactivateUser();
				break;

			case 9 : return;
			
			default : System.out.println("번호를 잘못 입력하셨습니다.");
			}
		} while (false);
	

	}




	private static void modifyUserinfor(UserDTO codeSelectUser) {
		UserController userController = new UserController();
		Scanner sc = new Scanner(System.in);
		
		UserDTO user = codeSelectUser;
		
		System.out.println(user);
		
		do {
			System.out.println("========= 코드 선택후 회원정보 수정 단위테스트 =========");
			System.out.println("1. 정보 다시 조회");
			System.out.println("2. 이메일 수정");
			System.out.println("3. 핸드폰번호 수정");
			System.out.println("4. 이름 수정");
//			System.out.println("5. 생년월일 수정");
			System.out.println("6. 성별 수정");
			System.out.println("7. 예치금 수정");
			System.out.println("8. 수정 사항 적용");
			System.out.println("9. 이전메뉴로");
			System.out.print("메뉴를 선택하세요 : ");
			int no = sc.nextInt();
			sc.nextLine();
			switch (no) {
			case 1:
				System.out.println(user);
				break;

			case 2:
				System.out.print("수정할 이메일 입력");
				String email = sc.nextLine();
				user.setEmail(email);
				break;

			case 3:
				System.out.print("수정할 핸드폰번호 입력");
				String phone = sc.nextLine();
				user.setPhone(phone);
				break;
				
			case 4:
				System.out.print("수정할 이름 입력");
				String name = sc.nextLine();
				user.setName(name);
				break;
				
//			case 5:
//				System.out.print("수정할 생년월일 입력");
//				String email = sc.nextLine();
//				break;
				
			case 6:
				System.out.print("수정할 성별 입력 (M or F)");
				String gender = sc.nextLine();
				user.setGender(gender);
				break;
				
			case 7:
				System.out.print("수정할 예치금 입력 (숫자만)");
				int deposit = sc.nextInt();
				user.setDeposit(deposit);
				break;
				
			case 8:
				userController.modifyUserInfor(user);
				return;

			case 9 : return;
			
			default : System.out.println("번호를 잘못 입력하셨습니다.");
			}
		} while (true);
	}



	private static void registDeactivateUser() {
		UserController userController = new UserController();
		Scanner sc = new Scanner(System.in);
		UserDTO user = userController.codeSelectUser(codeSelect());
		System.out.println(user);
		int entCode = 1;
		
		do {
			System.out.println("========= 코드 선택후 탈퇴 or 휴면상태 수정 단위테스트 =========");
			System.out.println("1. 이름과 아이디 다시 조회");
			System.out.println("2. 탈퇴 or 휴면상태 수정 설정");
			System.out.println("3. 활성회원으로 설정");
			System.out.println("8. 수정 사항 적용");
			System.out.println("9. 이전메뉴로");
			System.out.print("메뉴를 선택하세요 : ");
			int no = sc.nextInt();
			sc.nextLine();
			switch (no) {
			case 1:
				System.out.println("아이디 : " + user.getId());
				System.out.println("이름 : " + user.getName());
				break;

			case 2:
				System.out.print("탈퇴 or 휴면상태 수정");
				System.out.print(" 3 :휴면회원 , 4: 본인탈퇴, 5: 강제탈퇴 ");
				int entNo = sc.nextInt();
				
					switch (entNo) {
					
						case 3:
							System.out.println("3 :휴면회원으로 설정");
							System.out.println("상태코드 : " + user.getEntCode());
							user.setEntCode(entNo);
							break;
						case 4:
							System.out.println("4 :본인탈퇴회원으로 설정");
							System.out.println("상태코드 : " + user.getEntCode());
							user.setEntCode(entNo);
							break;
						case 5:
							System.out.println("5 :강제탈퇴회원으로 설정");
							System.out.println("상태코드 : " + user.getEntCode());
							user.setEntCode(entNo);
							break;
							
						default : System.out.println("번호를 잘못 입력하셨습니다.");
					}
				
				break;

			case 3:
				entCode = 1;
				user.setEntCode(entCode);
				System.out.print("활성회원으로 설정 수정");
				break;
				
			case 8:
				userController.modifyUserEntCode(user);
				return;

			case 9 : return;
			
			default : System.out.println("번호를 잘못 입력하셨습니다.");
			}
		} while (true);
		
	}



	private static void registBlackUser(UserDTO codeSelectUser) {
		UserController userController = new UserController();
		Scanner sc = new Scanner(System.in);
		UserDTO user = codeSelectUser;
		System.out.println(user);
		
		int entCode = 1;
		
		do {
			System.out.println("========= 코드 선택후 블랙리스트 상태 수정 단위테스트 =========");
			System.out.println("1. 이름과 아이디 다시 조회");
			System.out.println("2. 블랙리스트 설정");
			System.out.println("3. 블랙리스트 해제 (활성회원으로)");
			System.out.println("8. 수정 사항 적용");
			System.out.println("9. 이전메뉴로");
			System.out.print("메뉴를 선택하세요 : ");
			int no = sc.nextInt();
			sc.nextLine();
			switch (no) {
			case 1:
				System.out.println("아이디 : " + user.getId());
				System.out.println("이름 : " + user.getName());
				break;

			case 2:
				entCode = 2;
				user.setEntCode(entCode);
				System.out.print("블랙리스트로 설정 수정");
				break;

			case 3:
				entCode = 1;
				user.setEntCode(entCode);
				System.out.print("활성회원으로 설정 수정");
				break;
				
			case 8:
				userController.modifyUserEntCode(user);
				return;

			case 9 : return;
			
			default : System.out.println("번호를 잘못 입력하셨습니다.");
			}
		} while (true);
	}

	 /**
	  * @return Map으로 회원 코드 번호를 매개변수로 전달, int를 매개변수로 사용해도 무방하다.
	  *         여기에선 통일성과 테스트를 목적으로 Map으로 전달 하였다.
	  */
	private static Map<String, String> codeSelect() {
		Scanner sc = new Scanner(System.in);
		System.out.print("코드를 입력하세요 : ");
		String code = sc.nextLine();
		
		Map<String, String> userCode = new HashMap<>();
		userCode.put("code", code);
		
		
		return userCode;
	}
	
	
	private static Map<String, String> findId() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("이름을 입력하세요.");
		String name = sc.nextLine();
		System.out.println("이메일을 입력하세요.");
		String email = sc.nextLine();
		
		Map<String, String> findId = new HashMap<>();
		
		findId.put("name", name);
		findId.put("email", email);
		
		return findId;
	}
}
