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

		// post 방식으로 입력값 넘겨 받음.
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

		// 세션에서 로그인한 사용자 nick 가져오려고 선언
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// dto에 맞는 순서로 값을 배치
		LostAniDAO dao = new LostAniDAO();
		int cnt = dao.lostAniCreate(new LostAniDTO(0, laType, member.getNick(), aniName, aniPic, upKind, kind, sex,
				color, aniSize, isTag, feature, place, null, null));

		if (cnt > 0) {
			response.sendRedirect("lostAniBoard.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 작성 실패');");
			out.print("location.href='lostAniBoard.jsp';");
			out.print("</script>");
		}

	}

}
