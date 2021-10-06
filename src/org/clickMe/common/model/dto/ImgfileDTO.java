package org.clickMe.common.model.dto;

import java.io.Serializable;

public class ImgfileDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3397402052630757434L;

	private int img_code;
	private int img_cat_code;
	private int inq_code;
	private int post_code;
	private int review_code;
	private String orig_name;
	private String uuid_nave;
	
	public ImgfileDTO(int img_code, int img_cat_code, int inq_code, int post_code, int review_code, String orig_name,
			String uuid_nave) {
		super();
		this.img_code = img_code;
		this.img_cat_code = img_cat_code;
		this.inq_code = inq_code;
		this.post_code = post_code;
		this.review_code = review_code;
		this.orig_name = orig_name;
		this.uuid_nave = uuid_nave;
	}
	
	public int getImg_code() {
		return img_code;
	}
	public void setImg_code(int img_code) {
		this.img_code = img_code;
	}
	public int getImg_cat_code() {
		return img_cat_code;
	}
	public void setImg_cat_code(int img_cat_code) {
		this.img_cat_code = img_cat_code;
	}
	public int getInq_code() {
		return inq_code;
	}
	public void setInq_code(int inq_code) {
		this.inq_code = inq_code;
	}
	public int getPost_code() {
		return post_code;
	}
	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}
	public int getReview_code() {
		return review_code;
	}
	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}
	public String getOrig_name() {
		return orig_name;
	}
	public void setOrig_name(String orig_name) {
		this.orig_name = orig_name;
	}
	public String getUuid_nave() {
		return uuid_nave;
	}
	public void setUuid_nave(String uuid_nave) {
		this.uuid_nave = uuid_nave;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "ImgfileDTO [img_code=" + img_code + ", img_cat_code=" + img_cat_code + ", inq_code=" + inq_code
				+ ", post_code=" + post_code + ", review_code=" + review_code + ", orig_name=" + orig_name
				+ ", uuid_nave=" + uuid_nave + "]";
	}
	
	
}
