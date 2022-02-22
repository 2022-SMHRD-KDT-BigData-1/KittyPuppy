package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;
import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MapAniListCon implements iCommand {

	AnimalDAO dao = new AnimalDAO();
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member"); 
		String nick = member.getNick();
		String address = member.getAddress();
		String[] addr = address.split(" ");
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mapsList = mdao.memberFindAddr(addr[addr.length-1]);
		
		AnimalDAO dao = new AnimalDAO();
		
		String upKind = null;
		AnimalDTO aniList = dao.aniShow(nick, upKind);
		
	

		request.setAttribute("aniList", aniList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("maps.jsp");
		dispatcher.forward(request, response);
		
		
	}

	
}
