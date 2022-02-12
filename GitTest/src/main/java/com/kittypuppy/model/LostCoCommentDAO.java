package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LostCoCommentDAO {
	
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
	
	public int lostCoCommentCreate(LostCoCommentDTO lcc) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into  lost_cocomment values(lost_cocomment_cono_seq.NEXTVAL,?,?,?,?,default,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lcc.getLocNo());
			psmt.setInt(2, lcc.getFeedNo());
			psmt.setString(3, lcc.getNick());
			psmt.setString(4, lcc.getContent());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<LostCoCommentDTO> lostCoCommentShow(int locNo) {
		
		ArrayList<LostCoCommentDTO> list = new ArrayList<LostCoCommentDTO>();
		LostCoCommentDTO lcc = null;
		connect();
		try {
			String sql = "select * from lost_cocomment where locno = ? order by codate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, locNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				lcc = new LostCoCommentDTO(rs.getInt("cono"),rs.getInt("locno"), rs.getInt("feedNo"), rs.getString("nick"),rs.getString("content"),rs.getString("codate"),rs.getString("coupdate"));
				list.add(lcc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int lostCoCommentUpdate(int coNo, String content) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update lost_cocomment "
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
	
	public int lostCoCommentDelete(int coNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from lost_cocomment where cono = ?";
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
	
	public int lostCoCommentCount(int lostNo) {
		int cnt = 0;
		connect();

		String sql = "select * from lost_cocomment where lostNo = ? ";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lostNo);

			rs = psmt.executeQuery();
			
			while (rs.next()) {
				cnt++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
}
