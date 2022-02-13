package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.*;

public class FeedLikeCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//피드에 좋아요 버튼을 눌렀을때 좋아요 1이 올라가고 
		//누가 어디에 눌렀냐?
		HttpSession session = request.getSession();
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		
		FeedLikeDAO dao = new FeedLikeDAO();
		
		int result = dao.feedLike(new FeedLikeDTO(feedNo,nick));
		
		PrintWriter out = response.getWriter();
		out.print(result);
				
	}

}
