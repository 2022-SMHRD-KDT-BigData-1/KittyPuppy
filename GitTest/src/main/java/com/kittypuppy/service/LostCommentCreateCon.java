package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.LostCommentDAO;
import com.kittypuppy.model.LostCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class LostCommentCreateCon implements iCommand{

	LostCommentDAO dao= new LostCommentDAO();
	LostCommentDTO lostComment = null;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// ������Ʈ������ lostNo ����
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.lostCommentCreate(new LostCommentDTO(0, lostNo, member.getNick(), content, null, null));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� �ۼ� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
