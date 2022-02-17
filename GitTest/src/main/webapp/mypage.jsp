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
	MemberDTO member = (MemberDTO)session.getAttribute("member");
	String nick = member.getNick();
	// System.out.println(nick);
	
	FeedDAO feed = new FeedDAO();
	// 내가 팔로우 하고 있는 사람들의 게시물 리스트
	ArrayList<FeedDTO> feedList = feed.feedSelect(nick);
	
	FollowDAO follow = new FollowDAO();
	// 나를 팔로우 하는 사람들
	ArrayList<String> followerList = follow.followerShow(nick);
	// 내가 팔로잉중인 사람들
	ArrayList<String> followingList = follow.followingShow(nick);
	
	// 현재 로그인한 닉네임으로 불러온 피드리스트, 팔로워리스트, 팔로잉리스트 page영역에 저장하기
	pageContext.setAttribute("feedList",feedList);
	pageContext.setAttribute("followerList", followerList);
	pageContext.setAttribute("followingList", followingList);
	
	// 개행 처리 >> 댓글에 필요
	pageContext.setAttribute("enter","\r\n");
	
	FeedLikeDAO fldao = new FeedLikeDAO();
	FeedCommentDAO fcdao = new FeedCommentDAO();
	FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
	ScrapDAO sdao = new ScrapDAO();
	
	// 등록한 반려동물 가져오기
	AnimalDAO animal = new AnimalDAO();
	ArrayList<AnimalDTO> aniList = animal.aniShowAll(nick);
	pageContext.setAttribute("aniList", aniList);

