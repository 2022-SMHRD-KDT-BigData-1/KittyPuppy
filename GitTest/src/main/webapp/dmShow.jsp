<%@page import="com.kittypuppy.model.DMDTO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.DMDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* DMDTO member = (DMDTO) session.getAttribute("member");

DMDAO dao = new DMDAO();
ArrayList<DMDTO> DMlist = null;

if (member != null) { // 로그인한 상태
	DMlist = dao.DMList(member.getSendNick());
 */
}
%>
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
	font-size: 4ch;
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
	width: 400px;
	position: relative;
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
	width: 400px;
	padding: 10px;
	position: relative;
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

.au {
	overflow: auto;
}

.msg_head {
	position: relative;
}

.msg_card_body {
	overflow-y: auto;
}

.card-header {
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
}

.b {
	border: 1px solid gold;
}

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
}

::-webkit-scrollbar {
	width: 5px;
	height: 5px;
}

.sdiv {
	width: 50px;
	height: 70px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}
</style>
</head>
<body>
	<!-- 키티퍼피 로고 -->

	<div class="row mt-5 text-center">
		<div class="mb-4">
			<i class="bi bi-exclamation-octagon-fill hidden"></i>
			<h1 class="text-center">KittyPuppy</h1>
			<a href=""><i class="bi bi-exclamation-octagon-fill report"></i></a>
		</div>
	</div>
	<!-- 프로필 -->
	<div class="container out">
		<div class="row mt-6">
			<div class="row">
				<div class="row m-3"
					style="display: inline-block; vertical-align: top">
					<a href=""> <img
						src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
						class="rounded-circle img-thumbnail img-fluid float-start" /> <strong
						class="sdiv">닉네임</strong>
					</a>
				</div>
			</div>

			<!-- 간격 -->
			<div class="py-3"></div>
			<!-- 말풍선 -->

			<div class="overflow-auto g-2 p-3"
				style="max-height: 500px; max-width: 100%">
				<div class="row sm-2">

					<div class="balloon_03 mb-4">
						Hi, how are you samim?
						<!-- <div class="me-chat-col"></div> -->
					</div>

					<div class="d-flex justify-content-end mb-4">
						<div class="balloon_04">Hi Khalid i am good tnx how about
							you?</div>
					</div>

					<div class="d-flex justify-content-start mb-4">
						<div class="balloon_03">I am good too, thank you for your
							chat template</div>
					</div>

					<div class="d-flex justify-content-end mb-4">
						<div class="balloon_04">You are welcome</div>
					</div>

					<div class="d-flex justify-content-end mb-4">
						<div class="balloon_04">You are welcome</div>
					</div>

					<div class="d-flex justify-content-start mb-4">
						<div class="balloon_03">I am looking for your next templates</div>
					</div>

					<div class="d-flex justify-content-end mb-4">
						<div class="balloon_04">Ok, thank you have a good day</div>
					</div>

					<div class="d-flex justify-content-start mb-4">
						<div class="balloon_03">Bye, see you</div>
					</div>
				</div>
			</div>
			<!-- 보내기 -->
			<div class="row mt-3 text-center">
				<div class="input-group mb-3">

					닉<input type="text" class="form-control" id="nick"
						autocomplete="off" /> 받는닉<input type="text"
						class="form-control col-4" id="sNick" autocomplete="off" /> <input
						type="text" class="form-control" id="m" autocomplete="off" />
					<div class="input-group-append">
						<button id="msg-send" class="btn btn-primary"
							placeholder="message" style="background-color: #25aa90">
							보내기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="jquery-3.6.0.min.js"></script>

	<script>
		/* $(document).ready(function(){
		    function dm(){
		        let nick = $('#nick').val();
		        let sNick=$('#sNick').val();
		        let m=$('#m').val();

		        $.ajax({
		            url:'DMSendCon.do',
		            type:'get',
		            dataType: 'json',
		            data: {sendnick:nick, receivenick:sNick, content: m},
		            success:function(data){
		                console.log(data.sql);
		                alert("성공");
		            },
		            error:function(){
		                alert ("실패");
		            }
		        })

		    }

		    $('#msg-send').click(function(){
		        dm();
		    });


		});

		 */

		$('#msg-send').on('click', function() {
			alert('저장성공')
			$.ajax({
				url : 'DMSendCon.do', // 서버에 전달할 파일명
				type : 'get',
				data : {
					sendNick : $('#nick').val(), // 전송할 파라미터 1
					receiveNick : $('#sNick').val(), // 전송할 파라미터 1
					content : $('#m').val()
				// 전송할 파라미터 2
				},
				success : function() {

					console.log('저장성공'); // 성공시 코드
				},
				error : function() {
					alert("저장실패");
				}
			});
		});
	</script>
</body>
</html>
