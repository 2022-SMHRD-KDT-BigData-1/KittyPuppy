package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCoCommentDAO;
import com.kittypuppy.model.LostCoCommentDTO;

public class LostCoCommentUpdateCon implements iCommand{

	LostCoCommentDTO lostCoComment = null;
	LostCoCommentDAO dao = new LostCoCommentDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// 쿼리스트링으로 coNo 받음
		int coNo = Integer.parseInt(request.getParameter("coNo"));


		int cnt = dao.lostCoCommentUpdate(coNo, content);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('대댓글 수정 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
