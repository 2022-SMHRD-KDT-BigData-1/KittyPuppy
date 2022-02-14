package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FollowDAO {
	
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
	
	public int follow(FollowDTO follow) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into follow values(?,?,default)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, follow.getNick());
			psmt.setString(2, follow.getFollowerNick());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	// follower ��� ���� + ���̷� ���� �����ֱ�. ���� �ȷο��ϴ� ���
	public ArrayList<String> followerShow(String nick) {
		
		ArrayList<String> list = new ArrayList<String>();
		connect();
		try {
			String sql = "select * from follow where followernick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
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
	// ���� �ȷ������� ���
	public ArrayList<String> followingShow(String nick) {
		
		ArrayList<String> list = new ArrayList<String>();
		connect();
		try {
			String sql = "select * from follow where nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			rs =  psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("followernick"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	// �ȷο� �� otherpage�� �ȷο� ������ ǥ���ϱ�
	public boolean followMark(String nick, String followerNick) {
			
		boolean isfollow = false;
		connect();
		try {
			String sql = "select * from follow where nick = ? and followernick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			psmt.setString(2, followerNick);
			rs =  psmt.executeQuery();
			isfollow = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return isfollow;
			
	}
	
	public int unFollow(FollowDTO follow) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from follow where nick = ? and followernick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, follow.getNick());
			psmt.setString(2, follow.getFollowerNick());
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
