package com.wagu.dto;

public class MemberDTO {
	private int memberID;
	private String email;
	private String pw;
	private String name;
	private int birth;
	private String phone1;
	private String phone2;
	private String phone3;
	/* private String phone; */
	private String image;
	
	public MemberDTO() {}

	public MemberDTO(int memberID, String email, String pw, String name, int birth, String phone1, String phone2,
			String phone3, String image) {
		super();
		this.memberID = memberID;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.image = image;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

	
	
	
}
