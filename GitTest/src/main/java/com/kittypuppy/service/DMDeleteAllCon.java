package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.DMDAO;

public class DMDeleteAllCon implements iCommand {
	// 대화방 삭제
	DMDAO dao = new DMDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sendnick = request.getParameter("sendnick");
		String receivenick = request.getParameter("receivenick");

		int cnt = dao.DMDeleteAll(sendnick, receivenick);

		if (cnt > 0) {
			response.sendRedirect("main.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('데이터 삭제 실패..!');");
			out.print("location.href= 'main.jsp';");
			out.print("</script>");

		}

	}

}
