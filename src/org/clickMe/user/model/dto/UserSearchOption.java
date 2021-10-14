package org.clickMe.user.model.dto;

import java.io.Serializable;

public class UserSearchOption implements Serializable {

	private static final long serialVersionUID = -5544577773867652572L;
	
	private String option;
	private String value;
	
	public UserSearchOption() {
	}

	public UserSearchOption(String option, String value) {
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
