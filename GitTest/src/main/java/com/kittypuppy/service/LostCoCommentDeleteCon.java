package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCoCommentDAO;

public class LostCoCommentDeleteCon implements iCommand{
	LostCoCommentDAO dao = new LostCoCommentDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ������Ʈ������ coNo ����
		int coNo = Integer.parseInt(request.getParameter("coNo"));

		int cnt = dao.lostCoCommentDelete(coNo);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(cnt);
		
		if (cnt > 0) {
			System.out.println("���� ���� ");
		} else {
			System.out.println("���� ���� ");

		}
	}

}
