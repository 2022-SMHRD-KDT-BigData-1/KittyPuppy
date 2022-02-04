package com.kittypuppy.model;

public class FeedLikeDTO {

	private String feedNo;
	private String nick;
	
	public FeedLikeDTO(String feedNo, String nick) {
		super();
		this.feedNo = feedNo;
		this.nick = nick;
	}

	public String getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(String feedNo) {
		this.feedNo = feedNo;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
}
