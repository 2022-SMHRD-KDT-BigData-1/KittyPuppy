package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.deploy.WarWatcher;

import com.kittypuppy.model.DMDAO;
import com.kittypuppy.model.DMDTO;
import com.kittypuppy.model.FollowDTO;

public class DMDeleteAllCon implements iCommand {
	// ��ȭ�� ����
	DMDAO dao = new DMDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sendnick = request.getParameter("sendnick");
		String receivenick = request.getParameter("receivenick");
		System.out.println(sendnick);
		PrintWriter out = response.getWriter();
		int cnt = dao.DMDeleteAll(sendnick, receivenick);
		
		
		if (cnt > 0) {
			
		
			System.out.println("����");
		} else {
			System.out.println("����");

		}
		System.out.println(cnt);
		out.print(cnt);
	}

}
