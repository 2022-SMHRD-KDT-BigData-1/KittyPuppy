package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.LostCoCommentDAO;
import com.kittypuppy.model.LostCoCommentDTO;

public class LostCoCommentShowCon implements iCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax에서 포스트 방식으로 lostNo 받음
		request.setCharacterEncoding("UTF-8");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		LostCoCommentDAO dao = new LostCoCommentDAO();
		ArrayList<LostCoCommentDTO> lcoco_list = null;
		lcoco_list = dao.lostCoCommentShow(lostNo);
		
		// webINFO 폴더에 gson-2.8.5.jar 파일 넣기
		//Gson 객체 만들기 : json 타입으로 변환하기
		Gson gson = new Gson();
		
		// JsonArray 객체 -> json 타입으로 바뀐 데이터를 저장할 수 있는 역할
		JsonArray jarray = new JsonArray();
		
		for(int i = 0;i<lcoco_list.size();i++) {
			jarray.add(gson.toJson(lcoco_list.get(i)));
			//Gson 객체가 key 값을 지정해줌: 해당하는 변수 명과 동일하게 맞춰줌. 
		}
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
	}
	

}