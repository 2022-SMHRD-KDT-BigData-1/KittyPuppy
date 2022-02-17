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
<meta charset="UTF-8">
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
<title>lostTemp</title>
</head>
<body>

	<!-- 댓글 보이는 창 : 댓글 버튼(class="comment-btn-line") 작동시 펼쳐짐 /bootstrap collapse 기능 -->
	<div class="collapse comment-contents row b show" id="collapseExample">

		<!--  댓글 박스 반복문 : 시작 -->
		<c:forEach var="loc" items="${loc_list}">
			<div id="aComment-box${loc.locNo}" class="aComment-box ${loc.locNo}">

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
							data-bs-target="#collapse-loc${loc.locNo}" aria-expanded="true"
							aria-controls="collapseCocoWrite">
							답글
							<c:if test="${requestScope.lcocoNum > 0}">${requestScope.lcocoNum}</c:if>
							<i class="bi bi-reply" style='font-size: 15px;'></i>
						</button>

						<c:if test="${member.getNick() == loc.nick}">
							<button id="loc${loc.locNo}" class="loc-delete-btn btn b"
								type="button"
								onclick="locDelete(${loc.locNo}, '#aComment-box${loc.locNo}')">
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
							class='form-control rounded lcoco-comment' placeholder='대댓글 입력'
							aria-label='Search' aria-describedby='search-addon' />
						<button class="lcoco-Submit-btn b" type='button'
							onclick="lcocoSubmit( ${lostAni.lostNo}, ${loc.locNo}, '#lcoco-comment${loc.locNo}' )">
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
									<img class="lcoco-img img-fluid rounded-circle img-thumbnail"
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
											<button id="lcoco${lcoco.coNo}" class="lcoco-delete-btn b"
												type="button"
												onclick="lcocoDelete(${lcoco.coNo}, '#lcoco-Comment-box${lcoco.coNo}')">
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
					onclick="locSubmit(${lostAni.lostNo})">
					<i style="font-size: 2ch;" class="bi bi-send"></i>
				</button>
			</div>
		</div>
		<!-- 댓글 작성 창 구현 : 종료 -->
	</div>



</body>
</html>