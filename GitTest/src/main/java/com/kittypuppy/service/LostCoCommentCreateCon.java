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
	LostCoCommentDTO lostComment = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// ������Ʈ������ locNo ����
		int locNo = Integer.parseInt(request.getParameter("locNo"));

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.lostCoCommentCreate(new LostCoCommentDTO(0, locNo, member.getNick(), content, null, null));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���� �ۼ� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
