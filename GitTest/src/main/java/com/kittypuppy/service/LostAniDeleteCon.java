package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostAniDAO;

public class LostAniDeleteCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ������Ʈ������ get ������� �Խù� ��ȣ�� ����
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		LostAniDAO dao = new LostAniDAO();
		int cnt = dao.lostAniDelete(lostNo);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
