package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;

public class MBirthCheckCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// String id = request.getParameter("id");
		String birth = request.getParameter("birth");

		MemberDAO dao = new MemberDAO();

		// int checkId = dao.memberIdCheck(id);
		int check = dao.memberBirthCheck(birth);

		PrintWriter out = response.getWriter();

		if (check == 0) {
			System.out.println("등록 된 생년월일 입니다.");
			
		} else {
			System.out.println("미등록 된 생년월일 입니다.");

		}
		out.print(check + ""); // ajax결과 값인 result 가 됨, String으로 값을 내보낼수 있도록 ""로 해준다
	}
}
