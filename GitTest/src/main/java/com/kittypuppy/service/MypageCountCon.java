package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.ScrapDAO;

public class MypageCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String nick = request.getParameter("nick");
		String type = request.getParameter("type");
		
		FeedDAO fdao = new FeedDAO();
		ScrapDAO sdao = new ScrapDAO();
    	
		ArrayList<FeedDTO> feedList = null;
		if (type.equals("feed")) {
			feedList = fdao.feedSelect(nick);
		} else {
			feedList = sdao.scrapShow(nick);
		}
        int result = feedList.size();
        
        PrintWriter out = response.getWriter();
        out.print(result);
	}

}
