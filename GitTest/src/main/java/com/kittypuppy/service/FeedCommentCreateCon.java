package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedCommentDAO;
import com.kittypuppy.model.FeedCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class FeedCommentCreateCon implements iCommand {

	FeedCommentDAO dao = new FeedCommentDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");

		// 쿼리스트링으로 feedNo 받음
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		String text = request.getParameter("text");
		System.out.println(feedNo+text);
		
		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int result = dao.feedCommentCreate(new FeedCommentDTO(0, feedNo, member.getNick(), text, null, null));

		PrintWriter out = response.getWriter();
		out.print(result);

	}
}
