<%@page import="com.kittypuppy.model.ScrapDTO"%>
<%@page import="com.kittypuppy.model.FeedLikeDTO"%>
<%@page import="com.kittypuppy.model.FeedCoCommentDTO"%>
<%@page import="com.kittypuppy.model.FeedCommentDTO"%>
<%@page import="com.kittypuppy.model.AnimalDTO"%>
<%@page import="com.kittypuppy.model.AnimalDAO"%>
<%@page import="com.kittypuppy.model.ScrapDAO"%>
<%@page import="com.kittypuppy.model.FeedCoCommentDAO"%>
<%@page import="com.kittypuppy.model.FeedCommentDAO"%>
<%@page import="com.kittypuppy.model.FeedLikeDAO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FollowDAO"%>
<%@page import="com.kittypuppy.model.FeedDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>KittyPuppy</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap" rel="stylesheet">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://bootsnipp.com/dist/bootsnipp.min.css" crossorigin="anonymouse">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <!-- Custom styles for this template -->
    <link href="narrow-jumbotron.css" rel="stylesheet">
    
    <!-- css 파일 -->
	<link rel="stylesheet" href="./assets/css/otherpage.css">

</head>
<body>
    
    <!-- 키티퍼피 로고 -->
    <div class="header-logo">
        <i class="bi bi-exclamation-octagon-fill hidden"></i>
        <h1 class="text-center">KittyPuppy</h1>
        <a href ='lostAniReport.html'><i class="bi bi-exclamation-octagon-fill report"></i></a>
    </div>
        
    <br>
    <!-- 상단 고정된 메뉴바 -->
    <div class='text-center banner header-menu'>
        <a href="feed.jsp"><i class = "bi bi-phone icon"></i></a>

        <a href="lostAniBoard.jsp"><i class="bi bi-megaphone icon"></i></a>

        <a href="maps.jsp"><i class="bi bi-geo-alt icon"></i></a>

        <a href="mypage.jsp"><i class="bi bi-person icon"></i></a>

        <a href="dmList.jsp"><i class = "bi bi-chat-dots icon"></i></a>
    </div>
    
    <%
    	// 다른사람의 프로필 이미지를 눌렀을때 get방식으로 담겨오는 nick을 받아주는 것
    	String nick = request.getParameter("nick");
    	String otherNick = request.getParameter("otherNick");
    	int startNum = Integer.parseInt(request.getParameter("startNum"));
    	session.setAttribute("otherNick", otherNick);
   		MemberDAO dao = new MemberDAO();
     	MemberDTO otherMember = dao.memberInfo(otherNick);
     	pageContext.setAttribute("otherMember", otherMember);
       		
   		FeedDAO feed = new FeedDAO();
   		ArrayList<FeedDTO> feedList = feed.feedSelectLimit3(otherNick,startNum,startNum+2);
   		
   		
   		
   		pageContext.setAttribute("feedList", feedList);
   		
   		// 개행 처리 >> 댓글에 필요
   		pageContext.setAttribute("enter","\r\n");
    
   		FeedLikeDAO fldao = new FeedLikeDAO();
   		FeedCommentDAO fcdao = new FeedCommentDAO();
   		FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
   		ScrapDAO sdao = new ScrapDAO();
   		
   		// 현 페이지 회원의 등록한 반려동물 가져오기
   		AnimalDAO animal = new AnimalDAO();
   		ArrayList<AnimalDTO> aniList = animal.aniShowAll(otherNick);
   		pageContext.setAttribute("aniList", aniList);
   		
    %>

    <div id = "reload">
    	<!-- 스토리 : 내 피드 -->
             
			<c:forEach var = 'feed'	items = '${feedList }'>
				<c:set var = 'fdn' value = '${feed.feedNo}' scope = 'request'/>
               	<c:set var = 'fnick' value = '${feed.nick}' scope = 'request'/>	
               	
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<div class='col-6'>
								<img src="${otherMember.picAddress}" class="rounded-circle img-thumbnail feed img-fluid float-start"
										 onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
								<div align="left">
									<strong>${feed.nick}</strong><br />
									${fn:substring(feed.feedDate,0,10)}
								</div>
							</div>
							<!-- 첨부된 사진-->
							<div id="carouselExampleControls${feed.feedNo}"  class="carousel slide"
                            data-bs-interval="false">
								<div class="carousel-inner">
									<c:set var = 'temp' value = '1' scope = 'request'/>
									<c:forEach var ='src' items='${fn:split(feed.picAddress,",")}'>
										<c:choose>
											<c:when test="${requestScope.temp==1}">
												<c:set var = 'temp' value = '2' scope = 'request'/>
												<div class="carousel-item active" style="max-width:500px; max-height:500px;">
													<img src="${src}" class="d-block w-100" alt="...">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item" style="max-width:500px; max-height:500px;">
													<img src="${src}" class="d-block w-100" alt="...">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControls${feed.feedNo}" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls${feed.feedNo}" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

						</div>
						<!-- 피드 내용-->
						<div class="col-sm-6">
							<!-- 피드 본문 -->
							<div align='left'>
								${fn:substring(feed.content, 0, 4)}...
								<button class='info feed-bt' data-bs-toggle="collapse" 
								data-bs-target="#collapseExample${feed.feedNo}" aria-expanded="false">더보기</button>
							</div>
							<div class = 'collapse' align = 'left' id ='collapseExample${feed.feedNo}'>${fn:replace(feed.content,enter,"<br>")}</div>
							
							<!-- 해시 태그 -->
							<div class="tag" align="left">${feed.tag}</div>
							
							<!-- 좋아요 댓글 정보 -->
							<%
		                    	int fdn = (int)request.getAttribute("fdn");
		                    	int cnt = fldao.feedLikeShow(fdn).size();
		                    	int comCnt = fcdao.feedCommentShow(fdn).size()+fccdao.feedCoCommentShowByFeedNo(fdn).size();
		                    %>
							<div align='left'>
								<span id ='like${feed.feedNo}'>좋아요 <%= cnt %></span> <span id ='comCnt${feed.feedNo}'>댓글 <%= comCnt%></span>
							</div>
							
							<!--  피드 댓글 창 -->
		                    <div class = 'comment'  id ='comment${feed.feedNo}'>
		                    </div>
							
							<!-- 피드 배너 -->
		                    <div class = 'navbar'>
		                    	<%
		                    		
		                    		boolean checkL = fldao.feedLikeMark(new FeedLikeDTO(fdn,nick));
		                    		boolean checkS = sdao.scrapMark(new ScrapDTO(null,fdn,null,nick));
		                    	
		                    		if (checkL) {
		                    			pageContext.setAttribute("checkL",1);
		                    		} else {
		                    			pageContext.setAttribute("checkL",0);
		                    		}
		                    		
		                    		if (checkS) {
		                    			pageContext.setAttribute("checkS",1);
		                    		} else {
		                    			pageContext.setAttribute("checkS",0);
		                    		}
		                    		
		                    		
		                    	%>
		                    	<div id = 'likeCheck${feed.feedNo}'>
			                    	<c:choose>
			                    		<c:when test="${checkL==1}">
			                    			<button onclick='likeDelete(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")' class="feed-bt"><i class = 'fa fa-paw lcs'> 좋아요</i></button>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<button onclick='like(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")' class="feed-bt"><i class = 'fal fa-paw lcs'> 좋아요</i></button>
			                    		</c:otherwise>
			                    	</c:choose>
		                    	</div>
		                    	<div id = 'comLoad${feed.feedNo}'>
		                        	<button class = 'feed-bt btn'  type = 'button' onclick='feedComLoad(${feed.feedNo},"${nick}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>
		                        </div>
		                        <div id ='scrap${feed.feedNo}'>
		                        	<c:choose>
		                        		<c:when test="${checkS==1}">
		                        			<button onclick ='scrapDelete(${feed.feedNo},"#scrap${feed.feedNo}")' class="feed-bt"><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<button onclick ='scrap(${feed.feedNo},"#scrap${feed.feedNo}")' class="feed-bt"><i class = 'bi bi-bookmark lcs'> 스크랩</i></button>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
						</div>
					</div>
				</div>
				
			</c:forEach>	
    </div>
	

</body>
</html>