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
			String sql = "insert into  feed_cocomment values(feed_cocomment_cono_seq.NEXTVAL,?,?,?,default,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, feedCoComment.getFcNo());
			psmt.setString(2, feedCoComment.getNick());
			psmt.setString(3, feedCoComment.getContent());
			psmt.setString(4, feedCoComment.getCoUpdate());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<FeedCoCommentDTO> feedCoCommentShow(String fcNo) {
		
		ArrayList<FeedCoCommentDTO> list = new ArrayList<FeedCoCommentDTO>();
		FeedCoCommentDTO fcc = null;
		connect();
		try {
			String sql = "select * from feed_cocomment where fcno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, fcNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				fcc = new FeedCoCommentDTO(rs.getString("cono"),rs.getString("fcno"),rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(fcc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	public int feedCoCommentUpdate(String coNo, String content) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update feed_cocomment "
					+ "set content = ?, coupdate = sysdate"
					+ "where cono = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setString(2, coNo);
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int feedCoCommentDelete(String coNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed_cocomment where cono = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, coNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
