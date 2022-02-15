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
		// �̸���, ��й�ȣ,��ȭ��ȣ,�ּ�
		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();

		int check = dao.memberNickCheck(nick);

		PrintWriter out = response.getWriter();
//		out.print(check);
		
		if(check == 0) {
			System.out.println("�̹� �����ϴ� �г����Դϴ�.");
		}else {
			System.out.println("��� ������ �г����Դϴ�.");

		}
		out.print(check + ""); //ajax��� ���� result �� ��, String���� ���� �������� �ֵ��� ""�� ���ش�
	}
}
