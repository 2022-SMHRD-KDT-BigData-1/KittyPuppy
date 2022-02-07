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
		
		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		int openRange = Integer.parseInt(request.getParameter("openRange"));
		String picAddress = request.getParameter("picAddress");
		
		// ������Ʈ������ get ������� �Խù� ��ȣ�� ����
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));

		// ������ ������ �Խù��� feedno �� ���� �� �ִ� feedList
		int cnt = dao.feedUpdate(new FeedDTO(feedNo, null, picAddress, content, tag, null, null, openRange));
		 
		if ( cnt > 0 ) {
			response.sendRedirect("mypage.jsp");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");			
		}
	}

}
