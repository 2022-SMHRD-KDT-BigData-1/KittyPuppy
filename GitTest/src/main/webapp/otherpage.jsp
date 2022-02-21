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
    	String otherNick = request.getParameter("nick");
    	pageContext.setAttribute("otherNick", otherNick);
   		MemberDAO dao = new MemberDAO();
     	MemberDTO otherMember = dao.memberInfo(otherNick);
     	pageContext.setAttribute("otherMember", otherMember);
       		
   		FeedDAO feed = new FeedDAO();
   		ArrayList<FeedDTO> feedList = feed.feedSelect(otherNick);
   		
   		// 현재 로그인중인 회원
   		MemberDTO member = (MemberDTO)session.getAttribute("member");
   		
   		FollowDAO follow = new FollowDAO();
   		// 현 페이지 회원을 팔로우 하는 사람들
   		ArrayList<String> followerList = follow.followerShow(otherNick);
   		// 현 페이지 회원이 팔로잉중인 사람들
   		ArrayList<String> followingList = follow.followingShow(otherNick);
   		
   		pageContext.setAttribute("feedList", feedList);
   		pageContext.setAttribute("followerList", followerList);
   		pageContext.setAttribute("followingList", followingList);
   		
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


    <!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
    <div class="container out">
    
        <!-- 프로필 사진, 게시물, 팔로워 팔로잉 -->
        <div class="container profile">
            
            <span class="item img ">
            <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start" alt="프로필 사진 추가">
            </span>
           
            <!-- <div class="container profile-in text-center"> -->
                <div class="item post">
                    ${feedList.size()}<br>
                    게시물
                </div>

                <div class="item follower">
                   	${followerList.size()}<br>
                    팔로워
                </div>

                <div class="item following">
                    ${followingList.size()}<br>
                    팔로잉
                </div>
            

                <!-- 닉네임, 프로필 소개글 -->
                
                <div class="item nick text-start mt-2 mx-2">${otherMember.nick}</div>
                
                
                <div class="item intro text-start mb-2 mx-2">${otherMember.profile}</div>
                
            
            
            
                <!-- 팔로우, 메세지 버튼 -->
                <div class="item update" id="followCheck">
                	<%
                		boolean check = follow.followMark(member.getNick(), otherNick);
                	
                		if(check){
                			pageContext.setAttribute("check", 1);
                		}else{
                			pageContext.setAttribute("check", 0);
                		}
                	%>
                	<c:choose>
                		<c:when test="${check==0}">
                			<button onclick='follow("#followCheck",".item.follower")'type="button" class="btn me-1 follow">팔로우</button>
                		</c:when>
						<c:otherwise>
							<button onclick='unFollow("#followCheck",".item.follower")'type="button" class="btn me-1 unfollow">팔로우 취소</button>
						</c:otherwise>                		
                	</c:choose>
                </div>
                <div class="item write">
                    <button type="button" class="btn ms-1 message" onclick="location.href='dmShow.jsp?receivenick=${otherNick}' ">메세지</button>
                </div>
            <!-- </div> -->
        </div>
        <br>

        <!-- 반려동물 사진, 추가등록 버튼 -->
		<div class="animal row">
			<c:choose>
				<c:when test="${empty aniList }">
					<div class="col-auto">
						<img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
							class="rounded-circle img-thumbnail animal float-start"
							alt="프로필 사진 추가">
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="ani" items="${aniList }">
						<div class="col-auto">
							<a href="aniUpdate.jsp?animalName=${ani.animalName }">
							<img src="${ani.animalPic }"
								class="rounded-circle img-thumbnail animal float-start"
								alt="프로필 사진 추가"></a>
						</div>
					</c:forEach>
					
				</c:otherwise>
			</c:choose>
			
			

			<div class="col-auto">
				<a href="aniJoin.jsp"><i class="bi bi-plus-square-dotted"></i></a>
			</div>
		</div>
    
        <hr>

    </div>
    
    <div class="tab-content">
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
									${feed.feedDate}
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
		                    <div class = 'comment collapse'  id ='comment${feed.feedNo}'>
		                    	<div class = 'comment_body' align = 'left'>
		                    		<c:set var = 'feedNo' value = '${feed.feedNo}' scope = 'session'/>
		                    		<%
		                    			ArrayList<FeedCommentDTO> cs = null;
		                    			int feedNo = (int) session.getAttribute("feedNo");
		                    			cs = fcdao.feedCommentShow(feedNo);
		                    			pageContext.setAttribute("cs", cs);
		                    		%>
		                    		<c:forEach var ='com' items = '${cs}'>
		                    			<div>${fn:replace(com.content,enter,"<br>")} ${com.nick} ${com.coDate}
		                    				<button type = 'button' data-bs-toggle="collapse" data-bs-target="#coCom${com.fcNo}" aria-expanded="false"><i class="bi bi-reply" style = 'font-size : 15px;'></i></button>
		                    				<c:choose>
		                    					<c:when test = "${nick == com.nick}">
		                    						<button onclick = ''><i class="bi bi-pen" style = 'font-size:15px;'></i></button>
		                    						<button onclick = 'feedComDelete(${feed.feedNo},${com.fcNo},"#comCnt${feed.feedNo}")'><i class="bi bi-trash" style = 'font-size : 15px;'></i></button>
		                    					</c:when>
		                    					<c:otherwise>
		                    					</c:otherwise>
		                    				</c:choose>
		                    			</div>
		                    			<c:set var = 'fcNo' value = '${com.fcNo}' scope = 'session'/>
		                    				<div class = 'collapse' id = 'coCom${com.fcNo}'>
					                    		<%
					                    			ArrayList<FeedCoCommentDTO> ccs = null;
					                    			int fcNo = (int) session.getAttribute("fcNo");
					                    			ccs = fccdao.feedCoCommentShow(fcNo);
					                    			pageContext.setAttribute("ccs", ccs);
					                    		%>
						                    	<c:forEach var ='cocom' items = '${ccs}'>
							                    	<div style = 'padding-left: 20px;'>↳${fn:replace(cocom.content,enter,"<br>")}  ${cocom.nick} ${cocom.coDate}
							                   			<c:choose>
							                 				<c:when test = "${nick == cocom.nick}">
					                    						<button onclick = ''><i class="bi bi-pen" style = 'font-size:15px;'></i></button>
					                    						<button onclick = 'feedCoComDelete(${feed.feedNo},${cocom.coNo},"#comCnt${feed.feedNo}")'><i class="bi bi-trash" style = 'font-size : 15px;'></i></button>
					                    					</c:when>
					                    					<c:otherwise>
					                    					</c:otherwise>
					                    				</c:choose>
					                    			</div>
					                    		</c:forEach>
					                    		<!--  대댓글 입력  -->
					                    		<div class='input-group rounded' style = 'padding-left:20px'>
										        	<input id = 'comtext${com.fcNo}' type='text' class='form-control rounded' placeholder='대댓글 입력' aria-label='Search' aria-describedby='search-addon' style = "font-size:1.5ch;"/>
													<button onclick = 'feedCoComCreate(${com.fcNo},${feed.feedNo},"#comtext${com.fcNo}","#comCnt${feed.feedNo}")'><i style = "font-size: 2ch;" class="bi bi-send"></i></button>
												</div>
						                    </div>
		                    		</c:forEach>
		                    	</div>
		                    	<!--  댓글 입력  -->
		                    	<div>
		                    		<div class='input-group rounded'>
							        	<input id = 'text${feed.feedNo}' type='text' class='form-control rounded' placeholder='댓글 입력' aria-label='Search' aria-describedby='search-addon' />
										<button onclick = 'feedComCreate(${feed.feedNo},"#text${feed.feedNo}","#comCnt${feed.feedNo}")'><i style = "font-size: 3ch;" class="bi bi-send"></i></button>
									</div>
			                    </div>
		                    </div>
							
							<!-- 피드 배너 -->
		                    <div class = 'navbar'>
		                    	<%
		                    		
		                    		boolean checkL = fldao.feedLikeMark(new FeedLikeDTO(fdn,member.getNick()));
		                    		boolean checkS = sdao.scrapMark(new ScrapDTO(null,fdn,null,member.getNick()));
		                    	
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
		                        <button class = 'feed-bt btn'  type = 'button' data-bs-toggle="collapse" data-bs-target="#comment${feed.feedNo}" aria-expanded="false"><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>
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
	
	<!-- 팔로워, 팔로잉 명단 모달창 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="modal-container">
				
				<!-- header 박스 -->
				<header class="container-head">
					<div class="item back b">
						<i class="bi bi-chevron-left"></i>
					</div>
					<div class="item">${otherMember.nick}</div>
					<div class="item back b" style="visibility: hidden;">
						<i class="bi bi-chevron-left"></i>
					</div>
				</header>
				
			
				<!-- 팔로우 리스트 탭 메뉴 -->
				<section>
				<ul class="nav nav-tabs" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link bb active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Follower</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link bb" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Following</button>
				  </li>
				</ul>
				
				<!-- 팔로우 리스트 탭 내용 -->
				<div class="tab-content b" id="myTabContent" style="padding: 0px;">
				  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<ul>
				  		<c:forEach var = "follower" items="${followerList }">
		
				  			<%
				  				MemberDTO fmember = dao.memberInfo(pageContext.getAttribute("follower").toString());
				  				pageContext.setAttribute("fmember", fmember);
				  			%>
				  		
					  		<li class="list">
					  			<a href="otherpage.jsp?nick=${follower}" class="item">
									<img src="${fmember.picAddress}" class="rounded-circle img-thumbnail follow img-fluid float-start"
						 			onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
					  			</a>
					  			<div class="item">${fmember.nick}</div>
					  		</li>
					  		<hr>
					  	</c:forEach>
				  	</ul>
				  	
				  </div>
				  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				  	<ul>
				  		<c:forEach var = "following" items="${followingList }">
					  		<%
				  				MemberDTO ffmember = dao.memberInfo(pageContext.getAttribute("following").toString());
				  				pageContext.setAttribute("ffmember", ffmember);
				  			%>
				  		
					  		<li class="list">
					  			<a href="otherpage.jsp?nick=${following}" class="item">
									<img src="${ffmember.picAddress}" class="rounded-circle img-thumbnail follow img-fluid float-start"
						 			onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
					  			</a>
					  			<div class="item">${ffmember.nick}</div>
					  		</li>
					  		<hr>
					  	</c:forEach>
				  	</ul>
				  </div>
				</div>
				</section>
			</div>
		</div>
	</div>


     <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
    
    <script src='jquery-3.6.0.min.js'></script>
    <script>
    
	 	// 모달 창 켜기 - 팔로워 눌렀을 때
		const modal = document.getElementById("modal");
		const follower = document.querySelector(".follower");
	
		follower.addEventListener("click", e => {
		    modal.style.display = "flex";
		});
		
		// 모달창 켜기 - 팔로잉 눌렀을 때
		const following = document.querySelector(".following");
		following.addEventListener("click", e => {
		    modal.style.display = "flex";
		    document.getElementById("profile").className = "tab-pane fade show active";
		    document.getElementById("home").className = "tab-pane fade";
		    document.getElementById("profile-tab").className = "nav-link bb active";
		    document.getElementById("home-tab").className = "nav-link bb";
		});
	
	
		// 모달 창 끄기 1. x 버튼 누르기  2. 모달 바깥 영역 클릭
	
		//1. x 버튼 누르기
		const back = modal.querySelector(".back");
	
		back.addEventListener("click", e => {
		    modal.style.display = "none";
		});
	
		//2. 모달 바깥 영역 클릭
		modal.addEventListener("click", e => {
		    const evTarget = e.target;
		    if(evTarget.classList.contains("modal-overlay")) {
		        modal.style.display = "none";
		    }
		}); 
		
	
		// 좋아요 개수 세기
		function likeCount(feedNo,id){
			 $.ajax({
				async: false,
			    url: "FeedLikeCountCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	console.log(id);
		        	$(id).html("좋아요 " + result);
		        	console.log($(id).html);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 체크
		function likeCheck(feedNo,id){
			 $.ajax({
				async: false,
			    url: "FeedLikeCheckCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	if (result == 0) {
		        		console.log("안좋은데..");
		        		$(id).html("<brtton onclick='like("+feedNo+","+'"#like'+feedNo+'","#likeCheck'+feedNo+'")'+"' class="+'"feed-bt"><i class = '+"'fal fa-paw lcs'> 좋아요</i></button>");
		        		/* $(id).html("<button onclick='like("+feedNo+","+'"#like'+feedNo+'","#likeCheck'+feedNo+'")'+"'><i class = 'fal fa-paw lcs'> 좋아요</i></button>"); */
		        		
		        		
		        	} else {
		        		console.log("좋아요♥");
		        		$(id).html("<brtton onclick='likeDelete("+feedNo+","+'"#like'+feedNo+'","#likeCheck'+feedNo+'")'+"' class="+'"feed-bt"><i class = '+"'fa fa-paw lcs'> 좋아요</i></button>");
		        	}
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 누르기
		function like(feedNo,id1,id2){
			 $.ajax({
			    url: "FeedLikeCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	likeCount(feedNo,id1);
		        	likeCheck(feedNo,id2);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 취소
		function likeDelete(feedNo,id1,id2){
			 $.ajax({
			    url: "FeedLikeDeleteCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	likeCount(feedNo,id1);
		        	likeCheck(feedNo,id2);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 체크
		function scrapCheck(feedNo,id){
			 $.ajax({
				async: false,
			    url: "ScrapCheckCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	if (result == 0) {
		        		$(id).html("<brtton onclick='scrap("+feedNo+","+'"#scrap'+feedNo+'")'+"' class="+'"feed-bt"><i class = '+"'bi bi-bookmark lcs'> 스크랩</i></button>");
		        	} else {
		        		$(id).html("<brtton onclick='scrapDelete("+feedNo+","+'"#scrap'+feedNo+'")'+"' class="+'"feed-bt"><i class = '+"'bi bi-bookmark-fill lcs'> 스크랩</i></button>");
		        	}
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 하기
		function scrap(feedNo,id){
			 $.ajax({
			    url: "ScrapCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	scrapCheck(feedNo,id);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 취소하기
		function scrapDelete(feedNo,id){
			 $.ajax({
			    url: "ScrapDeleteCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	scrapCheck(feedNo,id);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
    
    	// 팔로우 개수 세기
    	function followCount(id){
    		$.ajax({
    			async: false,
    			url: "FollowerShowCon.do",
    			type: "post",
    			dataType:"json",
    			success: function(result){
    				$(id).html(result + "<br>팔로워");
    			}
    		});
    	}
    	
    	// 팔로우 체크
    	function followCheck(id){
    		$.ajax({
    			async: false,
				url: "FollowMarkCon.do",
				type: "post",
				dataType: "json",
				success: function(result){
					if(result == 0){
						console.log("팔로우 취소했다");
						$(id).html("<button onclick='follow("+'"#followCheck",'+'".item.follower")'+"'type="+'"button" class="'+'btn me-1 follow"'+">팔로우</button>");
					}else{
						console.log("팔로우 했다")
						$(id).html("<button onclick='unFollow("+'"#followCheck",'+'".item.follower")'+"'type="+'"button" class="'+'btn me-1 unfollow"'+">팔로우 취소</button>");
					}
				},
				error: function(){
					console.log("error");
				}
    		});
    	};
    	
    	// 팔로우 하기
    	function follow(id,id2){
    		$.ajax({
    			url: "FollowCon.do",
    			type: "post",
    			dataType: "json",
    			success: function(result){
    				followCheck(id);
    				followCount(id2);
    			},
    			error:function(){
    				console.log("err");
    			}
    		});
    	};
    	
    	// 팔로우 취소
    	function unFollow(id,id2){
    		$.ajax({
    			url: "UnFollowCon.do",
    			type: "post",
    			dataType: "json",
    			success: function(result){
    				followCheck(id);
    				followCount(id2);
    			},
    			error: function(){
    				console.log("err");
    			}
    		});
    	};
    
    </script>
</body>
</html>