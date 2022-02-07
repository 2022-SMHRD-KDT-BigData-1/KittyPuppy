package com.kittypuppy.model;

public class FeedLikeDTO {

	private int feedNo;
	private String nick;
	
	public FeedLikeDTO(int feedNo, String nick) {
		super();
		this.feedNo = feedNo;
		this.nick = nick;
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
	
}
