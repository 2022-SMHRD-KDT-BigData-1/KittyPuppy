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

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다)
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
     모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<!-- <script src="js/bootstrap.min.js"></script> -->

<style>
body {
	background-color: #ffffff;
	font-size: 10px;
	color: #25aa90;
	display: flex;
}

/* span {
            display: none;
        } */
.container {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	/* display: block; */
}

.container p {
	text-align: center;
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

.pwInfo {
	font-size: 10px;
}
</style>





</head>

<body>
	


	<div class="container">
		<form action="MUpdatePw.do" method="post">

			<div class="row">

				<div class="d-grid gap-2 col-12 mx-auto">
					<h1>KittyPuppy</h1>
					<div class="lock-icon"
						style="text-align: center; font-size: 100px;">
						<i class="bi bi-key-fill"></i>
					</div>
					<p>새로운 비밀번호를 설정해주세요.</p>

					<input type="password" id="pw" class="form-control" placeholder="비밀번호">
						 <span class="pwInfo">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
						 <span id="checkpw" size="2"></span> 
						 <input type="password" id="pw2" class="form-control" placeholder="비밀번호 확인">
						 <span id="pw-success" size="2" style="display: none;">비밀번호가 일치합니다.</span>
						 <span id="pw-danger" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
					<div class="d-grid gap-2 col-12 mx-auto">
						<button type="submit" class="btn my-2" style="background-color: #25aa90;">완료</button>
					</div>

				</div>
			</div>
		</form>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
		$('.form-control').focusout(function() {
			var pwd1 = $("#pw").val();
			var pwd2 = $("#pw2").val();

			if (pwd1 != '' && pwd2 == '') {
				null;
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#pw-success").css('display', 'inline-block');
					$("#pw-danger").css('display', 'none');
				} else {
					//alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
					$("#pw-success").css('display', 'none');
					$("#pw-danger").css('display', 'inline-block');
				}
			}
		});
	</script>

<script>
        // $("checkpw").one("keyup", function () {
        $('.form-control').one("keyup", function () {	
        //function checkpw() {
            var pw = $("#pw").val();		//입력한 패스워드 값 가져옴
            var checkpw = $("#checkpw").val();		// 결과를 출력할 공간
            //let checkpw2 = document.getElementById("checkpw2");

            var num = pw.search(/[0-9]/g);
            var eng = pw.search(/[a-z]/ig);
            var spe = pw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);


            if (pw.length < 8 || pw.length > 15) {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', 'red');
            	$("#checkpw").html("8자리 ~ 15자리 이내로 입력해주세요");
                //alert("8자리 ~ 15자리 이내로 입력해주세요");
            } else if (pw.search(/\s/) != -1) {		// 공백이 있는지 확인하는 코드
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', 'red');
            	$("#checkpw").html("비밀번호는 공백 없이 입력해주세요");
                //checkpw.innerHTML = "비밀번호는 공백 없이 입력해주세요";
                //alert("비밀번호는 공백 없이 입력해주세요")
            } else if (num < 0 || eng < 0 || spe < 0) {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', 'red');
            	$("#checkpw").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요");
                //checkpw.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요";
                //alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요")
            } else {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', 'green');
            	$("#checkpw").html("적절한 비밀번호 입니다");
                //checkpw.innerHTML = "적절한 비밀번호 입니다";
                //alert("적절한 비밀번호 입니다")
            }
        }


    </script>





</body>

</html>