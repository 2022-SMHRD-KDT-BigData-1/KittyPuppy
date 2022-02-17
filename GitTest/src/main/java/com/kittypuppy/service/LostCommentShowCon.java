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
	
		//ajax에서 포스트 방식으로 lostNo 받음
		request.setCharacterEncoding("UTF-8");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		lco_list = dao.lostCommentShow(lostNo);
		
		//Gson 객체 만들기 : json 타입으로 변환하기
		Gson gson = new Gson();
		// JsonArray 객체 -> json 타입으로 바뀐 데이터를 저장할 수 있는 역할
		JsonArray jarrayLoc_list = new JsonArray();
		
		for(int i = 0;i<lco_list.size();i++) {
			jarrayLoc_list.add(gson.toJson(lco_list.get(i)));
			//Gson 객체가 key 값을 지정해줌: 해당하는 변수 명과 동일하게 맞춰줌. 
		}
		
		PrintWriter out = response.getWriter();
		out.print(jarrayLoc_list);
		
		System.out.print("댓글 가져오기 완료"); // 추후 기능확인 후 지우기

	}
	

}
