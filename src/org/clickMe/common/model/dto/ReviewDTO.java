package org.clickMe.common.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class ReviewDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int no;
	private int postCode;
	private String reviewContent;
	private int reviewGrade;
	private java.sql.Date reviewTime;

	public ReviewDTO(int no, int postCode, String reviewContent, int reviewGrade, Date reviewTime) {
		super();
		this.no = no;
		this.postCode = postCode;
		this.reviewContent = reviewContent;
		this.reviewGrade = reviewGrade;
		this.reviewTime = reviewTime;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public java.sql.Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(java.sql.Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReviewDTO [no=" + no + ", postCode=" + postCode + ", reviewContent=" + reviewContent + ", reviewGrade="
				+ reviewGrade + ", reviewTime=" + reviewTime + "]";
	}

}