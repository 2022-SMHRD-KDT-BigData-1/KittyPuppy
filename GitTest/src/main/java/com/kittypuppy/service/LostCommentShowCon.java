package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kittypuppy.model.LostCommentDAO;
import com.kittypuppy.model.LostCommentDTO;

public class LostCommentShowCon implements iCommand {
	
	LostCommentDAO dao = new LostCommentDAO();
	ArrayList<LostCommentDTO> lco_list = null;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//ajax���� ����Ʈ ������� lostNo ����
		request.setCharacterEncoding("UTF-8");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		lco_list = dao.lostCommentShow(lostNo);
		
		//Gson ��ü ����� : json Ÿ������ ��ȯ�ϱ�
		Gson gson = new Gson();
		// JsonArray ��ü -> json Ÿ������ �ٲ� �����͸� ������ �� �ִ� ����
		JsonArray jarrayLoc_list = new JsonArray();
		
		for(int i = 0;i<lco_list.size();i++) {
			jarrayLoc_list.add(gson.toJson(lco_list.get(i)));
			//Gson ��ü�� key ���� ��������: �ش��ϴ� ���� ��� �����ϰ� ������. 
		}
		
		PrintWriter out = response.getWriter();
		out.print(jarrayLoc_list);
		
		System.out.print("��� �������� �Ϸ�"); // ���� ���Ȯ�� �� �����

	}
	

}
