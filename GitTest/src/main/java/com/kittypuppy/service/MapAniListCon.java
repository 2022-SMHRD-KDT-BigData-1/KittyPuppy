package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;
import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;

public class MapAniListCon implements iCommand {

	AnimalDAO dao = new AnimalDAO();
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String nick = request.getParameter("nick");
		
		AnimalDAO dao = new AnimalDAO();
		
		String upKind = null;
		AnimalDTO aniList = dao.aniShow(nick, upKind);
		
	

		request.setAttribute("aniList", aniList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("maps.jsp");
		dispatcher.forward(request, response);
		
		
	}

	
}
