package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.ScrapDAO;
import com.kittypuppy.model.ScrapDTO;

public class ScrapCon implements iCommand{
	ScrapDAO dao = new ScrapDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nick = request.getParameter("nick");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		int cnt = dao.scrap(new ScrapDTO(nick, feedNo, null));
		
		if(cnt>0) {
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
