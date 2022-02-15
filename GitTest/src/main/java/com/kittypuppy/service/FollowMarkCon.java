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
		String followerNick = (String)session.getAttribute("otherNick");
		String nick = member.getNick();
		
		FollowDAO follow = new FollowDAO();
		
		boolean check = follow.followMark(nick, followerNick);
		
		int result = 0; // 팔로우테이블에 행이 없음. 즉, 팔로우를 안한 상태
		if(check) {
			result = 1; // 팔로우테이블에 행이 있음. 즉, 팔로우를 한 상태
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
}
