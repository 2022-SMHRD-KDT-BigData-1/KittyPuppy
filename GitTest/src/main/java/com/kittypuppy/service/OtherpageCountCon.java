package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;

public class OtherpageCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String otherNick = request.getParameter("otherNick");
		FeedDAO fdao = new FeedDAO();
    	
		ArrayList<FeedDTO> feedList = fdao.feedSelect(otherNick);
        
        int result = feedList.size();
        PrintWriter out = response.getWriter();
        out.print(result);
	}

}
