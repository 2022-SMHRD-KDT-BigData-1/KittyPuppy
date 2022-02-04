package com.kittypuppy.model;

public class ScrapDTO {
	
	private String nick;
	private String feedNo;
	private String scrapDate;
	
	public ScrapDTO(String nick, String feedNo, String scrapDate) {
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

	public String getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(String feedNo) {
		this.feedNo = feedNo;
	}

	public String getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(String scrapDate) {
		this.scrapDate = scrapDate;
	}
	
}
