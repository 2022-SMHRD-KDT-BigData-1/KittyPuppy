package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.*;

public class FeedSearchCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = UTF-8");
		String search = null;
		search = (String) request.getParameter("search");
		PrintWriter out = response.getWriter();
		
		if (search.length() != 0) {
			if (search.substring(0, 1).equals("#")) {
				search = search.substring(1);
				FeedDAO fdao = new FeedDAO();
				ArrayList<String> tagList = fdao.tagSearch(search);
				request.setAttribute("searchType", "tag");
				request.setAttribute("searchList",tagList);
			} else {
				MemberDAO dao = new MemberDAO();
				ArrayList<String> memberList = dao.memberList(search);
				request.setAttribute("searchType", "nick");
				request.setAttribute("searchList", memberList);
			}
			request.setAttribute("search", search);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
		} else {
			out.print("<script>");
			out.print("alert('검색어를 입력해주세요!!!');");
			out.print("location.href= 'feed.jsp';");
			out.print("</script>");
		}

	}

}
