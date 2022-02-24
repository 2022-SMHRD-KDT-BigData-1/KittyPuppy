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
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
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
	margin-top: 150px;
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

a {
	color: #000000;
	text-decoration-line: none;
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

/* 스크롤 바 Track */
::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px white;
	border-radius: 10px;
}

/* 스크롤 바 Handle */
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

.icon {
	font-size: 4ch;
	margin-left: 15px;
	margin-right: 15px;
	color: #25aa8f7e;
}

.bi {
	font-size: 40px;
}

.bi-geo-alt-fill {
	color: #25aa90;
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
	<%
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	String address = member.getAddress();
	MemberDAO mdao = new MemberDAO();
	AnimalDAO dao = new AnimalDAO();
	
	// memberDAO 메소드를 통해 현재 로그인한 회원의 주소와 동일한 주소를 가진 회원들의 닉네임리스트 불러오기 
	ArrayList<String> nickList = mdao.memberFindAddr(address);
	if (nickList == null) {
		System.out.println("주변 회원 없음");
	}

	pageContext.setAttribute("nickList", nickList);
	
	ArrayList<AnimalDTO> catList = new ArrayList<AnimalDTO>();
	ArrayList<AnimalDTO> dogList = new ArrayList<AnimalDTO>();
	ArrayList<AnimalDTO> aniList = new ArrayList<AnimalDTO>();
	AnimalDTO animal = null;
	for (int i = 0; i < nickList.size(); i++) {
		String nick = nickList.get(i);
		System.out.println(nick);
		String upKind1 = "고양이";
		String upKind2 = "개";
		String upKind3 = "동물";

		animal = dao.aniShow(nick, upKind1);
		if (animal != null) {
			System.out.println(animal.getNick());
			catList.add(animal);
		}

		animal = dao.aniShow(nick, upKind2);
		if (animal != null) {
			dogList.add(animal);
		}

		animal = dao.aniShow(nick, upKind3);
		if (animal != null) {
			aniList.add(animal);
		}
	}
	int size = catList.size() + dogList.size() + aniList.size();
	pageContext.setAttribute("catList", catList);
	pageContext.setAttribute("dogList", dogList);
	pageContext.setAttribute("aniList", aniList);
	
	%>

	<p id = 'addr' style= "display:none;"><%= address %></p>
	<p id = 'size' style= "display:none;"><%= size %></p>
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
			<div class='text-center banner header-menu'>
				<a href="feed.jsp"><i class="bi bi-phone icon"></i></a> <a
					href="lostAniBoard.jsp"><i class="bi bi-megaphone icon"></i></a> <a
					href="maps.jsp"><i class="bi bi-geo-alt-fill icon"></i></a> <a
					href="mypage.jsp"><i class="bi bi-person icon"></i></a> <a
					href="dmList.jsp"><i class="bi bi-chat-dots icon"></i></a>
			</div>

		</div>
		
		<!-- 지도 -->
		<div class="row">

			<div class="col-sm-6 g-2">

				<div class="map">

					<!-- 지도를 표시할 div 입니다 -->

					<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
					
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04190b979a6d181ca1953e1db631e885&libraries=services,clusterer,drawing"></script>
					
						<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>

						
						
						<div id="clickLatlng"></div>

						<script>
							var address = $("#addr").html();
							console.log(address);
							var nickList = $("#nickList").html();
							
							//var size = $("#size").html();
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption);

							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							// 주소로 좌표를 검색합니다
							geocoder.addressSearch(	address, function(result, status) { //member.address

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									var message = 'latlng: new kakao.maps.<br>LatLng('+ result[0].y	+ ', ';
									message += result[0].x + ')';

									var resultDiv = document.getElementById('clickLatlng');
									resultDiv.innerHTML = message;

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker(
											{
												map : map,
												position : coords
											});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>' //member.address + 같은동 친구 수 
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
						</script>

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
					style="max-height: 360px; max-width: 100%;">

					<div class="tab-content" id="myTabContent">
						


						<!-- 고양이 kitty -->
						<div class="tab-pane fade show active" id="kittylist"
							role="tabpanel" aria-labelledby="kittylist-tab">
							<div class="row">
								<!-- <button type="button"
									class="btn rounded-pill btn-outline-default "
									style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
									<i class="fas fa-star pr-2" aria-hidden="true"> </i>
								</button> -->
								<c:choose>
									<c:when test="${empty catList }">
										<p style="text-align: center; color: black;">현재 회원님의 동네에
											동물 친구들이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="cat" items="${catList}">
											<c:set var='aNick' value='${cat.nick}' scope='request' />

											<div class="col-7 p-3  g-2">
												<button type="button"
													class="btn rounded-pill btn-outline-default "
													style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
													<i class="fas fa-star pr-2" aria-hidden="true"> </i>
													${cat.kind}
												</button>
												<p style="text-align: left; color: black;">
													${cat.animalName}<br> ${cat.animalAge}살<br>
													<%
													String ani_nick = (String) request.getAttribute("aNick");
													System.out.println(ani_nick);
													MemberDTO mm = mdao.memberInfo(ani_nick);
													pageContext.setAttribute("mm", mm);
													String year = mm.getBirth();
													year = year.substring(0, 4);
													String group = null;
													int age = Integer.parseInt(year);
													if (age <= 2023 && age > 1984) {
														group = "20~30대";
													} else if (age <= 1983 && age > 1964) {
														group = "40~50대";
													} else {
														group = "10대";
													}
													%>
													${mm.address}<br> ${mm.sex},
													<%=group%><br>

												</p>
											</div>
											<div class="col-5 g-4 ">
												<!-- 사진 클릭시 피드로 이동 -->
												<a href="otherpage.jsp?nick=${cat.nick}"> <img
													src="${cat.animalPic}"
													class="rounded-circle img-thumbnail feed img-fluid float-start"
													style="width: auto; height: 80%;"
													onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
												</a>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- 강아지 puppy -->
						<div class="tab-pane fade" id="puppylist" role="tabpanel"
							aria-labelledby="puppylist-tab">
							<div class="row">
								<c:choose>
									<c:when test="${empty dogList }">
										<p style="text-align: center; color: black;">현재 회원님의 동네에
											동물 친구들이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="dog" items="${dogList}">
											<c:set var='bNick' value='${dog.nick}' scope='request' />

											<div class="col-7 p-3  g-2">
												<button type="button"
													class="btn rounded-pill btn-outline-default "
													style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
													<i class="fas fa-star pr-2" aria-hidden="true"> </i>
													${dog.kind}
												</button>
												<p style="text-align: left; color: black;">
													${dog.animalName}<br> ${dog.animalAge}살<br>
													<%
													String ani_nick = (String) request.getAttribute("bNick");
													System.out.println(ani_nick);
													MemberDTO mm = mdao.memberInfo(ani_nick);
													pageContext.setAttribute("mm", mm);
													String year = mm.getBirth();
													year = year.substring(0, 4);
													String group = null;
													int age = Integer.parseInt(year);
													if (age <= 2023 && age > 1984) {
														group = "20~30대";
													} else if (age <= 1983 && age > 1964) {
														group = "40~50대";
													} else {
														group = "10대";
													}
													%>
													${mm.address}<br> ${mm.sex},
													<%=group%><br>

												</p>
											</div>
											<div class="col-5 g-4 ">
												<!-- 사진 클릭시 피드로 이동 -->
												<a href="otherpage.jsp?nick=${dog.nick}"> <img
													src="${dog.animalPic}"
													class="rounded-circle img-thumbnail feed img-fluid float-start"
													style="width: auto; height: 80%;"
													onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
												</a>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>


						</div>



						<!-- 동물리스트 -->
						<div class="tab-pane fade" id="animalist" role="tabpanel"
							aria-labelledby="animalist-tab">

							<div class="row">
								<c:choose>
									<c:when test="${empty aniList }">
										<p style="text-align: center; color: black;">현재 회원님의 동네에
											동물 친구들이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="ani" items="${aniList}">
											<c:set var='cNick' value='${ani.nick}' scope='request' />

											<div class="col-7 p-3  g-2">
												<button type="button"
													class="btn rounded-pill btn-outline-default "
													style="outline-style: inherit; background-color: rgb(238, 247, 247); color: #000000; font: size 9px;">
													<i class="fas fa-star pr-2" aria-hidden="true"> </i>
													${ani.kind}
												</button>
												<p style="text-align: left; color: black;">
													${ani.animalName}<br> ${ani.animalAge}살<br>
													<%
													String ani_nick = (String) request.getAttribute("cNick");
													System.out.println(ani_nick);
													MemberDTO mm = mdao.memberInfo(ani_nick);
													pageContext.setAttribute("mm", mm);
													String year = mm.getBirth();
													year = year.substring(0, 4);
													String group = null;
													int age = Integer.parseInt(year);
													if (age <= 2023 && age > 1984) {
														group = "20~30대";
													} else if (age <= 1983 && age > 1964) {
														group = "40~50대";
													} else {
														group = "10대";
													}
													%>
													${mm.address}<br> ${mm.sex},
													<%=group%><br>

												</p>
											</div>
											<div class="col-5 g-4 ">
												<!-- 사진 클릭시 피드로 이동 -->
												<a href="otherpage.jsp?nick=${ani.nick}"> <img
													src="${ani.animalPic}"
													class="rounded-circle img-thumbnail feed img-fluid float-start"
													style="width: auto; height: 80%;"
													onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';">
												</a>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
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