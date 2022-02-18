package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MLoginCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = new MemberDAO();

		MemberDTO member = dao.memberLogin(id, pw);

		if (member != null) {
			System.out.println("로그인 성공!");

			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("feed.jsp");//메인 피드 수정

		} else {
			// 로그인 실패 알림창 띄운 후 login.jsp로 이동하기!
			// *JoinCon else문 참고

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 실패..!');");
			out.print("location.href= 'login.jsp';");// 로그인페이지 수정
			out.print("</script>");
		}
	}

}
