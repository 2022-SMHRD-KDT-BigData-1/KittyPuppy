package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DMDAO {

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
	
	public int DMSend(DMDTO dm) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into dm values(dm_dmno_seq.NEXTVAL,?,?,?,default)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dm.getSendNick());
			psmt.setString(2, dm.getReceiveNick());
			psmt.setString(3, dm.getContent());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	// DM 주고받은 회원 리스트 보여주기
	public ArrayList<String> DMList(String sendnick) {
		
		ArrayList<String> list = new ArrayList<String>();
		connect();
		try {
			String sql = "select distinct receivenick from dm where sendnick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sendnick);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("receivenick"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	// DM 주고받은 내역보여주기
	public ArrayList<DMDTO> DMShow(String sendnick, String receivenick) {
		
		ArrayList<DMDTO> dmList = new ArrayList<DMDTO>();
		DMDTO dm = null;
		connect();
		try {
			String sql = "select * from dm where (sendnick = ? and recieve nick = ?) or (sendnick = ? and recieve nick = ?) order by senddate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sendnick);
			psmt.setString(2, receivenick);
			psmt.setString(3, receivenick);
			psmt.setString(4, sendnick);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				dm = new DMDTO(rs.getString("dmno"),rs.getString("sendnick"),rs.getString("receivenick"),rs.getString("content"),rs.getString("senddate"));
				dmList.add(dm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dmList;
		
	}
	// 주고받은 내역중 가장 최근 DM
	public DMDTO latestDM(String sendnick, String receivenick) {
		
		DMDTO dm = null;
		connect();
		try {
			String sql = "select * from dm where (sendnick = ? and recieve nick = ?) or (sendnick = ? and recieve nick = ?) order by senddate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sendnick);
			psmt.setString(2, receivenick);
			psmt.setString(3, receivenick);
			psmt.setString(4, sendnick);
			rs =  psmt.executeQuery();
			if (rs.next()) {
				dm = new DMDTO(rs.getString("dmno"),rs.getString("sendnick"),rs.getString("receivenick"),rs.getString("content"),rs.getString("senddate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dm;
		
	}
	// 메시지 하나 삭제
	public int DMDelete(String dmNo) {

		int cnt = 0;
		connect();
		try {
			String sql = "delete from dm where dmno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dmNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	// 대화방 삭제
	public int DMDeleteAll(String sendnick, String receivenick) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from dm where (sendnick = ? and recieve nick = ?) or (sendnick = ? and recieve nick = ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sendnick);
			psmt.setString(2, receivenick);
			psmt.setString(3, receivenick);
			psmt.setString(4, sendnick);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
}
