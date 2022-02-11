<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page
	import = 'java.util.ArrayList'
	import = 'com.kittypuppy.model.*'
%>
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>

<head>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1.0'>

<!-- Bootstrap CSS -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'
	rel='stylesheet'
	integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3'
	crossorigin='anonymous'>

<!-- Google Font -->
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link
	href='https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap'
	rel='stylesheet'>

    <!-- 아이콘 -->
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css'>
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
<link rel='stylesheet' href='https://bootsnipp.com/dist/bootsnipp.min.css' crossorigin='anonymouse'>
<link rel='stylesheet' href='https://pro.fontawesome.com/releases/v5.10.0/css/all.css'
    integrity='sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p' crossorigin='anonymous' />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js'></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src='js/bootstrap.min.js'></script>

<!-- Custom styles for this template -->
<link href='narrow-jumbotron.css' rel='stylesheet'>

<title>WebKittyPuppy</title>

<style>
html, body {
	height: 100%;
}

body {
	background-color: #ffffff;
	padding: 10px;
}

/* 로고 글꼴, 색상 설정 */
	h1 {
		font-family: 'Dancing Script', cursive;
		font-size: 35px;
		color: #25aa90;
		display: inline;
	}
	
	.hidden {
		color: #f5e172;
		font-size: 4ch;
		visibility: hidden;
	}
	
	.report {
		color: #f5e172;
		font-size: 4ch;
	}
	
	/* 아이콘 설정 */
	.icon {
		font-size : 5ch;
		color : #000000;
	}
	
	.bi {
		font-size: 40px;
	}
	
	/* 상단 로고 고정 */
	.header-logo {
		position: fixed;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: 0;
		height: 5rem;
		background-color: white;
		padding-top: 15px;
		width: 100%;
		text-align: center;
		z-index: 3;
	}
	
	/* 상단 메뉴바 고정 */
	.header-menu {
		position: fixed;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: 5rem;
		height: 5rem;
		background-color: white;
		padding-top: 15px;
		width: 100%;
		z-index:3;
	}
	
	/* 바깥 컨테이너 설정 */
	.container.out {
		width: 100%;
		padding-left: 15px;
		padding-right: 15px;
		padding-bottom: 15px;;
		padding-top: 9rem;
		margin: auto;
		display: block;
		max-width: 470px;
	}
	
	a {
		text-decoration-line: none;
	}
	
	i {
		color: #25aa90;
	}
	
	.ls {
		margin: atuo;
		max-width: 442px;
		margin: auto;
	}
	
	.lcs {
		font-size: 2ch;
		margin-left: 15px;
		margin-right: 15px;
	}
	
	#cursor {
		color: #25aa90;
	}
	
	button {
		border: 0cm;
		background-color: #ffffff;
	}
	
	.info {
		font-size: 12px;
	}
	
	.row {
		align-items: center;
	}
	
	.col-sm-6 {
		width: 492px;
	}
	
	.col-sm-6>img {
		width: 100%;
	}
	
	.img-thumbnail {
		max-width: 70px;
		max-height: 70px;
	}
	
	div {
		display: block;
	}
	
	.comt {
		display: none;
	}
	
	.comment {
		display: none;
	}
	
	.comment_body {
		hegiht : 300px;
		overflow : auto;
	}
	
	/* 화면크기가 1050px이 넘어갔을때 적용되는 css */
	@media ( min-width : 1050px) {
		/* 바깥 컨테이너 설정 */
		.container.out {
			max-width: 1200px;
		}
	
		.img-thumbnail {
			max-width: 100px;
			max-height: 150px;
		}
		.ls {
			max-width: 1000px;
		}
	}
	
</style>

