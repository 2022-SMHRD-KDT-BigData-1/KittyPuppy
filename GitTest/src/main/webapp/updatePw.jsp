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
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style>
html, body {
	height: 100%;
}

body {
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color: #ffffff;
	font-size: 13px;
	color: #25aa90;
	display: flex;
}

/* span {
            display: none;
        } */
.container {
	width: 360px;
	min-width: 360px;
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

.pwInfo {
	font-size: 13px;
}
</style>
</head>
<body>

	<div class="container">
		<form action="MUpdatePwCon.do" method="post">

			<div class="row">

				<div class="d-grid gap-2 col-12 mx-auto">
					<h1>KittyPuppy</h1>
					<div class="lock-icon"
						style="text-align: center; font-size: 100px;">
						<i class="bi bi-key-fill"></i>
					</div>
					<p>새로운 비밀번호를 설정해주세요.</p>

					<input type="password" id="pw" class="form-control"
						placeholder="비밀번호" name="pw" /> <span class="pwInfo">8~16자
						영문 대 소문자, 숫자, 특수문자를 사용하세요.</span> <span id="checkpw"></span> <input
						type="password" id="pw2" class="form-control"
						placeholder="비밀번호 확인" /> <span id="pw-success"
						style="display: none;">비밀번호가 일치합니다.</span> <span id="pw-danger"
						style="display: none; color: #d92742;">비밀번호가 일치하지 않습니다.</span>
					<div class="d-grid gap-2 col-12 mx-auto">
						<button type="submit" class="btn my-2"
							style="background-color: #25aa90;" name="submit">완료</button>
					</div>

				</div>
			</div>
		</form>
	</div>


	<script>
	
	let pw, pw2, checkpw;
	<!--비밀번호 일치 체크  -->
		$('.form-control').focusout(function() {
			pw = $("#pw").val();
			pw2 = $("#pw2").val();

			if (pw != '' && pw2 == '') {
				null;
			} else if (pw != "" || pw2 != "") {
				
				//일치 할경우
				if (pw == pw2) {				
					$("#pw-success").css('display', 'inline-block');
					$("#pw-danger").css('display', 'none');
					$("#")
					
				} else {
					//alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
					$("#pw-success").css('display', 'none');
					$("#pw-danger").css('display', 'inline-block');
					
				}
			}
		});

		<!-- 비밀번호 설정 조건 -->
        	$('.form-control').focusout(function() {
       		
       		//입력한 패스워드 값 가져옴
            pw = $("#pw").val();		
            pw2 = $("#pw2").val();
        	
            // 결과를 출력할 공간	
            checkpw = $("#checkpw").val();		

            //search 문자검색
            var num = pw.search(/[0-9]/g); 
            var eng = pw.search(/[a-z]/ig);
            var spe = pw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);


            if (pw.length < 8 || pw.length > 15) {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', '#d92742');
            	$("#checkpw").html("8자리 ~ 15자리 이내로 입력해주세요");
                //alert("8자리 ~ 15자리 이내로 입력해주세요");
                return;
                
            } else if (pw.search(/\s/) != -1) {		// 공백이 있는지 확인하는 코드
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', '#d92742');
            	$("#checkpw").html("비밀번호는 공백 없이 입력해주세요");
            	return;
                //checkpw.innerHTML = "비밀번호는 공백 없이 입력해주세요";
                //alert("비밀번호는 공백 없이 입력해주세요")
                
            } else if (num < 0 || eng < 0 || spe < 0) {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', '#d92742');
            	$("#checkpw").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요");
            	return;
                //checkpw.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요";
                //alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요")
                
            } else {
            	document.getElementById('checkpw').style.display = 'block';
            	$("#checkpw").css('color', 'green');
            	$("#checkpw").html("적절한 비밀번호 입니다");
                //checkpw.innerHTML = "적절한 비밀번호 입니다";
                //alert("적절한 비밀번호 입니다")
            }
        });

</script>

</body>
</html>