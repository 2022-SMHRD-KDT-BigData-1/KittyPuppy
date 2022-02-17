package com.kittypuppy.model;

public class LostCoCommentDTO {
	
	private int coNo;
	private int locNo;
	private int lostNo;
	private String nick;
	private String content;
	private String coDate;
	private String coUpdate;
	
	
	public LostCoCommentDTO(int coNo, int locNo, int lostNo, String nick, String content, String coDate,
			String coUpdate) {
		super();
		this.coNo = coNo;
		this.locNo = locNo;
		this.lostNo = lostNo;
		this.nick = nick;
		this.content = content;
		this.coDate = coDate;
		this.coUpdate = coUpdate;
	}


	public int getCoNo() {
		return coNo;
	}


	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}


	public int getLocNo() {
		return locNo;
	}


	public void setLocNo(int locNo) {
		this.locNo = locNo;
	}


	public int getlostNo() {
		return lostNo;
	}


	public void setLostNo(int lostNo) {
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
