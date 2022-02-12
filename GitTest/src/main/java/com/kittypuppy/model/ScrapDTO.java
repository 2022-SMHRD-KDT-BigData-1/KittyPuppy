package com.kittypuppy.model;

public class ScrapDTO {
	
	private String nick; // ��ũ�� ���� �ǵ� �Խ��� �г���
	private int feedNo;
	private String scrapDate;
	private String sNick;// ��ũ�� �� ��� �г���
	
	public ScrapDTO(String nick, int feedNo, String scrapDate, String sNick) {
		super();
		this.nick = nick;
		this.feedNo = feedNo;
		this.scrapDate = scrapDate;
		this.sNick = sNick;
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
	
	public String getSNick() {
		return sNick;
	}

	public void setSNick(String sNick) {
		this.sNick = sNick;
	}
	
}
