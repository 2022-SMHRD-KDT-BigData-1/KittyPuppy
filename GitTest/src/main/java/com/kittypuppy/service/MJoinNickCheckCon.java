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

		// �̸���, ��й�ȣ,��ȭ��ȣ,�ּ�
		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();

		boolean check = dao.memberIdCheck(nick);

		PrintWriter out = response.getWriter();
		out.print(check);
	}
}
