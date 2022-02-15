package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FollowDAO;

public class FollowerShowCon implements iCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String otherNick = (String)session.getAttribute("otherNick");
		
		FollowDAO follow = new FollowDAO();
   		// 나를 팔로우 하는 사람들
   		ArrayList<String> followerList = follow.followerShow(otherNick);
   		int result = followerList.size();
   		
   		PrintWriter out = response.getWriter();
   		out.print(result);
		
	}

}
