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

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		String content = request.getParameter("content");

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// ��� ����
		int cnt = dao.lostCommentCreate(new LostCommentDTO(0, lostNo, member.getNick(), content, null, null));
		PrintWriter out = response.getWriter();		
		
		if (cnt > 0) {
			System.out.print("����ۼ� ����"); // ���� ���Ȯ�� �� �����
			out.print(cnt);
		} else {
			System.out.print("����ۼ� ����"); // ���� ���Ȯ�� �� �����
			out.print(cnt);
		}

	}

}
