<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.AnimalDTO"%>
<%@page import="com.kittypuppy.model.AnimalDAO"%>
<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@00&display=swap"
	rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>



<style>
body {
	background-color: #ffffff;
	font-size: 10px;
	color: #25aa90;
	display: flex;
	padding: 15px;
	margin: auto;
}

html, body {
	height: 100%;
}

.container {
	width: 70%;
	padding: 15px;
	margin: auto;
	display: block;
	overflow-x: hidden;
}

@media ( min-width : 992px) {
	.img-thumbnail {
		max-width: 150px;
		max-height: 150px;
	}
	.container {
		max-width: 1200px;
		max-height: 700px;
	}
	.ls {
		max-width: 1000px;
	}
}

.container p {
	text-align: center;
	font-size: 12px;
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
	z-index: 3;
}

/* 로고 */
h1 {
	text-align: center;
	font-size: 40px;
	color: #25aa90;
	font-family: 'Dancing Script', cursive;
	display: inline;
}

.bi {
	font-size: 40px;
}

.hidden {
	color: #f5e172;
	font-size: 40px;
	visibility: hidden;
}

.report {
	color: #f5e172;
	font-size: 40px;
}

/* 탭 버튼 */
.nav-link.active {
	background-color: #25aa90 !important;
}

.nav-link {
	color: white;
	background-color: #25aa8f7e !important;
}

.nav-link:hover {
	color: white !important;
}

.btn {
	background-color: #25aa90;
	color: white;
}

/* 지도 크기  */
.map-container {
	overflow: hidden;
	padding-bottom: 56.25%;
	position: relative;
	height: 0;
}

.map-container iframe {
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	position: absolute;
}

#map {
	height: 100%;
}

/* 스크롤 바 width */
::-webkit-scrollbar {
	width: 5px;
	height: 5px;
}

/* Track */
::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px white;
	border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	/* background: #afe6db; */
	background-color: white;
	border-radius: 10px;
}

/* 메뉴바  */
.banner {
	font-size: 30px;
	word-spacing: 2.0ch;
}

.ls {
	margin: atuo;
	max-width: 442px;
	margin: auto;
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
	z-index: 3;
}

/* 공간 배분 비율 체크 */
.b {
	border: solid;
	color: coral;
}
</style>



