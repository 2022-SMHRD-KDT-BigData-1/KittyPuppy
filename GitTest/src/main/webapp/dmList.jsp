<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.DMDTO"%>
<%@page import="com.kittypuppy.model.DMDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>KittyPuppy</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://bootsnipp.com/dist/bootsnipp.min.css"
	crossorigin="anonymouse" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- Custom styles for this template -->
<link href="narrow-jumbotron.css" rel="stylesheet" />


<style>
body {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
/* 로고 글꼴, 색상 설정 */
h1 {
	font-family: "Dancing Script", cursive;
	font-size: 35px;
	color: #25aa90;
	display: inline;
}

a {
	color: #000000;
	text-decoration-line: none;
}

/* 레이아웃 잡아주는 class 이름 */
.ls {
	margin: 0 auto;
	width: 360px;
	min-width: 360px;
}
/* 상단 로고 고정 */
.header-logo {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	padding-bottom: 0px;
	text-align: center;
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

/* 상단 메뉴바 고정 */
.header-menu {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	position: fixed;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 5rem;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
}

.icon {
	font-size: 4ch;
	color: #25aa8f7e;
}

#cursor {
	color: #25aa90;
}

button {
	border: 0cm;
	background-color: #ffffff;
}
/* dm list 컨테이너 */
.container.out {
	height:480px;
	padding: 10.5rem 10px 10px 10px;
	margin: auto;
	display: block;
	overflow-y: scroll
}

.chat_img {
	float: left;
	width: 70px;
	height: 70px;
	]
}

.chat_ib {
	padding-left: 80px;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto;
}

.container.out::-webkit-scrollbar {
	width: 5px;
	height: 5px;
}

/* /* .b {
	border: 1px solid gold;
}
 */

@media ( min-width : 600px) {
	.ls {
		width: 600px;
		min-width: 600px;
		max-width: 600px;
	}
	.header-menu {
		justify-content: space-evenly;
	}
}
</style>
</head>
<body>
	<%
	DMDAO dao = new DMDAO();
	MemberDAO mdao = new MemberDAO();
	/* ArrayList<DMDTO> DMlist = null; */
	String receivenick = request.getParameter("receivenick");
	MemberDTO member = (MemberDTO) session.getAttribute("member");

	String sendnick = member.getNick();
	ArrayList<String> list = dao.DMList(sendnick);

	int DMlist = 0;
	DMlist = dao.DMDeleteAll(sendnick, receivenick);

	pageContext.setAttribute("DMlist", DMlist);

	pageContext.setAttribute("receivenick", receivenick);
	pageContext.setAttribute("sendnick", sendnick);
	pageContext.setAttribute("list", list);
	%>

	<!-- 키티퍼피 로고 -->
	<div class="header-logo ls">
		<i class="bi bi-exclamation-octagon-fill hidden"></i>
		<h1 class="text-center">KittyPuppy</h1>
		<a href="lostAniReport.html"> <i
			class="bi bi-exclamation-octagon-fill report"></i></a>
	</div>

	<!-- 상단 고정된 메뉴바 -->
	<div class='header-menu ls'>
		<a href='feed.jsp'><i class='bi bi-phone icon'></i></a> <a
			href='lostAniBoard.jsp'><i class='bi bi-megaphone icon'></i></a> <a
			href='maps.jsp'><i class='bi bi-geo-alt icon'></i></a> <a
			href='mypage.jsp'><i class='bi bi-person icon'></i></a> <a
			href='dmList.jsp'><i id='cursor'
			class=' bi bi-chat-dots-fill icon'></i></a>
	</div>

	<!-- DM 리스트 -->
	<div class="container out dm-list ls">
		<%
		for (int i = 0; i < list.size(); i++) {
			String dmNick = (String) request.getAttribute(list.get(i));
			MemberDTO dm = mdao.memberInfo(list.get(i));
			pageContext.setAttribute("dm", dm);
		%>
		<div class="chat<%=i%>">
			<div class="chat_img">
				<%
				if (dm.getPicAddress() == null) {
				%>
				<a href="dmShow.jsp?receivenick=<%=list.get(i)%>"> <img
					src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
					alt="sunil" class="rounded-circle img-thumbnail float-start" />
				</a>
				<%
				} else {
				%>
				<a href="dmShow.jsp?receivenick=<%=list.get(i)%>"> <img
					src="<%=dm.getPicAddress()%>" alt="sunil"
					class="rounded-circle img-thumbnail float-start" />
				</a>
				<%
				}
				%>
			</div>
			<div class="chat_ib people mb-3">
				<a href="dmShow.jsp?receivenick=<%=list.get(i)%>"><%=list.get(i)%></a><br />
				<%
				out.print("<p>" + dao.latestDM(sendnick, list.get(i)).getContent() + "</p>");
				%>
				<p>
					<%=dao.latestDM(sendnick, list.get(i)).getSendDate()%>
					<button onclick="DMDeleteAll('<%=sendnick%>','<%=list.get(i)%>')">
						<i class="bi bi-trash icon" style='font-size: 15px;'></i>
					</button>
				</p>
			</div>
		</div>
		<hr>
		<%
		}
		%>
	</div>
</body>

<script>
	function DMDeleteAll(sendnick, receivenick) {

		$.ajax({
			url : "DMDeleteAllCon.do",
			type : "post",
			data : {
				sendnick : sendnick,
				receivenick : receivenick
			},
			dataType : 'json',
			success : function(cnt) {
				location.reload();
				console.log('성공')
			},
			error : function() {
				console.log('err');
			}
		});
	};
</script>


</html>
