package org.clickMe.common.model.dto;

import java.io.Serializable;

public class ReportPerMemberDTO implements Serializable{
	private static final long serialVersionUID = 1L;

	private int userCode;
	private int postCode;
	
	public CmtDTO(int userCode, int postCode) {
		this.userCode = userCode;
		this.postCode = postCode;
	}
	
	public CmtDTO() {
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	@Override
	public String toString() {
		return "CmtDTO [userCode=" + userCode + ", postCode=" + postCode + "]";
	}
	
}
