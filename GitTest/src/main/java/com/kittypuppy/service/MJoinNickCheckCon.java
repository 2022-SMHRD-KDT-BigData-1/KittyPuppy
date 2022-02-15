package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;

public class MJoinNickCheckCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 이메일, 비밀번호,전화번호,주소
		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();

		int check = dao.memberNickCheck(nick);

		PrintWriter out = response.getWriter();
//		out.print(check);
		
		if(check == 0) {
			System.out.println("이미 존재하는 닉네임입니다.");
		}else {
			System.out.println("사용 가능한 닉네임입니다.");

		}
		out.print(check + ""); //ajax결과 값인 result 가 됨, String으로 값을 내보낼수 있도록 ""로 해준다
	}
}
