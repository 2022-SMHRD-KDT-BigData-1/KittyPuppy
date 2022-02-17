package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedLikeDAO;
import com.kittypuppy.model.FeedLikeDTO;
import com.kittypuppy.model.MemberDTO;

public class FeedDeleteCon implements iCommand {

	FeedDAO dao = new FeedDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ������Ʈ������ get ������� �Խù� ��ȣ�� ����
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		
		FeedLikeDAO fldao = new FeedLikeDAO();
		int result = fldao.feedLikeDelete(new FeedLikeDTO(feedNo,nick));
		
		if(result > 0) {
			System.out.println("���ƿ� ���� �Ϸ�");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
		
		int cnt = dao.feedDelete(feedNo);

		if (cnt > 0) {
			System.out.println("�Խñ� ���� �Ϸ�");
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}
