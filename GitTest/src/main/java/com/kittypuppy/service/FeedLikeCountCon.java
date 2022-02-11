package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kittypuppy.model.*;

public class FeedLikeCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		FeedLikeDAO fdao = new FeedLikeDAO();
		int result = fdao.feedLikeShow(feedNo).size();
		PrintWriter out = response.getWriter();
		out.write(result);
	}

}
