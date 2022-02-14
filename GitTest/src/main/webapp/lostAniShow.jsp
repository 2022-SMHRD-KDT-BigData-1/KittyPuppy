<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.kittypuppy.model.*"%>
<%@ page import="com.kittypuppy.service.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// 로그인 회원정보 저장
MemberDTO member = (MemberDTO) session.getAttribute("member");

// get 방식으로 해당 데이터 lostNo 받아서 저장
int lostNo = Integer.parseInt(request.getParameter("lostNo"));

// lostAni 정보 저장
LostAniDAO la_dao = new LostAniDAO();
LostAniDTO lostAni = null;
lostAni = la_dao.lostAniSelect(lostNo);
pageContext.setAttribute("lostAni", lostAni);

// laComment/cocoment 저장
LostCommentDAO lco_dao = new LostCommentDAO();
ArrayList<LostCommentDTO> lco_list = null;
lco_list = lco_dao.lostCommentShow(lostNo);
pageContext.setAttribute("lco_list", lco_list);

//Cocoment lcoco 저장
LostCoCommentDAO lcoco_dao = new LostCoCommentDAO();
ArrayList<LostCoCommentDTO> lcoco_list = null;
lcoco_list = lcoco_dao.lostCoCommentShow2(lostNo);
pageContext.setAttribute("lcoco_list", lcoco_list);

//int Commentcnt = lc_dao.lostCommentCount(lostNo) + lcoco_dao.lostCoCommentCount(lostNo);
int Commentcnt = lco_list.size() + lcoco_list.size();
pageContext.setAttribute("Commentcnt", Commentcnt);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- Required meta tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>lostAni</title>

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
.material-icons, #megaphone-fill, .bi-calendar3 {
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
}

.bi {
	font-size: 30px;
	color: #25aa8f7e;
	display: inline;
	width: 40px;
}

