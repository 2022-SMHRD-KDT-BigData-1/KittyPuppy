package com.kittypuppy.model;

public class DMDTO {
	
	private String dmNo;
	private String sendNick;
	private String receiveNick;
	private String content;
	private String sendDate;
	
	public DMDTO(String dmNo, String sendNick, String receiveNick, String content, String sendDate) {
		super();
		this.dmNo = dmNo;
		this.sendNick = sendNick;
		this.receiveNick = receiveNick;
		this.content = content;
		this.sendDate = sendDate;
	}

	public String getDmNo() {
		return dmNo;
	}

	public void setDmNo(String dmNo) {
		this.dmNo = dmNo;
	}

	public String getSendNick() {
		return sendNick;
	}

	public void setSendNick(String sendNick) {
		this.sendNick = sendNick;
	}

	public String getReceiveNick() {
		return receiveNick;
	}

	public void setReceiveNick(String receiveNick) {
		this.receiveNick = receiveNick;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	
}
