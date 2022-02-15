package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCoCommentDAO;
import com.kittypuppy.model.FeedCoCommentDTO;

public class FeedCoCommentLoadCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
		
		ArrayList<FeedCoCommentDTO> result = fccdao.feedCoCommentShowByFeedNo(feedNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
