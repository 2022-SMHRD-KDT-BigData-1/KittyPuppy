package com.kittypuppy.model;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String picAddress;
	private String nick;
	private String sex;
	private String birth;
	private String address;
	private String profile;
	
	public MemberDTO(String id, String pw, String picAddress, String nick, String sex, String birth, String address,
			String profile) {
		super();
		this.id = id;
		this.pw = pw;
		this.picAddress = picAddress;
		this.nick = nick;
		this.sex = sex;
		this.birth = birth;
		this.address = address;
		this.profile = profile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPicAddress() {
		return picAddress;
	}

	public void setPicAdress(String picAddress) {
		this.picAddress = picAddress;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setAge(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAdress(String address) {
		this.address = address;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	public MemberDTO(String id, String pw, String birth) {
		// 비밀번호 설정
		super();
		this.id = id;
		this.pw = pw;
		this.birth = birth;
		System.out.println("dto");
	}
	
}
