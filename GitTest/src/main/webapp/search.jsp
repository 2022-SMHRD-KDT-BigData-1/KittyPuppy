<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page errorPage="login.jsp"%> --%>
<%@ page import='java.util.ArrayList' import='com.kittypuppy.model.*'%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

<title>WebKittyPuppy</title>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<style>
html, body {
	height: 100%;
}

body {
	background-color: #ffffff;
	display: flex;
	padding: 10px;
}

a {
	color: #000000;
	text-decoration-line: none;
}

.ls {
	margin: atuo;
	max-width: 442px;
	margin: auto;
}

i {
	color: #25aa90;
}

.hash {
	font-size: 5ch;
	color: #000000;
}

.container {
	width: 100%;
	max-width: 492px;
	padding: 15px;
	margin: auto;
	display: block;
}

.btn {
	background-color: #25aa90;
	color: white
}

.row {
	align-items: center;
}

.img-thumbnail {
	max-width: 60px;
	max-height: 60px;
}

@media ( min-width : 1050px) {
	.container {
		max-width: 1200px;
	}
	.ls {
		max-width: 700px;
	}
}

.bi-chevron-left {
	font-size: 3ch;
}

div {
	display: block;
}

#search-addon {
	background-color: white;
}
</style>
</head>
<body>
	<%
		MemberDAO dao = new MemberDAO();
	%>
	<div class="container ls d-grid gap-3">

		<!-- 검색창 -->
		<form action='FeedSearchCon.do' method='post'>
			<div class="input-group rounded">
				<a href='feed.jsp' class="input-group-text border-0"
					id="search-addon"><i class="bi bi-chevron-left"></i></a> <input
					name='search' type="search" class="form-control rounded"
					style="margin-right: 5px;" placeholder="닉네임 또는 태그 검색"
					aria-label="Search" aria-describedby="search-addon" /> <label
					class="btn btn-default input-group-text border-0" id="search-addon"
					style="font-size: 30px; padding: 0px; margin: 5px"> <i
					class="fas fa-search"> <input type="submit" hidden></i>
				</label>
			</div>
		</form>
		<!--  검색 결과 -->
		<div class="row mt-3">
			<c:choose>
				<c:when test = '${searchType == "nick"}'>
					<!-- 닉네임 검색 결과-->
					<!--  SRNick : search result nick -->
					<c:choose>
						<c:when test ='${empty searchList}'>
							<p>검색 결과가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<p>${search}에 대한 검색결과</p>
							<c:forEach var = 'SRNick' items='${searchList}'>
								<c:set var = 'SRNick' value='${SRNick}' scope = 'request'/>
								<%
									String SRNick = (String)request.getAttribute("SRNick");
									MemberDTO SRMember = dao.memberInfo(SRNick);
									pageContext.setAttribute("SRMember", SRMember);
								%>
								<a href='otherpage.jsp?nick=${SRNick}'>
									<div>
										<c:choose>
											<c:when test='${empty SRMember.picAddress}'>
												<img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start">
											</c:when>
											<c:otherwise>
												<img src="${SRMember.picAddress}" class="rounded-circle img-thumbnail img-fluid float-start">
											</c:otherwise>
										</c:choose>	
										<br> <strong>  ${SRNick}</strong>
									</div>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</c:when>
				<c:otherwise>
					<!-- 태그 검색 결과-->
					<!--  SRTag : search result tag -->
					<c:choose>
						<c:when test ='${empty searchList}'>
							<p>검색 결과가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<p>${search}에 대한 검색결과</p>
							<c:forEach var = 'SRTag' items='${searchList}'>
							<c:set var = 'SRTag' value = '${SRTag}' scope='request'/>
							<c:set var = 'SRTagChange' value='${fn:replace(SRTag,"#","놷갼셧뱗")}' scope = 'request'/>
							<c:set var = 'SRTagChange' value='${fn:replace(SRTagChange," ","럃귤꾤꺖")}' scope = 'request'/>
								<a href='searchResult.jsp?tag=${SRTagChange}'>
									<div>
										<i class="hash bi bi-hash"></i> <strong> ${SRTag}</strong>
									</div>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</c:otherwise>
			</c:choose>
		</div>

	</div>

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
</body>
</html>