package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FollowDAO;
import com.kittypuppy.model.FollowDTO;

public class FollowCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nick = request.getParameter("nick");
		String followerNick = request.getParameter("followerNick");
		
		FollowDAO dao = new FollowDAO();
		
		int cnt = dao.follow(new FollowDTO(nick, followerNick, null));
		
		if(cnt > 0) {
			response.sendRedirect("#");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패..!');");
			out.print("location.href= 'main.jsp';");//수정
			out.print("</script>");
		}
	}

}
