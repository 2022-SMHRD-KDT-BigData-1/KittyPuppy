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

public class FeedUpdateCon implements iCommand{

	FeedDTO feed = null;
	FeedDAO dao = new FeedDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		int openRange = Integer.parseInt(request.getParameter("openRange"));
		String picAddress = request.getParameter("picAddress");
		
		// 쿼리스트링에서 get 방식으로 게시물 번호를 받음
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));

		// 수정을 선택한 게시물의 feedno 를 받을 수 있는 feedList
		int cnt = dao.feedUpdate(new FeedDTO(feedNo, null, picAddress, content, tag, null, null, openRange));
		 
		if ( cnt > 0 ) {
			response.sendRedirect("mypage.jsp");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정 실패');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");			
		}
	}

}
