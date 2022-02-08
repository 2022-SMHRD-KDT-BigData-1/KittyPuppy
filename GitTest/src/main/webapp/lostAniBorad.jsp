<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lostAniBorad</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>
h1 {
	text-align: center;
	font-size: 60px;
	font-family: 'Dancing Script', cursive;
	font-weight: 900;
	color: #25aa90;
}

.container {
	text-align: center;
	width: 95%;
	max-width: 1200px;
	min-width: 300px;
	padding: 15px;
	margin: auto;
	display: auto;
}

.b {
	
}
</style>



</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<h1>KittyPuppy</h1>
		</div>
		<div class="row" align="center">
			<h2>다른 페이지 아이콘 자리</h2>
			<h2>검색 자리</h2>

		</div>
		<div class="row">

			<!-- 붓스트랩 -카드 컴포넌츠 두개 나란히 나오려면 공간 546이상 필요 -->
			<div class="card" style="width: 16rem;">
				<img src="..." class="card-img-top" alt="사진 자리">
				<div class="card-body">
					<h5 class="card-title">${lostAni.type}${lostAni.kind}kind</h5>
					<p class="card-text">
						<span>${lostAni.sex}성별</span> <span>${lostAni.aniSize}크기</span>
					</p>
					<hr>
					<p>${lostAni.ladate}날짜</p>
					<p>${lostAni.place}위치</p>

				</div>
			</div>
			<div class="card" style="width: 16rem;">
				<img src="..." class="card-img-top" alt="사진 자리">
				<div class="card-body">
					<h5 class="card-title">${lostAni.type}${lostAni.kind}kind</h5>
					<p class="card-text">
						<span>${lostAni.sex}성별</span> <span>${lostAni.aniSize}크기</span>
					</p>
					<hr>
					<p>${lostAni.ladate}날짜</p>
					<p>${lostAni.place}위치</p>

				</div>
			</div>

		</div>

	</div>

</body>
</html>