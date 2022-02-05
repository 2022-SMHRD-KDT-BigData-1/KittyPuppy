package com.kittypuppy.model;

public class AnimalDTO {
	
	private String nick;
	private String animalName;
	private String animalPic;
	private String upKind;
	private String kind;
	private String animalSex;
	private int animalAge;
	private String animalProfile;

	public AnimalDTO(String nick, String animalName, String animalPic, String upKind, String kind, String animalSex,
			int animalAge, String animalProfile) {
		super();
		this.nick = nick;
		this.animalName = animalName;
		this.animalPic = animalPic;
		this.upKind = upKind;
		this.kind = kind;
		this.animalSex = animalSex;
		this.animalAge = animalAge;
		this.animalProfile = animalProfile;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public String getAnimalPic() {
		return animalPic;
	}

	public void setAnimalPic(String animalPic) {
		this.animalPic = animalPic;
	}

	public String getUpKind() {
		return upKind;
	}

	public void setUpKind(String upKind) {
		this.upKind = upKind;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getAnimalSex() {
		return animalSex;
	}

	public void setAnimalSex(String animalSex) {
		this.animalSex = animalSex;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public String getAnimalProfile() {
		return animalProfile;
	}

	public void setAnimalProfile(String animalProfile) {
		this.animalProfile = animalProfile;
	}

}
