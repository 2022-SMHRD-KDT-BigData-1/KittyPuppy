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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class LostAniCreateCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ���� ��� ����
		String saveDir = "C:/Users/smhrd/git/KittyPuppy/GitTest/src/main/webapp/assets/img";

		// ���� ����
		MultipartRequest multi = new MultipartRequest(request, saveDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

		// DB ���� �� ���� �� �޾ƿ���
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String nick = member.getNick();
		
		String laType = multi.getParameter("laType");
		String aniName = multi.getParameter("aniName");
		String upkind = multi.getParameter("upkind");
		String kind = multi.getParameter("kind");
		String color = multi.getParameter("color");
		String laSize = multi.getParameter("laSize");
		String isTag = multi.getParameter("isTag");
		String sex = multi.getParameter("sex");
		String feature = multi.getParameter("feature");
		String place = multi.getParameter("place");
		String picAddress ="./assets/img/"+multi.getFilesystemName("picAddress");

		System.out.println(laType);
		System.out.println(aniName);
		System.out.println(upkind);
		System.out.println(kind);
		System.out.println(color);
		System.out.println(laSize);
		System.out.println(isTag);
		System.out.println(sex);
		System.out.println(feature);
		System.out.println(place);
		System.out.println(picAddress);
		System.out.println(nick);
		// DB ����
		LostAniDAO ldao = new LostAniDAO();
		int result = ldao.lostAniCreate(new LostAniDTO(0,  laType,  nick,  aniName,  picAddress,  upkind, kind,  sex,  color,  laSize,  isTag,  feature,place, null, null));

		// DB ���� ���� üũ
		if (result > 0) {
			response.sendRedirect("lostAniBoard.jsp");
		} else {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���������� �������� ���߽��ϴ�.');");
			out.print("location.href = 'lostAniReport.html';");
			out.print("</script>");
		}
	}

}
