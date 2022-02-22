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
<title>Document</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />

<title>KittyPuppy</title>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet" />

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

/* 로고 글꼴, 색상 설정 */
h1 {
	font-family: "Dancing Script", cursive;
	font-size: 35px;
	color: #25aa90;
	display: inline;
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
/* .header-logo {
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
} */

a {
	color: #000000;
	text-decoration-line: none;
}

/* i {
	color: #25aa90;
} */

/* .bi {
	font-size: 40px;
} */

.ls {
	margin: atuo;
	max-width: 442px;
	margin: auto;
}

/* .lcs {
	font-size: 2ch;
	margin-left: 15px;
	margin-right: 15px;
} */

#cursor {
	color: #25aa90;
}

 button {
	border: 0cm;
	background-color: #ffffff;
} 

/* 상단 로고 고정 */
/* .header-logo {
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
} */

/* 상단 메뉴바 고정 */
/* .header-menu {
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
} */

/* 아이콘 설정 */
.icon {
	font-size: 4ch;
	color: #25aa90;
}

/* 탭을 클릭했을 때 */
/* .nav-link.active {
	background-color: #25aa90 !important;
	padding-left: 13px;
	padding-right: 13px;
	padding-top: 7px;
	padding-bottom: 7px;
} */

/* 탭에 마우스를 올렸을 때 */
/* .nav-link {
	color: white;
	background-color: #25aa8f7e !important;
	padding-left: 13px;
	padding-right: 13px;
	padding-top: 7px;
	padding-bottom: 7px;
} */

/* .nav-link:hover {
	color: white !important;
} */

/* .btn:hover {
	color: white !important; 
}.btn {
	background-color: #25aa90;
	color: white;
	/* width:190px;
            height: 38px;
            padding-left:13px;
            padding-right: 13px;
            padding-top: 7px;
            padding-bottom: 7px;
            border: 0px; 
}
*/



/* .btn.update, .btn.write {
	width: 215px;
}
 */
/* button{
            align-items: stretch !important;
        } */
/* .row {
	align-items: center;
} */

/* .balloon_03 {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 10px;
	background-color: #ededed;
	padding: 10px;
	width: 400px;
	position: relative;
}
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
	width: 400px;
	padding: 10px;
	position: relative;
}
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
 */
/* .au {
	overflow: auto;
} */

/* .msg_head {
	position: relative;
}
 */
/* .msg_card_body {
	overflow-y: auto;
} */

/* .card-header {
	border-radius: 15px 15px 0 0 !important;
	border-bottom: 0 !important;
}
 */
/* .card-footer {
	border-radius: 0 0 15px 15px !important;
	border-top: 0 !important;
}
 */
/* .img-thumbnail {
	max-width: 70px;
	max-height: 70px;
}
 */
.b {
	border: 1px solid gold;
}

/* .box1 {
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

::-webkit-scrollbar {
	width: 5px;
	height: 5px;
}

/* .sdiv {
	width: 50px;
	height: 70px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
} */
/* css */
.container {
	max-width: 1160px;
	margin: auto;
}


/* .inbox_people {
	background: #f8f8f8 none repeat scroll 0 0;
	float: left;
	overflow: hidden;
	width: 40%;
	border-right: 1px solid #c4c4c4;
} */

/* .inbox_msg {
	clear: both;
	overflow: hidden;
} */

/* .top_spac {
	margin: 20px 0 0;
}

.recent_heading {
	float: left;
	width: 40%;
}

.srch_bar {
	display: inline-block;
	text-align: right;
	width: 60%;
} */

/* .headind_srch {
	padding: 10px 29px 10px 20px;
	overflow: hidden;
	border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
	color: #05728f;
	font-size: 21px;
	margin: auto;
}

.srch_bar input {
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 2px 0 4px 6px;
	background: none;
}
 */
/* .srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
} */

 .chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto;
}
.chat_img {
	float: left;
	width: 7%;
}

.chat_ib {
	float: left;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
}

/* .chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
}
 */
.inbox_chat {
	height: 550px;
	overflow-y: scroll;
}

/* .incoming_msg_img {
	display: inline-block;
	width: 6%;
}
 */
/* .received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
} */

/* .received_withd_msg p {
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 5px 10px 5px 12px;
	width: 100%;
} */

/* .time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}
 */
/* .received_withd_msg {
	width: 57%;
} */

/* .mesgs {
	float: left;
	padding: 30px 15px 0 25px;
	width: 60%;
}
 */
/* .sent_msg p {
	background: #05728f none repeat scroll 0 0;
	border-radius: 3px;
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 5px 10px 5px 12px;
	width: 100%;
}
 */
/* .outgoing_msg {
	overflow: hidden;
	margin: 26px 0 26px;
} */

/* .sent_msg {
	float: right;
	width: 46%;
} */

/* .input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
} */

/* .type_msg {
	border-top: 1px solid #c4c4c4;
	position: relative;
}
 */
/* .msg_send_btn {
	background: #05728f none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
} */

/* .messaging {
	padding: 0 0 50px 0;
} */

/* .msg_history {
	height: 516px;
	overflow-y: auto;
}
 */

img{
height: 70px;
width: 70px;

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
	<div class="container out ">
		<div class="row mt-2 text-center">
			<div class="mb-4">
				<i class="bi bi-exclamation-octagon-fill hidden"></i>
				<h1 class="text-center">KittyPuppy</h1>
				<a href="lostAniReport.html"><i class="bi bi-exclamation-octagon-fill report"></i></a>
			</div>
		</div>
		<!-- 상단 고정된 메뉴바 -->

		<div class='ls navbar text-center banner header-menu'>
			<a href='feed.jsp'><i class='bi bi-phone icon'></i></a> <a
				href='lostAniBoard.jsp'><i class='bi bi-megaphone icon' ></i></a> <a
				href='maps.jsp'><i class='bi bi-geo-alt icon'></i></a> <a
				href='mypage.jsp'><i class='bi bi-person icon'></i></a> <a
				href='dmList.jsp'><i id='cursor' class=' bi bi-chat-dots-fill icon'></i></a>
		</div>

	</div>

	<!-- 리스트 -->
	<div class="container out ">
					<% for (int i = 0; i < list.size(); i++) {
						String fnick = (String) request.getAttribute("fnick");
	                	MemberDTO fm = mdao.memberInfo(fnick);
	                	pageContext.setAttribute("fm", fm);
					%>
					
					<a href="dmShow.jsp?receivenick=<%=list.get(i)%>">
						<div class=" chat_people ">
							<%if (mdao.memberInfo(list.get(i)).getPicAddress() == null) {%>
							<div class="chat_img ">
								<img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" alt="sunil" class = "rounded-circle img-thumbnail img-fluid float-start"/>
							</div>
							<%} else {%>
							<div class="chat_img ">
								<img src="<%=mdao.memberInfo(list.get(i)).getPicAddress()%>" alt="sunil" class = "rounded-circle "/>
							</div>
							<%}%>

							<div class="chat_ib people mb-3">
								<%
								out.print(list.get(i));
								out.print("<p>" + dao.latestDM(sendnick, list.get(i)).getContent() + "</p>"); %>
								<p> <%=dao.latestDM(sendnick, list.get(i)).getSendDate()%>  
								<button onclick="DMDeleteAll('<%=sendnick%>','<%=list.get(i)%>')">
                           <i class="bi bi-trash icon" style='font-size: 15px;'></i>
						</button>
								</p>
							</div>
					</a>
					
				</div>

				<%}%>

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
