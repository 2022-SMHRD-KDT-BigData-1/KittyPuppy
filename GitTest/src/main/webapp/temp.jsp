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

<!-- feed.css -->
<link href='./assets/css/feed.css' rel='stylesheet'>

</head>

<body>
	<%
	FeedDAO fdao = new FeedDAO();
	FeedCommentDAO fcdao = new FeedCommentDAO();
	FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
	MemberDAO dao = new MemberDAO();
	
	int feedNo = Integer.parseInt(request.getParameter("feedNo"));
	String nick = request.getParameter("nick");
	FeedDTO feed = fdao.feedSearchByNo(feedNo);
	session.setAttribute("feedNo", feedNo);
	session.setAttribute("nick", nick);
	session.setAttribute("feed", feed);
	
	// 개행 처리
	pageContext.setAttribute("enter","\r\n");
	%>

	<!--  피드 댓글 창 -->
	<div class='comment' id='tempComment'>
		<div class='comment_body' align='left'>
			<c:set var='feedNo' value='${feed.feedNo}' scope='session' />
			<%
			ArrayList<FeedCommentDTO> cs = null;
			cs = fcdao.feedCommentShow(feedNo);
			pageContext.setAttribute("cs", cs);
			%>
			<c:forEach var='com' items='${cs}'>
			<c:set var = 'comNick' value = '${com.nick}' scope = 'request'/>
				<!-- 댓글 -->
				<div>
					<%
					String comNick = (String) request.getAttribute("comNick");
					MemberDTO cm = dao.memberInfo(comNick);
					pageContext.setAttribute("cm", cm);
					%>
					<table>
						<tr>
							<td rowspan=3 style = "text-align:center; vertical-align :top;">
								<a href = "otherpage.jsp?nick=${com.nick}">
									<c:choose>
										<c:when test="${empty cm.picAddress}">
											<img
												src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png'
												style = "width:40px; height:40px;"
												class='rounded-circle img-tn float-start'>
										</c:when>
										<c:otherwise>
											<img src='${cm.picAddress}'
												style = "width:40px; height:40px;"
												class='rounded-circle img-tn float-start'>
										</c:otherwise>
									</c:choose>
								</a>
							</td>
							<td>
								<a href = "otherpage.jsp?nick=${com.nick}">
									<strong> ${com.nick}</strong>
								</a>
								<button type='button' data-bs-toggle="collapse" style = "background-color:#ffffff; outline:0; border:0px;"
									data-bs-target="#coCom${com.fcNo}" aria-expanded="false">
									<i class="bi bi-reply" style='font-size: 15px;'></i>
								</button> <c:choose>
									<c:when test="${nick == com.nick}">
										<button onclick='' style = "background-color:#ffffff; outline:0; border:0px;">
											<i class="bi bi-pen" style='font-size: 15px;'></i>
										</button>
										<button style = "background-color:#ffffff; outline:0; border:0px;"
											onclick='feedComDelete(${feed.feedNo},${com.fcNo},"${nick}","#comCnt${feed.feedNo}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'>
											<i class="bi bi-trash" style='font-size: 15px;'></i>
										</button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								${fn:replace(com.content,enter,"<br>")}
							</td>
						</tr>
						<tr>
							<td>
								작성일 : ${fn:substring(com.coDate,0,10)}
							</td>
						</tr>
					</table>
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
						<c:set var = 'ccmNick' value = '${cocom.nick}' scope = 'request'/>
						<!-- 대댓글 -->
						<%
							String ccmNick = (String) request.getAttribute("ccmNick");
							MemberDTO ccm = dao.memberInfo(ccmNick);
							pageContext.setAttribute("ccm", ccm);
						%>
					<div style = "padding-left:40px">
						<table>
							<tr>
								<td rowspan=3 style = "text-align:center; vertical-align :top;">
									<a href = "otherpage.jsp?nick=${cocom.nick}">
										<c:choose>
											<c:when test="${empty ccm.picAddress}">
												<img
													src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png'
													style = "width:40px; height:40px;"
													class='rounded-circle img-tn float-start'>
											</c:when>
											<c:otherwise>
												<img src='${ccm.picAddress}'
													style = "width:40px; height:40px;"
													class='rounded-circle img-tn float-start'>
											</c:otherwise>
										</c:choose>
									</a>
								</td>
								<td>
									<a href = "otherpage.jsp?nick=${cocom.nick}">
										<strong> ${cocom.nick}</strong>
									</a>
									<c:choose>
										<c:when test="${nick == cocom.nick}">
											<button onclick='' style = "background-color:#ffffff; outline:0; border:0px;">
												<i class="bi bi-pen" style='font-size: 15px;'></i>
											</button>
											<button style = "background-color:#ffffff; outline:0; border:0px;"
												onclick='feedCoComDelete(${feed.feedNo},${cocom.coNo},"${nick}","#comCnt${feed.feedNo}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'>
												<i class="bi bi-trash" style='font-size: 15px;'></i>
											</button>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>
									${fn:replace(cocom.content,enter,"<br>")}
								</td>
							</tr>
							<tr>
								<td>
									작성일 : ${fn:substring(cocom.coDate,0,10)}
								</td>
							</tr>
						</table>
					</div>
					</c:forEach>
					<!--  대댓글 입력  -->
					<div class='input-group rounded' style='padding-left: 82px'>
						<input id='comtext${com.fcNo}' type='text'
							class='form-control rounded' placeholder='대댓글 입력'
							aria-label='Search' aria-describedby='search-addon'
							style="font-size: 1.5ch;" />
						<button style = "background-color:#ffffff; outline:0; border:0px;"
							onclick='feedCoComCreate(${com.fcNo},${feed.feedNo},"${nick}","#comtext${com.fcNo}","#comCnt${feed.feedNo}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'>
							<i style="font-size: 2ch;" class="bi bi-send"></i>
						</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--  댓글 입력  -->
		<div>
			<div class='input-group rounded'>
			<input id = 'text${feed.feedNo}' type='text' class='form-control rounded' placeholder='댓글 입력' aria-label='Search' aria-describedby='search-addon' />
			<button style = "background-color:#ffffff; outline:0; border:0px;" onclick = 'feedComCreate(${feed.feedNo},"${nick}","#text${feed.feedNo}","#comCnt${feed.feedNo}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'><i style = "font-size: 3ch;" class="bi bi-send"></i></button>
			</div>
		</div>
	</div>
</body>
</html>
