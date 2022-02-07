package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.AnimalDAO;

public class AniDeleteCon implements iCommand {
	AnimalDAO dao = new AnimalDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nick = request.getParameter("nick");
		String animalName = request.getParameter("animalName");

		int cnt = dao.aniDelete(nick, animalName);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}

	}

}
