<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KittyPuppy</title>

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
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
<link href="./assets/css/login.css?ver=0.9.0.1" rel="stylesheet">
</head>

<body>

	<div class="container">

		<div class="row justify-content-center">

			<!--모바일 크기에는 사진 없어짐 d-none d-sm-block d-sm-none d-md-block -->
			<div
				class="d-none d-sm-block d-sm-none d-md-block d-md-none d-lg-block d-grid gap-sm-1 col-sm-6 ">

				<img class="img-fluid"
					src="./assets/img/kittypuppyLoginImg.jpg"
					alt="IMG">
			</div>

			<!-- <div class="simple-login-container"> -->
			<div class="col-sm-6">
				<form action="MLoginCon.do" method="post">
					<div>
						<div class="d-grid gap-2 col-12">
							<h1 id="logo">KittyPuppy</h1>
							<input type="text" name="id" class="form-control"
								placeholder="이메일"> <input type="password" name="pw"
								class="form-control" placeholder="비밀번호"> <a
								href="findPw.jsp" class="text-end my-2">비밀번호를 잊으셨나요?</a>
						</div>

						<div class="d-grid gap-2 col-12 mx-auto">
							<button type="submit" class="btn"
								style="background-color: #25aa90;">로그인</button>
							<button type="button" class="btn"
								onclick="location.href='join.jsp'"
								style="background-color: #25aa8f7e;">회원가입</button>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>