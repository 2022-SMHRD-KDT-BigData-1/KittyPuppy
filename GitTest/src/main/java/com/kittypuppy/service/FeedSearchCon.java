package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.*;

public class FeedSearchCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String search = (String) request.getParameter("search");
		String[] temp = search.split("");

		if (temp[0].equals("#")) {
			
			
			request.setAttribute("searchList",search);
		} else {
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberDTO> memberList = dao.memberList(search);
			request.setAttribute("searchList", memberList);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}

}
