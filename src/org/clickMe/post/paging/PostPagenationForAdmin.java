package org.clickMe.post.paging;

public class PostPagenationForAdmin {

	public static PostPageCriteria getPostPageCriteria(int pageNo, int totalPostCount, int limitPostNumPerPage,
			int buttonAmount) {
		return getPostPageCriteria(pageNo, totalPostCount, limitPostNumPerPage, buttonAmount, null, null, 0, null, null);
	}

	public static PostPageCriteria getPostPageCriteria(int pageNo, int totalPostCount, int limitPostNumPerPage,
			int buttonAmount, String title, String content, int authCode, String sellerId, String blindYn) {
		
		int maxPage;
		int startPage;
		int endPage;
		int startRow;
		int endRow;
		
		maxPage = ((totalPostCount - 1) / limitPostNumPerPage) + 1;

		startPage = ((pageNo - 1) / buttonAmount ) * buttonAmount + 1;

		endPage = startPage + buttonAmount - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		if (maxPage == 0 && endPage == 0) {
			maxPage = startPage;
			endPage = startPage;
		}
		
		startRow = (pageNo - 1) * limitPostNumPerPage + 1;
		endRow = startRow + limitPostNumPerPage - 1;

		System.out.println("startRow : " + startRow + "\t" + "endRow : " + endRow);
		
		PostPageCriteria postPageCriteria = new PostPageCriteria(
				pageNo, totalPostCount, limitPostNumPerPage, buttonAmount, maxPage, startPage, endPage, startRow, endRow,
				title, content, authCode, sellerId, blindYn);

		return postPageCriteria;
	}

}
