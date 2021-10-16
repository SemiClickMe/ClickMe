package org.clickMe.post.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class DetailPostDTO implements Serializable{
	private static final long serialVersionUID = 4585237131053417290L;
	
	private int code;
	private String sellerId;
	private String buyerId;
	private String catName;
	private String authStatus;
	private String title;
	private String content;
	private int likeCount;
	private java.sql.Date time;
	private String soldYn;
	private int reportCount;
	private String blindYn;
	private int itemPrice;
	private int view;
	
	public DetailPostDTO() {
	}

	public DetailPostDTO(int code, String sellerId, String buyerId, String catName, String authStatus, String title,
			String content, int likeCount, Date time, String soldYn, int reportCount, String blindYn, int itemPrice,
			int view) {
		this.code = code;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.catName = catName;
		this.authStatus = authStatus;
		this.title = title;
		this.content = content;
		this.likeCount = likeCount;
		this.time = time;
		this.soldYn = soldYn;
		this.reportCount = reportCount;
		this.blindYn = blindYn;
		this.itemPrice = itemPrice;
		this.view = view;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public java.sql.Date getTime() {
		return time;
	}

	public void setTime(java.sql.Date time) {
		this.time = time;
	}

	public String getSoldYn() {
		return soldYn;
	}

	public void setSoldYn(String soldYn) {
		this.soldYn = soldYn;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getBlindYn() {
		return blindYn;
	}

	public void setBlindYn(String blindYn) {
		this.blindYn = blindYn;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "DetailPostDTO [code=" + code + ", sellerId=" + sellerId + ", buyerId=" + buyerId + ", catName="
				+ catName + ", authStatus=" + authStatus + ", title=" + title + ", content=" + content + ", likeCount="
				+ likeCount + ", time=" + time + ", soldYn=" + soldYn + ", reportCount=" + reportCount + ", blindYn="
				+ blindYn + ", itemPrice=" + itemPrice + ", view=" + view + "]";
	}

	
}
