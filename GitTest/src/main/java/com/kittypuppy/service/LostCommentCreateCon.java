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
		String content = request.getParameter("content");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		// ��� ����
		int cnt = dao.lostCommentCreate(new LostCommentDTO(0, lostNo, member.getNick(), content, null, null));
				
		if (cnt > 0) {
			System.out.print("����ۼ� ����"); // ���� ���Ȯ�� �� �����

			// ��� ArrayList ��������
			loc_list = dao.lostCommentShow(lostNo);
			
			// ����� ���� out ��ü ����
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			// Gson ��ü ����� : json Ÿ������ ��ȯ�ϱ�
			Gson gson = new Gson();
			// JsonArray ��ü -> json Ÿ������ �ٲ� �����͸� ������ �� �ִ� ����
			JsonArray jarrayLoc_list = new JsonArray();

			for (int i = 0; i < loc_list.size(); i++) {
				jarrayLoc_list.add(gson.toJson(loc_list.get(i)));
				// Gson ��ü�� key ���� ��������: �ش��ϴ� ���� ��� �����ϰ� ������.
			}

			out.print(jarrayLoc_list);

		} else {
			System.out.print("����ۼ� ����"); // ���� ���Ȯ�� �� �����
		}

	}

}
