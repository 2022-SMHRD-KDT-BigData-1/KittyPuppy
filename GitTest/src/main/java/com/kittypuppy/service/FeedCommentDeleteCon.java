package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCommentDAO;

public class FeedCommentDeleteCon implements iCommand{

	FeedCommentDAO dao = new FeedCommentDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링으로 fcNo 받음
		int fcNo = Integer.parseInt(request.getParameter("fcNo"));

		int result = dao.feedCommentDelete(fcNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
