package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.FollowDAO;

public class MypageCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String nick = request.getParameter("nick");
		
		FeedDAO fdao = new FeedDAO();
    	FollowDAO fwdao = new FollowDAO();
    	
		ArrayList<FeedDTO> feedList = null;
    	ArrayList<String> followList = fwdao.followingShow(nick);
    	
        if (followList.size() == 0) {
    		feedList = fdao.feedShowAll();
    	} else {
    		feedList = fdao.feedShow(followList);
    	}
        
        int result = feedList.size();
        
        PrintWriter out = response.getWriter();
        out.print(result);
	}

}
