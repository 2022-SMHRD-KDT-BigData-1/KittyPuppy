package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCommentDAO;
import com.kittypuppy.model.LostCommentDTO;

public class LostCommentUpdateCon implements iCommand{

	LostCommentDTO LostComment = null;
	LostCommentDAO dao = new LostCommentDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// ������Ʈ������ locNo ����
		int locNo = Integer.parseInt(request.getParameter("locNo"));


		int cnt = dao.lostCommentUpdate(locNo, content);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
