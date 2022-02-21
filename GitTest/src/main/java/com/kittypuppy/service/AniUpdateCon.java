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
		
		// 저장 경로 지정
		String saveDir = "C:/Users/smhrd/git/KittyPuppy/GitTest/src/main/webapp/assets/img";
		
		// 파일 저장
		MultipartRequest multi = new MultipartRequest(request, saveDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		// animal 테이블에 이미 반려동물 사진이 등록되어 있는 경우
		// 새로 입력된 animalPic 값이 널이더라도 기존 DB에 있는 값 다시 불러오기
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
			out.print("alert('반려동물 수정 실패..!');");
			out.print("location.href= 'mypage.jsp';");// 수정
			out.print("</script>");
		}

	
	}

}
