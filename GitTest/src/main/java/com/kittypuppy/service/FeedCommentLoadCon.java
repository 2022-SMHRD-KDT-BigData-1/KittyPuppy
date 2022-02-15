package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedCommentDAO;
import com.kittypuppy.model.FeedCommentDTO;

public class FeedCommentLoadCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		FeedCommentDAO fcdao = new FeedCommentDAO();
		
		ArrayList<FeedCommentDTO> result = fcdao.feedCommentShow(feedNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
