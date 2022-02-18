package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnimalDAO {
	
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
	
	public int aniJoin(AnimalDTO animal) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "insert into animal values(?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, animal.getNick());
			psmt.setString(2, animal.getAnimalName());
			psmt.setString(3, animal.getAnimalPic());
			psmt.setString(4, animal.getUpKind());
			psmt.setString(5, animal.getKind());
			psmt.setString(6, animal.getAnimalSex());
			psmt.setInt(7, animal.getAnimalAge());
			psmt.setString(8, animal.getAnimalProfile());
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int aniUpdate(String nick, String animalName, AnimalDTO animal) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "update web_member "
					+ "set animalname = ?, animal pic = ?, upkind = ?, kind = ?, animalsex= ?, animalage = ?, animalprofile = ? "
					+ "where nick = ? and animalname = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, animal.getAnimalName());
			psmt.setString(2, animal.getAnimalPic());
			psmt.setString(3, animal.getUpKind());
			psmt.setString(4, animal.getKind());
			psmt.setString(5, animal.getAnimalSex());
			psmt.setInt(6, animal.getAnimalAge());
			psmt.setString(7, animal.getAnimalProfile());
			psmt.setString(8, nick);
			psmt.setString(9, animalName);
			cnt =  psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public int aniDelete(String nick, String animalName) {
		
		int cnt = 0;
		connect();
		try {
			String sql = "delete from animal where nick = ? and animalname = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			psmt.setString(2, animalName);
			cnt = psmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	// 회원의 첫번째 반려동물 보여주기 , 지도
	public AnimalDTO aniShow(String nick, String upKind) {
		
		AnimalDTO animal = null;
		connect();
		try {
			String sql = "";
			if (upKind.equals("개") || upKind.equals("고양이")) {
				sql = "select * from animal where nick = ? and upkind = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, nick);
				psmt.setString(2, upKind);
			} else {
				sql = "select * from animal where nick = ? and upkind not IN('개','고양이')";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, nick);
			}
			rs = psmt.executeQuery();
			if (rs.next()) {
				animal = new AnimalDTO(rs.getString("nick"),rs.getString("animalname"),rs.getString("animalpic"),rs.getString("upkind"),rs.getString("kind"),rs.getString("animalsex"),rs.getInt("animalage"),rs.getString("animalprofile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return animal;
		
	}
	// 회원의 반려동물 모두보여주기, 프로필
	public ArrayList<AnimalDTO> aniShowAll(String nick) {
		
		ArrayList<AnimalDTO> aniList = new ArrayList<AnimalDTO>();
		AnimalDTO animal = null;
		connect();
		try {
			// SQL문 준비
			String sql = "select * from animal where nick = ?";
			
			// SQL문을 실행 할 수 있는 상태 준비
			psmt = conn.prepareStatement(sql);
			// 순서가 바뀌여 있었죠??
			
			// 준비된 상태에서 ? 채워주기
			psmt.setString(1, nick);
			
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				animal = new AnimalDTO(rs.getString("nick"),rs.getString("animalname"),rs.getString("animalpic"),rs.getString("upkind"),rs.getString("kind"),rs.getString("animalsex"),rs.getInt("animalage"),rs.getString("animalprofile"));
				aniList.add(animal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return aniList;
		
	}
}
