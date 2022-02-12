package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LostAniDAO {
	
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
	
	public int lostAniCreate(LostAniDTO lostAni) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into lost_animal values(lost_animal_lostno_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,default,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, lostAni.getLaType());
			psmt.setString(2, lostAni.getNick());
			psmt.setString(3, lostAni.getAniName());
			psmt.setString(4, lostAni.getAniPic());
			psmt.setString(5, lostAni.getUpKind());
			psmt.setString(6, lostAni.getKind());
			psmt.setString(7, lostAni.getSex());
			psmt.setString(8, lostAni.getColor());
			psmt.setString(9, lostAni.getAniSize());
			psmt.setString(10, lostAni.getIsTag());
			psmt.setString(11, lostAni.getFeature());
			psmt.setString(12, lostAni.getPlace());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<LostAniDTO> lostAniShow() {
		
		ArrayList<LostAniDTO> lostList = new ArrayList<LostAniDTO>();
		LostAniDTO lostAni = null;
		connect();
		try {
			String sql = "select * from lost_animal";
			psmt = conn.prepareStatement(sql);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				lostAni = new LostAniDTO(rs.getInt("lostno"),rs.getString("latype"),
						rs.getString("nick"),rs.getString("animalname"),rs.getString("animalpic"),
						rs.getString("upkind"),rs.getString("kind"),rs.getString("sex"),
						rs.getString("color"),rs.getString("animalsize"),rs.getString("istag"),
						rs.getString("feature"),rs.getString("place"),rs.getString("ladate"),
						rs.getString("laupdate"));
				lostList.add(lostAni);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return lostList;
		
	}
	
	public LostAniDTO lostAniSelect(int lostNo) {
		
		LostAniDTO lostAni = null;
		connect();
		try {
			String sql = "select * from lost_animal where lostno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lostNo);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				lostAni = new LostAniDTO(lostNo,rs.getString("latype"),
						rs.getString("nick"),rs.getString("animalname"),rs.getString("animalpic"),
						rs.getString("upkind"),rs.getString("kind"),rs.getString("sex"),
						rs.getString("color"),rs.getString("animalsize"),rs.getString("istag"),
						rs.getString("feature"),rs.getString("place"),rs.getString("ladate"),
						rs.getString("laupdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return lostAni;
		
	}

	public int lostAniUpdate(LostAniDTO lostAni) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update lost_animal "
					+ "set latype = ?, animalname = ?, animalpic = ?, upkind = ?, kind = ?, sex = ?, color = ?, animalsize = ?, istag = ?, feature = ?, place = ?, laupdate = sysdate"
					+ "where lostno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, lostAni.getLaType());
			psmt.setString(2, lostAni.getAniName());
			psmt.setString(3, lostAni.getAniPic());
			psmt.setString(4, lostAni.getUpKind());
			psmt.setString(5, lostAni.getKind());
			psmt.setString(6, lostAni.getSex());
			psmt.setString(7, lostAni.getColor());
			psmt.setString(8, lostAni.getAniSize());
			psmt.setString(9, lostAni.getIsTag());
			psmt.setString(10, lostAni.getFeature());
			psmt.setString(11, lostAni.getPlace());
			psmt.setInt(12, lostAni.getLostNo());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int lostAniDelete(int lostNo) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from lost_animal where lostno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lostNo);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<LostAniDTO> lostAniFilter(LostAniDTO lostAniFilter) {
		
		ArrayList<LostAniDTO> lostList = new ArrayList<LostAniDTO>();
		LostAniDTO lostAni = null;
		connect();
		try {
			String sql = "select * from lost_animal where lostno is not null";
			if (lostAniFilter.getLaType() != null) {
				sql += "and latype = "+ lostAniFilter.getLaType();
			}
			if (lostAniFilter.getAniName() != null) {
				sql += "and animalname = "+ lostAniFilter.getAniName();
			}
			if (lostAniFilter.getUpKind() != null) {
				sql += "and upkind = "+ lostAniFilter.getUpKind();
			}
			if (lostAniFilter.getKind() != null) {
				sql += "and kind = "+ lostAniFilter.getKind();
			}
			if (lostAniFilter.getSex() != null) {
				sql += "and sex = "+ lostAniFilter.getSex();
			}
			if (lostAniFilter.getAniSize() != null) {
				sql += "and animalsize = "+ lostAniFilter.getAniSize();
			}
			if (lostAniFilter.getIsTag()!= null) {
				sql += "and istag = "+ lostAniFilter.getIsTag();
			}
			if (lostAniFilter.getFeature() != null) {
				sql += "and feature = "+ lostAniFilter.getFeature();
			}
			if (lostAniFilter.getPlace() != null) {
				sql += "and place = "+ lostAniFilter.getPlace();
			}
			psmt = conn.prepareStatement(sql);
			rs =  psmt.executeQuery();
			while (rs.next()) {
				lostAni = new LostAniDTO(rs.getInt("lostno"),rs.getString("latype"),
						rs.getString("nick"),rs.getString("animalname"),rs.getString("animalpic"),
						rs.getString("upkind"),rs.getString("kind"),rs.getString("sex"),
						rs.getString("color"),rs.getString("animalsize"),rs.getString("istag"),
						rs.getString("feature"),rs.getString("place"),rs.getString("ladate"),
						rs.getString("laupdate"));
				lostList.add(lostAni);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return lostList;
		
	}
	// 유기동물 신고시 자동으로 위.경도 값 가져오기
	public void lostAniPlace() {
		
	}
}
