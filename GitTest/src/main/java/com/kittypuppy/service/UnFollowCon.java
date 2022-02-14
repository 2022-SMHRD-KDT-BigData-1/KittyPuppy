package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FollowDAO;
import com.kittypuppy.model.FollowDTO;

public class UnFollowCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nick = request.getParameter("nick");
		String followerNick = request.getParameter("followerNick");

		FollowDAO dao = new FollowDAO();

		int cnt = dao.unFollow(new FollowDTO(nick, followerNick, null));
		PrintWriter out = response.getWriter();
		
		if(cnt > 0) {
			System.out.println(cnt);
			out.print(cnt);
			
		}else {
			response.setContentType("text/html; charset=utf-8");
			out.print("<script>");
			out.print("alert('팔로우 실패..!');");
			out.print("location.href= 'main.jsp';");//수정
			out.print("</script>");
		}
	}

}
