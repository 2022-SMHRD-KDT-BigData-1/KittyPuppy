package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kittypuppy.model.LostCommentDAO;
import com.kittypuppy.model.LostCommentDTO;
import com.kittypuppy.model.MemberDTO;

public class LostCommentCreateCon implements iCommand {

	ArrayList<LostCommentDTO> loc_list = new ArrayList<LostCommentDTO>();
	LostCommentDAO dao = new LostCommentDAO();
	LostCommentDTO lostComment = null;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식으로 입력값 넘겨 받음.
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));

		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		// 댓글 저장
		int cnt = dao.lostCommentCreate(new LostCommentDTO(0, lostNo, member.getNick(), content, null, null));
				
		if (cnt > 0) {
			System.out.print("댓글작성 성공"); // 추후 기능확인 후 지우기

			// 댓글 ArrayList 가져오기
			loc_list = dao.lostCommentShow(lostNo);
			
			// 출력을 위한 out 객체 선언
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			// Gson 객체 만들기 : json 타입으로 변환하기
			Gson gson = new Gson();
			// JsonArray 객체 -> json 타입으로 바뀐 데이터를 저장할 수 있는 역할
			JsonArray jarrayLoc_list = new JsonArray();

			for (int i = 0; i < loc_list.size(); i++) {
				jarrayLoc_list.add(gson.toJson(loc_list.get(i)));
				// Gson 객체가 key 값을 지정해줌: 해당하는 변수 명과 동일하게 맞춰줌.
			}

			out.print(jarrayLoc_list);

		} else {
			System.out.print("댓글작성 실패"); // 추후 기능확인 후 지우기
		}

	}

}
