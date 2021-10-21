package org.clickMe.Inquiry.model.dto;

import java.io.Serializable;

public class InquirySearchCriteria implements Serializable {
	private static final long serialVersionUID = 3454420298937423130L;
	
	private String option;
	private String value;
	
	public InquirySearchCriteria() {
	}

	public InquirySearchCriteria(String option, String value) {
		this.option = option;
		this.value = value;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "SearchOption [option=" + option + ", value=" + value + "]";
	}
	
}
