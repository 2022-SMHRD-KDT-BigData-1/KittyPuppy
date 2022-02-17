package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;

public class MFindPW implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");

		String id = request.getParameter("id");
		String birth = request.getParameter("birth");

		MemberDAO dao = new MemberDAO();

		int checkId = dao.memberIdCheck(id);
		int checkBirth = dao.memberBirthCheck(birth);

		PrintWriter out = response.getWriter();

		if(checkId == 0) {
			System.out.println("�̹� �����ϴ� ���̵��Դϴ�.");
			if(checkBirth == 0) {
				System.out.println("��� �� ������� �Դϴ�.");
				out.print("<script>");
				out.print("location.href= 'updatePw.jsp';");
				out.print("</script>");
			}else {
				System.out.println("�̵�� �� ������� �Դϴ�.");
				out.print("<script>");
				out.print("alert('ȸ�������� ��ġ���� �ʾ� ȸ�������� ���ּ���.');");
				out.print("location.href= 'join.jsp';");
				out.print("</script>");
			}
		}else {
			System.out.println("��� ������ ���̵��Դϴ�.");
		}
		out.print(checkId + "");  //ajax��� ���� result �� ��, String���� ���� �������� �ֵ��� ""�� ���ش�
	}
}
