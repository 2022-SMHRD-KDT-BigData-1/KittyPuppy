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
	LostCoCommentDTO lostCoComment = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		int locNo = Integer.parseInt(request.getParameter("locNo"));
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		String content = request.getParameter("content");

		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		int cnt = dao.lostCoCommentCreate(new LostCoCommentDTO(0, locNo, lostNo, member.getNick(), content, null, null));
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("대댓글작성 성공"); // 추후 기능확인 후 지우기
			out.print(cnt);
		} else {
			System.out.println("대댓글작성 실패"); // 추후 기능확인 후 지우기
			out.print(cnt);
		}
	}

}
