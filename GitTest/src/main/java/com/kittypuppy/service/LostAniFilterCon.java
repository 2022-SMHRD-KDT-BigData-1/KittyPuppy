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
		String laType = request.getParameter("laType");
		String aniName = request.getParameter("aniName");
		String upKind = request.getParameter("upKind");
		String kind = request.getParameter("kind");
		String sex = request.getParameter("sex");
		String aniSize = request.getParameter("aniSize");
		String isTag = request.getParameter("isTag");
		String feature = request.getParameter("feature");
		String place = request.getParameter("place");

		// 공백 값으로 올 경우 DAO null 검사에서 확인이 안 됨. null로 변환
		if (aniName.length() == 0)
			aniName = null;
		if (kind.length() == 0)
			kind = null;
		if (feature.length() == 0)
			feature = null;
		if (place.length() == 0)
			place = null;

		LostAniDTO dto = new LostAniDTO(0, laType, null, aniName, null, upKind, kind, sex, null, aniSize, isTag,
				feature, place, null, null);
		// 입력값 확인용
		System.out.println(dto.toString());

		String addSql = " is not null";

		if (laType == null || laType == "" || laType.equals("null")) {
		} else {
			addSql += " and latype = '" + laType + "' ";
		}

		if (aniName == null || aniName == "" || aniName.equals("null")) {
		} else {
			addSql += " and animalname like '%" + aniName + "%' ";
		}
		if (upKind == null || upKind == "" || upKind.equals("null")) {
		} else {
			addSql += " and upkind = '" + upKind + "' ";
		}

		if (kind == null || kind == "" || sex.equals("null")) {
		} else {
			addSql += " and kind = '" + kind + "' ";
		}

		if (sex == null || sex == "" || sex.equals("null")) {
		} else {
			addSql += " and sex = '" + sex + "' ";
		}

		if (aniSize == null || aniSize == "" || aniSize.equals("null")) {
		} else {
			addSql += " and animalsize = '" + aniSize + "' ";
		}

		if (isTag == null || isTag == "" || isTag.equals("null")) {
		} else {
			addSql += " and istag = '" + isTag + "' ";
		}

		if (feature == null || feature == "" || feature.equals("null")) {
		} else {
			addSql += " and feature like '%" + feature + "%' ";
		}

		if (place == null || place == "" || place.equals("null")) {
		} else {
			addSql += " and place like '%" + place + "%' ";
		}

		System.out.print(addSql);

		// 일단 검색 가능할 것 같은 내용 넣어둠
		lostAniFilter = dao.lostAniFilter(dto, addSql);

		request.setAttribute("lostAniFilter", lostAniFilter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("lostAniFilterResult.jsp");
		dispatcher.forward(request, response);

	}

}
