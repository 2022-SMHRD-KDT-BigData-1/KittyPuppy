package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.DMDAO;
import com.kittypuppy.model.DMDTO;

public class DMSendCon implements iCommand {
	DMDAO dao = new DMDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dmNo = Integer.parseInt(request.getParameter("dmNo"));
		String sendnick = request.getParameter("sendNick");
		String receiveNick = request.getParameter("receiveNick");
		String content = request.getParameter("content");
		String sendDate = request.getParameter("sendDate");

		int cnt = dao.DMSend(new DMDTO(dmNo, sendnick, receiveNick, content, sendDate));

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
