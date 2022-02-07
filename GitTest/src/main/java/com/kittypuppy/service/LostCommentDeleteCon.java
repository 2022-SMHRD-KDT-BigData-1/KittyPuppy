package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCommentDAO;

public class LostCommentDeleteCon implements iCommand{

	LostCommentDAO dao = new LostCommentDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링으로 locNo 받음
		int locNo = Integer.parseInt(request.getParameter("locNo"));

		int cnt = dao.lostCommentDelete(locNo);

		if (cnt > 0) {
			response.sendRedirect("main.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 삭제 실패..!');");
			out.print("location.href= 'main.jsp';");
			out.print("</script>");

		}
	}

}
