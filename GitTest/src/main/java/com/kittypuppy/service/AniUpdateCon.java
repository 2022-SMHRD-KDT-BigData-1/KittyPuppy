package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;
import com.kittypuppy.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AniUpdateCon implements iCommand{
	AnimalDAO dao = new AnimalDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// ���� ��� ����
		String saveDir = "C:/Users/smhrd/git/KittyPuppy/GitTest/src/main/webapp/assets/img";
		
		// ���� ����
		MultipartRequest multi = new MultipartRequest(request, saveDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		// animal ���̺� �̹� �ݷ����� ������ ��ϵǾ� �ִ� ���
		// ���� �Էµ� animalPic ���� ���̴��� ���� DB�� �ִ� �� �ٽ� �ҷ�����
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String nick = multi.getParameter("nick");
		String animalName = multi.getParameter("animalName");
		String upKind = multi.getParameter("upKind");
		String kind = multi.getParameter("kind");
		String animalSex = multi.getParameter("animalSex");
		int animalAge = Integer.parseInt(multi.getParameter("animalAge"));
		String animalProfile = multi.getParameter("animalProfile");
		
		String animalPic = multi.getFilesystemName("animalPic");
		if(animalPic != null) {
			System.out.println(animalPic);
			animalPic = "./assets/img/" + animalPic;
		}else {
			String anipic = dao.aniShow(nick, upKind).getAnimalPic();
			if(anipic != null) {
				animalPic = anipic;
			}
		}

		AnimalDTO dto = new AnimalDTO(nick,animalName,animalPic,upKind,kind,animalSex,animalAge,animalProfile);
		int cnt = dao.aniUpdate(nick, animalName, dto); // 

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�ݷ����� ���� ����..!');");
			out.print("location.href= 'mypage.jsp';");// ����
			out.print("</script>");
		}

	
	}

}
