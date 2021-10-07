package org.clickMe.member.model.dto;

import java.sql.Date;

public class MemberDTO implements java.io.Serializable{

	private int no;
	private String id;
	private String pwd;
	private String email;
	private String phone;
	private String name;
	private java.sql.Date date; 
	private String gender;
	
	public MemberDTO() {
	
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", phone=" + phone
				+ ", name=" + name + ", date=" + date + ", gender=" + gender + "]";
	}

	public MemberDTO(int no, String id, String pwd, String email, String phone, String name, Date date, String gender) {
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.name = name;
		this.date = date;
		this.gender = gender;
	}
}
