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

<%
	String nick = (String) session.getAttribute("nick");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.memberInfo(nick);
	
	FeedDAO feed = new FeedDAO();
	ArrayList<FeedDTO> feedList = feed.feedSelect(nick);
	
	FollowDAO follow = new FollowDAO();
	// 나를 팔로우 하는 사람들
	ArrayList<String> followerList = follow.followerShow(nick);
	// 내가 팔로잉중인 사람들
	ArrayList<String> followingList = follow.followingShow(nick);
	
	
	// 현재 로그인한 닉네임으로 불러온 피드리스트 page영역에 저장하기
	pageContext.setAttribute("feedList",feedList);

%>
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

			<span class="item img "> <img
				src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
				class="rounded-circle img-thumbnail img-fluid float-start"
				alt="프로필 사진 추가">
			</span>

			<!-- <div class="container profile-in text-center"> -->
			<div class="item post">
				<!-- 게시물의 갯수 -->
				<%=feedList.size()%><br> 게시물
			</div>

			<div class="item follower">
				<%=followerList.size()%><br> 팔로워
			</div>

			<div class="item following">
				<%=followingList.size()%><br> 팔로잉
			</div>


			<!-- 닉네임, 프로필 소개글 -->

			<div class="item nick text-start mt-2 mx-2"><%=nick%></div>


			<div class="item intro text-start mb-2 mx-2"><%=member.getProfile()%></div>




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
			<div class="col-auto">
				<a href="aniJoin.jsp"><img
					src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
					class="rounded-circle img-thumbnail animal float-start"
					alt="프로필 사진 추가"></a>
			</div>
			<div class="col-auto">
				<a href="aniJoin.jsp"></a><img
					src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
					class="rounded-circle img-thumbnail animal float-start"
					alt="프로필 사진 추가"></a>
			</div>

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

                <!-- 스토리 : 내 피드 -->
                <% 
                	for(int i = 0; i < feedList.size(); i++){ 
                	String carouselid = "carouselExampleControls";
                	carouselid += i;
                %>
						
               	
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<div class='col-6'>
								<img
									src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
									class="rounded-circle img-thumbnail feed img-fluid float-start">
								<div align="left">
									<strong><%=feedList.get(i).getNick() %></strong><br />
									<%=feedList.get(i).getFeedDate() %>
								</div>
							</div>
							<!-- 첨부된 사진-->
							<div id="<%=carouselid %>"  class="carousel slide"
                            data-bs-interval="false">
								<div class="carousel-inner">
									<%
		                            	String src = feedList.get(i).getPicAddress();
										System.out.println(src);
		                            	String[] srclist = src.split(",");
		                            	String item = null;
		                            	
		                            	for(int j = 0; j < srclist.length; j++){
		                            		if(j == 0){
		                            			item = "carousel-item active";
		                            		}else{
		                            			item = "carousel-item";
		                            		}
		                            		System.out.println(srclist[j]);
                            		%>
                            	
									<div class="<%= item %>">
										<img src="<%=srclist[j] %>" class="d-block w-100" alt="...">
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
								<%=feedList.get(i).getContent() %>
								<button class='info feed' onclick='more()'>더보기</button>
							</div>
							<div class="tag" align="left"><%=feedList.get(i).getTag() %></div>
							<div align='left'>
								좋아요 10 댓글 10
								<button class='info feed' onclick='entire()'>전체보기</button>
							</div>
							<div>
								<button class="feed">
									<i class='fa fa-paw lcs' onclick='like()'> 좋아요</i>
								</button>
								<!-- <button><i class = 'fal fa-paw lcs' onclick = 'likedelete()'> 좋아요</i></button> -->
								<button class="feed">
									<i class="bi bi-chat-dots lcs" onclick='comment()'> 댓글</i>
								</button>
								<button class="feed">
									<i class="bi bi-bookmark-fill lcs" onclick='scrap()'> 스크랩</i>
								</button>
								<!-- <button><i class = "bi bi-bookmark lcs" onclick = 'scrapdelete()'> 스크랩</i></button> -->
							</div>
						</div>
					</div>
				</div>
				<% } %>
                



			</div>

			<div class="tab-pane fade" id="myreview" role="tabpanel"
				aria-labelledby="myreview-tab">

                <!-- 스크랩 -->
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<div class='col-4'>
								<img
									src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
									class="rounded-circle img-thumbnail feed img-fluid float-start">
								<div>
									<strong>닉네임</strong><br /> 게시일
								</div>
							</div>
							<!-- 첨부된 사진-->
							<div id="carouselExampleControls3" class="carousel slide"
                            data-bs-interval="false">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="https://t.ly/j26ep" class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="https://t.ly/j26ep" class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="https://t.ly/j26ep" class="d-block w-100" alt="...">
									</div>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls3" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

						</div>
						<!-- 피드 내용-->
						<div class="col-sm-6">
							<div align='left'>
								간식 냠냠...
								<button class='info feed' onclick='more()'>더보기</button>
							</div>
							<div align='left'>
								좋아요 10 댓글 10
								<button class='info feed' onclick='entire()'>전체보기</button>
							</div>
							<div>
								<button class="feed">
									<i class='fa fa-paw lcs' onclick='like()'> 좋아요</i>
								</button>
								<!-- <button><i class = 'fal fa-paw lcs' onclick = 'likedelete()'> 좋아요</i></button> -->
								<button class="feed">
									<i class="bi bi-chat-dots lcs" onclick='comment()'> 댓글</i>
								</button>
								<button class="feed">
									<i class="bi bi-bookmark-fill lcs" onclick='scrap()'> 스크랩</i>
								</button>
								<!-- <button><i class = "bi bi-bookmark lcs" onclick = 'scrapdelete()'> 스크랩</i></button> -->
							</div>
						</div>
					</div>
				</div>
            
            
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


</body>
</html>