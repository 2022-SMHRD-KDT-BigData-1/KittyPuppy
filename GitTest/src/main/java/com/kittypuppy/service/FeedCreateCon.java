package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.FeedDAO;
import com.kittypuppy.model.FeedDTO;
import com.kittypuppy.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FeedCreateCon implements iCommand{

	FeedDTO feed = null;
	FeedDAO dao = new FeedDAO();
	MemberDTO member = null;

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ���� ��� ����
		String saveDir = "C:/Users/smhrd/git/KittyPuppy/GitTest/src/main/webapp/assets/img";
		
		// ���� ����
		MultipartRequest multi = new MultipartRequest(request, saveDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		// DB ���� �� ���� �� �޾ƿ���
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String nick = member.getNick();
		
		String content = multi.getParameter("content");
		String tag = multi.getParameter("tag");
		int openRange = Integer.parseInt(multi.getParameter("openRange"));
		
		String picAddress1 = multi.getFilesystemName("picAddress1");
		String picAddress2 = multi.getFilesystemName("picAddress2");
		String picAddress3 = multi.getFilesystemName("picAddress3");
		String picAddress4 = multi.getFilesystemName("picAddress4");
		String picAddress5 = multi.getFilesystemName("picAddress5");
		ArrayList<String> paList = new ArrayList<String>();
		
		if (picAddress1 != null) {
			paList.add(".assets/img/"+picAddress1);
		}
		if (picAddress2 != null) {
			paList.add(".assets/img/"+picAddress2);
		}
		if (picAddress3 != null) {
			paList.add(".assets/img/"+picAddress3);
		}
		if (picAddress4 != null) {
			paList.add(".assets/img/"+picAddress4);
		}
		if (picAddress5 != null) {
			paList.add(".assets/img/"+picAddress5);
		}
		
		String picAddress = String.join(",", paList);
		
		// �� �޾ƿԴ��� Ȯ��
		System.out.println(nick);
		System.out.println(content);
		System.out.println(tag);
		System.out.println(openRange);
		System.out.println(picAddress);
		
		// DB ����
		FeedDAO fdao = new FeedDAO();
		int result = fdao.feedCreate(new FeedDTO(0,nick,picAddress,content,tag,null,null,openRange));
		
		// DB ���� ���� üũ
		if (result > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Feed�� ���������� ���ε� ���� ���߽��ϴ�..');");
			out.print("location.href = 'feedUpload.jsp';");
			out.print("</script>");
		}
	}

}
