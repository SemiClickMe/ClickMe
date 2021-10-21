package org.clickMe.post.model.dto;

import java.io.Serializable;

public class PostForUserDTO implements Serializable {
	private static final long serialVersionUID = -3866000657531620526L;
	
	private int code;
	private String title;
	private int itemPrice;
	private String authStatus;
	private int likes;
	private int views;
	private String thumbPath;
	
	public PostForUserDTO() {
	}

	public PostForUserDTO(int code, String title, int itemPrice, String authStatus, int likes, int views,
			String thumbPath) {
		this.code = code;
		this.title = title;
		this.itemPrice = itemPrice;
		this.authStatus = authStatus;
		this.likes = likes;
		this.views = views;
		this.thumbPath = thumbPath;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getThumbPath() {
		return thumbPath;
	}

	public void setThumbPath(String thumbPath) {
		this.thumbPath = thumbPath;
	}

	@Override
	public String toString() {
		return "PostForUserDTO [code=" + code + ", title=" + title + ", itemPrice=" + itemPrice + ", authStatus="
				+ authStatus + ", likes=" + likes + ", views=" + views + ", thumbPath=" + thumbPath + "]";
	}
	
}
