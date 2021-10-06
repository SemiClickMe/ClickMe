package org.clickMe.common.model.dto;

import java.sql.Date;

public class InquiryDTO implements java.io.Serializable {

	private static final long serialVersionUID = -9194975670319475203L;

	private int no;
	private int inqTypeCode;
	private int userCode;
	private String inqTitle;
	private String inqContent;
	private Date inqTime;
	private String ansContent;
	private Date ansTime;
	private String ansYn;
	
	public InquiryDTO() {
	}

	public InquiryDTO(int no, int inqTypeCode, int userCode, String inqTitle, String inqContent, Date inqTime,
			String ansContent, Date ansTime, String ansYn) {
		this.no = no;
		this.inqTypeCode = inqTypeCode;
		this.userCode = userCode;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqTime = inqTime;
		this.ansContent = ansContent;
		this.ansTime = ansTime;
		this.ansYn = ansYn;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getInqTypeCode() {
		return inqTypeCode;
	}

	public void setInqTypeCode(int inqTypeCode) {
		this.inqTypeCode = inqTypeCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public Date getInqTime() {
		return inqTime;
	}

	public void setInqTime(Date inqTime) {
		this.inqTime = inqTime;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsTime() {
		return ansTime;
	}

	public void setAnsTime(Date ansTime) {
		this.ansTime = ansTime;
	}

	public String getAnsYn() {
		return ansYn;
	}

	public void setAnsYn(String ansYn) {
		this.ansYn = ansYn;
	}

	@Override
	public String toString() {
		return "InquiryDTO [no=" + no + ", inqTypeCode=" + inqTypeCode + ", userCode=" + userCode + ", inqTitle="
				+ inqTitle + ", inqContent=" + inqContent + ", inqTime=" + inqTime + ", ansContent=" + ansContent
				+ ", ansTime=" + ansTime + ", ansYn=" + ansYn + "]";
	}
	
	

}