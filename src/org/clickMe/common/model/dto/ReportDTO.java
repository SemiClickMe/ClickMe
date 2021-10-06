package org.clickMe.common.model.dto;

import java.io.Serializable;

public class ReportDTO implements Serializable{

	private static final long serialVersionUID = -8180867708829928474L;

	private int reportCode;
	private int postCode;
	private String reason;
	
	public ReportDTO() {
	}
	
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public ReportDTO(int reportCode, int postCode, String reason) {
		this.reportCode = reportCode;
		this.postCode = postCode;
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "ReportDTO [reportCode=" + reportCode + ", postCode=" + postCode + ", reason=" + reason + "]";
	}
	
}
