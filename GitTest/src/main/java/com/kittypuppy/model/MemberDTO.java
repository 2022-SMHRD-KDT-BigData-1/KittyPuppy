package com.kittypuppy.model;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String picAdress;
	private String nick;
	private String sex;
	private String age;
	private String adress;
	private String profile;
	private String isAnimal;
	
	public MemberDTO(String id, String pw, String picAdress, String nick, String sex, String age, String adress,
			String profile, String isAnimal) {
		super();
		this.id = id;
		this.pw = pw;
		this.picAdress = picAdress;
		this.nick = nick;
		this.sex = sex;
		this.age = age;
		this.adress = adress;
		this.profile = profile;
		this.isAnimal = isAnimal;
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

	public String getPicAdress() {
		return picAdress;
	}

	public void setPicAdress(String picAdress) {
		this.picAdress = picAdress;
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

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIsAnimal() {
		return isAnimal;
	}

	public void setIsAnimal(String isAnimal) {
		this.isAnimal = isAnimal;
	}
	
}
