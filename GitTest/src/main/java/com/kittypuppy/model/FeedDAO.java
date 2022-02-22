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
			String sql = "insert into feed values(feed_feedno_seq.NEXTVAL,?,?,?,?,default,null,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feed.getNick());
			psmt.setString(2, feed.getPicAddress());
			psmt.setString(3, feed.getContent());
			psmt.setString(4, feed.getTag());
			psmt.setInt(5, feed.getOpenRange());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	// 모든 회원의 피드 보여주기 (팔로우하고 있는 회원이 없을 때) 
	public ArrayList<FeedDTO> feedShowAll(){
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed order by feeddate desc";
			psmt = conn.prepareStatement(sql);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	
	// 모든 회원의 피드 3개씩 보여주기 (팔로우하고 있는 회원이 없을 때)
	public ArrayList<FeedDTO> feedShowAllLimit3(int startNum, int endNum){
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from (select ROW_NUMBER() OVER(ORDER BY feedno desc) as rnum, feedno,nick,picaddress,content,tag,feeddate,feedupdate,openrange from feed order by feedno desc) where rnum >= ? and rnum <= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startNum);
			psmt.setInt(2, endNum);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	
	// 내가 팔로우 하고 있는 회원들의 피드 보여주기
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
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	
	// 내가 팔로우 하고 있는 회원들의 피드 3개씩 보여주기
	public ArrayList<FeedDTO> feedShowLimit3(ArrayList<String> followingList, int startNum, int endNum) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from (select ROW_NUMBER() OVER(ORDER BY feedno desc) as rnum, feedno,nick,picaddress,content,tag,feeddate,feedupdate,openrange from feed where nick IN (";
			for (int i = 0; i < followingList.size();i++) {
				if (i == followingList.size() - 1) {
					sql += "?";
				} else {
					sql += "?,";
				}
			}
			sql += ")order by feedNo desc) where rnum >=? and rnum <=?";
			psmt = conn.prepareStatement(sql);
			for (int i = 0; i < followingList.size();i++) {
				psmt.setString(i+1, followingList.get(i));
			}
			psmt.setInt(followingList.size()+1, startNum);
			psmt.setInt(followingList.size()+2, endNum);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
		
	// 특정 회원의 피드 보여주기
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
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
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
					+ "set picaddress = ?, content = ?, tag = ?, feedupdate = sysdate, openrange = ?"
					+ "where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feed.getPicAddress());
			psmt.setString(2, feed.getContent());
			psmt.setString(3, feed.getTag());
			psmt.setInt(4, feed.getOpenRange());
			psmt.setInt(5, feed.getFeedNo());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int feedDelete(int feedNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	// 피드 안에서 태그 검색하기
	public ArrayList<String> tagSearch(String tag){
		
		ArrayList<String> tagList= new ArrayList<String>();
		connect();
		try {
			String sql = "select distinct tag from feed where tag like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+tag+"%");
			rs =  psmt.executeQuery();
			while (rs.next()) {
				tagList.add(rs.getString("tag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tagList;
	}
	
	// 태그로 피드 게시물 검색하기
	public ArrayList<FeedDTO> feedSearchByTag(String tag) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed where tag = ? order by feeddate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tag);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	
	// 태그로 피드 게시물 3개씩 검색하기
	public ArrayList<FeedDTO> feedSearchByTagLimit3(String tag,int startNum, int endNum) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from (select ROW_NUMBER() OVER(ORDER BY feedno desc) as rnum, feedno,nick,picaddress,content,tag,feeddate,feedupdate,openrange from feed where tag = ? order by feedno desc) where rnum >= ? and rnum <= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tag);
			psmt.setInt(2, startNum);
			psmt.setInt(3, endNum);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
				feedList.add(feed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feedList;
	}
	
	// 게시물번호로 피드 게시물 검색하기
	public FeedDTO feedSearchByNo(int feedNo) {

		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedNo);
			rs =  psmt.executeQuery();
			if (rs.next()) {
				feed = new FeedDTO(rs.getInt("feedno"),rs.getString("nick"),rs.getString("picaddress"),rs.getString("content"),rs.getString("tag"),rs.getString("feeddate"),rs.getString("feedupdate"),rs.getInt("openrange"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return feed;
	}
}
