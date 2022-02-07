package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;

public class FeedSearchCon implements iCommand {

	FeedDAO dao = new FeedDAO();
	ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String tag = (String) request.getParameter("tag");
		feedList = dao.feedSelect(tag);

		request.setAttribute("feedList", feedList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("mainPage.jsp");
		dispatcher.forward(request, response);

	}

}
