<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>KittyPuppy_Join</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@800&display=swap" rel="stylesheet">

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
            text-align: center;
            font-size: 15px;
        }

        .container h1 {
            text-align: center;
            font-size: 50px;
            font-family: 'Dancing Script', cursive;
            font-weight: 900;
        }

        .container .btn {
            background-color: #25aa90;
            color: #fff;

        }

        html,
        body {
            height: 100%;
        }
    </style>





</head>

<body>



    <div class="container">
        <form action="MUpdatePw.do" method="post">

            <div class="row">

                <div class="d-grid gap-2 col-12 mx-auto">

                    <h1>KittyPuppy</h1>

                    <div class="lock-icon" style="text-align: center; font-size: 100px;">
                        <i class="bi bi-key-fill"></i>


                    </div>

                    <p>새로운 비밀번호를 설정해주세요. </p>

                    <input type="password" id="pw" class="form-control" onkeyup="checkpw()" placeholder="비밀번호">
                    <span id="checkpw" size="2"></span>
                    <input type="password" id="pw2" class="form-control" onkeyup="checkpw2()" placeholder="비밀번호 확인">
                    <span id="checkpw2" size="2"></span>

                    <div class="d-grid gap-2 col-12 mx-auto">
                        <button type="submit" class="btn my-2" style="background-color: #25aa90;">완료</button>
                    </div>

                    


                </div>




            </div>
        </form>
    </div>


    <script src="jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>

<script>
        // $("checkpw").one("keyup", function () {
        function checkpw() {
            let pw = document.getElementById("pw").value;		//입력한 패스워드 값 가져옴
            let checkpw = document.getElementById("checkpw");		// 결과를 출력할 공간
            //let checkpw2 = document.getElementById("checkpw2");

            let num = pw.search(/[0-9]/g);
            let eng = pw.search(/[a-z]/ig);
            let spe = pw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);


            if (pw.length < 8 || pw.length > 15) {
                checkpw.style.color = "red";
                checkpw.innerHTML = "8자리 ~ 15자리 이내로 입력해주세요";
                //alert("8자리 ~ 15자리 이내로 입력해주세요");
            } else if (pw.search(/\s/) != -1) {		// 공백이 있는지 확인하는 코드
                checkpw.style.color = "red";
                checkpw.innerHTML = "비밀번호는 공백 없이 입력해주세요";
                alert("비밀번호는 공백 없이 입력해ㅇㄹ주세요")
            } else if (num < 0 || eng < 0 || spe < 0) {
                checkpw.style.color = "red";
                //checkpw.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요";
                alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요")
            } else {
                checkpw.style.color = "green";
                //checkpw.innerHTML = "적절한 비밀번호 입니다";
                alert("적절한 비밀번호 입니다")
            }
        }


    </script>
    <script>
        // <--비밀번호 일치여부 확인-- >
        function checkpw2() {
            let pw = document.getElementById("pw").value; //입력한 패스워드 값 가져옴
            let checkpw = document.getElementById("checkpw"); // 결과를 출력할 공간

            let pw2 = document.getElementById("pw2").value; // 입력한 패스워드 확인 값
            let checkpw2 = document.getElementById("checkpw2"); // 결과를 출력할 공간

            checkpw.innerHTML = "";

            if (pw == pw2) {
                confirmPw.style.color = "green";
                confirmPw.innerHTML = "비밀번호가 일치합니다.";
            } else {
                confirmPw.style.color = "red";
                confirmPw.innerHTML = "비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.";
            }
        }




    </script>








<!--    왜 안되는겨!!! <script>

    $('#checkpw').keyup(function() {
    	var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;
	
        if(pw.length < 6 || pw.length>16){
        	document.getElementById('checkpw').value='';
        	$("#checkpw").html('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        	$("#checkpw").css('color', 'red');
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        if(check_SC == 0){
        	document.getElementById('checkpw').value='';
        	$("#checkpw").html('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.');
        	$("#checkpw").css('color', 'red');
           
        }
        if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('checkpw2').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('checkpw2').style.color='green';
            }
            else{
                document.getElementById('checkpw2').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('checkpw2').style.color='red';
            }
        }
    })

    </script> -->





</body>

</html>