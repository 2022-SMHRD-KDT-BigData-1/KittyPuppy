<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>KittyPuppy</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@00&display=swap" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2? family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap"
        rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>

    <style>
        body {
            font-family: 'IBM Plex Sans KR', sans-serif;
            background-color: #ffffff;
            font-size: 10px;
            color: #25aa90;
            display: flex;
        }

        .container {
            width: 360px;
            min-width: 360px;
            margin: auto;
        }

        span {
            display: none;
        }

        @media (min-width: 992px) {
            .img-thumbnail {
                max-width: 100px;
                max-height: 100px;
            }

        }

        /* 사진등록 문구 */
        .container p {
            text-align: center;
            font-size: 12px;
        }

        /* 회원가입수정 문구 */
        .container h3 {
            text-align: center;
            color: black;
            font-size: 20px;
            margin-top: 8%;
            margin-bottom: 8%;
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

        <form action="MUpdateCon.do" method="post">

            <div class="row">

                <div class="d-grid gap-2 col-12 mx-auto">

                    <div class="row">
                        <!-- 뒤로가기 아이콘 -->
                        <div class="col-sm-2">
                            <a href="mypage.jsp">
                                <!-- 마이페이지 이동 -->
                                <i class="bi bi-chevron-left"
                                    style="font-size: 2rem; color: black; align-items: flex-start;"></i>
                            </a>
                        </div>

                        <div class="col-sm-8">
                            <h3> 회원정보수정</h3>
                        </div>
                        <!-- 아래 col-2가 있어야 text가 중앙으로 올수 있음 -->
                        <div class="col-sm-2">
                            <h3> </h3>
                        </div>

                    </div>
                    <br>
                    <!-- 프로필 사진 바꾸기 -->

                    <!-- 원형 사진을 클릭하여 사진을 업로드 -->

                    <div class="text-center">
                        <!-- 사진업로드 이동 -->
                        <label class="btn btn-default" style="background-color: white;">
                            <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
                                class="avatar rounded-circle img-thumbnail" alt="avatar" style="width: 100px;">
                            <input type="file" name="picAddress" hidden></i>
                        </label>
                        <br>
                        <p>프로필 사진 바꾸기</p>

                    </div>
                    <div class="d-grid gap-2 col-12 mx-auto">
                        <!-- 정보 변경 -->
                        <input type="text" id="nick" class="form-control" placeholder="닉네임" name="nick">
                        <span id="checkNick" size="2"></span>

                        <input type="password" class="form-control" placeholder="비밀번호" name="pw">
                        <input type="password" class="form-control" placeholder="비밀번호 확인">


                        <select id="disabledSelect" class="form-select" name="sex">
                            <option>성별</option>
                            <option value="남성">남성</option>
                            <option value="여성">여성</option>
                        </select>


                        <input type="date" class="form-control" placeholder="생년월일" name="birth">
                        <input type="text" class="form-control" placeholder="주소" name="address">
                        <input type="text" class="form-control" placeholder="프로필" name="profile">

                    </div>


                    <div class="d-grid gap-2 col-12 mx-auto">
                        <button type="submit" class="btn" style="background-color: #25aa90;">완료</button>

                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- 닉 중복 체크 -->
    <script src="jquery-3.6.0.min.js"></script>

    <script type="text/javascript">


        $('#nick').focusout(function () {
            let nick = $('#nick').val();

            $.ajax({
                url: "MJoinNickCheckCon.do",
                type: "post",
                data: {
                    nick: nick
                },
                dataType: 'json',
                success: function (result) {
                    if (result == 0) {
                        document.getElementById('checkNick').style.display = 'block';
                        $("#checkNick").html('사용할 수 없는 닉네임입니다');
                        $("#checkNick").css('color', 'red');

                    } else {
                        document.getElementById('checkNick').style.display = 'block';
                        $("#checkNick").html('사용할 수 있는 닉네임입니다');
                        $("#checkNick").css('color', 'green');
                    }
                },
                error: function () {
                    alert("nick서버요청실패")
                }
            })
        }) 
    </script>







</body>

</html>