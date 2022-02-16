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

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		int fcNo = Integer.parseInt(request.getParameter("fcNo"));
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		String text = request.getParameter("text");
		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		

		int result = dao.feedCoCommentCreate(new FeedCoCommentDTO(0, fcNo, feedNo, member.getNick(), text, null, null));
		PrintWriter out = response.getWriter();
		out.print(result);

	}

}
