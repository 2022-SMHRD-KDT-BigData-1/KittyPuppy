package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MUpdateCon implements iCommand {
	MemberDAO dao = new MemberDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getId();
				
		String pw = request.getParameter("pw");
		String picAddress = request.getParameter("picAddress");
		String nick = request.getParameter("nick");
		String sex = request.getParameter("sex");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String profile = request.getParameter("profile");
		
		MemberDAO dao = new MemberDAO();

		int cnt = dao.memberUpdate(new MemberDTO(id, pw, picAddress, nick, sex, birth, address, profile));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원정보 수정 실패');");  //완료하고 마이페이지
			out.print("location.href='update.jsp';");
			out.print("</script>");
		}
	}

}