.bi-chevron-left {
	font-size: 35px;
	margin-left: 5px;
	width: 40px;
	color: #25aa8f7e;
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

.inner-items:first-child {
	margin: auto;
	text-align: center;
}

img {
	border-radius: 2%;
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

.comment-btn-line {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.comment-btn, .update-btn {
	flex: auto;
	display: block;
}

.bi-chat-dots-fill {
	display: none;
}

/* *** 이하 댓글 대댓글 배치 관련 flex 설정*/
.lcocoNum {
	color: gray;
}

#aCocomment-div {
	display: flex;
}

.coco-space {
	flex: auto;
	width: 30px;
}

.coco-items {
	flex: auto;
}
/* **** 이상 댓글 대댓글 배치 관련 flex 설정*/

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
			<a href='lostAniBoard.jsp'><i class="bi bi-chevron-left b"></i></a>
			<h1 class="text-center b">KittyPuppy</h1>
			<a href=''><i class="bi bi-exclamation-octagon-fill report b"></i></a>
		</div>

		<br>
		<!-- 상단 고정된 메뉴바 -->
		<div class='text-center banner header-menu b'>
			<a><i class="bi bi-phone icon b"></i></a> <a><i
				id="megaphone-fill" class="bi bi-megaphone-fill icon b"></i></a> <a><i
				class="bi bi-geo-alt icon b"></i></a> <a><i
				class="bi bi-person icon b"></i></a> <a><i
				class="bi bi-chat-dots icon b"></i></a>
		</div>


		<!-- 상단 로고,메뉴바 밑의 내용 하나 컨테이너 -->
		<div class="row innerContainer b">
			<div class="row innerContainer b">


				<!-- 이미지 파일 : bootstrap carousel 사용-->
				<div id="carouselExampleIndicators"
					class="carousel slide inner-items" data-bs-ride="carousel"
					data-interval="false">

					<!-- 이미지 반복  입력-->
					<div class="carousel-inner" data-interval="false">
						<c:set var='temp' value='1' scope='request' />
						<c:forEach var='src' items='${fn:split(lostAni.getAniPic(),",")}'>
							<c:choose>
								<c:when test="${requestScope.temp==1}">
									<div class="carousel-item active" data-interval="false">
										<img src="${src}" class="d-block w-100 img-fluid"
											onerror="this.onerror=null; this.src='./assets/img/no-image-icon.jpg';"
											alt="이미지가 등록되지 않았습니다.">
										<c:set var='temp' value='${requestScope.temp+1}'
											scope='request' />
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-item " data-interval="false">
										<img src="${src}" class="d-block w-100 img-fluid"
											onerror="this.onerror=null; this.src='./assets/img/no-image-icon.jpg';"
											alt="이미지가 등록되지 않았습니다.">
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>

					<!-- 좌우 슬라이드 버튼 -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>

					<!-- 인디케이터 반복 -->
					<div class="carousel-indicators">
						<c:set var='temp' value='1' scope='request' />
						<c:forEach var='src' items='${fn:split(lostAni.getAniPic(),",")}'>
							<c:choose>
								<c:when test="${requestScope.temp==1}">
									<button type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide-to="${requestScope.temp-1}" class="active"
										aria-current="true" aria-label="Slide ${requestScope.temp}"></button>
									<c:set var='temp' value='${requestScope.temp+1}'
										scope='request' />

								</c:when>
								<c:otherwise>
									<button type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide-to="${requestScope.temp-1}"
										aria-label="Slide ${requestScope.temp}"></button>
									<c:set var='temp' value='${requestScope.temp+1}'
										scope='request' />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>


				<!-- lostAni 상세 -->
				<div class="inner-items b">
					<div class="aniTitle h2">${lostAni.laType}
						[${lostAni.getUpKind()}] ${lostAni.kind}</div>
					<div class="subTitle h5">${lostAni.sex}${lostAni.getIsTag()}
						${lostAni.aniSize} ${lostAni.color}</div>

					<div class="laDetail b">
						<span class="h5"> 날짜 : ${lostAni.laDate}</span><br /> <span
							class="h5"> 장소: ${lostAni.place}</span><br /> <span class="h5">
							특징 : ${lostAni.feature}</span><br /> <span class="h5"> 작성자 :
							${lostAni.nick}</span><br />
						<p id="lostComCnt">댓글수 ${Commentcnt}</p>
					</div>



					<!-- 댓글 버튼 : 작성자일 경우 글 수정 버튼 생성 -->
					<div class="comment-btn-line b">
						<button class='btn comment-btn b' type='button'
							data-bs-toggle="collapse" data-bs-target="#collapseExample"
							aria-expanded="false" aria-controls="collapseExample">
							<i class='bi bi-chat-dots lcs'> 댓글</i>
						</button>
						<c:if test="${member.getNick() == lostAni.nick}">
							<a href="LostAniUpdateCon.do?lostNo=${lostAni.lostNo}"><button
									class='btn update-btn b' type='button'>
									<i class="bi bi-vector-pen">글 수정</i>
								</button></a>
						</c:if>
					</div>

					<!-- 댓글 보이는 창 : 댓글 버튼(class="comment-btn-line") 작동시 펼쳐짐 /bootstrap collapse 기능 -->
					<div class="collapse" id="collapseExample">
						<div class="well comment-contents b">

							<c:forEach var="lco" items="${lco_list}">

								<div class='aComment-box${lco.locNo}'>
									<p>${lco.nick}</p>
									<p class="">${lco.content}</p>
									<span class="">${fn:substring(lco.coDate,0,11)}</span> <span
										class="">${fn:substring(lco.coUpdate,0,11)}</span> <a
										class="write_cocomment">댓글쓰기</a>

									<c:set var="lcocoNum" value="0" scope="request" />
									<c:forEach var="lcoco" items="${lcoco_list}">
										<c:if test="${lcoco.locNo == lco.locNo}">
											<c:set var="lcocoNum" value="${requestScope.lcocoNum + 1}"
												scope="request" />
										</c:if>
									</c:forEach>
									<c:if test="${requestScope.lcocoNum > 0}">
										<a class="h6 lcocoNum${lco.locNo} b">ㅡ 댓글수
											${requestScope.lcocoNum}</a>
									</c:if>


									<!-- <%-- <div id="aCocomment-div${lcoco.cono}">
											<div class="coco-space">ㄴ</div>
											<div class="coco-items">
												<p class="">${lcoco.nick}</p>
												<p class="">${lcoco.content}</p>
												<span class="">${fn:substring(lcoco.laDate,0,11)}</span> <span
													class="">${fn:substring(lcoco.laUpdate,0,11)}</span>
											</div>
										</div> --%> -->
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 댓글 작성 창 구현 : 시작 : 가져옴-->
					<div>
						<form action='lostCommentCreateCon.do' method='post'>
							<div class='input-group rounded'>
								<input type='text' class='form-control rounded'
									placeholder='댓글 입력' aria-label='Search'
									aria-describedby='search-addon' /> <input type='submit'
									value='↑'>
							</div>
						</form>
					</div>
					<!-- 댓글 작성 창 구현 : 종료 -->
				</div>


				<!-- 댓글 및 댓글 작성창 collapse : 종료 -->
				<!-- 댓글 종료 -->

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
			
		// moveLostAniupdate(): 페이지 이동 : a 태그로 버튼이 감싸지면  필요 없음.
		
			
		//작성 버튼 눌리면 작동하는 기능
		$('.comment-btn').on('click', lostCommentCnt() {
			let cnt = 0;

			$.ajax({
				type : "post",
				data : {
					"lostNo" : lostNo
				},
				url : "LostCommentCntCon.do",
				dataType : "text",
				success : function(data) {
					cnt += data;
				},
				error : function() {
					alert("ajax 1 실패");
				}
			});
			console.log(3);
			$.ajax({
				type : "post",
				data : {
					"lostNo" : lostNo
				},
				url : "LostCoCommentCntCon.do",
				dataType : "text",
				success : function(data) {
					cnt += data;
				},
				error : function() {
					alert("ajax 2 실패");
				}
			});

			$('#lostComCnt').html("댓글" + cnt + "개");
		});
		

		// 1. 댓글 개수 보기 (dao댓글 가져와서 -> 개수 반환) 필요 없음...
		// function lostCommentCnt(lostNo) {
		/* function lostCommentCnt() {
			let cnt = lco_list.size() + lcoco_list.size(); 
			$('#lostComCnt').html("댓글수" + cnt);
		} */
		
		// 현재 댓글 대댓글 list 가져오기 
		function submitComment(lostNo){
			 $.ajax({
			    url: "LostCommenShowCon.do",
			    type: "post",
                async:false, // 이 한 줄만 추가하면 전역 변수에 저장 가능
		       data: { lostNo: lostNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	
		        	let code ='';
		        	
		        	// 받아온 데이터를 테이블에 추가해주세요
					for (let i = 0; i < result.length; i++) {
						// 현재 배열의 원소를 사용가능한 객체로 변환한 후, 
						let lco = JSON.parse(result[i]);

						code += '	<div id="aComment-div'+lco.locNo+'">';
						code += '	<p>'+lco.nick+'</p>';
						code += '	<p class="">'+lco.content+'</p>';
						code += '<span class="">${fn:substring('+lco.laDate+',0,11)}</span> <span';
						code += '	class="">${fn:substring('+lco.laUpdate+',0,11)}</span> <a';
						code += '	class="write_cocomment">댓글쓰기</a>';
			
						code += '		<c:forEach var="lcoco" items="lcoco_list">';
			
						code += '			<c:if test="${lcoco.lostNo == '+lco.lostNo+'}">';
						code += '				<div id="aCocomment-div ${lcoco.cono}">';
						code += '					<div class="coco-space">ㄴ</div>';
						code += '				<div class="coco-items">';
						code += '					<p class="">${lcoco.nick}</p>';
						code += '					<p class="">${lcoco.content}</p>';
						code += '					<span class="">${fn:substring(lcoco.laDate,0,11)}</span> <span';
						code += '						class="">${fn:substring(lcoco.laUpdate,0,11)}</span>';
						code += '	</div></div></c:if></c:forEach></div>';
						}
						
			            $(".comment-contents").html(code);
						$('#lostComCnt').html("댓글수" + ${Commentcnt+1});
			            
		        },
			    error: function() {
		    		console.log("err-co");
		    	}
			});
		};

		function submitCoComment(lostNo){
			 $.ajax({
			    url: "LostCoCommenShowCon.do",
			    type: "post",
                async:false, // 이 한 줄만 추가하면 전역 변수에 저장 가능
		       data: { lostNo: lostNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	
 		        	let code ='';
 		        	//받아온 데이터를 테이블에 추가해주세요
 					for (let i = 0; i < result.length; i++) {
 						// 현재 배열의 원소를 사용가능한 객체로 변환한 후, 
 						let lcoco = JSON.parse(result[i]);
					
		        	
		        	
		       		code += '<div class="well">';
		    		code += '<div class="comment-contents b">';
		
					code += '<c:forEach var="lco" items="lco_list">';
		
					code += '	<div id="aComment-div${lco.locNo}">';
					code += '	<p>${lco.nick}</p>';
					code += '	<p class="">${lco.content}</p>';
					code += '<span class="">${fn:substring(lco.laDate,0,11)}</span> <span';
					code += '	class="">${fn:substring(lco.laUpdate,0,11)}</span> <a';
					code += '	class="write_cocomment">댓글쓰기</a>';
		
					code += '		<c:forEach var="lcoco" items="lcoco_list">';
		
					code += '			<c:if test="${lcoco.lostno == lco.lostno}">';
					code += '				<div id="aCocomment-div${lcoco.cono}">';
					code += '					<div class="coco-space">ㄴ</div>';
					code += '				<div class="coco-items">';
					code += '					<p class="">${lcoco.nick}</p>';
					code += '					<p class="">${lcoco.content}</p>';
					code += '					<span class="">${fn:substring(lcoco.laDate,0,11)}</span> <span';
					code += '						class="">${fn:substring(lcoco.laUpdate,0,11)}</span>';
					code += '	</div></div></c:if></c:forEach></div></c:forEach></div></div></div>';
					
		            $(".comment-contents").html(code);
					$('#lostComCnt').html("댓글수" + ${Commentcnt+1}); */
		        },
		        
		        
			    error: function() {
		    		console.log("err-coco");
		    	}
			});
		};
		
	</script>
</body>
</html>
