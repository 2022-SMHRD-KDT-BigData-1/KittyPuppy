package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCoCommentDAO;

public class FeedCoCommentDeleteCon implements iCommand{

	FeedCoCommentDAO dao= new FeedCoCommentDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ������Ʈ������ coNo ����
		int coNo = Integer.parseInt(request.getParameter("coNo"));

		int cnt = dao.feedCoCommentDelete(coNo);

		if (cnt > 0) {
			response.sendRedirect("main.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���� ���� ����..!');");
			out.print("location.href= 'main.jsp';");
			out.print("</script>");

		}
	}

}
