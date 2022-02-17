package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.LostAniDAO;
import com.kittypuppy.model.LostAniDTO;
import com.kittypuppy.model.MemberDTO;

public class LostAniCreateCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post ������� �Է°� �Ѱ� ����.
		request.setCharacterEncoding("utf-8");
		String laType = request.getParameter("laType");
		String aniName = request.getParameter("aniName");
		String aniPic = request.getParameter("aniPic");
		String upKind = request.getParameter("upKind");
		String kind = request.getParameter("kind");
		String sex = request.getParameter("sex");
		String color = request.getParameter("color");
		String aniSize = request.getParameter("aniSize");
		String isTag = request.getParameter("isTag");
		String feature = request.getParameter("feature");
		String place = request.getParameter("place");

		// ���ǿ��� �α����� ����� nick ���������� ����
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// dto�� �´� ������ ���� ��ġ
		LostAniDAO dao = new LostAniDAO();
		int cnt = dao.lostAniCreate(new LostAniDTO(0, laType, member.getNick(), aniName, aniPic, upKind, kind, sex,
				color, aniSize, isTag, feature, place, null, null));

		if (cnt > 0) {
			response.sendRedirect("lostAniBoard.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� �ۼ� ����');");
			out.print("location.href='lostAniBoard.jsp';");
			out.print("</script>");
		}

	}

}
