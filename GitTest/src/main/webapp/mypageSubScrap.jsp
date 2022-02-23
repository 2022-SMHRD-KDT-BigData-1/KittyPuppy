<%@page import="com.kittypuppy.model.AnimalDTO"%>
<%@page import="com.kittypuppy.model.AnimalDAO"%>
<%@page import="com.kittypuppy.model.ScrapDTO"%>
<%@page import="com.kittypuppy.model.FeedLikeDTO"%>
<%@page import="com.kittypuppy.model.FeedCommentDTO"%>
<%@page import="com.kittypuppy.model.FeedCoCommentDTO"%>
<%@page import="com.kittypuppy.model.FeedCoCommentDAO"%>
<%@page import="com.kittypuppy.model.FeedCommentDAO"%>
<%@page import="com.kittypuppy.model.FeedLikeDAO"%>
<%@page import="com.kittypuppy.model.ScrapDAO"%>
<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FollowDTO"%>
<%@page import="com.kittypuppy.model.FollowDAO"%>
<%@page import="com.kittypuppy.model.FeedDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 서비스 직전에 -->
<%-- <%@ page errorPage="login.jsp"%> --%>
	
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = 'fn' uri = "http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>KittyPuppy</title>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet">
	

 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://bootsnipp.com/dist/bootsnipp.min.css"
	crossorigin="anonymouse">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- Custom styles for this template -->
<link href="narrow-jumbotron.css" rel="stylesheet">

<!-- css 파일 -->
<link rel="stylesheet" href="./assets/css/mypage.css">



</head>
<body>
<%
	MemberDAO dao = new MemberDAO();
	
	String nick = request.getParameter("nick");
	int startNum = Integer.parseInt(request.getParameter("startNum"));
	int endNum = startNum+2;
	FeedDAO feed = new FeedDAO();
	
	pageContext.setAttribute("nick",nick);
	// 개행 처리 >> 댓글에 필요
	pageContext.setAttribute("enter","\r\n");
	
	FeedLikeDAO fldao = new FeedLikeDAO();
	FeedCommentDAO fcdao = new FeedCommentDAO();
	FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
	ScrapDAO sdao = new ScrapDAO();
	
	// 스크랩
	ScrapDAO scrap = new ScrapDAO();
	ArrayList<FeedDTO> scrapList = scrap.scrapShowLimit3(nick,startNum,endNum);
	pageContext.setAttribute("scrapList", scrapList);
