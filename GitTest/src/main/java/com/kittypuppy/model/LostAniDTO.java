package com.kittypuppy.model;

public class LostAniDTO {
	
	private String lostNo;
	private String laType;
	private String nick;
	private String aniName;
	private String aniPic;
	private String upKind;
	private String kind;
	private String sex;
	private String color;
	private String aniSize;
	private String isTag;
	private String feature;
	private String content;
	private String place;
	private String laDate;
	private String laUpdate;
	
	public LostAniDTO(String lostNo, String laType, String nick, String aniName, String aniPic, String upKind,
			String kind, String sex, String color, String aniSize, String isTag, String feature, String content,
			String place, String laDate, String laUpdate) {
		super();
		this.lostNo = lostNo;
		this.laType = laType;
		this.nick = nick;
		this.aniName = aniName;
		this.aniPic = aniPic;
		this.upKind = upKind;
		this.kind = kind;
		this.sex = sex;
		this.color = color;
		this.aniSize = aniSize;
		this.isTag = isTag;
		this.feature = feature;
		this.content = content;
		this.place = place;
		this.laDate = laDate;
		this.laUpdate = laUpdate;
	}

	public String getLostNo() {
		return lostNo;
	}

	public void setLostNo(String lostNo) {
		this.lostNo = lostNo;
	}

	public String getLaType() {
		return laType;
	}

	public void setLaType(String laType) {
		this.laType = laType;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getAniName() {
		return aniName;
	}

	public void setAniName(String aniName) {
		this.aniName = aniName;
	}

	public String getAniPic() {
		return aniPic;
	}

	public void setAniPic(String aniPic) {
		this.aniPic = aniPic;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getAniSize() {
		return aniSize;
	}

	public void setAniSize(String aniSize) {
		this.aniSize = aniSize;
	}

	public String getIsTag() {
		return isTag;
	}

	public void setIsTag(String isTag) {
		this.isTag = isTag;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getLaDate() {
		return laDate;
	}

	public void setLaDate(String laDate) {
		this.laDate = laDate;
	}

	public String getLaUpdate() {
		return laUpdate;
	}

	public void setLaUpdate(String laUpdate) {
		this.laUpdate = laUpdate;
	}
	
}
