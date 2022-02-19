package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MFindPwCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset = UTF-8");

		String id = request.getParameter("id");
		String birth = request.getParameter("birth");

		MemberDAO dao = new MemberDAO();

		MemberDTO member = dao.findPw(id, birth);
		
		if (member != null) {
			System.out.println("아이디와 생일 일치");

//			request.setAttribute("id", id);
//			request.setAttribute("birth", birth);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("updatePw.jsp");
//			dispatcher.forward(request, response);
//			
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("updatePw.jsp");// 비밀번호 설정페이지 이동

		} else {
			// 아이디와 생일 불일치 경우 
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원정보가 일치하지 않아 회원가입을 해주세요');");
			out.print("location.href= 'join.jsp';");// 회원가입 페이지 이동
			out.print("</script>");
		}
	}

}

		
		
//		int checkId = dao.memberIdCheck(id);
//		int checkBirth = dao.memberBirthCheck(birth);
//
//		PrintWriter out = response.getWriter();
//
//		if(checkId == 0) {
//			System.out.println("이미 존재하는 아이디입니다.");
//			if(checkBirth == 0) {
//				System.out.println("등록 된 생년월일 입니다.");
//				out.print("<script>");
//				out.print("location.href= 'updatePw.jsp';");
//				out.print("</script>");
//			}else {
//				System.out.println("미등록 된 생년월일 입니다.");
//				out.print("<script>");
//				out.print("alert('회원정보가 일치하지 않아 회원가입을 해주세요.');");
//				out.print("location.href= 'join.jsp';");
//				out.print("</script>");
//			}
//		}else {
//			System.out.println("사용 가능한 아이디입니다.");
//		}
//		out.print(checkId + "");  //ajax결과 값인 result 가 됨, String으로 값을 내보낼수 있도록 ""로 해준다
//	}
//}
