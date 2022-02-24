<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.kittypuppy.model.*"%>
<%@ page import="com.kittypuppy.service.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>

<%
MemberDTO member = (MemberDTO) session.getAttribute("member");
LostAniDAO la_dao = new LostAniDAO();
ArrayList<LostAniDTO> lostList = null;
lostList = la_dao.lostAniShow();
pageContext.setAttribute("lostList", lostList);
%>


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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- moment.js cdn : 날짜 형태 변환 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	
<!-- lostAniBoard css 파일 -->
<link href="./assets/css/lostAniBoard.css" rel="stylesheet">

</head>
<body>
	<div class="container out b">

		<!-- 키티퍼피 로고 -->
		<div class="header-logo  b">
			<i class="bi bi-exclamation-octagon-fill hidden b"></i>
			<h1 class="text-center b">KittyPuppy</h1>
			<a href="lostAniReport.html"><i id='report'
				class="bi bi-exclamation-octagon-fill b"></i></a>
		</div>

		<br>
		<!-- 상단 고정된 메뉴바 -->
		<div class='text-center banner header-menu b'>
			<a href="feed.jsp"><i class="bi bi-phone icon b"></i></a> <a
				href="lostAniBoard.jsp"><i id="megaphone-fill"
				class="bi bi-megaphone-fill icon megaphone b"></i></a> <a
				href="maps.jsp"><i class="bi bi-geo-alt icon b"></i></a> <a
				href="mypage.jsp"><i class="bi bi-person icon b"></i></a> <a
				href="dmList.jsp"><i class="bi bi-chat-dots icon b"></i></a>
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

			<c:choose>
				<c:when test="${empty lostList}">
					<li>현재 제보된 내용이 없습니다.</li>
				</c:when>
				<c:otherwise>
					<c:forEach var="lost" items="${lostList}">
						<div class="card">
							<a href='lostAniShow.jsp?lostNo=${lost.getLostNo()}'> <img
								src='${fn:split(lost.aniPic,",")[0]}'
								class="img-fluid card-img-top"
								onerror="this.onerror=null; this.src='./assets/img/no-image-icon.jpg';"
								alt="이미지가 등록되지 않았습니다."></a>
							<div class="card-body">
								<h5 class="card-title">
									<span class="laType">${lost.getLaType()}</span><span
										class="lakind">${lost.getKind()}</span>
								</h5>
								<p class="card-text">
									<span>${lost.getSex()}</span> <span>${lost.getAniSize()}</span><br>
									<sapn> <i class="bi bi-calendar3 innerIcon"></i> 등록일: </sapn>
									<span class="boardDate"> ${lost.getLaDate()}</span> <br> <span
										class="material-icons innerIcon">location_on</span><span>위치
										: ${lost.getPlace()} </span>
								</p>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div id="modal" class="modal-overlay">
		<div class="modal-window">

			<div class="report-container b">
				<form action="LostAniFilterCon.do" method="post">
					<!-- header 박스 -->
					<header class="container-head b">
						<div class="item back b">
							<i class="bi bi-chevron-left"></i>
						</div>
						<div class="item searchPage b">Search</div>
						<div class="item submit b">
							<button type="submit" class="btn">검색</button>
						</div>
					</header>

					<!-- section1 박스: 게시글 등록유형~ 성별까지 다단 나눈 8개, 4줄 -->
					<section class="container-section1 b">
						<select id="laType" class="form-select item1" name="laType">
							<option value="find" selected>목격</option>
							<option value="lost">실종</option>
							<option value="null">보호중null</option>
							<option value="null">완료null</option>
						</select> <input type="text" name="aniName" id="input_aniName"
							class="form-control item1" placeholder="반려동물 이름"> <select
							id="laUpkind" class="form-select item1" name="upKind">
							<option value="null" selected>반려동물 대분류</option>
							<option value="개">개</option>
							<option value="고양이">고양이</option>
							<option value="기타">다른 동물</option>
						</select> <input type="text" name="kind" id="input_kind"
							class="form-control item1" placeholder="반려동물 소분류"> <select
							id="laSize" class="form-select item1" name="aniSize">
							<option value="대형">대형</option>
							<option value="중형">중형</option>
							<option value="소형" selected>소형</option>
						</select> <select id="isTag" class="form-select item1" name="isTag">
							<option value="true">인식표 있음</option>
							<option value="false" selected>인식표 없음</option>
						</select> <select id="sex" class="form-select item1" name="sex">
							<option value="null" selected>성별</option>
							<option value="수컷">수컷</option>
							<option value="암컷">암컷</option>
						</select>
					</section>

					<!-- section2 박스: 게시글 내용, 장소 자동 채워지는 place, 2개 2줄-->
					<section class="container-section2 b">
						<div class="item2">
							<textarea class="form-control item2" name="feature"
								id="exampleFormControlTextarea1" rows="5" placeholder="특징 및 내용 "></textarea>
						</div>
						<input type="text" name="place" id="input_place"
							class="form-control item2" placeholder="제보위치">
					</section>
				</form>
			</div>

		</div>
	</div>


	<script>
	// 날짜 형식 변경 라이브러리
	$(document).ready(function () {
        var date = new Date();
        $(".boardDate").text(moment(date).format('YYYY-MM-DD'));
	});
	
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
