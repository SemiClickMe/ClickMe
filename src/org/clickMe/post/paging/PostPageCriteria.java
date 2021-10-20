package org.clickMe.post.paging;

import java.io.Serializable;

public class PostPageCriteria implements Serializable {
	private static final long serialVersionUID = 7272834419633203963L;
	
	private int pageNo;					// 요청한 페이지 번호
	private int totalPostCount;			// 전체 게시글 수
	private int limitPostNumPerPage;	// 한 페이지에 보여줄 게시글 수
	private int buttonAmount;			// 한 번에 보여줄 페이징 버튼의 갯수
	private int maxPage;				// 가장 마지막 페이지
	private int startPage;				// 한 번에 보여줄 페이징 버튼의 시작하는 페이지 수
	private int endPage;				// 한 번에 보여줄 페이징 버튼의 마지막 페이지 수
	private int startRow;				// DB 조회 시 최신 게시글부터 조회해야 하는 행의 시작 수
	private int endRow;					// DB 조회 시 최신 게시글부터 조회해야 하는 행의 마지막 수
	private String sellerId;		// 작성자 검색어
	private String title;			// 제목 검색어
	private String content;			// 내용 검색어
	private String blindYn;			// 블라인드 검색어
	private int authCode;			// 감정코드 검색어
	private int itemPriceRangeMin;	// 최소금액 검색어
	private int itemPriceRangeMax;	// 최대금액 검색어
	
	public PostPageCriteria() {
	}

	public PostPageCriteria(int pageNo, int totalPostCount, int limitPostNumPerPage, int buttonAmount, int maxPage,
			int startPage, int endPage, int startRow, int endRow, String sellerId, String title, String content,
			String blindYn, int authCode, int itemPriceRangeMin, int itemPriceRangeMax) {
		this.pageNo = pageNo;
		this.totalPostCount = totalPostCount;
		this.limitPostNumPerPage = limitPostNumPerPage;
		this.buttonAmount = buttonAmount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.sellerId = sellerId;
		this.title = title;
		this.content = content;
		this.blindYn = blindYn;
		this.authCode = authCode;
		this.itemPriceRangeMin = itemPriceRangeMin;
		this.itemPriceRangeMax = itemPriceRangeMax;
	}

	public PostPageCriteria(int pageNo, int totalPostCount, int limitPostNumPerPage, int buttonAmount, int maxPage,
			int startPage, int endPage, int startRow, int endRow, String title, String content, int authCode,
			int itemPriceRangeMin, int itemPriceRangeMax) {
		this.pageNo = pageNo;
		this.totalPostCount = totalPostCount;
		this.limitPostNumPerPage = limitPostNumPerPage;
		this.buttonAmount = buttonAmount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.title = title;
		this.content = content;
		this.authCode = authCode;
		this.itemPriceRangeMin = itemPriceRangeMin;
		this.itemPriceRangeMax = itemPriceRangeMax;
	}

	public PostPageCriteria(int pageNo, int totalPostCount, int limitPostNumPerPage, int buttonAmount, int maxPage,
			int startPage, int endPage, int startRow, int endRow, String sellerId, String title, String content,
			String blindYn, int authCode) {
		this.pageNo = pageNo;
		this.totalPostCount = totalPostCount;
		this.limitPostNumPerPage = limitPostNumPerPage;
		this.buttonAmount = buttonAmount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.sellerId = sellerId;
		this.title = title;
		this.content = content;
		this.blindYn = blindYn;
		this.authCode = authCode;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPostCount() {
		return totalPostCount;
	}

	public void setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
	}

	public int getLimitPostNumPerPage() {
		return limitPostNumPerPage;
	}

	public void setLimitPostNumPerPage(int limitPostNumPerPage) {
		this.limitPostNumPerPage = limitPostNumPerPage;
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

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBlindYn() {
		return blindYn;
	}

	public void setBlindYn(String blindYn) {
		this.blindYn = blindYn;
	}

	public int getAuthCode() {
		return authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}

	public int getItemPriceRangeMin() {
		return itemPriceRangeMin;
	}

	public void setItemPriceRangeMin(int itemPriceRangeMin) {
		this.itemPriceRangeMin = itemPriceRangeMin;
	}

	public int getItemPriceRangeMax() {
		return itemPriceRangeMax;
	}

	public void setItemPriceRangeMax(int itemPriceRangeMax) {
		this.itemPriceRangeMax = itemPriceRangeMax;
	}

	@Override
	public String toString() {
		return "PostPageCriteria [pageNo=" + pageNo + ", totalPostCount=" + totalPostCount + ", limitPostNumPerPage="
				+ limitPostNumPerPage + ", buttonAmount=" + buttonAmount + ", maxPage=" + maxPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", startRow=" + startRow + ", endRow=" + endRow + ", sellerId="
				+ sellerId + ", title=" + title + ", content=" + content + ", blindYn=" + blindYn + ", authCode="
				+ authCode + ", itemPriceRangeMin=" + itemPriceRangeMin + ", itemPriceRangeMax=" + itemPriceRangeMax
				+ "]";
	}
	
}
