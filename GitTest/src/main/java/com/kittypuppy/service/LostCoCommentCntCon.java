package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCoCommentDAO;

public class LostCoCommentCntCon implements iCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.setCharacterEncoding("UTF-8");
		
	int lostNo = Integer.parseInt(request.getParameter("lostNo"));

	LostCoCommentDAO dao = new LostCoCommentDAO();
	int cnt = dao.lostCoCommentCount(lostNo);

		PrintWriter out = response.getWriter();
		out.print(cnt);
	}
}
