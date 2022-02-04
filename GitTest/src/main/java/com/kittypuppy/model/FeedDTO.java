package com.kittypuppy.model;

public class FeedDTO {

	private String feedNo;
	private String nick;
	private String picAddress;
	private String content;
	private String tag;
	private String feedDate;
	private String feedUpate;
	private String openRange;
	
	public FeedDTO(String feedNo, String nick, String picAddress, String content, String tag, String feedDate,
			String feedUpate, String openRange) {
		super();
		this.feedNo = feedNo;
		this.nick = nick;
		this.picAddress = picAddress;
		this.content = content;
		this.tag = tag;
		this.feedDate = feedDate;
		this.feedUpate = feedUpate;
		this.openRange = openRange;
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

	public String getPicAddress() {
		return picAddress;
	}

	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getFeedDate() {
		return feedDate;
	}

	public void setFeedDate(String feedDate) {
		this.feedDate = feedDate;
	}

	public String getFeedUpate() {
		return feedUpate;
	}

	public void setFeedUpate(String feedUpate) {
		this.feedUpate = feedUpate;
	}

	public String getOpenRange() {
		return openRange;
	}

	public void setOpenRange(String openRange) {
		this.openRange = openRange;
	}
	
}
