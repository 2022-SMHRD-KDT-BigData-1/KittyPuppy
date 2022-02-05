package com.kittypuppy.model;

public class FeedCommentDTO {
	
	private int fcNo;
	private int feedNo;
	private String nick;
	private String content;
	private String coDate;
	private String coUpdate;
	
	public FeedCommentDTO(int fcNo, int feedNo, String nick, String content, String coDate, String coUpdate) {
		super();
		this.fcNo = fcNo;
		this.feedNo = feedNo;
		this.nick = nick;
		this.content = content;
		this.coDate = coDate;
		this.coUpdate = coUpdate;
	}
	
	public int getFcNo() {
		return fcNo;
	}
	public void setFcNo(int fcNo) {
		this.fcNo = fcNo;
	}
	public int getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
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
