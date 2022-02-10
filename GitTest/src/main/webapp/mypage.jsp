<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FollowDTO"%>
<%@page import="com.kittypuppy.model.FollowDAO"%>
<%@page import="com.kittypuppy.model.FeedDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<style>
html, body {
	height: 100%;
}

body {
	background-color: #ffffff;
	padding: 10px;
}

/* 로고 글꼴, 색상 설정 */
h1 {
	font-family: 'Dancing Script', cursive;
	font-size: 35px;
	color: #25aa90;
	display: inline;
}

.hidden {
	color: #f5e172;
	font-size: 4ch;
	margin-right: 100px;
	visibility: hidden;
}

.report {
	color: #f5e172;
	font-size: 4ch;
	margin-left: 100px;
}

/* 상단 로고 고정 */
.header-logo {
	position: fixed;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 0;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	width: 100%;
	text-align: center;
}

/* 상단 메뉴바 고정 */
.header-menu {
	position: fixed;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 5rem;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	width: 100%;
}

.icon {
	font-size: 4ch;
	margin-left: 15px;
	margin-right: 15px;
	color: #25aa8f7e;
}

/* 탭을 클릭했을 때 */
.nav-link.active {
	background-color: #25aa90 !important;
	padding-left: 13px;
	padding-right: 13px;
	padding-top: 7px;
	padding-bottom: 7px;
}

/* 탭에 마우스를 올렸을 때 */
.nav-link {
	color: white;
	background-color: #25aa8f7e !important;
	padding-left: 13px;
	padding-right: 13px;
	padding-top: 7px;
	padding-bottom: 7px;
}

.nav-link:hover {
	color: white !important;
}

.btn:hover {
	/* background-color: #25aa8f7e !important; */
	color: white !important;
}

.btn {
	background-color: #25aa90;
	color: white;
	/* width:190px;
            height: 38px;
            padding-left:13px;
            padding-right: 13px;
            padding-top: 7px;
            padding-bottom: 7px;
            border: 0px; */
}

.btn.update, .btn.write {
	width: 215px;
}

/* button{
            align-items: stretch !important;
        } */
.row {
	align-items: center;
}

/* 바깥 컨테이너 설정 */
.container.out {
	width: 100%;
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 15px;;
	padding-top: 9rem;
	margin: auto;
	display: block;
	max-width: 470px;
}

/* 피드 컨테이너 설정 */
.container.feed {
	width: 100%;
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 15px;;
	margin: auto;
	display: block;
	max-width: 470px;
}


/* 프로필 컨테이너 설정 - flexbox */
.container.profile {
	/* Flex - 정렬을 위한 컨테이너 */
	display: flex;
	flex-wrap: wrap;
	padding: 0px;
	/* 주축 방향 정렬 */
	justify-content: center;
	/* 교차축 방향 정렬 */
	align-items: center;
	text-align: center;
}

/* Flexbox 안의 아이템 모바일 */
.item.img {
	/* margin-right: 50px; */
	flex-basis: 100px;
	height: 72px;
	flex-grow: 0;
	flex-shrink: 0;
}

.item.post {
	flex-basis: 25%;
}

.item.follower {
	flex-basis: 25%;
}

.item.following {
	flex-basis: 25%;
}

.item.nick {
	flex-basis: 100%;
}

.item.intro {
	flex-basis: 100%;
}

.item.update, .item.write {
	flex-basis: 220px;
}

/* 스크린 사이즈에 따라 썸네일, 컨테이너 max크기 지정 */
.img-thumbnail {
	max-width: 77px;
	max-height: 77px;
}

@media ( min-width : 992px) {
	.img-thumbnail {
		max-width: 150px;
		max-height: 150px;
	}
	.img-thumbnail.animal {
		max-width: 90px;
		max-height: 90px;
	}
	.img-thumbnail.feed{
		max-width: 100px;
		max-height: 100px;
	}
	.container.out {
		max-width: 700px;
	}
	.container.profile {
		justify-content: flex-end;
		text-align: left;
	}
	.container.feed{
		max-width: 1200px;
	}
	.item.img {
		order: 1;
		flex-basis: 35%;
		padding-top: 15px;
		height: 60px;
	}
	.item.post {
		order: 5;
		flex-basis: 140px;
		padding-top: 15px;
		margin-bottom: 15px;
	}
	.item.follower {
		order: 6;
		flex-basis: 140px;
		padding-top: 15px;
		margin-bottom: 15px;
	}
	.item.following {
		order: 7;
		flex-basis: 140px;
		padding-top: 15px;
		margin-bottom: 15px;
	}
	.item.nick {
		order: 2;
		flex-basis: 20%;
	}
	.item.update {
		order: 3;
		flex-basis: 20%;
	}
	.item.write {
		order: 4;
		flex-basis: 20%;
	}
	.item.intro {
		order: 8;
		padding-left: 240px;
		margin-top: 15px;
	}
	.icon {
		font-size: 40px;
		margin-left: 30px;
		margin-right: 30px;
	}
	.hidden {
		margin-right: 150px;
	}
	.report {
		margin-left: 150px;
	}
	.btn.update, .btn.write {
		width: 135px;
	}
}

ul {
	padding-right: 0px !important;
}

.row {
	margin: 0px;
}

.bi {
	font-size: 40px;
}

.bi-person-fill {
	color: #25aa90;
}

/* 피드 관련 css */
.info {
	font-size: 12px;
}

.col-sm-6 {
	width: 492px;
}

.col-sm-6>img {
	width: 100%;
}

.feed {
	border: 0cm;
	background-color: #ffffff;
}

.lcs {
	font-size: 2ch;
	margin-left: 15px;
	margin-right: 15px;
}


</style>



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
			href="lostAniBorad.jsp"><i class="bi bi-megaphone icon"></i></a> <a
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

	<div class="container feed">
		<!-- 탭의 내용 -->
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
				aria-labelledby="userinfo-tab">


				<!-- 피드 -->
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
							<div id="carouselExampleControls" class="carousel slide"
								data-bs-ride="carousel">
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
									data-bs-target="#carouselExampleControls" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>


							<!-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
						  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
						  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
					</div> -->

							<!-- <img src="data:image/jpeg;base64,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" class=""> -->
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
			<div class="tab-pane fade" id="myreview" role="tabpanel"
				aria-labelledby="myreview-tab">내가 스크랩한 게시물</div>

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