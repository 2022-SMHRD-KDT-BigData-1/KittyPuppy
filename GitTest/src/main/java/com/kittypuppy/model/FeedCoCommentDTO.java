package com.kittypuppy.model;

public class FeedCoCommentDTO {
	
	private String coNo;
	private String fcNo;
	private String nick;
	private String content;
	private String coDate;
	private String coUpdate;
	
	public FeedCoCommentDTO(String coNo, String fcNo, String nick, String content, String coDate, String coUpdate) {
		super();
		this.coNo = coNo;
		this.fcNo = fcNo;
		this.nick = nick;
		this.content = content;
		this.coDate = coDate;
		this.coUpdate = coUpdate;
	}

	public String getCoNo() {
		return coNo;
	}

	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}

	public String getFcNo() {
		return fcNo;
	}

	public void setFcNo(String fcNo) {
		this.fcNo = fcNo;
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
