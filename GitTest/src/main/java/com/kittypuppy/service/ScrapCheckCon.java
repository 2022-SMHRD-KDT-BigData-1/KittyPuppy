package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDTO;
import com.kittypuppy.model.ScrapDAO;
import com.kittypuppy.model.ScrapDTO;

public class ScrapCheckCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		String nick = member.getNick();
		ScrapDAO sdao = new ScrapDAO();
		
		boolean check = sdao.scrapMark(new ScrapDTO(null,feedNo,null,nick));
		
		int result = 0;
		if (check) {
			result = 1;
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	

}
