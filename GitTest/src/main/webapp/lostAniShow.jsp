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
MemberDAO m_dao = new MemberDAO();

// get 방식으로 해당 데이터 lostNo 받아서 저장
int lostNo = Integer.parseInt(request.getParameter("lostNo"));

// lostAni 정보 저장
LostAniDAO la_dao = new LostAniDAO();
LostAniDTO lostAni = null;
lostAni = la_dao.lostAniSelect(lostNo);
pageContext.setAttribute("lostAni", lostAni);

// laComment/cocoment 저장
LostCommentDAO loc_dao = new LostCommentDAO();
ArrayList<LostCommentDTO> loc_list = null;
loc_list = loc_dao.lostCommentShow(lostNo);
pageContext.setAttribute("loc_list", loc_list);

//Cocoment lcoco 저장
LostCoCommentDAO lcoco_dao = new LostCoCommentDAO();
ArrayList<LostCoCommentDTO> lcoco_list = null;
lcoco_list = lcoco_dao.lostCoCommentShow2(lostNo);
pageContext.setAttribute("lcoco_list", lcoco_list);

//int Commentcnt = loc_dao.lostCommentCount(lostNo) + lcoco_dao.lostCoCommentCount(lostNo);
int Commentcnt = loc_list.size() + lcoco_list.size();
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
<!-- css 파일 -->
<link rel="stylesheet" href="./assets/css/lostAniShow.css">
<style>
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
			<a href="feed.jsp"><i class="bi bi-phone icon b"></i></a> <a href="lostAniBoard.jsp"><i
				id="megaphone-fill" class="bi bi-megaphone-fill icon megaphone b"></i></a>
			<a href="maps.jsp"><i class="bi bi-geo-alt icon b"></i></a> <a
				href="mypage.jsp"><i class="bi bi-person icon b"></i></a> <a
				href="dmList.jsp"><i class="bi bi-chat-dots icon b"></i></a>
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

					<!-- 댓글 보이는 창 : 댓글 버튼(class="comment-btn-line") 작동시 펼쳐짐 /bootstrap collapse 기능 -->
					<div class="collapse comment-contents row b" id="collapseExample">

						<!--  댓글 박스 반복문 : 시작 -->
						<c:forEach var="loc" items="${loc_list}">
							<div id="aComment-box${loc.locNo}"
								class="aComment-box ${loc.locNo}">

								<div class="loc-img-space b">
									<c:set var='locNick' value='${loc.getNick()}' scope='request' />
									<%
									String locNick = (String) request.getAttribute("locNick");
									MemberDTO loc_m = m_dao.memberInfo(locNick);
									pageContext.setAttribute("loc_m", loc_m);
									%>
									<img class="loc-img img-fluid rounded-circle img-thumbnail"
										src="${loc_m.getPicAddress()}"
										onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';"
										alt="">
								</div>
								<div class="loc-item-box b">
									<div class="loc-content-box">
										<p class="loc-nick h6 ">
											<b>${loc.nick}</b>
										</p>
										<c:set var="lcocoNum" value="0" scope="request" />
										<c:forEach var="lcoco" items="${lcoco_list}">
											<c:if test="${lcoco.locNo == loc.locNo}">
												<c:set var="lcocoNum" value="${requestScope.lcocoNum + 1}"
													scope="request" />
											</c:if>
										</c:forEach>
										<p class="loc-content h6 b">${loc.content}</p>
										<span class="loc-bottom"> 작성일
											${fn:substring(loc.coDate,0,11)}</span> <span class="">${fn:substring(loc.coUpdate,0,11)}</span>
										<button class='btn cocomment-btn b h6' type='button'
											data-bs-toggle="collapse"
											data-bs-target="#collapse-loc${loc.locNo}"
											aria-expanded="false" aria-controls="collapseCocoWrite">
											답글
											<c:if test="${requestScope.lcocoNum > 0}">${requestScope.lcocoNum}</c:if>
											<i class="bi bi-reply" style='font-size: 15px;'></i>
										</button>

										<c:if test="${member.getNick() == loc.nick}">
											<button id="loc${loc.locNo}" class="loc-delete-btn btn b"
												type="button"
												onclick="locDelete(${loc.locNo}, '#aComment-box${loc.locNo}','${member.getNick()}')">
												<i class="bi bi-trash" style='font-size: 15px;'></i>
											</button>
										</c:if>
									</div>
								</div>



								<!--  대댓글 박스 반복문 :댓글에 if 대댓이 있으, collapse로 대댓 생성 -->


								<div class="collapse CoComment-contents row b"
									id="collapse-loc${loc.locNo}">
									<!-- 대댓글 입력창 -->
									<div class='input-group rounded '>
										<input type='text' name="lcoco-comment"
											id="lcoco-comment${loc.locNo}"
											class='form-control rounded lcoco-comment'
											placeholder='대댓글 입력' aria-label='Search'
											aria-describedby='search-addon' />
										<button class="lcoco-Submit-btn b" type='button'
											onclick="lcocoSubmit( ${lostAni.lostNo}, ${loc.locNo}, '#lcoco-comment${loc.locNo}','${member.getNick()}')">
											<i style="font-size: 1.5ch;" class="bi bi-send"></i>
										</button>
									</div>
									<c:forEach var="lcoco" items="${lcoco_list}">
										<c:if test="${loc.locNo == lcoco.locNo}">
											<div id="lcoco-Comment-box${lcoco.coNo}"
												class="lcoco-Comment-box ${lcoco.coNo}">

												<div class="lcoco-img-space b">
													<c:set var='lcocoNick' value='${lcoco.getNick()}'
														scope='request' />
													<%
													String lcocoNick = (String) request.getAttribute("lcocoNick");
													MemberDTO lcoco_m = m_dao.memberInfo(lcocoNick);
													pageContext.setAttribute("lcoco_m", lcoco_m);
													%>
													<img
														class="lcoco-img img-fluid rounded-circle img-thumbnail"
														src="${lcoco_m.getPicAddress()}"
														onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png';"
														alt="">
												</div>
												<div class="lcoco-item-box b">
													<div class="lcoco-content-box">
														<p class="lcoco-nick h6 ">
															<b>${lcoco.nick}</b>
														</p>
														<p class="lcoco-content h6 b">${lcoco.content}</p>
														<span class="lcoco-bottom"> 작성일
															${fn:substring(lcoco.coDate,0,11)}</span> <span class="">${fn:substring(lcoco.coUpdate,0,11)}</span>

														<c:if test="${member.getNick() == lcoco.nick}">
															<button id="lcoco${lcoco.coNo}"
																class="lcoco-delete-btn b" type="button"
																onclick="lcocoDelete(${lcoco.coNo}, '#lcoco-Comment-box${lcoco.coNo}', '${member.getNick()}')">
																<i class="bi bi-trash" style='font-size: 15px;'></i>
															</button>
														</c:if>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<!--  답글(대댓글) 반복박스  : 종료 -->
							</div>
							<!--  댓글 내부 반복박스  : 종료 -->

						</c:forEach>
						<!-- 댓글 작성 창 구현 : 가져옴-->
						<div>
							<div class='input-group rounded'>
								<input type='text' name="loc-comment"
									class='form-control rounded loc-comment' placeholder='댓글 입력'
									aria-label='Search' aria-describedby='search-addon' />
								<button class="loc-Submit-btn b"
									onclick="locSubmit(${lostAni.lostNo},'${member.getNick()}')">
									<i style="font-size: 2ch;" class="bi bi-send"></i>
								</button>
							</div>
						</div>
						<!-- 댓글 작성 창 구현 : 종료 -->
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
				</div>

				<!-- 댓글 종료 -->

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
	// 댓글 삭제 버튼		
	function locDelete(locNo, del_id, nick) {
				
		$.ajax({
		    type: "post",
	        data: { locNo: locNo },
		    url: "LostCommentDeleteCon.do",
	        dataType : 'json',
	        success: function(result) {
				if(result > 0){
	        		alert("success");
	        		lostComLoad(lostNo, nick);
	        	}else{
	        		alert("con-댓글삭제 실패");
	        	}
	        },
		    error: function() {
	            alert("ajax-실패");
	    	}
		});

	}
	
	// 대댓글 삭제 버튼		
	function lcocoDelete(coNo, del_id, nick) {
				
		$.ajax({
		    type: "post",
	        data: { coNo: coNo },
		    url: "LostCoCommentDeleteCon.do",
	        dataType : 'json',
	        success: function(result) {
				if(result > 0){
	        		alert("success");
	        		$(del_id).remove();
	        		lostComLoad(lostNo,nick);
	        	}else{
	        		alert("con-대댓글삭제 실패");
	        	}
	        },
		    error: function() {
	            alert("ajax-실패");
	    	}
		});
	}
	
	
	// 댓글 등록 버튼 > db 등록 > 페이지 새로고침;	
	function locSubmit(lostNo,nick) {
		
	    $.ajax({
	        type: "post",
	        data: {
	            lostNo: lostNo,
	            content: $('.loc-comment').val()
	        },
	        url: "LostCommentCreateCon.do",
	        dataType: "json",
	        success: function (result) {
	        	if(result > 0){
	        		alert("success");
	        		lostComLoad(lostNo,nick);
	        	}else{
	        		alert("con 댓글 작성 실패");
	        	}
	        },error: function () {
	            alert("ajax-실패");
	        }
	    });
	}
		
	// 대댓글 작성 등록 ajax
	function lcocoSubmit(lostNo, locNo, submitId, nick){
		
		 $.ajax({
		        type: "post",
		        data: {
		            lostNo: lostNo,
		            locNo: locNo,
		            content: $(submitId).val()
		        },
		        url: "LostCoCommentCreateCon.do",
		        dataType: "json",
		        success: function (result) {
		        	if(result > 0){
		        		alert("success");
		        		lostComLoad(lostNo,nick);
		        	}else{
		        		alert("con 대댓글 작성 실패");
		        	}
		        },error: function () {
		            alert("ajax-실패");
		        }
		    });
		}
		
	// 댓글 보이기
	function lostComLoad(lostNo,nick) {
			$('#collapseExample').empty();
			$('#collapseExample').load("lostAniCom.jsp #collapseExample",{lostNo:lostNo, nick:nick});
	}
	
	</script>
</body>
</html>
