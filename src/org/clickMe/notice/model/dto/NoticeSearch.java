package org.clickMe.notice.model.dto;

import java.io.Serializable;

public class NoticeSearch implements Serializable{

	private String option;
	private String value;

	public NoticeSearch() {
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
		return "NoticeList [option=" + option + ", value=" + value + "]";
	}

	public NoticeSearch(String option, String value) {
		super();
		this.option = option;
		this.value = value;
	}
	
}
