package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedLikeDAO {
	
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
	
	public int feedLike(FeedLikeDTO feedLike) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into feed_like values(?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedLike.getFeedNo());
			psmt.setString(2, feedLike.getNick());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	//좋아요 명단 보기 + 길이로 숫자 보여주기
	public ArrayList<String> feedLikeShow(int feedNo) {
		
		ArrayList<String> list = new ArrayList<String>();
		connect();
		try {
			String sql = "select * from feed_like where feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedNo);
			rs =  psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("nick"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	// 좋아요 한 게시물에 했음을 표시하기
	public boolean feedLikeMark(FeedLikeDTO feedLike) {
		
		boolean isLike = false;
		connect();
		try {
			String sql = "select * from feed_like where feedno = ? and nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedLike.getFeedNo());
			psmt.setString(2, feedLike.getNick());
			rs =  psmt.executeQuery();
			isLike = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return isLike;
		
	}
	
	public int feedLikeDelete(FeedLikeDTO feedLike) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from feed_like where feedno = ? and nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, feedLike.getFeedNo());
			psmt.setString(2, feedLike.getNick());
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}

}
