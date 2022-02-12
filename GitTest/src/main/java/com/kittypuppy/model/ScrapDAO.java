package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ScrapDAO {
	
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
	
	public int scrap(ScrapDTO scrap) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into scrap values(?,?,default)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, scrap.getNick());
			psmt.setInt(2, scrap.getFeedNo());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	// scrap�� feed �����ֱ�
	public ArrayList<FeedDTO> scrapShow(String sNick) {
		
		ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();
		FeedDTO feed = null;
		connect();
		try {
			String sql = "select * from feed_scrap_view where snick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sNick);
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
	
	// ��ũ���� �Խù��� ��ũ�� ������ ǥ��
	public boolean scrapMark(ScrapDTO scrap) {
		
		boolean isScrap = false;
		connect();
		try {
			String sql = "select * from scrap where snick = ? and feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, scrap.getSNick());
			psmt.setInt(2, scrap.getFeedNo());
			rs =  psmt.executeQuery();
			isScrap = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return isScrap;
		
	}
	
	public int scrapDelete(ScrapDTO scrap) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from scrap where snick = ? and feedno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, scrap.getSNick());
			psmt.setInt(2, scrap.getFeedNo());
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
