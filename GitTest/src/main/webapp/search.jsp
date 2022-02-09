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

    <!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://bootsnipp.com/dist/bootsnipp.min.css" crossorigin="anonymouse">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

<title>WebKittyPuppy</title>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<style>

    html, body {
        height: 100%;
    }

    body{
        background-color: #ffffff;
        display: flex;
        padding: 10px;
    }

    a {
        color : #000000;
        text-decoration-line: none;
    }

    .ls {
        margin: atuo;
        max-width: 442px;
        margin: auto;
    }
    
    i {
        font-size: 3ch;
        font-weight: bold;
        color: #25aa90;
    }

    .hash {
        font-size : 5ch;
        color : #000000;
    }

    .search-icon {
        font-size : 3ch;
    }

    .search-board {
        outline: 2px solid;
        outline-color: #25aa90;
        width: 405px;
    }

    .container{
        width: 100%;
        max-width: 492px;
        padding:15px;
        margin: auto;
        display:block;
    }

    .btn{
            background-color: #25aa90;
            color:white
    }

    .row {
	    align-items: center;
    }

    .img-thumbnail{
            max-width:60px;
            max-height:60px;
    }

    @media (min-width: 1050px) {

        .container{
            max-width:1200px;
        }

        .ls {
            max-width: 700px;
        }

        .search-board {
        width: 664px;
        }

    }

    div{
        display:block;
    }

</style>
</head>
<body>
<div class="container">
    <!-- 검색창 -->
    <div class = 'ls'>
        <div class="row">
            <table>
                <tr>
                    <td>
                        <a href = 'feed.jsp'><i class="bi bi-chevron-left"></i></a>
                    </td>
                    <td>
                        <a href = "FeedSearchCon.do"><i class="bi bi-search search-icon"> </i></a>
                    </td>
                    <td>
                        <input type = 'text' class = 'search-board' name = 'search' placeholder= "검색하고 싶은 닉네임 또는 태그 입력">
                    </td>
                </tr>
            </table>
        </div>

        <div class="row">
            <button class="col btn me-1">회원정보 수정</button>
            <button class="col btn ms-1">게시물 작성</button>
        </div>

        <!-- 닉네임 검색 결과-->
        <div class="row mt-3">
            <a href =''>
                <div>
                    <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start">
                    <br>
                    <strong> 닉네임1</strong>
                </div>
            </a>
            
            <a href =''>
                <div>
                    <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start">
                    <br>
                    <strong> 닉네임2</strong>
                </div>
            </a>

            <a href =''>
                <div>
                    <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start">
                    <br>
                    <strong> 닉네임3</strong>
                </div>
            </a>

            <a href =''>
                <div>
                    <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start">
                    <br>
                    <strong> 닉네임4</strong>
                </div>
            </a>
        </div>

        <!-- 태그 검색 결과-->

        <div class="row mt-3">

            <a href ='searchResult.jsp?search='>
                <div>
                    <i class="hash bi bi-hash"></i>
                    <strong> 태그1</strong>
                </div>
            </a>

            <a href ='searchResult.jsp?search='>
                <div>
                    <i class="hash bi bi-hash"></i>
                    <strong> 태그2</strong>
                </div>
            </a>

            <a href ='searchResult.jsp?search='>
                <div>
                    <i class="hash bi bi-hash"></i>
                    <strong> 태그3</strong>
                </div>
            </a>

            <a href ='searchResult.jsp?search='>
                <div>
                    <i class="hash bi bi-hash"></i>
                    <strong> 태그4</strong>
                </div>
            </a>
            
        </div>

    </div>

</div>

<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>