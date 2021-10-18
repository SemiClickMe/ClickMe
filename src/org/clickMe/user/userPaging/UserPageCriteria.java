package org.clickMe.user.userPaging;

import java.io.Serializable;

/**   
	* @packageName : org.clickMe.user.userPaging 
	* @Class : UserPageCriteria
    * @Comment : 페이징 처리시 사용되는 변수들을 자바빈 형태로 모아 놓았다.
	* @fileName : UserPageCriteria.java 
	* @author : Hansoo Lee
    * @History : 2021.10.15 Hansoo Lee 처음 작성함 
    * @see 참고할 class나 외부 url
*/
public class UserPageCriteria implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pageNo;	               // 요청한 페이지 번호
	private int totalCount;            // 전체 사용자 수
	private int limitUserNum;          // 한 페이지에 보여줄 사용자 수
	private int buttonAmount;          // 한 번에 보여줄 페이징 버튼의 갯수
	private int maxPage;               // 가장 마지막 페이지
	private int startPage;			   // 한 번에 보여줄 페이징 버튼의 시작하는 페이지 수
	private int endPage;               // 한 번에 보여줄 페이징 버튼의 마지막 페이지 수
	private int startRow;              // DB 조회 시 최신 사용자 부터 조회해야 하는 행의 시작 수
	private int endRow;                // DB 조회 시 최신 사용자부터 조회해야 하는 행의 마지막 수
	private String searchUserCondition;    // 검색 조건
	private String searchUserValue;        // 검색어
	private String userListEntCondition;   // 선택된 사용자상태 조건 
	
	public UserPageCriteria() {
	}

	public UserPageCriteria(int pageNo, int totalCount, int limitUserNum, int buttonAmount, int maxPage,
			int startPage, int endPage, int startRow, int endRow, String searchUserCondition, String searchUserValue,
			String userListEntCondition) {
		this.pageNo = pageNo;
		this.totalCount = totalCount;
		this.limitUserNum = limitUserNum;
		this.buttonAmount = buttonAmount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.searchUserCondition = searchUserCondition;
		this.searchUserValue = searchUserValue;
		this.userListEntCondition = userListEntCondition;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getLimitUserNum() {
		return limitUserNum;
	}

	public void setLimitUserNum(int limitUserNum) {
		this.limitUserNum = limitUserNum;
	}

	public int getButtonAmount() {
		return buttonAmount;
	}

	public void setButtonAmount(int buttonAmount) {
		this.buttonAmount = buttonAmount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getSearchUserCondition() {
		return searchUserCondition;
	}

	public void setSearchUserCondition(String searchUserCondition) {
		this.searchUserCondition = searchUserCondition;
	}

	public String getSearchUserValue() {
		return searchUserValue;
	}

	public void setSearchUserValue(String searchUserValue) {
		this.searchUserValue = searchUserValue;
	}

	public String getUserListEntCondition() {
		return userListEntCondition;
	}

	public void setUserListEntCondition(String userListEntCondition) {
		this.userListEntCondition = userListEntCondition;
	}

	@Override
	public String toString() {
		return "UserPageDTO [pageNo=" + pageNo + ", totalCount=" + totalCount + ", limitUserNum=" + limitUserNum
				+ ", buttonAmount=" + buttonAmount + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", startRow=" + startRow + ", endRow=" + endRow + ", searchUserCondition="
				+ searchUserCondition + ", searchUserValue=" + searchUserValue + ", userListEntCondition="
				+ userListEntCondition + "]";
	}


	
}
