package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedLikeDAO;
import com.kittypuppy.model.FeedLikeDTO;

public class FeedLikeDeleteCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		String nick = request.getParameter("nick");

		FeedLikeDAO dao = new FeedLikeDAO();

		int cnt = dao.feedLike(new FeedLikeDTO(feedNo, nick, null));

		if (cnt > 0) {
			response.sendRedirect("#"); // 수정 새로고침 안하는 상태
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패..!');");
			out.print("location.href= 'main.jsp';");// 수정
			out.print("</script>");
		}

	}

}
