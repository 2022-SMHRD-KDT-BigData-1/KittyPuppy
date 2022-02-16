<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ page import='java.util.ArrayList' import='com.kittypuppy.model.*'%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='en'>

<head>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1.0'>

<!-- Bootstrap CSS -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'
	rel='stylesheet'
	integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3'
	crossorigin='anonymous'>

<!-- Google Font -->
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link
	href='https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap'
	rel='stylesheet'>

<!-- 아이콘 -->
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css'>
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<link rel='stylesheet'
	href='https://bootsnipp.com/dist/bootsnipp.min.css'
	crossorigin='anonymouse'>
<link rel='stylesheet'
	href='https://pro.fontawesome.com/releases/v5.10.0/css/all.css'
	integrity='sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p'
	crossorigin='anonymous' />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js'></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src='js/bootstrap.min.js'></script>

<!-- Custom styles for this template -->
<link href='narrow-jumbotron.css' rel='stylesheet'>

<title>WebKittyPuppy</title>

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
	visibility: hidden;
}

.report {
	color: #f5e172;
	font-size: 4ch;
}

/* 아이콘 설정 */
.icon {
	font-size: 5ch;
	color: #000000;
}

.bi {
	font-size: 40px;
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

a {
	color: #000000;
	text-decoration-line: none;
}

i {
	color: #25aa90;
}

.ls {
	margin: atuo;
	max-width: 442px;
	margin: auto;
}

.lcs {
	font-size: 2ch;
	margin-left: 15px;
	margin-right: 15px;
}

#cursor {
	color: #25aa90;
}

button {
	border: 0cm;
	background-color: #ffffff;
}

.info {
	font-size: 12px;
}

.row {
	align-items: center;
}

.col-sm-6 {
	width: 492px;
}

.col-sm-6>img {
	width: 100%;
}

.img-thumbnail {
	max-width: 70px;
	max-height: 70px;
}

div {
	display: block;
}

.comment {
	display: block;
}

.comment_body {
	hegiht: 300px;
	overflow: auto;
}

/* 화면크기가 1050px이 넘어갔을때 적용되는 css */
@media ( min-width : 1050px) {
	/* 바깥 컨테이너 설정 */
	.container.out {
		max-width: 1200px;
	}
	.img-thumbnail {
		max-width: 100px;
		max-height: 100px;
	}
	.ls {
		max-width: 1000px;
	}
}
</style>

</head>

<body>
	<%
	FeedDAO fdao = new FeedDAO();
	FeedCommentDAO fcdao = new FeedCommentDAO();
	FeedCoCommentDAO fccdao = new FeedCoCommentDAO();

	int feedNo = Integer.parseInt(request.getParameter("feedNo"));
	String nick = request.getParameter("nick");
	FeedDTO feed = fdao.feedSearchByNo(feedNo);
	session.setAttribute("feedNo", feedNo);
	session.setAttribute("nick", nick);
	session.setAttribute("feed", feed);
	%>

	<!--  피드 댓글 창 -->
	<div class='comment' id='comment${feed.feedNo}'>
		<div class='comment_body' align='left'>
			<c:set var='feedNo' value='${feed.feedNo}' scope='session' />
			<%
			ArrayList<FeedCommentDTO> cs = null;
			cs = fcdao.feedCommentShow(feedNo);
			pageContext.setAttribute("cs", cs);
			%>
			<c:forEach var='com' items='${cs}'>
				<div>${fn:replace(com.content,enter,"<br>")}
					${com.nick} ${com.coDate}
					<button type='button' data-bs-toggle="collapse"
						data-bs-target="#coCom${com.fcNo}" aria-expanded="false">
						<i class="bi bi-reply" style='font-size: 15px;'></i>
					</button>
					<c:choose>
						<c:when test="${nick == com.nick}">
							<button onclick=''>
								<i class="bi bi-pen" style='font-size: 15px;'></i>
							</button>
							<button
								onclick='feedComDelete(${feed.feedNo},${com.fcNo},"${nick}","#comCnt${feed.feedNo}","#comment${feed.feedNo}")'>
								<i class="bi bi-trash" style='font-size: 15px;'></i>
							</button>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
				<c:set var='fcNo' value='${com.fcNo}' scope='session' />
				<div class='collapse' id='coCom${com.fcNo}'>
					<%
					ArrayList<FeedCoCommentDTO> ccs = null;
					int fcNo = (int) session.getAttribute("fcNo");
					ccs = fccdao.feedCoCommentShow(fcNo);
					pageContext.setAttribute("ccs", ccs);
					%>
					<c:forEach var='cocom' items='${ccs}'>
						<div style='padding-left: 20px;'>
							↳${fn:replace(cocom.content,enter,"<br>")} ${cocom.nick}
							${cocom.coDate}
							<c:choose>
								<c:when test="${nick == cocom.nick}">
									<button onclick=''>
										<i class="bi bi-pen" style='font-size: 15px;'></i>
									</button>
									<button
										onclick='feedCoComDelete(${feed.feedNo},${cocom.coNo},"${nick}","#comCnt${feed.feedNo}","#comment${feed.feedNo}")'>
										<i class="bi bi-trash" style='font-size: 15px;'></i>
									</button>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
					<!--  대댓글 입력  -->
					<div class='input-group rounded' style='padding-left: 20px'>
						<input id='comtext${com.fcNo}' type='text'
							class='form-control rounded' placeholder='대댓글 입력'
							aria-label='Search' aria-describedby='search-addon'
							style="font-size: 1.5ch;" />
						<button
							onclick='feedCoComCreate(${com.fcNo},${feed.feedNo},"${nick}","#comtext${com.fcNo}","#comCnt${feed.feedNo}","#comment${feed.feedNo}")'>
							<i style="font-size: 2ch;" class="bi bi-send"></i>
						</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--  댓글 입력  -->
		<div>
			<div class='input-group rounded'>
				<input id='text${feed.feedNo}' type='text'
					class='form-control rounded' placeholder='댓글 입력'
					aria-label='Search' aria-describedby='search-addon' />
				<button
					onclick='feedComCreate(${feed.feedNo},"#text${feed.feedNo}","${nick}","#comCnt${feed.feedNo}","#comment${feed.feedNo}"))'>
					<i style="font-size: 3ch;" class="bi bi-send"></i>
				</button>
			</div>
		</div>
	</div>
</body>
</html>
