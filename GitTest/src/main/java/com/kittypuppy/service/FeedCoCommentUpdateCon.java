package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCoCommentDAO;
import com.kittypuppy.model.FeedCoCommentDTO;

public class FeedCoCommentUpdateCon implements iCommand {

	FeedCoCommentDTO feedComment = null;
	FeedCoCommentDAO dao = new FeedCoCommentDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// ������Ʈ������ coNo ����
		int coNo = Integer.parseInt(request.getParameter("coNo"));


		int cnt = dao.feedCoCommentUpdate(coNo, content);

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
