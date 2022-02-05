package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostAniDAO;
import com.kittypuppy.model.LostAniDTO;

public class LostAniFilterCon implements iCommand {

	LostAniDAO dao = new LostAniDAO();
	ArrayList<LostAniDTO> lostList = new ArrayList<LostAniDTO>();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String tag = (String) request.getParameter("tag");

		// 일단 검색 가능할 것 같은 내용 넣어둠
		lostList = dao.lostAniFilter(laType, aniName, upKind, kind, sex, aniSize, isTag, feature, place);

		request.setAttribute("lostList", lostList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("mainPage.jsp");
		dispatcher.forward(request, response);

	}

}
