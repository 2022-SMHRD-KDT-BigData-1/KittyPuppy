package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedCoCommentDAO {
	
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
	
	public int feedCoCommentCreate(FeedCoCommentDTO feedCoComment) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,?,?,?,?,default,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedCoComment.getFcNo());
			psmt.setInt(2, feedCoComment.getFeedNo());
			psmt.setString(3, feedCoComment.getNick());
			psmt.setString(4, feedCoComment.getContent());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<FeedCoCommentDTO> feedCoCommentShow(int fcNo) {
		
		ArrayList<FeedCoCommentDTO> list = new ArrayList<FeedCoCommentDTO>();
		FeedCoCommentDTO fcc = null;
		connect();
		try {
			String sql = "select * from feed_cocomment where fcno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, fcNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				fcc = new FeedCoCommentDTO(rs.getInt("cono"),rs.getInt("fcno"),rs.getInt("feedNo"),rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(fcc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	public ArrayList<FeedCoCommentDTO> feedCoCommentShowByFeedNo(int feedNo) {
		
		ArrayList<FeedCoCommentDTO> list = new ArrayList<FeedCoCommentDTO>();
		FeedCoCommentDTO fcc = null;
		connect();
		try {
			String sql = "select * from feed_cocomment where feedno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				fcc = new FeedCoCommentDTO(rs.getInt("cono"),rs.getInt("fcno"),rs.getInt("feedNo"),rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(fcc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int feedCoCommentUpdate(int coNo, String content) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update feed_cocomment "
					+ "set content = ?, coupdate = sysdate"
					+ "where cono = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, coNo);
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int feedCoCommentDelete(int coNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed_cocomment where cono = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, coNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
