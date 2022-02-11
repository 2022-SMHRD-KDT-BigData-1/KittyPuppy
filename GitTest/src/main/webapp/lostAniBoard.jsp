<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>lostAniBoard</title>

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
/*------------------------------------이하 모달 창 관련 --------------------------------------------------------------*/
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	z-index: 3;
}

#modal .modal-window {
	background: rgba(255, 255, 255, 1);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
	z-index: 3;
}

.btn {
	background-color: #25aa90;
	color: #fff;
	margin-right: 5px;
	width: 70px;
}

.searchPage {
	font-family: 'Dancing Script', cursive ;
	font-size: 35px;
	color: #25aa90;
	display: inline;
}

.back {
	font-size: 15px;
	color: #25aa90;
	margin-left: 5px;
	width: 70px;
}

.container-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.container-section1 {
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	align-content: flex-start;
}

.item1 {
	flex: 1 1 40%;
	margin: 5px;
	max-width: 50%;
}

.container-section2 {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	align-content: flex-start;
}

.item2 {
	flex: 1 1 80%;
	width: 98%;
	margin: 5px;
}

.report-container {
	width: 100%;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 10px;;
	padding-top: 10px;
	margin: 0px auto;
	display: block;
	max-width: 430px;
	min-width: 385px;
	padding-right: 10px;
	padding-bottom: 10px;
}

@media ( min-width : 800px) {
	/* 바깥 컨테이너 설정 */
	.report-container {
		width: 100%;
		max-width: 750px;
		margin: auto;
		display: auto;
	}
}

/*------------------------------------이상 모달 창 관련 --------------------------------------------------------------*/
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

.hidden {
	color: #f5e172;
	font-size: 4ch;
	margin-right: 10px;
	visibility: hidden;
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
}

/* 상단 메뉴바 고정 */
.header-menu {
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
	max-width: 430px;
	min-width: 385px;
	padding-right: 15px;
	padding-bottom: 15px;
}
/* 유실 유기동물 카드 관련 */
.innerContainer {
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	align-content: flex-start;
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
	/* 상단 로고 관련 설정 */
	.hidden {
		margin-right: 10px;
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
	/* 제보현황 4개 보이기*/
	.innerContainer {
		display: flex;
		flex-wrap: wrap;
		align-items: flex-start;
		align-content: flex-start;
	}
	.card {
		flex: 1 1 25%;
		border: solid 1px gainsboro;
		max-width: 180px;
		height: 255px;
		padding: 1px;
		z-index: -1;
		margin: 2px;
	}
}

.top {
	width: 650px;
}

.searchInput {
	text-align: center;
	max-width: 650px;
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
		<div class="header-logo  b">
			<i class="bi bi-exclamation-octagon-fill hidden b"></i>
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

		<!-- 검색 바... : 거대한 검색 버튼... 이거 좀 바꿔야 할 듯 -->
		<div id="search" class="row b justify-content-center">
			<div class="input-group searchInput b">
				<div class="input-group-prepend">
					<span class="input-group-text material-icons" id="basic-addon3">
						search </span>
				</div>
				<input type="text" class="form-control" id="basic-url"
					aria-describedby="basic-addon3" />
			</div>
		</div>

		<!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
		<div class="row innerContainer b">
			<div class="card">
				<a href="#"><img src="./assets/img/img1.jpg"
					class="card-img-top" alt="photo position" /></a>
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
			<div class="card">
				<a href="#"><img src="./assets/img/img1.jpg"
					class="card-img-top" alt="photo position" /></a>
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
			<div class="card">
				<a href="#"><img src="./assets/img/img1.jpg"
					class="card-img-top" alt="photo position" /></a>
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
			<div class="card">
				<a href="#"><img src="./assets/img/img1.jpg"
					class="card-img-top" alt="photo position" /></a>
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
			<div class="card">
				<a href="#"><img src="./assets/img/img1.jpg"
					class="card-img-top" alt="photo position" /></a>
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

	<div id="modal" class="modal-overlay">
		<div class="modal-window">

			<div class="report-container b">
				<form action="#" method="post">
					<!-- header 박스 -->
					<header class="container-head b">
						<div class="item back b">
							<i class="bi bi-chevron-left"></i>
						</div>
						<div class="item searchPage b"> Search </div>
						<div class="item submit b">
							<button type="submit" class="btn">검색</button>
						</div>
					</header>

					<!-- section1 박스: 게시글 등록유형~ 성별까지 다단 나눈 8개, 4줄 -->
					<section class="container-section1 b">
						<select id="laType" class="form-select item1" name="laType">
							<option value="" selected>게시글 등록유형</option>
							<option>목격</option>
							<option>실종</option>
							<option>보호중</option>
							<option>완료</option>
						</select> <input type="text" name="aniName" id="input_aniName"
							class="form-control item1" placeholder="반려동물 이름"> <select
							id="laUpkind" class="form-select item1" name="upkind">
							<option value="" selected>반려동물 대분류</option>
							<option>강아지</option>
							<option>고양이</option>
							<option>다른 동물</option>
						</select> <input type="text" name="kind" id="input_kind"
							class="form-control item1" placeholder="반려동물 소분류"> <select
							id="laSize" class="form-select item1" name="laSize">
							<option value="" selected>동물 사이즈</option>
							<option>대형</option>
							<option>중형</option>
							<option>소형</option>
						</select> <select id="isTag" class="form-select item1" name="isTag">
							<option value="" selected>인식표 여부</option>
							<option>인식표 있음</option>
							<option>인식표 없음</option>
						</select> <select id="sex" class="form-select item1" name="sex">
							<option value="" selected>성별</option>
							<option>수컷</option>
							<option>암컷</option>
						</select>
					</section>

					<!-- section2 박스: 게시글 내용, 장소 자동 채워지는 place, 2개 2줄-->
					<section class="container-section2 b">
						<div class="item2">
							<textarea class="form-control item2"
								id="exampleFormControlTextarea1" rows="5" placeholder="특징 및 내용 "></textarea>
						</div>
						<input type="text" name="place" id="input_place"
							class="form-control item2" placeholder="제보위치">
					</section>
				</form>
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
	// 모달 창 켜기
	const modal = document.getElementById("modal");
	const search = document.getElementById("search");

	search.addEventListener("click", e => {
	    modal.style.display = "flex";
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
    </script>
</body>
</html>
