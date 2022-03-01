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
	ArrayList<LostAniDTO> lostAniFilter = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 입력값 post 방식으로 받음
		request.setCharacterEncoding("utf-8");
		String laType = "";
		if (!request.getParameter("laType").equals("")) {
			laType  = " and latype = '"+request.getParameter("laType")+"'";
		}
		String aniName = "";
		if (!request.getParameter("aniName").equals("")) {
			aniName  = " and animalname = '"+request.getParameter("aniName")+"'";
		}
		String upKind = "";
		if (!request.getParameter("upKind").equals("")) {
			upKind  = " and upkind = '"+request.getParameter("upKind")+"'";
		}
		String kind = "";
		if (!request.getParameter("kind").equals("")) {
			kind  = " and kind = '"+request.getParameter("kind")+"'";
		}
		String sex = "";
		if (!request.getParameter("sex").equals("")) {
			sex  = " and sex = '"+request.getParameter("sex")+"'";
		}
		String aniSize = "";
		if (!request.getParameter("aniSize").equals("")) {
			aniSize  = " and animalsize = '"+request.getParameter("aniSize")+"'";
		}
		String isTag = "";
		if (!request.getParameter("isTag").equals("")) {
			isTag  = " and istag = '"+request.getParameter("isTag")+"'";
		}
		String feature = "";
		if (!request.getParameter("feature").equals("")) {
			feature  = " and feature = '"+request.getParameter("feature")+"'";
		}
		String place = "";
		if (!request.getParameter("place").equals("")) {
			place  = " and place = '"+request.getParameter("place")+"'";
		}
		
		String addSql = " is not null" + laType + aniName + upKind + kind + sex + aniSize + isTag + feature + place;

		System.out.print(addSql);

		// 일단 검색 가능할 것 같은 내용 넣어둠
		lostAniFilter = dao.lostAniFilter(addSql);

		request.setAttribute("lostAniFilter", lostAniFilter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("lostAniFilterResult.jsp");
		dispatcher.forward(request, response);

	}

}
