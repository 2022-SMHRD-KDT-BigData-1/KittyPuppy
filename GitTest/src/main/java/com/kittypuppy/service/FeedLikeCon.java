package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.deploy.WarWatcher;

import com.kittypuppy.model.FeedLikeDAO;
import com.kittypuppy.model.FeedLikeDTO;

public class FeedLikeCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//피드에 좋아요 버튼을 눌렀을때 좋아요 1이 올라가고 
		//누가 어디에 눌렀냐?
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		String nick = request.getParameter("nick");
		
		FeedLikeDAO dao = new FeedLikeDAO();
		
		int cnt = dao.feedLike(new FeedLikeDTO(feedNo,nick));
		
		if(cnt>0) {
			response.sendRedirect("#"); //수정 새로고침 안하는 상태
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패..!');");
			out.print("location.href= 'main.jsp';");//수정
			out.print("</script>");
		}
		
	}

}
