package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.DMDAO;
import com.kittypuppy.model.DMDTO;

public class DMSendCon implements iCommand {
	DMDAO dao = new DMDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String sendNick = request.getParameter("sendNick");
		String receiveNick = request.getParameter("receiveNick");
		String content = request.getParameter("content");
		
		int cnt = dao.DMSend(new DMDTO(0, sendNick, receiveNick, content, null));

		if (cnt > 0) {
			System.out.println("성공");
			
		} else {
			System.out.println("실패");
		}
	}

}
