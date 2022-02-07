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
	ArrayList<LostAniDTO> lostAniFilter =null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//입력값 post 방식으로 받음 
		request.setCharacterEncoding("utf-8");
		String laType = request.getParameter("laType");
		String aniName = request.getParameter("aniName");
		String upKind = request.getParameter("upKind");
		String kind = request.getParameter("kind");
		String sex = request.getParameter("sex");
		String aniSize = request.getParameter("aniSize");
		String isTag = request.getParameter("isTag");
		String feature = request.getParameter("feature");
		String place = request.getParameter("place");

		
		// 일단 검색 가능할 것 같은 내용 넣어둠
		lostAniFilter = dao.lostAniFilter(new LostAniDTO(0,laType, null, aniName, null,upKind, kind, sex, null, aniSize, isTag, feature, place, null,null));

		request.setAttribute("lostAniFilter", lostAniFilter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("mainPage.jsp");
		dispatcher.forward(request, response);

	}

}
