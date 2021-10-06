package org.clickMe.common.model.dto;

import java.sql.Date;

public class PaymentDTO implements java.io.Serializable {

	private static final long serialVersionUID = -3667724811978898160L;

	private int no;
	private int postCode;
	private String method;
	private Date paymentTime;
	
	public PaymentDTO() {
	}

	public PaymentDTO(int no, int postCode, String method, Date paymentTime) {
		this.no = no;
		this.postCode = postCode;
		this.method = method;
		this.paymentTime = paymentTime;
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

	public Date getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentDTO [no=" + no + ", postCode=" + postCode + ", method=" + method + ", paymentTime=" + paymentTime
				+ "]";
	}
	
	
	
}