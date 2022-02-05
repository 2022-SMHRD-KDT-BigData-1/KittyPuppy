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
		
		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// 쿼리스트링으로 locNo 받음
		int locNo = Integer.parseInt(request.getParameter("locNo"));


		int cnt = dao.lostCommentUpdate(locNo, content);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 수정 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
