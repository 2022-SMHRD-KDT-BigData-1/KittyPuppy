package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCoCommentDAO;
import com.kittypuppy.model.FeedCommentDAO;

public class FeedComCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		FeedCommentDAO fcdao = new FeedCommentDAO();
		FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
		
		int cnt1 = fcdao.feedCommentShow(feedNo).size();
		int cnt2 = fccdao.feedCoCommentShowByFeedNo(feedNo).size();
		int result = cnt1 + cnt2;
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
