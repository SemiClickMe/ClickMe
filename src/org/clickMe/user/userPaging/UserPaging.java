package org.clickMe.user.userPaging;

/**   
	* @packageName : org.clickMe.user.userPaging 
	* @Class : UserPaging
    * @Comment : 페이징을 하는데 필요한 변수들을 계산하고, 정리하는 클래스이다.
	* @fileName : UserPaging.java 
	* @author : Hansoo Lee
    * @History : 2021.10.15 Hansoo Lee 처음 작성함 
    * @see 참고할 class나 외부 url
*/
public class UserPaging {

	public static UserPageCriteria getSelectCriteria(int pageNo, int totalCount, int limitUserNum, int buttonAmount) {

		return getSelectCriteria(pageNo, totalCount, limitUserNum, buttonAmount, null, null, null);

	}

	public static UserPageCriteria getSelectCriteria(int pageNo, int totalCount, int limitUserNum, int buttonAmount,
			String searchUserCondition, String searchUserValue, String userListEntCondition) {

		int maxPage;
		int startPage;
		int endPage;
		int startRow;
		int endRow;

		maxPage = ((totalCount - 1) / limitUserNum) + 1;

		startPage = ((pageNo - 1) / buttonAmount ) * buttonAmount + 1;

		endPage = startPage + buttonAmount - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		if (maxPage == 0 && endPage == 0) {
			maxPage = startPage;
			endPage = startPage;
		}

		startRow = (pageNo - 1) * limitUserNum + 1;
		endRow = startRow + limitUserNum - 1;

		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		UserPageCriteria selectCriteria = new UserPageCriteria (pageNo, totalCount, limitUserNum, buttonAmount ,maxPage, startPage, endPage, startRow, endRow, searchUserCondition, searchUserValue, userListEntCondition);

		return selectCriteria;
	}

}
