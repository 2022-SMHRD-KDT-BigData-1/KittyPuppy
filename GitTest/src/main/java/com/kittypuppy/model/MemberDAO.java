package com.kittypuppy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

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

	public int memberJoin(MemberDTO member) {

		int cnt = 0;
		connect();
		try {
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPw());
			psmt.setString(3, member.getPicAddress());
			psmt.setString(4, member.getNick());
			psmt.setString(5, member.getSex());
			psmt.setString(6, member.getBirth());
			psmt.setString(7, member.getAddress());
			psmt.setString(8, member.getProfile());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int memberUpdate(MemberDTO member) {

		int cnt = 0;
		connect();
		try {
			String sql = "update member "
					+ "set pw = ?, picaddress = ?, nick = ?, sex = ?, birth = ?, address = ?, profile = ? "
					+ "where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getPw());
			psmt.setString(2, member.getPicAddress());
			psmt.setString(3, member.getNick());
			psmt.setString(4, member.getSex());
			psmt.setString(5, member.getBirth());
			psmt.setString(6, member.getAddress());
			psmt.setString(7, member.getProfile());
			psmt.setString(8, member.getId());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	public MemberDTO memberLogin(String id, String pw) {

		MemberDTO member = null;
		connect();
		try {
			String sql = "select * from member where id = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				member = new MemberDTO(rs.getString("id"), null, rs.getString("picaddress"), rs.getString("nick"),
						rs.getString("sex"), rs.getString("birth"), rs.getString("address"), rs.getString("profile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}

	public int memberDelete(String id, String pw) {

		int cnt = 0;
		connect();
		try {
			String sql = "delete from member where id = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 내정보 특정 회원정보
	public MemberDTO memberInfo(String nick) {

		MemberDTO member = null;
		connect();
		try {
			String sql = "select * from member where nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			if (rs.next()) {
				member = new MemberDTO(rs.getString("id"), null, rs.getString("picaddress"), rs.getString("nick"),
						rs.getString("sex"), rs.getString("birth"), rs.getString("address"), rs.getString("profile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;

	}

	// 주소 기준으로 주변 반려인 검색 기능 지도에서..
	public MemberDTO memberFindAddr(String address) {
		String addr = 
		connect();
		try {
			String sql = "select * from member where address"
		}
	}

	// 비밀번호 분실시 아이디와 생년월일(8자리)을 바탕으로 비빌번호 변경..
		public int updatePw(String id, String pw, String birth) {

			int cnt = 0;
			connect();
			try {
				String sql = "update member set pw = ? where id = ? and birth = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, pw);
				psmt.setString(2, id);
				psmt.setString(3, birth);
				cnt = psmt.executeUpdate();
				System.out.println("try");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("catch");
			} finally {
				close();
				System.out.println("close");
			}
			System.out.println("return cnt");
			return cnt;
			

		}
// 비밀번호 찾기 아이디와 생일로 로그인	
		public MemberDTO findPw(String id, String birth) {
			
			MemberDTO member = null;
			connect();
			try {
				String sql = "select * from member where id = ? and birth = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, birth);
				rs = psmt.executeQuery();
				if (rs.next()) {
					member = new MemberDTO(rs.getString("id"), rs.getString("pw"), rs.getString("picaddress"), rs.getString("nick"),
							rs.getString("sex"), rs.getString("birth"), rs.getString("address"), rs.getString("profile"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return member;
		}


//아이디 중복 체크
	public int memberIdCheck(String id) {

		int check = 0;
		connect();
		try {
			String sql = "select * from member where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next() || id.equals("")) {
				check = 0;
			} else {
				check = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}

//닉네임 중복 체크
	public int memberNickCheck(String nick) {

		int check = 0;
		connect();
		try {
			String sql = "select * from member where nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			if (rs.next()) {
				check = 0;
			} else {
				check = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}

// 생일 중복 체크(비밀번호 분실시)
	public int memberBirthCheck(String birth) {

		int check = 0;
		connect();
		try {				
			String sql = "select * from member where birth = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, birth);
			rs = psmt.executeQuery();
			if (rs.next()) {
				check = 0;
			} else {
				check = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}

	// 멤버 리스트 받아오기 닉네임만
		public ArrayList<String> memberList(String nick) {

			ArrayList<String> members = new ArrayList<String>();
			connect();
			try {
				String sql = "select nick from member where nick like ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+nick+"%");
				rs = psmt.executeQuery();
				while (rs.next()) {
					members.add(rs.getString("nick"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return members;
		}

		

		


}
