package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;

public class MapAniListCon implements iCommand {

	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String nick = request.getParameter("nick");
		
		AnimalDAO dao = new AnimalDAO();
		ArrayList<AnimalDTO> aniList = new ArrayList<AnimalDTO>();
		
		
		aniList = dao.aniShowAll(nick);

		request.setAttribute("aniList", aniList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("maps.jsp");
		dispatcher.forward(request, response);
		
		
	}

	
}