%>

	<!-- 스크랩 -->
	<div id = "reload">
		<c:choose>
			<c:when test="${empty scrapList}">
				<h1 style="color: black;">저장한 항목 없음</h1>
			</c:when>
			<c:otherwise>
				<c:forEach var="scrap" items="${scrapList}">
					<c:set var="scNo" value="${scrap.feedNo }" scope="page" />
					<!-- scNick : 스크랩 게시물을 실제로 작성한 사람 -->
					<c:set var="scNick" value="${scrap.nick }" scope="page" />

					<!-- 스크랩한 게시물 -->
					<div class="row mt-3 text-center">
						<div class="row justify-content-center">
							<div class="d-grid gap-sm-1 col-sm-6">
								<!-- 게시자 정보 -->
								<a href='otherpage.jsp?nick=${scNick }'>
									<div class='col-6'>
										<%
											String scNick = (String)pageContext.getAttribute("scNick");
											MemberDTO sm = dao.memberInfo(scNick);
											pageContext.setAttribute("sm", sm);
										%>

										<img src="${sm.picAddress}"
											class="rounded-circle img-thumbnail feed img-fluid float-start"
											onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">


										<div align="left">
											<strong>${scrap.nick }</strong> <br />${fn:substring(scrap.feedDate,0,10)}
										</div>
									</div>
								</a>

								<!-- 첨부된 사진-->
								<div id="carouselExampleControls${scrap.feedNo}"
									class="carousel slide" data-bs-interval="false">
									<div class="carousel-inner">
										<c:set var='temp' value='1' scope='request' />
										<c:forEach var='src' items='${fn:split(scrap.picAddress,",")}'>
											<c:choose>
												<c:when test="${requestScope.temp==1}">
													<c:set var='temp' value='2' scope='request' />
													<div class="carousel-item active"
														style="max-width: 500px; max-height: 500px;">
														<img src="${src}" class="d-block w-100" alt="...">
													</div>
												</c:when>
												<c:otherwise>
													<div class="carousel-item"
														style="max-width: 500px; max-height: 500px;">
														<img src="${src}" class="d-block w-100" alt="...">
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>

									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleControls${scrap.feedNo}"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleControls${scrap.feedNo}"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>

							</div>
							<!-- 스크랩 피드 내용-->
							<div class="col-sm-6">

								<!-- 스크랩 피드 본문 -->
								<div align='left'>${fn:replace(scrap.content,enter,"<br>")}</div>

								<!-- 스크랩 해시 태그 -->
								<div class="tag" align="left">${scrap.tag}</div>

								<!-- 스크랩 좋아요 댓글 정보 -->
								<%
				                    	int scNo = (int)pageContext.getAttribute("scNo");
				                    	int cnt = fldao.feedLikeShow(scNo).size();
				                    	int comCnt = fcdao.feedCommentShow(scNo).size()+fccdao.feedCoCommentShowByFeedNo(scNo).size();
				                    %>
								<div align='left'>
									<span id='like${scrap.feedNo}'>좋아요 <%= cnt %></span> <span
										id='comCnt${scrap.feedNo}'>댓글 <%= comCnt%></span>
								</div>

								<!-- 스크랩 피드 댓글 창 -->

								<div class='comment' id='comment${scrap.feedNo}'></div>

								<!-- 피드 배너 -->
								<div class='navbar'>
									<%
				                    		boolean check = fldao.feedLikeMark(new FeedLikeDTO(scNo,nick));
				                    		boolean checkS = sdao.scrapMark(new ScrapDTO(null,scNo,null,nick));
				                    	
				                    		if (check) {
				                    			pageContext.setAttribute("check",1);
				                    		} else {
				                    			pageContext.setAttribute("check",0);
				                    		}
				                    		
				                    		if (checkS) {
				                    			pageContext.setAttribute("checkS",1);
				                    		} else {
				                    			pageContext.setAttribute("checkS",0);
				                    		}
				                    		
				                    		
				                    	%>
									<div id='likeCheck${scrap.feedNo}'>
										<c:choose>
											<c:when test="${check==1}">
												<button
													onclick='likeDelete(${scrap.feedNo},"#like${scrap.feedNo}","#likeCheck${scrap.feedNo}")'
													class="feed-bt">
													<i class='fa fa-paw lcs'> 좋아요</i>
												</button>
											</c:when>
											<c:otherwise>
												<button
													onclick='like(${scrap.feedNo},"#like${scrap.feedNo}","#likeCheck${scrap.feedNo}")'
													class="feed-bt">
													<i class='fal fa-paw lcs'> 좋아요</i>
												</button>
											</c:otherwise>
										</c:choose>
									</div>
									<div id='comLoad${scrap.feedNo}'>
										<button class='feed-bt btn' type='button'
											onclick='feedComLoad(${scrap.feedNo},"${nick}","#comment${scrap.feedNo}","#comLoad${scrap.feedNo}")'>
											<i class='bi bi-chat-dots lcs'> 댓글</i>
										</button>
									</div>
									<div id='scrap${scrap.feedNo}'>
										<c:choose>
											<c:when test="${checkS==1}">
												<button
													onclick='scrapDelete(${scrap.feedNo},"#scrap${scrap.feedNo}")'
													class="feed-bt">
													<i class='bi bi-bookmark-fill lcs'> 스크랩</i>
												</button>
											</c:when>
											<c:otherwise>
												<button
													onclick='scrap(${scrap.feedNo},"#scrap${scrap.feedNo}")'
													class="feed-bt">
													<i class='bi bi-bookmark lcs'> 스크랩</i>
												</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>