package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedCommentDAO {
	
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
	
	public int feedCommentCreate(FeedCommentDTO feedComment) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into feed_comment values(feed_comment_fcno_seq.NEXTVAL,?,?,?,default,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedComment.getFeedNo());
			psmt.setString(2, feedComment.getNick());
			psmt.setString(3, feedComment.getContent());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<FeedCommentDTO> feedCommentShow(int feedNo) {
		
		ArrayList<FeedCommentDTO> list = new ArrayList<FeedCommentDTO>();
		FeedCommentDTO fc = null;
		connect();
		try {
			String sql = "select * from feed_comment where feedno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				fc = new FeedCommentDTO(rs.getInt("fcno"),rs.getInt("feedno"),rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(fc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}

	public int feedCommentUpdate(int fcNo, String content) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update feed_comment "
					+ "set content = ?, coupdate = sysdate"
					+ "where fcno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, fcNo);
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int feedCommentDelete(int fcNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed_comment where fcno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, fcNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
