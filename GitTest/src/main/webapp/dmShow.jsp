<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="com.kittypuppy.model.DMDTO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.DMDAO"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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
html, body {
	height: 100%;
}

body {
	font-family: 'IBM Plex Sans KR', sans-serif;
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
	font-size: 40px;
	/* margin-left: 15px; */
	margin-right: 100px;
	visibility: hidden;
}

.report {
	color: #f5e172;
	font-size: 40px;
}

/* 상단 로고 고정 */
.header-logo {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	position: fixed;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 0;
	height: 5rem;
	background-color: white;
	padding-top: 15px;
	padding-bottom: 0px;
	width: 360px;
	min-width: 360px;
	max-width: 360px;
	text-align: center;
	z-index: 3;
}

.profile-thumnail {
	display: inline-block;
	vertical-align: top;
	margin-top: 30px;
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

/* .b {
	border: 1px solid gold;
} */
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

.container1 {
	overflow-y: scroll;
	max-height: 500px;
	max-width: 100%;
	overflow-x: hidden
}
.container1::-webkit-scrollbar{ display:none; }

.sdiv {
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
}

@media ( min-width : 800px) {
	.header-logo {
		max-width: 800px;
	}
}
</style>
</head>
<body>
	<%
	DMDAO dao = new DMDAO();
	ArrayList<DMDTO> DMlist = null;
	String receivenick = request.getParameter("receivenick");
	MemberDTO member = (MemberDTO) session.getAttribute("member");

	String sendnick = member.getNick();

	DMlist = dao.DMShow10(sendnick, receivenick, 1, 10);
	MemberDAO mdao = new MemberDAO();
	ArrayList<String> list = dao.DMList(sendnick);

	pageContext.setAttribute("receivenick", receivenick);
	pageContext.setAttribute("sendnick", sendnick);

	pageContext.setAttribute("DMlist", DMlist);

	System.out.print(receivenick);
	%>

	<!-- 키티퍼피 로고 -->
	<div class="row mt-5 text-center">
		<div class="mb-4 header-logo">
			<a href="dmList.jsp"><i class="bi bi-chevron-left"></i></a>
			<h1 class="text-center">KittyPuppy</h1>
			<a href="lostAniReport.html"><i
				class="bi bi-exclamation-octagon-fill report"></i></a>
		</div>
	</div>

	<!-- 프로필 -->
	<div class="container out a">
		<div class="row profile-thumnail " style="">
			<!-- 프로필 사진 -->
			<a href="otherpage.jsp?nick=${receivenick}"> <%
 if (mdao.memberInfo(receivenick).getPicAddress() == null) {
 %> <img
				src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
				class="rounded-circle img-thumbnail img-fluid float-start" /> <%
 } else {
 %> <img src="<%=mdao.memberInfo(receivenick).getPicAddress()%>"
				class="rounded-circle img-thumbnail img-fluid float-start" /> <%
 }
 %> <strong class="sdiv" style="decorate: none"> ${receivenick}
			</strong>
			</a>
		</div>

		<!-- 말풍선 -->

		<div class="container1" style="height: 500px; width: 100%">
			<%
			for (int i = DMlist.size() - 1; i >= 0; i--) {
			%>
			<%
			if (DMlist.get(i).getSendNick().equals(sendnick)) {
			%>
			<div class="lcoco-content-box ">

				<div class="d-flex justify-content-end mb-4 sksk ">
					<!-- 삭제 -->
					<table class="tb">
						<tr>
							<td style="vertical-align: bottom;">
								<button onclick=" DMDelete(<%=DMlist.get(i).getDmNo()%>)"
									style="border: none; background-color: white;">
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
			<div class="d-flex justify-content-start mb-4">
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


		<!-- 보내기 -->



		<div class="row mt-3 text-center ">
			<div class="input-group mb-3">

				<input type="text" class="form-control" id="m" autocomplete="off" />
				<div class="input-group-append">
					<button id="msg-send" class="btn btn" placeholder="message">
						<i style="font-size: 3ch;" class="bi bi-send"></i>
					</button>
				</div>
			</div>
		</div>

	</div>


	<script src="jquery-3.6.0.min.js"></script>

	<script>
	/* 삭제 */
				function DMDelete(dmNo) {

					$.ajax({
						url : "DMDeleteCon.do",
						type : "post",
						data : {
							dmNo : dmNo
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
	
				/* 보내기 */
				 $(document).ready(function() {
			            $("#m").keydown(function(key) {
			                if (key.keyCode == 13) {
			              $("#msg-send").click();
			                }
			            });
				 
				 $('#msg-send').on('click', function() {
						$.ajax({
							url : 'DMSendCon.do', // 서버에 전달할 파일명
							type : 'post',
							data : {
								sendNick : '${sendnick}', // 전송할 파라미터 1
								receiveNick : '${receivenick}', // 전송할 파라미터 1
								content : $('#m').val()
							},
							success : function() {
								
								location.reload();
								
								console.log('저장성공'); // 성공시 코드
							},
							error : function() {
								alert("저장실패");
							}
						});
					}); 
				 
			     });
				/* 스크롤 밑으로 내리기 */
				 $(document).ready(function() {
				 const $messageTextBox = $('.container1');
					$messageTextBox.scrollTop($messageTextBox[0].scrollHeight);
				   });
				 
				 
				 /* 스크롤 */
			 	/* var isLoading = false;
				function loadNewPage() {
  					var temp = $(document).height();
    				$(".container").prepend($(".sksk"));
    				$(document).scrollTop($(document).height()-temp);
   				 	isLoading = false;
				}
						$(document).scroll(function() {
  						if($(document).scrollTop() < 60 && !isLoading) {
   	 					isLoading = true;
    					setTimeout(loadNewPage, 1200);
 				 }
				});
						console.log("아아아아아아앙아아");		
						$(document).scrollTop($(document).height());  */
					
					/* 스크롤 2 */			
					var num1 = 1;
						var num = 138;
						var nick1 = "<c:out value= '${sendnick}'/>";	
						var nick2 = "<c:out value= '${receivenick}'/>";	
					$(".container1").scroll(function() {
						 console.log($(".container1").scrollTop())
						/*  console.log($(window).height())
						console.log($(".container").height())   */
														/* 수직위치 */
						if(Math.round($(this).scrollTop()) == 0){
							$.ajax({
								url: "DMCountCon.do",
								type: "post",
								data: {sendnick:nick1,
										receivenick: nick2 },
								dataType: 'json',
								success: function(result) {
									console.log("numtest")
									num1 += 10;
									if(result >= num1){
										console.log(num1);
										$(".container1 ").prepend("<div id ='load"+num1+"''>" + "</div>");
										$("#load"+num1).load("dmShowSub.jsp .container2",{sendnick:nick1, receivenick: nick2,num1:num1});
										
									}
								},
								error : function(){
									console.log('err');
								}
							});
						}
					});	
					
					/* null 처리 */
				/* 	unction formSubmit() {
					 if(document.getElementById("#m").value == "" ) {
  					alert('내용을 작성해 주세요');
 					 return;
 					}
 					document.f1.submit();
						} */
	</script>

</body>
</html>
