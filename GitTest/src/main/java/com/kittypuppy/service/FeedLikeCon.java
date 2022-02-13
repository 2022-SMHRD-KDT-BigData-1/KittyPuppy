package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.*;

public class FeedLikeCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//�ǵ忡 ���ƿ� ��ư�� �������� ���ƿ� 1�� �ö󰡰� 
		//���� ��� ������?
		HttpSession session = request.getSession();
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		
		FeedLikeDAO dao = new FeedLikeDAO();
		
		int result = dao.feedLike(new FeedLikeDTO(feedNo,nick));
		
		PrintWriter out = response.getWriter();
		out.print(result);
				
	}

}
