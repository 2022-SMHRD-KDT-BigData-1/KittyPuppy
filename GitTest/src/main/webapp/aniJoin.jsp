<%@page import="com.kittypuppy.model.AnimalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.AnimalDAO"%>
<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            /* padding: 15px;
            margin: auto; */
        }

        .container {
            width: 100%;
            padding: 15px;

            display: block;
        }

        @media (min-width: 992px) {
            .img-thumbnail {
                max-width: 100px;
                max-height: 100px;
            }

            .container {
                max-width: 800px;
            }
        }

        .container p {
            text-align: center;
            font-size: 12px;
        }

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
<%
	MemberDAO dao = new MemberDAO();
	MemberDTO member = (MemberDTO)session.getAttribute("member");
	String nick = member.getNick();
%>

 <div class="container out">
 
 <form action="AniJoinCon.do" method="post" enctype="multipart/form-data">

        <div class="row">


            <div class="d-grid gap-0 col-12 mx-auto">

                <div class="row">
                    <!-- 뒤로가기 아이콘 -->
                    <div class="col-2">
                        <a href="mypage.jsp"><!-- 마이페이지 이동 -->
                        <i class="bi bi-chevron-left"
                                style="font-size: 2rem; color: black; align-items: flex-start;"></i></a>
                            
                       
                    </div>

                    <div class="col-8">
                        <h3> 반려동물등록</h3>
                    </div>
                    <!-- 아래 col-2가 있어야 text가 중앙으로 올수 있음 -->
                    <div class="col-2">
                        <h3> </h3>
                    </div>

                </div>
                <br>
                <!-- 프로필 사진 바꾸기 -->

                <!-- 원형 사진을 클릭하여 사진을 업로드 -->

                <div class="text-center ">
                     <!-- 사진업로드 이동 -->
                    <label class="btn btn-default" style="background-color: white;">
                        <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
                            class="avatar rounded-circle img-thumbnail" alt="avatar" style="width: 100px;"> <input
                            type="file" name="animalPic" hidden ></i>
                    </label>

                    

                    <br>
                    <p>반려동물 사진 바꾸기</p>

                </div>



                <!-- 정보 변경 -->
                <!-- 닉네임 자동으로 채워지기 -->
                <textarea class="form-control" name="nick">${member.nick }</textarea><br>
                <input type="text" class="form-control" placeholder="반려동물 이름" name="animalName"><br>


                <div class="mb-3">

                    <select id="disabledSelect" class="form-select" name="upKind">
                        <option>반려동물 대분류</option>
                        <option>고양이</option>
                        <option>개</option>
                        <option>동물</option>
                        <!--  <option value=""></option> 추가 하면 됨 -->

                    </select>
                </div>

                <div class="mb-3">

				<input type="text" class="form-control" placeholder="반려동물 소분류 ex)푸들 or 샴" name="kind">
                    
                </div>


                <div class="mb-3">

                    <select id="disabledSelect" class="form-select" name="animalSex">
                        <option>성별</option>
                        <option value="">여아</option>
                        <option value="">남아</option>
                        <!--  퍼피유에 여아 남아로 되어 있음 -->
                    </select>
                </div>

                <input type="text" class="form-control" placeholder="나이 ex)2살이면 2, 3살이면 3" name="animalAge"><br>
                <input type="text" class="form-control" placeholder="반려동물 프로필" name="animalProfile"><br>






            </div>


            <div class="d-grid gap-2 col-12 mx-auto">
                <button type="submit" class="btn" style="background-color: #25aa90;">완료</button>

            </div>

        </div>
</form>
    </div>



</body>
</html>