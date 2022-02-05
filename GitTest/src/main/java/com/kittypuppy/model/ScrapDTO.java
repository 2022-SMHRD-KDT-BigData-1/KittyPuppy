package com.kittypuppy.model;

public class ScrapDTO {
	
	private String nick;
	private int feedNo;
	private String scrapDate;
	
	public ScrapDTO(String nick, int feedNo, String scrapDate) {
		super();
		this.nick = nick;
		this.feedNo = feedNo;
		this.scrapDate = scrapDate;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public String getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(String scrapDate) {
		this.scrapDate = scrapDate;
	}
	
}
