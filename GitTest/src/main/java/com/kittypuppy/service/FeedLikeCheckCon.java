package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.*;

public class FeedLikeCheckCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		String nick = member.getNick();
		FeedLikeDAO fldao = new FeedLikeDAO();
		
		boolean check = fldao.feedLikeMark(new FeedLikeDTO(feedNo,nick));
		
		int result = 0;
		if (check) {
			result = 1;
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
