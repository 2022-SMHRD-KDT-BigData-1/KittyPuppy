package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;

public class MJoinIdCheckCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// �̸���, ��й�ȣ,��ȭ��ȣ,�ּ�
		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();

		int check = dao.memberIdCheck(id);

		PrintWriter out = response.getWriter();
		out.print(check);
		if(check == 0) {
			System.out.println("�̹� �����ϴ� ���̵��Դϴ�.");
		}else {
			System.out.println("��� ������ ���̵��Դϴ�.");

		}
		out.write(check + "");
	}
}
