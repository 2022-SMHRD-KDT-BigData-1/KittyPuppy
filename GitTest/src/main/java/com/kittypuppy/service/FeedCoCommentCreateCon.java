package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedCoCommentDAO;
import com.kittypuppy.model.FeedCoCommentDTO;
import com.kittypuppy.model.FeedCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class FeedCoCommentCreateCon implements iCommand {

	FeedCoCommentDAO dao= new FeedCoCommentDAO();

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		int fcNo = Integer.parseInt(request.getParameter("fcNo"));
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		String text = request.getParameter("text");
		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		

		int result = dao.feedCoCommentCreate(new FeedCoCommentDTO(0, fcNo, feedNo, member.getNick(), text, null, null));
		PrintWriter out = response.getWriter();
		out.print(result);

	}

}
