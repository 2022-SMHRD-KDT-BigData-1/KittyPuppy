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
	FeedCoCommentDTO feedCoComment = null;

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));

		// ������Ʈ������ fcNo ����
		int fcNo = Integer.parseInt(request.getParameter("fcNo"));

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.feedCoCommentCreate(new FeedCoCommentDTO(0, fcNo, feedNo, member.getNick(), content, null, null));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��� �ۼ� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