</head>
<body>
    
    <%	
    	FeedDAO fdao = new FeedDAO();
    	FollowDAO fwdao = new FollowDAO();
    	String nick = (String)session.getAttribute("nick");
    	fwdao.followingShow(nick);
    	
    	ArrayList<FeedDTO> feedList = null;
    	ArrayList<String> followList = fwdao.followingShow(nick);
    	if (followList.size() == 0) {
    		feedList = fdao.feedShowAll();
    	} else {
    		feedList = fdao.feedShow(followList);
    	}
    	pageContext.setAttribute("feedList",feedList);
    %>
    
    <!-- 키티퍼피 로고 -->
    <div class='ls navbar header-logo'>
        <i class='bi bi-exclamation-octagon-fill hidden'></i>
        <h1 class='text-center'>KittyPuppy</h1>
        <a href =''><i class='bi bi-exclamation-octagon-fill report'></i></a>
    </div>
        
    <br>
    <!-- 상단 고정된 메뉴바 -->
    <div class='ls navbar text-center banner header-menu'>
        <a><i id = 'cursor' class = 'bi bi-phone-fill icon'></i></a>

        <a href = 'lostAniBoard.jsp'><i class='bi bi-megaphone icon'></i></a>

        <a href = 'maps.jsp'><i class='bi bi-geo-alt icon'></i></a>

        <a href = 'mypage.jsp'><i class='bi bi-person icon'></i></a>

        <a href = 'dmList.jsp'><i class = 'bi bi-chat-dots icon'></i></a>
    </div>

    <!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
	<div class='container out'>
        <!-- 검색창 -->
        <form action = 'FeedSearchCon.do' method = 'post'>
	        <div class='ls input-group rounded'>
	            <input name ='search' type='search' class='form-control rounded' placeholder='닉네임 또는 태그 검색' aria-label='Search' aria-describedby='search-addon' />
	        	<label class='btn btn-default input-group-text border-0' id='search-addon' style='font-size: 30px;'>
	        		<i class='fas fa-search'> <input type='submit' hidden></i>
	    		</label>
	        </div>
        </form>
        
        <c:forEach var ='feed' items = '${feedList}'>
			<div class='row mt-3 text-center'>
				<div class='row justify-content-center'>
	                <div class='d-grid gap-sm-1 col-sm-6'>
	                    <!-- 게시자 정보 -->
	                    <div class = 'col-6'>
	                        <img src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png' class='rounded-circle img-thumbnail img-fluid float-start'>
	                        <div align ='left'>
		                        <strong>${feed.nick}</strong><br/>
		                        ${feed.feedDate}
	                        </div>
	                    </div>
	                    <!-- 첨부된 사진-->
	                    <img src='${feed.picAddress}'>
	                </div>
	                <!-- 피드 내용-->
	                <div class='col-sm-6'>
	                    <div class = 'content' align = 'left'>${feed.content}<button class = 'info more'>더보기</button></div>
	                    <div class = 'tag' align = 'left'>${feed.tag}
	                    <div align = 'left'>좋아요 10 댓글 10 <button class = 'info entire'>전체보기</button></div>
	                    <div class = 'comment'>
	                    	<div class = 'row'>
	                    		<button class = 'col-1 remove'><i class='bi bi-chevron-left'></i></button>
	                    		<h1 class = 'col-10'>comment</h1>
	                    	</div>
	                    	<div class = 'comment_body' align = 'left'>
	                    		<div>댓글내용</div>
	                    	</div>
	                    	 <div class = 'comt'>
		                    	<form action ='FeedCommentCreateCon.do' method = 'post'>
		                    		<div class='input-group rounded'>
							        	<input type='text' class='form-control rounded' placeholder='댓글 입력' aria-label='Search' aria-describedby='search-addon' />
										<input type='submit' value = '↑'>
									</div>
		                    	</form>
		                    </div>
	                    </div>
	                    <div>
	                        <button class = 'bt1'><i class = 'fa fa-paw lcs'> 좋아요</i></button>
	                        <!-- <button class = 'bt2'><i class = 'fal fa-paw lcs'> 좋아요</i></button> -->
	                        <button class = 'bt3'><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>
	                        <button class = 'bt4'><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>
	                        <!-- <button class = 'bt5'><i class = 'bi bi-bookmark lcs'> 스크랩</i></button> -->
	                    </div>
	                </div>
	            </div>
	        </div>
        	</div>
        </c:forEach>
    </div>
	
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js' integrity='sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p' crossorigin='anonymous'></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <!-- <script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js' integrity='sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB' crossorigin='anonymous'></script>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js' integrity='sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13' crossorigin='anonymous'></script> -->
    
    <script src='jquery-3.6.0.min.js'></script>
	<script type = 'text/javascript'>
		// 더보기(본문 자세히보기)
		$('.more').click(function(){
			$('.content').html('css 너무 어렵다.....');
		});
		// 전체보기
		for (let i = 0; i < document.querySelectorAll('.entire').length;i++){
			document.querySelectorAll('.enetire')[i].addEventListener('click',function(){
				document.querySelector('.comment')[i].style.display = 'block';
			});
		}
		// 접기
		$('.remove').click(function(){
			document.querySelector('.comment').style.display = 'none';
		});
		// 댓글 입력창 보이기 및 숨기기		
		document.querySelector('.bt3').addEventListener('click',function(){
			if(document.querySelector('.comt').style.display == 'none'){
				document.querySelector('.comt').style.display = 'block';
			} else {
				document.querySelector('.comt').style.display = 'none';
			}
		});
	</script>
</body>
</html>
