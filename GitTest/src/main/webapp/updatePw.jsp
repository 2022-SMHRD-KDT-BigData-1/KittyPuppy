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

        .btn {
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
        <form action=".do" method="post">

            <div class="row">

                <div class="d-grid gap-2 col-12 mx-auto">

                    <h1>KittyPuppy</h1>

                    <div class="lock-icon" style="text-align: center; font-size: 100px;">
                        <i class="bi bi-key-fill"></i>


                    </div>

                    <p>새로운 비밀번호를 설정해주세요. </p>

                    <input type="password" id="pw" class="form-control" placeholder="비밀번호">
                    <span id="checkId" size="2"></span>
                    <input type="passwordck" id="checkPw" class="form-control" placeholder="비밀번호 확인">
                    <span id="checkBirth" size="2"></span>

                    <div class="d-grid gap-2 col-12 mx-auto">
                        <button type="submit" class="btn my-2" style="background-color: #25aa90;">완료</button>
                    </div>

                    <hr class="my-1">


                    <div class="d-grid gap-2 col-12 mx-auto">
                        <button type="button" class="btn my-2" style="background-color: #25aa90;">로그인으로 돌아가기</button>
                    </div>



                </div>




            </div>
        </form>
    </div>


    <script src="jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>



    </script>





</body>

</html>