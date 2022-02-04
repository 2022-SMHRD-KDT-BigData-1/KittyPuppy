package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;

public class FeedSelectCon implements iCommand {

	FeedDAO dao = new FeedDAO();
	ArrayList<FeedDTO> feedList = new ArrayList<FeedDTO>();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ������Ʈ������ get ������� �Խù� ��ȣ�� ����
		String nick = request.getParameter("nick");
		feedList = dao.feedSelect(nick);

		request.setAttribute("feedList", feedList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("othersPage.jsp");
		dispatcher.forward(request, response);
	}

}
