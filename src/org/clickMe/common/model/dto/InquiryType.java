package org.clickMe.common.model.dto;

public class InquiryType implements java.io.Serializable {

	private static final long serialVersionUID = 1974348914846639079L;

	private int no;
	private String inqType;

	public InquiryType() {
	}

	public InquiryType(int no, String inqType) {
		this.no = no;
		this.inqType = inqType;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getInqType() {
		return inqType;
	}

	public void setInqType(String inqType) {
		this.inqType = inqType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "InquiryType [no=" + no + ", inqType=" + inqType + "]";
	}

}
