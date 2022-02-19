package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MUpdatePwCon implements iCommand {
	MemberDAO dao = new MemberDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = UTF-8");
		
		
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String id = member.getId();		
		String birth = member.getBirth();
		
		String pw = request.getParameter("pw");
				
		MemberDAO dao = new MemberDAO();

		int cnt = dao.updatePw(new MemberDTO(id, pw, birth), id, pw, birth);

		if (cnt > 0) {
			System.out.println("비밀번호 설정 완료");
			response.sendRedirect("login.jsp"); // 설정 완료 시 로그인 페이지 이동
		} else {
			System.out.println("비밀번호 설정 실패");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호 설정 실패');");  //실패시 다시 비밀번호 설정 페이지 이동
			out.print("location.href='updatePw.jsp';");
			out.print("</script>");
		}
	}

}
