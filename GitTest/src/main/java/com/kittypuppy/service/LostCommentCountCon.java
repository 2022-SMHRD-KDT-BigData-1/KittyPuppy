package com.kittypuppy.service;
	import java.io.IOException;
	import java.io.PrintWriter;

	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCoCommentDAO;
import com.kittypuppy.model.LostCommentDAO;

	public class LostCommentCountCon implements iCommand{

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			int lostNo = Integer.parseInt(request.getParameter("lostNo"));
			
			LostCommentDAO lcdao = new LostCommentDAO();
			LostCoCommentDAO lccdao = new LostCoCommentDAO();
			
			int cnt1 = lcdao.lostCommentShow(lostNo).size();
			int cnt2 = lccdao.lostCoCommentShow2(lostNo).size();
			int result = cnt1 + cnt2;
			
			PrintWriter out = response.getWriter();
			out.print(result);
		}

	}


