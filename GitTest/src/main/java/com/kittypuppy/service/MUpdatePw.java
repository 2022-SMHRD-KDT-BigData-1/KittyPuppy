package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MUpdatePw implements iCommand {
	MemberDAO dao = new MemberDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String id = member.getId();		
		String birth = member.getBirth();
		
		String pw = request.getParameter("pw");
				
		MemberDAO dao = new MemberDAO();

		int cnt = dao.forgetPW(new MemberDTO(id, pw, birth);

		if (cnt > 0) {
			response.sendRedirect("login.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('��й�ȣ ���� ����');");  //���н� ��й�ȣ ���� ������ �̵�
			out.print("location.href='updatePw.jsp';");
			out.print("</script>");
		}
	}

}