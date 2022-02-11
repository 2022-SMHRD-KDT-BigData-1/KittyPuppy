<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>lostAniShow</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
.material-icons, .megaphone, .bi-calendar3 {
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

.bi-chevron-left {
	font-size: 25px;
	margin-left: 5px;
	width: 40px;
}

.report {
	color: #f5e172;
	font-size: 4ch;
	margin-right: 15px;
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
	position: fixed; /*상단에 고정된 플렉스 박스 */
	left: 0;
	right: 0;
	top: 0;
	margin: auto;
	display: flex;
	justify-content: space-between;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	width: 100%;
	text-align: center;
	max-width: 430px;
	min-width: 385px;
	z-index: 2;
	max-width: 430px;
}

/* 상단 메뉴바 고정 */
.header-menu {
	display: none;
	position: fixed;
	left: 0;
	right: 0;
	top: 5rem;
	margin: auto;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	width: 100%;
	min-width: 385px;
	max-width: 750px;
	z-index: 2;
	position: fixed;
}

/* 바깥 컨테이너 설정 */
.container.out {
	width: 100%;
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 15px;;
	padding-top: 3rem;
	margin: auto;
	display: block;
	max-width: 430px;
	min-width: 385px;
	padding-right: 15px;
	padding-bottom: 15px;
}
/* 유실 유기동물 카드 관련 */
.innerContainer {
	display: flex;
}

.card {
	flex: 1 1 45%;
	border: solid 1px Gainsboro;
	max-width: 200px;
	height: 255px;
	padding: 1px;
	z-index: -1;
	margin: 4px;
}

.card>a {
	margin: auto;
}

.card-img-top {
	width: 163px;
	height: 163px;
}

.card-body {
	padding: 5px;
}

.innerIcon, .card-text {
	font-size: 12px;
}

/* 화면크기가 800px이 넘어갔을때 적용되는 css */
@media ( min-width : 800px) {
	/* 바깥 컨테이너 설정 */
	.container.out {
		width: 100%;
		max-width: 750px;
		margin: auto;
		display: auto;
		padding-top: 9rem;
		z-index: 2;
	}
	/* 상단 로고 고정 */
	.header-logo {
		display: flex;
		position: fixed;
		justify-content: space-between;
		margin: auto;
		height: 5rem;
		background-color: white;
		padding-top: 15px;
		width: 100%;
		text-align: center;
		max-width: 750px;
		z-index: 2;
	}
	.header-menu {
		display: block;
	}

	/* 상단 로고 관련 설정 */
	.bi-chevron-left {
		visibility: hidden;
	}
	.report {
		margin-right: 15px;
	}

	/* 상단 메뉴바 설정 */
	.icon {
		font-size: 40px;
		margin-left: 30px;
		margin-right: 30px;
	}
	.innerContainer {
		display: flex;
		flex-direction: coloumn;
		align-items: flex-start;
	}
	.inner-items {
		flex: 1 1 40%;
	}

}

.top {
	width: 650px;
}

.comment-line {
	display: flex;
	justify-content: center;
}

.comment-btn {
	flex: auto;
}

.update-btn {
	flex: 1 1 40%;
	display: none;
}

.bi-chat-dots-fill {
	display: none;
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
		<div class="header-logo b">
			<i class="bi bi-chevron-left b"></i>
			<h1 class="text-center b">KittyPuppy</h1>
			<a href=''><i class="bi bi-exclamation-octagon-fill report b"></i></a>
		</div>

		<br>
		<!-- 상단 고정된 메뉴바 -->
		<div class='text-center banner header-menu b'>
			<a><i class="bi bi-phone icon b"></i></a> <a><i
				class="bi bi-megaphone-fill icon megaphone b"></i></a> <a><i
				class="bi bi-geo-alt icon b"></i></a> <a><i
				class="bi bi-person icon b"></i></a> <a><i
				class="bi bi-chat-dots icon b"></i></a>
		</div>


		<!-- 상단 로고,메뉴바 밑의 내용 하나 컨테이너 -->
		<div class="row innerContainer b">

			<!-- 이미지 파일 -->
			<div class="inner-items b">
				<img class="img-fluid" src="./assets/img/img1.jpg" />
			</div>

			<!-- lostAni 상세 -->
			<div class="inner-items b">
				<div class="aniTitle h2">${lostAni.laType}타입[${lostAni.upKind}]${lostAni.kind}</div>
				<div class="subTitle h5">${lostAni.sex}서브/${lostAni.age}/${lostAni.size}/${lostAni.color}</div>

				<div class="laDetail b">
					<span class="h5"> 날짜 : ${lostAni.laDate}</span><br /> <span
						class="h5"> 장소: ${lostAni.place}</span><br /> <span class="h5">
						특징 : ${lostAni.feature}</span><br /> <span class="h5"> 닉네임 :
						${lostAni.nick}</span>
				</div>
				<div class="comment-line b">
					<sapn class="commet-btn"> <i class="bi bi-chat-dots"></i> <i
						class="bi bi-chat-dots-fill"></i> 댓글</sapn>
					<span class="update-btn"><a href="#">글 수정</a></span>

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

	<script>
		
	</script>
</body>
</html>
