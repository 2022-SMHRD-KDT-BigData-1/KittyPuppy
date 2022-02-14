package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FollowDAO;
import com.kittypuppy.model.FollowDTO;
import com.kittypuppy.model.MemberDTO;

public class FollowMarkCon implements iCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String followerNick = request.getParameter("otherNick");
		String nick = member.getNick();
		FollowDAO follow = new FollowDAO();
		
		boolean check = follow.followMark(nick, followerNick);
		
		int result = 0;
		if(check) {
			result = 1;
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
}
