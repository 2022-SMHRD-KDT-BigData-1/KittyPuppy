package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.MemberDTO;

public class FeedCreateCon implements iCommand{

	FeedDTO feed = null;
	FeedDAO dao = new FeedDAO();
	MemberDTO member = null;

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		int openRange = Integer.parseInt(request.getParameter("openRange"));
		String picAddress = request.getParameter("picAddress");
		
		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		member = (MemberDTO)session.getAttribute("member");
		
		int cnt = dao.feedCreate(new FeedDTO(0, member.getNick(), picAddress, content, tag, null, null, openRange));
		
		if ( cnt > 0 ) {
			response.sendRedirect("mypage.jsp");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 작성 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");			
		}
		
	}

}
