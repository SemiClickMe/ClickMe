package org.clickMe.common.model.dto;

import java.io.Serializable;

public class ImgfileDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3397402052630757434L;

	private int imgCode;
	private int imgCatCode;
	private int inqCode;
	private int postCode;
	private int reviewCode;
	private String origName;
	private String uuidName;

	public ImgfileDTO(int imgCode, int imgCatCode, int inqCode, int postCode, int reviewCode, String origName,
			String uuidName) {
		super();
		this.imgCode = imgCode;
		this.imgCatCode = imgCatCode;
		this.inqCode = inqCode;
		this.postCode = postCode;
		this.reviewCode = reviewCode;
		this.origName = origName;
		this.uuidName = uuidName;
	}

	public int getImgCode() {
		return imgCode;
	}

	public void setImgCode(int imgCode) {
		this.imgCode = imgCode;
	}

	public int getImgCatCode() {
		return imgCatCode;
	}

	public void setImgCatCode(int imgCatCode) {
		this.imgCatCode = imgCatCode;
	}

	public int getInqCode() {
		return inqCode;
	}

	public void setInqCode(int inqCode) {
		this.inqCode = inqCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}

	public String getOrigName() {
		return origName;
	}

	public void setOrigName(String origName) {
		this.origName = origName;
	}

	public String getUuidName() {
		return uuidName;
	}

	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ImgfileDTO [imgCode=" + imgCode + ", imgCatCode=" + imgCatCode + ", inqCode=" + inqCode + ", postCode="
				+ postCode + ", reviewCode=" + reviewCode + ", origName=" + origName + ", uuidName=" + uuidName + "]";
	}

}
