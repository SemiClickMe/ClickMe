package org.clickMe.common.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class RecommentDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3803272163819491044L;
	private int re_comment_code;
	private int cmt_code;
	private String re_comment_content;
	private java.sql.Date re_comment_time;
	private String re_comment_Yn;

	public RecommentDTO(int re_comment_code, int cmt_code, String re_comment_content, Date re_comment_time,
			String re_comment_Yn) {
		super();
		this.re_comment_code = re_comment_code;
		this.cmt_code = cmt_code;
		this.re_comment_content = re_comment_content;
		this.re_comment_time = re_comment_time;
		this.re_comment_Yn = re_comment_Yn;
	}

	public int getRe_comment_code() {
		return re_comment_code;
	}

	public void setRe_comment_code(int re_comment_code) {
		this.re_comment_code = re_comment_code;
	}

	public int getCmt_code() {
		return cmt_code;
	}

	public void setCmt_code(int cmt_code) {
		this.cmt_code = cmt_code;
	}

	public String getRe_comment_content() {
		return re_comment_content;
	}

	public void setRe_comment_content(String re_comment_content) {
		this.re_comment_content = re_comment_content;
	}

	public java.sql.Date getRe_comment_time() {
		return re_comment_time;
	}

	public void setRe_comment_time(java.sql.Date re_comment_time) {
		this.re_comment_time = re_comment_time;
	}

	public String getRe_comment_Yn() {
		return re_comment_Yn;
	}

	public void setRe_comment_Yn(String re_comment_Yn) {
		this.re_comment_Yn = re_comment_Yn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReviewDTO [re_comment_code=" + re_comment_code + ", cmt_code=" + cmt_code + ", re_comment_content="
				+ re_comment_content + ", re_comment_time=" + re_comment_time + ", re_comment_Yn=" + re_comment_Yn
				+ "]";
	}
	
	
	
}
