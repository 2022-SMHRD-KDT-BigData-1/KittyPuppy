<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
/* 공통 사항 @media 위에 작성함. */
.material-icons {
	color: #25aa90;
}

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

/* 아이콘 설정 */
.icon {
	margin-left: 15px;
	margin-right: 15px;
}

.bi {
	font-size: 40px;
}

/* 상단 로고 고정 */
.header-logo {
	position: fixed;
	margin: auto;
	left: 0;
	right: 0;
	top: 0;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	width: 100%;
	text-align: center;
	min-width: 373px;
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
	min-width: 373px;
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
	min-width: 373px;
}

/* 화면크기가 992px이 넘어갔을때 적용되는 css */
@media ( min-width : 992px) {
	/* 바깥 컨테이너 설정 */
	.container.out {
		width: 90%;
		max-width: 700px;
		min-width: 373px;
		margin: auto;
		display: auto;
	}

	/* 상단 로고 관련 설정 */
	.hidden {
		margin-right: 150px;
	}
	.report {
		margin-left: 150px;
	}

	/* 상단 메뉴바 설정 */
	.icon {
		font-size: 40px;
		margin-left: 30px;
		margin-right: 30px;
	}
}

.top {
	width: 650px;
}

.searchInput {
	text-align: center;
	max-width: 650px;
}

#innerContainer {
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.card {
	padding: 2px;
	width: 165px;
	height: 255px;
}

.card-img-top {
	width: 163px;
	height: 163px;
}

.card-body {
	padding: 1px;
}

.innerIcon, .card-text {
	font-size: 12px;
}

/* grid 구분 확인을 위한 css 설정*/
.b {
	border: solid 1px violet;
}
</style>
</head>
<body>
	<div class="container out b">

		<!-- 키티퍼피 로고 -->
		<div class="header-logo">
			<i class="bi bi-exclamation-octagon-fill hidden"></i>
			<h1 class="text-center">KittyPuppy</h1>
			<a href=''><i class="bi bi-exclamation-octagon-fill report"></i></a>
		</div>

		<br>
		<!-- 상단 고정된 메뉴바 -->
		<div class='text-center banner header-menu'>
			<a><i class="bi bi-phone icon"></i></a> <a><i
				class="bi bi-megaphone icon"></i></a> <a><i
				class="bi bi-geo-alt icon"></i></a> <a><i class="bi bi-person icon"></i></a>

			<a><i class="bi bi-chat-dots icon"></i></a>
		</div>


		<!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
			<div class="row b justify-content-center">
				<div class="input-group mb-3 searchInput b">
					<div class="input-group-prepend">
						<span class="input-group-text material-icons" id="basic-addon3">
							search </span>
					</div>
					<input type="text" class="form-control" id="basic-url"
						aria-describedby="basic-addon3" />
				</div>
			</div>

			<div id="innerContainer" class="row b">
				<div class="card">
					<a href="#"><img src="..." class="card-img-top"
						alt="photo position" /></a>
					<div class="card-body">
						<h5 class="card-title">${lostAni.type}${lostAni.kind}kind</h5>
						<p class="card-text">
							<span>${lostAni.sex}성별</span> <span>${lostAni.aniSize}크기</span><br>
							<span><i class="bi bi-calendar3 innerIcon"></i>${lostAni.laDate}날짜</span>
							<br> <span class="material-icons innerIcon">location_on</span><span>${lostAni.place}위치

							</span>
						</p>
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
		<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>
