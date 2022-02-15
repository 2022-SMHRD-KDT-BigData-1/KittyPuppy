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

public class UnFollowCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		String followerNick = (String)session.getAttribute("otherNick");

		FollowDAO dao = new FollowDAO();

		int result = dao.unFollow(new FollowDTO(nick, followerNick, null));
		PrintWriter out = response.getWriter();
		
		System.out.println(result);
		out.print(result);
			
		
	}

}
