package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCoCommentDAO;

public class FeedCoCommentDeleteCon implements iCommand{

	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FeedCoCommentDAO dao= new FeedCoCommentDAO();
		int coNo = Integer.parseInt(request.getParameter("coNo"));

		int result = dao.feedCoCommentDelete(coNo);
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
