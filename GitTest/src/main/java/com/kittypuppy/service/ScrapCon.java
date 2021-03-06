package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedLikeDAO;
import com.kittypuppy.model.FeedLikeDTO;
import com.kittypuppy.model.MemberDTO;
import com.kittypuppy.model.ScrapDAO;
import com.kittypuppy.model.ScrapDTO;

public class ScrapCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		
		ScrapDAO sdao = new ScrapDAO();
		
		int result = sdao.scrap(new ScrapDTO(null,feedNo,null,nick));
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
}
