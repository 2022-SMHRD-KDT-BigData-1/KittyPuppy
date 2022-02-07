package com.kittypuppy.model;

public class FollowDTO {
	
	private String nick;
	private String followerNick;
	private String followDate;
	
	public FollowDTO(String nick, String followerNick, String followDate) {
		super();
		this.nick = nick;
		this.followerNick = followerNick;
		this.followDate = followDate;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getFollowerNick() {
		return followerNick;
	}

	public void setFollowerNick(String followerNick) {
		this.followerNick = followerNick;
	}

	public String getFollowDate() {
		return followDate;
	}

	public void setFollowDate(String followDate) {
		this.followDate = followDate;
	}
	
}
