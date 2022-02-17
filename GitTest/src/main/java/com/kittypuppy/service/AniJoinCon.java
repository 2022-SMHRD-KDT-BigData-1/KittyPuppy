package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;

public class AniJoinCon implements iCommand {
	AnimalDAO dao = new AnimalDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String nick = request.getParameter("nick");
		String animalName = request.getParameter("animalName");
		String animalPic = request.getParameter("animalPic");
		String upKind = request.getParameter("upKind");
		String kind = request.getParameter("kind");
		String animalSex = request.getParameter("animalSex");
		int animalAge = Integer.parseInt(request.getParameter("animalAge"));
		String animalProfile = request.getParameter("animalProfile");

		int cnt = dao.aniJoin(new AnimalDTO(nick, animalName, animalPic, upKind, kind, animalSex, animalAge, animalProfile));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp"); //등록 완료시 마이페이지로 이동
			
			 
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('등록 실패..!');");
			out.print("location.href= 'main.jsp';");// 수정
			out.print("</script>");
		}

	}

}
