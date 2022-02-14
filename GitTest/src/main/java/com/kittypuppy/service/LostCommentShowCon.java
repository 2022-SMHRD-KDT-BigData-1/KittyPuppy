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
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//ajax���� ����Ʈ ������� lostNo ����
		request.setCharacterEncoding("UTF-8");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		LostCommentDAO dao = new LostCommentDAO();
		ArrayList<LostCommentDTO> lco_list = null;
		lco_list = dao.lostCommentShow(lostNo);
		
		// webINFO ������ gson-2.8.5.jar ���� �ֱ�
		//Gson ��ü ����� : json Ÿ������ ��ȯ�ϱ�
		Gson gson = new Gson();
		
		// JsonArray ��ü -> json Ÿ������ �ٲ� �����͸� ������ �� �ִ� ����
		JsonArray jarray = new JsonArray();
		
		for(int i = 0;i<lco_list.size();i++) {
			jarray.add(gson.toJson(lco_list.get(i)));
			//Gson ��ü�� key ���� ��������: �ش��ϴ� ���� ��� �����ϰ� ������. 
		}
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
	}
	

}
