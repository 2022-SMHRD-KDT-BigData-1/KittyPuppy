package com.kittypuppy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.AnimalDAO;
import com.kittypuppy.model.AnimalDTO;
import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MapAniListCon implements iCommand {

	AnimalDAO dao = new AnimalDAO();
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member"); 
		String address = member.getAddress();

		// memberDAO 메소드를 통해 현재 로그인한 회원의 주소와 동일한 주소를 가진 회원들의 닉네임리스트 불러오기 
		MemberDAO mdao = new MemberDAO();
		ArrayList<String> nickList = mdao.memberFindAddr(address);
		if(nickList == null) {
			System.out.println("주변 회원 없음");
			
		}else {
			
		}
		
		String upKind = request.getParameter("upKind");
		if(upKind == null) {
			upKind = "kitty";
		}
		
		ArrayList<AnimalDTO> aniList = new ArrayList<AnimalDTO>();
		AnimalDTO animal = null;
		for(int i = 0; i < nickList.size(); i++) {
			String nick = nickList.get(i);
			animal = dao.aniShow(nick, upKind);
			aniList.add(animal);
		}
		 
		session.setAttribute("aniList", aniList);
		response.sendRedirect("maps.jsp");
		
		
	}

	
}
