package com.kittypuppy.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String,iCommand> map;
	
	@Override
	public void init() throws ServletException {
		
		map = new HashMap<String, iCommand>();
		map.put("/AniDeleteCon.do", new AniDeleteCon());
		map.put("/AniJoinCon.do", new AniJoinCon());
		map.put("/AniUpdateCon.do", new AniUpdateCon());
		map.put("/DMDeleteAllCon.do", new DMDeleteAllCon());
		map.put("/DMDeleteCon.do", new DMDeleteCon());
		map.put("/DMSendCon.do", new DMSendCon());
		map.put("/FeedCoCommentCreateCon.do", new FeedCoCommentCreateCon());
		map.put("/FeedCoCommentDeleteCon.do", new FeedCoCommentDeleteCon());
		map.put("/FeedCoCommentUpdateCon.do", new FeedCoCommentUpdateCon());
		map.put("/FeedCommentCreateCon.do", new FeedCommentCreateCon());
		map.put("/FeedCommentDeleteCon.do", new FeedCommentDeleteCon());
		map.put("/FeedCommentUpdateCon.do", new FeedCommentUpdateCon());
		map.put("/FeedCreateCon.do", new FeedCreateCon());
		map.put("/FeedDeleteCon.do", new FeedDeleteCon());
		map.put("/FeedUpdateCon.do", new FeedUpdateCon());
		map.put("/FeedSearchCon.do", new FeedSearchCon());
		map.put("/FeedLikeCon.do", new FeedLikeCon());
		map.put("/FeedLikeDeleteCon.do", new FeedLikeDeleteCon());
		map.put("/FollowCon.do", new FollowCon());
		map.put("/UnFollowCon.do", new UnFollowCon());
		map.put("/LostAniCreateCon.do", new LostAniCreateCon());
		map.put("/LostAniDeleteCon.do", new LostAniDeleteCon());
		map.put("/LostAniUpdateCon.do", new LostAniUpdateCon());
		map.put("/LostAniFilterCon.do", new LostAniFilterCon());
		map.put("/LostCoCommentCreateCon.do", new LostCoCommentCreateCon());
		map.put("/LostCoCommentDeleteCon.do", new LostCoCommentDeleteCon());
		map.put("/LostCoCommentUpdateCon.do", new LostCoCommentUpdateCon());
		map.put("/LostCommentCreateCon.do", new LostCommentCreateCon());
		map.put("/LostCommentDeleteCon.do", new LostCommentDeleteCon());
		map.put("/LostCommentUpdateCon.do", new LostCommentUpdateCon());
		map.put("/MLoginCon.do", new MLoginCon());
		map.put("/MJoinCon.do", new MJoinCon());
		map.put("/MUpdateCon.do", new MUpdateCon());
		map.put("/MDeleteCon.do", new MDeleteCon());
		map.put("/ScrapCon.do", new ScrapCon());
		map.put("/ScrapDeleteCon.do", new ScrapDeleteCon());
		map.put("/MJoinIdCheckCon.do", new MJoinIdCheckCon());
		map.put("/MJoinNickCheckCon.do", new MJoinNickCheckCon());
		map.put("/DMSendCon.do", new DMSendCon());
		super.init();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		map.get(command).execute(request, response);
		System.out.println("서버요청");
	}

}
