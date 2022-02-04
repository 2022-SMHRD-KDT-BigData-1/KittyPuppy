package com.kittypuppy.model;

public class LostCommentDTO {
	
	private String locNo;
	private String lostNo;
	private String nick;
	private String content;
	private String coDate;
	private String coUpdate;
	
	public LostCommentDTO(String locNo, String lostNo, String nick, String content, String coDate, String coUpdate) {
		super();
		this.locNo = locNo;
		this.lostNo = lostNo;
		this.nick = nick;
		this.content = content;
		this.coDate = coDate;
		this.coUpdate = coUpdate;
	}

	public String getLocNo() {
		return locNo;
	}

	public void setLocNo(String locNo) {
		this.locNo = locNo;
	}

	public String getLostNo() {
		return lostNo;
	}

	public void setLostNo(String lostNo) {
		this.lostNo = lostNo;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCoDate() {
		return coDate;
	}

	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}

	public String getCoUpdate() {
		return coUpdate;
	}

	public void setCoUpdate(String coUpdate) {
		this.coUpdate = coUpdate;
	}
	
}