%>

	<!-- 키티퍼피 로고 -->
	<div class="header-logo">
		<i class="bi bi-exclamation-octagon-fill hidden"></i>
		<h1 class="text-center">KittyPuppy</h1>
		<a href=''><i class="bi bi-exclamation-octagon-fill report"></i></a>
	</div>

	<br>
	<!-- 상단 고정된 메뉴바 -->
	<div class='text-center banner header-menu'>
		<a href="feed.jsp"><i class="bi bi-phone icon"></i></a> <a
			href="lostAniBoard.jsp"><i class="bi bi-megaphone icon"></i></a> <a
			href=""><i class="bi bi-geo-alt icon"></i></a> <a href="mypage.jsp"><i
			class="bi bi-person-fill icon"></i></a> <a href=""><i
			class="bi bi-chat-dots icon"></i></a>
	</div>


	<!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
	<div class="container out">

		<!-- 프로필 사진, 게시물, 팔로워 팔로잉 -->
		<div class="container profile">
			
			<!-- 프로필 사진 -->

			<span class="item img ">
				<c:choose>
					<c:when test="${empty member.picAddress }">
						<img
						src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" 
						class="rounded-circle img-thumbnail img-fluid float-start">
					</c:when>
					<c:otherwise>
						<img
						src="${member.picAddress}"
						class="rounded-circle img-thumbnail img-fluid float-start">
					</c:otherwise>
				</c:choose>
			</span>

			<!-- <div class="container profile-in text-center"> -->
			<div class="item post">
				<!-- 게시물의 갯수 -->
				${feedList.size()}<br> 게시물
			</div>

			<div class="item follower">
				${followerList.size()}<br> 팔로워
			</div>

			<div class="item following">
				${followingList.size()}<br> 팔로잉
			</div>


			<!-- 닉네임, 프로필 소개글 -->

			<div class="item nick text-start mt-2 mx-2">${member.nick}</div>


			<div class="item intro text-start mb-2 mx-2">${member.profile}</div>




			<!-- 회원정보수정, 게시물 작성 버튼 -->
			<div class="item update">
				<button type="button" class="btn me-1 update"
					onclick="location.href='update.jsp' ">회원정보 수정</button>
			</div>
			<div class="item write">
				<button type="button" class="btn ms-1 write"
					onclick="location.href='feedUpload.jsp' ">게시물 작성</button>
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
							<a href="ani">
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

		<br>

		<!-- 탭 메뉴 -->
		<div class="tab row">
			<ul class="nav nav-pills" id="myTab" role="tablist">
				<li class="nav-item col me-1" role="presentation">
					<button class="nav-link active w-100 btn" href="#userinfo"
						id="userinfo-tab" data-bs-toggle="tab" " type="button" role="tab"
						aria-controls="userinfo" aria-selected="true">스토리</button>
				</li>
				<li class="nav-item col ms-1" role="presentation">
					<button class="nav-link w-100 btn" id="myreview-tab"
						data-bs-toggle="tab" data-bs-target="#myreview" type="button"
						role="tab" aria-controls="myreview" aria-selected="false">스크랩</button>
				</li>
			</ul>
		</div>

	</div>

		<!-- 탭의 내용 -->
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
			aria-labelledby="userinfo-tab">
			
			<c:forEach var = 'feed'	items = '${feedList }'>
				<c:set var = 'fdn' value = '${feed.feedNo}' scope = 'request'/>
        		<c:set var = 'fnick' value = '${feed.nick}' scope = 'request'/>	
        		
                <!-- 스토리 : 내 피드 -->
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<div class='col'>
							<%
						      	String fnick = (String) request.getAttribute("fnick");
						      	MemberDTO fm = dao.memberInfo(fnick);
						      	pageContext.setAttribute("fm",fm);
						    %>
								<c:choose>
									<c:when test = "${empty fm.picAddress} ">
										<img
									src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
									class="rounded-circle img-thumbnail feed img-fluid float-start">
									</c:when>
								</c:choose>
								<img
									src="${fm.picAddress}"
									class="rounded-circle img-thumbnail feed img-fluid float-start">
								<div align="left">
									<strong>${feed.nick}</strong><br />
									${feed.feedDate}
								</div>
								<div  style="float:right; ">
									<button class="feed-bt"><i class="bi bi-x-lg lcs"></i></button>
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
	                    		boolean check = fldao.feedLikeMark(new FeedLikeDTO(fdn,nick));
	                    		boolean checkS = sdao.scrapMark(new ScrapDTO(null,fdn,null,nick));
	                    	
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
	                    	<div id = 'likeCheck${feed.feedNo}'>
		                    	<c:choose>
		                    		<c:when test="${check==1}">
		                    			<button onclick='likeDelete(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")' class="feed-bt"><i class = 'fa fa-paw lcs'> 좋아요</i></button>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<button onclick='like(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")' class="feed-bt"><i class = 'fal fa-paw lcs'> 좋아요</i></button>
		                    		</c:otherwise>
		                    	</c:choose>
	                    	</div>
	                        <button class = 'feed-bt btn'  type = 'button' data-bs-toggle="collapse" data-bs-target="#comment${feed.feedNo}" aria-expanded="false"><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>
	                        <button class="feed-bt" onclick="location.href='feedUpdate.jsp?fdn=${feed.feedNo}' "><i class="bi bi-pencil-square lcs"> 수정하기</i></button>
	                        <%-- <div id ='scrap${feed.feedNo}'>
	                        	<c:choose>
	                        		<c:when test="${checkS==1}">
	                        			<button onclick ='scrapDelete(${feed.feedNo},"#scrap${feed.feedNo}")' class="feed-bt"><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<button onclick ='scrap(${feed.feedNo},"#scrap${feed.feedNo}")' class="feed-bt"><i class = 'bi bi-bookmark lcs'> 스크랩</i></button>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div> --%>
	                    </div>
						</div>
					</div>
				</div>
                


			</c:forEach>
		</div>
		
			<!-- 스크랩 -->
			<div class="tab-pane fade" id="myreview" role="tabpanel"
				aria-labelledby="myreview-tab">

                
                <%
	            	// 스크랩
	            	ScrapDAO scrap = new ScrapDAO();
	            	ArrayList<FeedDTO> scrapList = scrap.scrapShow(nick);
	            	if(scrapList.size()==0){ 
	            		out.print("<h1>저장한 항목 없음</h1>");
	            	 } else{
	            		 for(int i = 0; i < scrapList.size(); i++){ 
	                     	String carouselid = "carouselExampleControls";
	                     	carouselid += i;
	             %>
	            	
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<a href = 'otherpage.jsp?nick=<%=scrapList.get(i).getNick()%>'>
								<div class='col-6'>
									<img
										src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
										class="rounded-circle img-thumbnail feed img-fluid float-start">
									<div align="left">
										<strong><%=scrapList.get(i).getNick() %></strong>
										<br /><%=scrapList.get(i).getFeedDate() %>
									</div>
								</div>
							</a>
							<!-- 첨부된 사진-->
							<div id="<%=carouselid %>" class="carousel slide"
                            data-bs-interval="false">
								<div class="carousel-inner" >
								<%
		                            	String src = scrapList.get(i).getPicAddress();
		                            	String[] srclist = src.split(",");
		                            	String item = null;
		                            	
		                            	for(int j = 0; j < srclist.length; j++){
		                            		if(j == 0){
		                            			item = "carousel-item active";
		                            		}else{
		                            			item = "carousel-item";
		                            		}
                            		%>
                            		
									<div class="<%= item %>" style="max-width:500px; max-height:500px;">
										<img src="<%=srclist[j] %>" class="d-block img-fluid" alt="..." style="display:inline !important;">
									</div>
									
									<% } %>
								</div>
								<% carouselid = "#" + carouselid; %>
								<button class="carousel-control-prev" type="button"
									data-bs-target="<%=carouselid %>" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="<%=carouselid %>" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

						</div>
						<!-- 피드 내용--> 
						<div class="col-sm-6">
							<div align='left'>
								<%=scrapList.get(i).getContent() %>
								<button class='info feed-bt' onclick='more()'>더보기</button>
							</div>
							<div class="tag" align="left"><%=scrapList.get(i).getTag() %></div>
							<div align='left'>
								좋아요 10 댓글 10
								<button class='info feed-bt' onclick='entire()'>전체보기</button>
							</div>
							<div>
								<button class="feed-bt">
									<i class='fa fa-paw lcs' onclick='like()'> 좋아요</i>
								</button>
								<!-- <button><i class = 'fal fa-paw lcs' onclick = 'likedelete()'> 좋아요</i></button> -->
								<button class="feed-bt">
									<i class="bi bi-chat-dots lcs" onclick='comment()'> 댓글</i>
								</button>
								<button class="feed-bt">
									<i class="bi bi-bookmark-fill lcs" onclick='scrap()'> 스크랩</i>
								</button>
								<!-- <button><i class = "bi bi-bookmark lcs" onclick = 'scrapdelete()'> 스크랩</i></button> -->
							</div>
						</div>
					</div>
				</div>
            <%  }
	         } %>
            
            </div>

		
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
	
	<script src='jquery-3.6.0.min.js'></script>
	<script type='text/javascript'>
	
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
		        		$(id).html("<button onclick ='scrap("+feedNo+',"#scrap'+feedNo+'")'+"'><i class = 'bi bi-bookmark lcs'> 스크랩</i></button>");
		        	} else {
		        		$(id).html("<button onclick ='scrapDelete("+feedNo+',"#scrap'+feedNo+'")'+"'><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>");
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
	
	</script>

</body>
</html>