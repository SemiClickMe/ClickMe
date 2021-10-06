package org.clickMe.common.model.dto;

import java.sql.Date;

public class PaymentDTO implements java.io.Serializable {

	private static final long serialVersionUID = -3667724811978898160L;

	private int no;
	private int postCode;
	private String method;
	private Date patmentTime;
	
	public PaymentDTO() {}

	public PaymentDTO(int no, int postCode, String method, Date patmentTime) {
		this.no = no;
		this.postCode = postCode;
		this.method = method;
		this.patmentTime = patmentTime;
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

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Date getPatmentTime() {
		return patmentTime;
	}

	public void setPatmentTime(Date patmentTime) {
		this.patmentTime = patmentTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentDTO [no=" + no + ", postCode=" + postCode + ", method=" + method + ", patmentTime=" + patmentTime
				+ "]";
	}

	
}