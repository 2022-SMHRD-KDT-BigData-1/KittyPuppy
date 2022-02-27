<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="com.kittypuppy.model.DMDTO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

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
html, body {
	height: 100%;
}

body {
	background-color: #ffffff;
	padding: 10px;
}

/* 로고 글꼴, 색상 설정 */
h1 {
	font-family: "Dancing Script", cursive;
	font-size: 35px;
	color: #25aa90;
	display: inline;
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

.hidden {
	color: #f5e172;
	font-size: 4ch;
	/* margin-left: 15px; */
	margin-right: 100px;
	visibility: hidden;
}

.report {
	color: #f5e172;
	font-size: 4ch;
	/* float: right; */
	/* margin-right: 15px; */
	margin-left: 100px;
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
}

/* 상단 로고 고정 */
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
}

.icon {
	margin-left: 15px;
	margin-right: 15px;
}

/* 탭을 클릭했을 때 */
.nav-link.active {
	background-color: #25aa90 !important;
	padding-left: 13px;
	padding-right: 13px;
	padding-top: 7px;
	padding-bottom: 7px;
}

.balloon_03 {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 10px;
	background-color: #ededed;
	padding: 10px;
	max-width: 80%;
	position: relative;
	word-break: break-all;
}
/* .balloon_03 {
        float: left;
        position: relative;
        margin: 50px;
        width: 400px;
        height: 100px;
        background: #ededed;
        border-radius: 10px;
      } */
.balloon_03:after {
	border-top: 15px solid #ededed;
	border-left: 15px solid transparent;
	border-right: 0px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 10px;
	left: -15px;
}

.balloon_04 {
	float: right;
	margin-top: auto;
	margin-bottom: auto;
	margin-right: 10px;
	border-radius: 10px;
	background-color: #25aa90;
	max-width: 80%;
	padding: 10px;
	position: relative;
	word-break: break-all;
}

/* .balloon_04 {
        padding: 10px;
        float: right;
        align-items: right;
        position: relative;
        margin: 50px;
        width: 400px;
        height: 100px;
        background: #25aa90;
        border-radius: 10px;
      } */
.balloon_04:after {
	border-top: 15px solid #25aa90;
	border-left: 0px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 10px;
	right: -15px;
}

/* .au {
	overflow: auto;
} */

/* .msg_head {
	position: relative;
}

.msg_card_body {
	overflow-y: auto; */
}

/* .card-header {
	border-radius: 15px 15px 0 0 !important;
	border-bottom: 0 !important;
}

.card-footer {
	border-radius: 0 0 15px 15px !important;
	border-top: 0 !important;
}

.img-thumbnail {
	max-width: 70px;
	max-height: 70px;
} */


/* 
.box1 {
	flex: 1;
	width: 30%;
	box-sizing: border-box;
}

.box2 {
	flex: 1;
	margin: 0px 5%;
	width: 30%;
	box-sizing: border-box;
} */

/* ::-webkit-scrollbar {
	width: 5px;
	height: 5px;
} */

/* .sdiv {
	width: 50px;
	height: 70px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.Vmore {
	width: 10px;
	margin-top: 7px
}

a {
	text-decoration-line: none;
	color: #000000;
}

img {
	height: 70px;
	width: 70px;
} */
 
</style>
</head>
<body>
	<%
	DMDAO dao = new DMDAO();
	ArrayList<DMDTO> DMlist = null;
	String receivenick = request.getParameter("receivenick");
	String sendnick = request.getParameter("sendnick");
	int num1 = Integer.parseInt(request.getParameter("num1"));	

	
	DMlist = dao.DMShow10(sendnick, receivenick,num1,num1+9);
	
	MemberDAO mdao = new MemberDAO();
	ArrayList<String> list = dao.DMList(sendnick);

	pageContext.setAttribute("receivenick", receivenick);
	pageContext.setAttribute("sendnick", sendnick);

	pageContext.setAttribute("DMlist", DMlist);

	System.out.print(receivenick);
	%>
<div class="container2">
			<%
			for (int i = DMlist.size()-1; i >= 0 ; i--) {
			%>
			<%
			if (DMlist.get(i).getSendNick().equals(sendnick)) {
			%>
			<div class="lcoco-content-box ">

				<div class="d-flex justify-content-end me-3 mb-4 sksk ">
					<!-- 삭제 -->
					<table class = "tb">
						<tr>
							<td style="vertical-align: bottom;">
								<button onclick=" DMDelete(<%=DMlist.get(i).getDmNo()%>)"
									style="border: none; background-color:#e8fcf87e;">
									<i class="bi bi-trash" style='font-size: 15px;'></i>
								</button>
							</td>
						</tr>
					</table>
					<!--send말풍선 -->
					<div id="sdm(<%=DMlist.get(i).getDmNo()%>)" class="balloon_04  ">
						<%=DMlist.get(i).getContent()%>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="d-flex justify-content-start ms-3 mb-4">
				<!-- receivenick말풍선 -->
				<div id="rdm(<%=DMlist.get(i).getDmNo()%>)" class="balloon_03 ">
					<%=DMlist.get(i).getContent()%>
				</div>

			</div>
			<%
			}
			%>
			<%
			}
			%>
			</div>


</body>
</html>
