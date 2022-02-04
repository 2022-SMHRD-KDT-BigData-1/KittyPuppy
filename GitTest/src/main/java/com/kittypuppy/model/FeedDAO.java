package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String id = "campus_f_1_0115";
			String pw = "smhrd1";
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int feedCreate(FeedDTO feed) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into feed values(feed_feedno_seq.NEXTVAL,?,?,?,?,default,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feed.getNick());
			psmt.setString(2, feed.getPicAddress());
			psmt.setString(3, feed.getContent());
			psmt.setString(4, feed.getTag());
			psmt.setString(5, feed.getFeedUpate());
			psmt.setString(6, feed.getOpenRange());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	// 팔로잉하는 사람 피드 보여주기
	public ArrayList<FeedDTO> feedShow(ArrayList<String> followingList) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed where nick IN (";
			for (int i = 0; i < followingList.size();i++) {
				if (i == followingList.size() - 1) {
					sql += "?";
				} else {
					sql += "?,";
				}
			}
			sql += ")order by feeddate desc";
			psmt = conn.prepareStatement(sql);
			for (int i = 0; i < followingList.size();i++) {
				psmt.setString(i+1, followingList.get(i));
			}
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getString("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getString("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	// 특정인물 피드 보여주기
	public  ArrayList<FeedDTO> feedSelect(String nick) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed where nick = ? order by feeddate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getString("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getString("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}

	public int feedUpdate(FeedDTO feed) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update feed "
					+ "set picadress = ?, content = ?, tag = ?, feedupdate = sysdate openrange = ?"
					+ "where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feed.getPicAddress());
			psmt.setString(2, feed.getContent());
			psmt.setString(3, feed.getTag());
			psmt.setString(4, feed.getOpenRange());
			psmt.setString(5, feed.getFeedNo());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int feedDelete(String feedNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feedNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	

	// 닉네임으로 검색은 특정인물의 피드를 보여주는 것과 동일
	
	public ArrayList<FeedDTO> feedSearchByTag(String tag) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed where tag = ? order by feeddate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+tag+"%");
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getString("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getString("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
}
