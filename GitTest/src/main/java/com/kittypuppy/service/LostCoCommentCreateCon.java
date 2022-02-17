package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.LostCoCommentDAO;
import com.kittypuppy.model.LostCoCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class LostCoCommentCreateCon implements iCommand {

	LostCoCommentDAO dao = new LostCoCommentDAO();
	LostCoCommentDTO lostCoComment = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		int locNo = Integer.parseInt(request.getParameter("locNo"));
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		String content = request.getParameter("content");

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.lostCoCommentCreate(new LostCoCommentDTO(0, locNo, lostNo, member.getNick(), content, null, null));
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("�����ۼ� ����"); // ���� ���Ȯ�� �� �����
			out.print(cnt);
		} else {
			System.out.println("�����ۼ� ����"); // ���� ���Ȯ�� �� �����
			out.print(cnt);
		}
	}

}
