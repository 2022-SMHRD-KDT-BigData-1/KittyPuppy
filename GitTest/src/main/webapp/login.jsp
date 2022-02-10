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

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet">

<title>WebKittyPuppy</title>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<style>
body {
	background-color: #ffffff;
	display: flex;
	padding: 15px;
	margin: auto;
}

.container {
	text-align: center;
	width: 80%;
	max-width: 1200px;
	min-width: 300px;
	padding: 15px;
	margin: auto;
	display: auto;
}

.container h1 {
	text-align: center;
	font-size: 60px;
	color: #25aa90;
	font-family: 'Dancing Script', cursive;
}

.container .btn {
	background-color: #25aa90;
	color: #fff;
}

html, body {
	height: 100%;
}

.b {
	border: solid 1px violet;
	width: 300px;
}

.row {
	align-items: center;
}

.col-sm-6 {
	width: 400px;
}



#logo {
	margin-top: 40px;
	margin-bottom: 40px;
}
</style>

</head>

<body>



	<div class="container">

		<div class="row justify-content-center">
		
				<!--모바일 크기에는 사진 없어짐 d-none d-sm-block d-sm-none d-md-block -->
			<div class="d-none d-sm-block d-sm-none d-md-block d-md-none d-lg-block d-grid gap-sm-1 col-sm-6 ">
			
				<img class="img-fluid"
					src="http://www.animaltogether.com/news/photo/202012/3614_7974_1835.jpg"
					alt="IMG">
			</div>

			<!-- <div class="simple-login-container"> -->
			<div class="col-sm-6">
				<form action="MLoginCon.do" method="post">
					<div>
						<div class="d-grid gap-2 col-12">
							<h1 id="logo">KittyPuppy</h1>
							<input type="text" name="id" class="form-control" placeholder="Email">
							<input type="password" name="pw" class="form-control"
								placeholder="Password"> <a hrep="#" class="text-end">비밀번호를
								잊으셨나요?</a><br>
						</div>

						<div class="d-grid gap-2 col-12 mx-auto">
							<button type="submit" class="btn"
								style="background-color: #25aa90;">로그인</button>
							<button type="button" class="btn"
								style="background-color: #25aa8f7e;">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>



	
	<!-- <div class="loginform"> 



        <br>


        <div class="row">
            <div class="col-md-12 form-group">
                <input type="email" class="form-control" placeholder="Email">

            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12 form-group">
                <input type="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-md-12 form-group">
                <p hrep="#" class="text-end">비밀번호를 잊으셨나요?</p>
            </div>
        </div>
        <br>


        <div class="d-grid gap-2 col-12 mx-auto">
            <button type="button" class="btn" style="background-color: #25aa90;">로그인</button>
            <button type="button" class="btn" style="background-color: #25aa8f7e;">회원가입</button>
        </div>



    </div>-->
</body>

</html>