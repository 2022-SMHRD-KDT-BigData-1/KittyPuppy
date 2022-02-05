package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LostCommentDAO {
	
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
	
	public int lostCommentCreate(LostCommentDTO lc) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into lost_comment values(lost_comment_locno_seq.NEXTVAL,?,?,?,default,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lc.getLostNo());
			psmt.setString(2, lc.getNick());
			psmt.setString(3, lc.getContent());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<LostCommentDTO> lostCommentShow(int lostNo) {
		
		ArrayList<LostCommentDTO> list = new ArrayList<LostCommentDTO>();
		LostCommentDTO loc = null;
		connect();
		try {
			String sql = "select * from lost_comment where lostno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lostNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				loc = new LostCommentDTO(rs.getInt("locno"),rs.getInt("lostno"),rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(loc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	public int lostCommentUpdate(int locNo, String content) {
	
		int cnt = 0;
		connect();
		try {
			String sql = "update lost_comment "
					+ "set content = ?, coupdate = sysdate"
					+ "where locno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, locNo);
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int lostCommentDelete(int locNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from lost_comment where locno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, locNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
