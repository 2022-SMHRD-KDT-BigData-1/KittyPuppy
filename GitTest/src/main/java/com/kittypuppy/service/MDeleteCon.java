package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MDeleteCon implements iCommand {
	MemberDAO dao = new MemberDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 쿼리 스트링으로 받아옴
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw"); 

		int cnt = dao.memberDelete(id,pw);

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}

	}

}
