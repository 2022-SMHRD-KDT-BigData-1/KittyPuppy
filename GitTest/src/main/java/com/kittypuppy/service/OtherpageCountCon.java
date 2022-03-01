package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;

public class OtherpageCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String otherNick = request.getParameter("otherNick");
		FeedDAO fdao = new FeedDAO();
    	
        
        int result = fdao.feedCountAllByNick(otherNick);
        System.out.println(result);
        PrintWriter out = response.getWriter();
        out.print(result);
	}

}
