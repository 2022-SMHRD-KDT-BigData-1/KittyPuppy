package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;


public class MJoinCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.setCharacterEncoding("UTF-8");
		
		
		//이메일, 비밀번호,전화번호,주소
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String picAddress = request.getParameter("picAddress");
		String nick = request.getParameter("nick");
		String sex = request.getParameter("sex");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String profile = request.getParameter("profile");

		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.memberJoin(new MemberDTO(id, pw, null, nick, sex, birth, address, profile));

	
		if (cnt > 0) { 
			request.setAttribute("success_data", id);
			
			//forward방식으로 페이지 이동
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("login.jsp"); //로그인 페이지수정 
					
					dispatcher.forward(request, response);
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패..!');");
			out.print("location.href= 'join.jsp';");//수정
			out.print("</script>");
		}
		
		
		
	}
	}


