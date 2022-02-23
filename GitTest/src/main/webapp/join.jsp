<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<title>KittyPuppy_Join</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@800&display=swap"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<style>
body {
	background-color: #ffffff;
	font-size: 10px;
	color: #25aa90;
	display: flex;
}

span {
	display: none;
}

.container {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	/* display: block; */
}

.container p {
	text-align: right;
	font-size: 15px;
}

.container h1 {
	text-align: center;
	font-size: 50px;
	font-family: 'Dancing Script', cursive;
	font-weight: 900;
}

.btn {
	background-color: #25aa90;
	color: #fff;
}

html, body {
	height: 100%;
}
</style>





</head>

<body>



	<div class="container">
		<form action="MJoinCon.do" method="post">

			<div class="row">


				<div class="d-grid gap-2 col-12 mx-auto">

					<h1>KittyPuppy</h1>
					<input type="email" id="id" class="form-control" placeholder="이메일"
						name="id"> <span id="checkId" size="2"></span> <input
						type="text" id="nick" class="form-control" placeholder="닉네임"
						name="nick"> <span id="checkNick" size="2"></span> <input
						type="password" class="form-control" placeholder="비밀번호" name="pw">
					<input type="password" class="form-control" placeholder="비밀번호 확인">

					<select id="disabledSelect" class="form-select" name="sex">

						<!-- <option>성별</option> 자세히 알아보기-->
						<option>남자</option>
						<option>여자</option>
					</select> <input type="date" class="form-control" placeholder="생년월일"
						name="birth"> <input type="text" class="form-control"
						placeholder="주소:서울특별시 강남구 개포동까지 입력" name="address"
						style="font-size: 15px"> <input type="text"
						class="form-control" placeholder="프로필" name="profile">
				</div>


				<div class="d-grid gap-2 col-12 mx-auto my-2 ">
					<button type="submit" class="btn"
						style="background-color: #25aa90;">완료</button>

				</div>

			</div>
		</form>
	</div>


	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script>
		$('#id')
				.focusout(
						function() {
							let id = $('#id').val();

							$
									.ajax({
										url : "MJoinIdCheckCon.do",
										type : "post",
										data : {
											id : id
										},
										dataType : 'json',
										success : function(result) {
											if (result == 0) {
												document
														.getElementById('checkId').style.display = 'block';
												$("#checkId").html(
														'사용할 수 없는 이메일입니다');
												$("#checkId").css('color',
														'red');
											} else {
												document
														.getElementById('checkId').style.display = 'block';
												$("#checkId").html(
														'사용할 수 있는 이메일입니다');
												$("#checkId").css('color',
														'green');
											}
										},
										error : function() {
											alert("서버요청실패 id")
										}
									})
						})
	</script>
	<script type="text/javascript">
		$('#nick')
				.focusout(
						function() {
							let nick = $('#nick').val();

							$
									.ajax({
										url : "MJoinNickCheckCon.do",
										type : "post",
										data : {
											nick : nick
										},
										dataType : 'json',
										success : function(result) {
											if (result == 0) {
												document
														.getElementById('checkNick').style.display = 'block';
												$("#checkNick").html(
														'사용할 수 없는 닉네임입니다');
												$("#checkNick").css('color',
														'red');

											} else {
												document
														.getElementById('checkNick').style.display = 'block';
												$("#checkNick").html(
														'사용할 수 있는 닉네임입니다');
												$("#checkNick").css('color',
														'green');
											}
										},
										error : function() {
											alert("nick서버요청실패")
										}
									})
						})
	</script>





</body>
</html>