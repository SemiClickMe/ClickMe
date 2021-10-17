package org.clickMe.post.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class PostForAdminDTO implements Serializable {
	private static final long serialVersionUID = 7245515375323509808L;

	private int code;
	private String authStatus;
	private String title;
	private String sellerId;
	private String blindYn;
	private java.sql.Date time;
	
	public PostForAdminDTO() {
	}

	public PostForAdminDTO(int code, String authStatus, String title, String sellerId, String blindYn, Date time) {
		this.code = code;
		this.authStatus = authStatus;
		this.title = title;
		this.sellerId = sellerId;
		this.blindYn = blindYn;
		this.time = time;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBlindYn() {
		return blindYn;
	}

	public void setBlindYn(String blindYn) {
		this.blindYn = blindYn;
	}

	public java.sql.Date getTime() {
		return time;
	}

	public void setTime(java.sql.Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "PostForAdminDTO [code=" + code + ", authStatus=" + authStatus
				+ ", title=" + title + ", sellerId=" + sellerId
				+ ", blindYn=" + blindYn + ", time=" + time + "]";
	}
	
}
