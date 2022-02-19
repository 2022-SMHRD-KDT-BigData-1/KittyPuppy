package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.DMDAO;

public class DMDeleteCon implements iCommand {
	// DM 하나만 삭제
	DMDAO dao = new DMDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int dmNo = Integer.parseInt(request.getParameter("dmNo"));
		PrintWriter out = response.getWriter();
		int cnt = dao.DMDelete(dmNo);

		if (cnt > 0) {
		System.out.println("성공");
		} else {
			System.out.println("실패");	

		}
		out.print(cnt);
	}

}