</head>
<body>
<%-- 	<%
	MemberDAO dao = new MemberDAO();
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	String nick = member.getNick();

	AnimalDAO aniDao = new AnimalDAO();
	//AnimalDTO animal = null;
	//ArrayList<AnimalDTO> aniList = animal.aniShowAll(nick);
	AnimalDTO animal = aniDao.aniShow(nick, upKind);
	pageContext.setAttribute("animal", animal);
	%> --%>


	<div class="container">
		<div class='row'>
			<div class='ls navbar header-logo'>
				<i class='bi bi-exclamation-octagon-fill hidden'></i>
				<h1 class='text-center'>KittyPuppy</h1>
				<a href='lostAniReport.html'><i
					class='bi bi-exclamation-octagon-fill report'></i></a>
			</div>
		</div>

		<div class="row">
			<!-- 상단 배너 -->
			<!-- <div class="col-sm-1">
                <p></p>
            </div> -->
			<div class="g-4 gap-5">
				<div class='ls navbar text-center banner header-menu'>
					<a href="feed.jsp" style="color: #25aa90;"><i
						class="bi bi-phone footer"></i></a> <a href="lostAniBoard.jsp"
						style="color: #25aa90;"><i class="bi bi-megaphone footer"></i></a>
					<a href="maps.jsp" style="color: #25aa90;"><i
						class="bi bi-geo-alt footer"></i></a> <a href="mypage.jsp"
						style="color: #25aa90;"><i class="bi bi-person footer"></i></a> <a
						href="dmList.jsp" style="color: #25aa90;"><i
						class="bi bi-chat-dots footer"></i></a>
				</div>
			</div>
			<!-- <div class="col-sm-1">
                <p></p>
            </div> -->
		</div>

		<!-- 지도 -->
		<div class="row">

			<div class="col-sm-6 g-2">

				<div class="map">

					<!--구글 map플랫폼에서 가져옴 Async script executes immediately and must be after any DOM elements used in callback. 
                    <script
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACh8pWLz6hMAzNdtVVUXqnXvqmoHvx5zI&callback=initMap&v=weekly"
                        async></script>
                    <script>
                        function initMap() {
                            const myLatLng = { lat: 35.15005247338198, lng: 126.91990479977245 };  위도 경도 입력
                            const map = new google.maps.Map(document.getElementById("map"), {
                                zoom: 20,
                                center: myLatLng,
                            });
                            new google.maps.Marker({
                                position: myLatLng,
                                map,
                                title: "Hello World!",
                            });
                        }
                    </script>-->

					<!-- Google map -->
					<div id="map-container-google-1"
						class="z-depth-1-half map-container" style="height: 530px">
						<iframe
							src="https://maps.google.com/maps?q=대한민국+광주광역시+동구+예술길+31-15&t=&z=13&ie=UTF8&iwloc=&output=embed"
							frameborder="0" style="border: 0" allowfullscreen></iframe>
					</div>

				</div>
			</div>

			<!-- 주변 반려동물 리스트 탭 상단 -->
			<div class="col-sm-6 g-2">
				<ul class="nav nav-pills" id="myTab" role="tablist">
					<li class="nav-item mx-1 col" role="presentation">
						<button class="nav-link active w-100 btn-sm rounded-pill"
							href="#kittylist" id="kittylist-tab" data-bs-toggle="tab"
							type="button" role="tab" aria-controls="kittylist"
							aria-selected="true">Kitty</button>
					</li>
					<li class="nav-item mx-1 col" role="presentation">
						<button class="nav-link w-100 btn btn-sm rounded-pill"
							id="puppylist-tab" data-bs-toggle="tab"
							data-bs-target="#puppylist" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">Puppy</button>
					</li>
					<li class="nav-item mx-1 col" role="presentation">
						<button class="nav-link w-100 btn btn-sm rounded-pill"
							id="animalist-tab" data-bs-toggle="tab"
							data-bs-target="#animalist" type="button" role="tab"
							aria-controls="animalist" aria-selected="false">Animal</button>
					</li>
				</ul>

				<!-- 탭의 내용 -->

				<!-- 스크롤 기능 overflow -->
				<div class="overflow-auto g-2 p-3"
					style="max-height: 500px; max-width: 100%;">

					<div class="tab-content" id="myTabContent">

						<!-- 고양이 kitty -->
						<div class="tab-pane fade show active" id="kittylist"
							role="tabpanel" aria-labelledby="kittylist-tab">
							<div class="row">


								
									<div class="col-7 p-3  g-2">
										

											<!-- <button type="button"
												class="btn rounded-pill btn-outline-default "
												style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
												<i class="fas fa-star pr-2" aria-hidden="true"> </i>
											</button> -->
											<p style="text-align: center; color: black;">현재 회원님의 동네에
												동물 친구들이 없습니다.</p>
										
												<button type="button"
													class="btn rounded-pill btn-outline-default "
													style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
													<i class="fas fa-star pr-2" aria-hidden="true"> </i>
													"${animal.upKind}"
												</button>
												<p style="text-align: left; color: black;">
													"${animal.animalName}"<br> "${animal. animalAge}"<br>
													"${member. address}"<br> "${member.sex}"<br>
													"${member.birth}"
												</p>

									</div>
								


								<div class="col-5 g-4 ">
									<!-- 사진 클릭시 피드로 이동 -->
								

											<a href=""> <img
												src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
												class="img-thumbnail mx-auto d-block"
												 onerror="this.onerror=null; this.src='
												style="width:auto; height: 80%;"></a>

										
												<a href="otherpage.jsp?nick=${animal.nick}"><img
													src="${animal.animalPic }"
													class="img-thumbnail mx-auto d-block"
													style="width: auto; height: 80%;"></a>
											
								</div>
							</div>
						</div>
						<!-- 강아지 puppy -->
						<div class="tab-pane fade" id="puppylist" role="tabpanel"
							aria-labelledby="puppylist-tab">
							<div class="row">
								<div class="col-7 p-3  g-2">
									<button type="button"
										class="btn rounded-pill btn-outline-default "
										style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
										<i class="fas fa-star pr-2" aria-hidden="true"> </i>소분류"${animal.upKind}"
									</button>
									<p style="text-align: left; color: black;">
										반려동물 이름"${animal.animalName}"<br> 반려동물 나이"${animal. animalAge}"<br>
										광주광역시 서구 화정동"${member. address}"<br> 여성,"${member.sex}
										20~30대 "${member.age}"
									</p>
								</div>
								<div class="col-5 g-4 ">
									<!-- 사진 클릭시 피드로 이동 -->
									<a href="otherpage.jsp?nick=${animal.nick}"> <img src=""
										${aniList.animalPic }" class="img-thumbnail mx-auto d-block"
										style="width: auto; height: 80%;"></a>
								</div>
							</div>


						</div>



						<!-- 동물리스트 -->
						<div class="tab-pane fade" id="animalist" role="tabpanel"
							aria-labelledby="animalist-tab">

							<div class="row">
								<div class="col-7 p-3  g-2">
									<button type="button"
										class="btn rounded-pill btn-outline-default "
										style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
										<i class="fas fa-star pr-2" aria-hidden="true"> </i>소분류"${animal.upKind}"
									</button>
									<p style="text-align: left; color: black;">
										반려동물 이름"${animal.animalName}"<br> 반려동물 나이"${animal. animalAge}"<br>
										광주광역시 서구 화정동"${member. address}"<br> 여성"${member.sex}",
										20~30대 "${member.age}"
									</p>
								</div>
								<div class="col-5 g-4 ">
									<!-- 사진 클릭시 피드로 이동 -->
									<a href="otherpage.jsp?nick=${feed.nick}"><img
										src="${animal.animalPic }"
										class="img-thumbnail mx-auto d-block"
										style="width: auto; height: 80%;"></a>
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	</div>





	<!-- 밑에 script src 있어야 탭 적용 가능 -->
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>


	</div>

	<script>
		
	</script>









</body>
</html>