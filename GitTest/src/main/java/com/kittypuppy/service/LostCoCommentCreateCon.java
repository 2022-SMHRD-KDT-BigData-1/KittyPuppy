package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.LostCoCommentDAO;
import com.kittypuppy.model.LostCoCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class LostCoCommentCreateCon implements iCommand {

	LostCoCommentDAO dao = new LostCoCommentDAO();
	LostCoCommentDTO lostComment = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");

		// 쿼리스트링으로 locNo 받음
		int locNo = Integer.parseInt(request.getParameter("locNo"));

		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.lostCoCommentCreate(new LostCoCommentDTO(0, locNo, member.getNick(), content, null, null));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('대댓글 작성 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
