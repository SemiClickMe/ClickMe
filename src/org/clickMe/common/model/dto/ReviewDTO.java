package org.clickMe.common.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class ReviewDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int review_code;
	private int post_code;
	private String review_content;
	private int review_grade;
	private java.sql.Date review_time;
	
	public ReviewDTO(int review_code, int post_code, String review_content, int review_grade, Date review_time) {
		super();
		this.review_code = review_code;
		this.post_code = post_code;
		this.review_content = review_content;
		this.review_grade = review_grade;
		this.review_time = review_time;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	public int getPost_code() {
		return post_code;
	}

	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}

	public java.sql.Date getReview_time() {
		return review_time;
	}

	public void setReview_time(java.sql.Date review_time) {
		this.review_time = review_time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_code=" + review_code + ", post_code=" + post_code + ", review_content="
				+ review_content + ", review_grade=" + review_grade + ", review_time=" + review_time + "]";
	}

	
}