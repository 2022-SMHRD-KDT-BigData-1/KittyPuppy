<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%-- <%@ page errorPage="login.jsp"%> --%>
<%@ page
	import = 'java.util.ArrayList'
	import = 'com.kittypuppy.model.*'
%>
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = 'fn' uri = "http://java.sun.com/jsp/jstl/functions" %>
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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">

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

<!-- feed.css -->
<link href='./assets/css/feed.css' rel='stylesheet'>


</head>

<body>
    <%	
    	FeedDAO fdao = new FeedDAO();
    	FollowDAO fwdao = new FollowDAO();
    	FeedLikeDAO fldao = new FeedLikeDAO();
    	MemberDAO dao = new MemberDAO(); 
    	FeedCommentDAO fcdao = new FeedCommentDAO();
    	FeedCoCommentDAO fccdao = new FeedCoCommentDAO();
    	ScrapDAO sdao = new ScrapDAO();
    	
    	MemberDTO member = (MemberDTO)session.getAttribute("member");
    	String nick = member.getNick();
    	fwdao.followingShow(nick);
    	pageContext.setAttribute("nick",nick);
    	
    	ArrayList<FeedDTO> feedList = null;
    	ArrayList<String> followList = fwdao.followingShow(nick);
    	
    	int startNum = 1;
    	int endNum = startNum+2;
        if (followList.size() == 0) {
    		feedList = fdao.feedShowAllLimit3(startNum, endNum);
    	} else {
    		feedList = fdao.feedShowLimit3(followList, startNum, endNum);
    	}
        startNum += 3;
    	pageContext.setAttribute("feedList",feedList);
    	pageContext.setAttribute("startNum",startNum);
    	
    	// 개행 처리
		pageContext.setAttribute("enter","\r\n");
    %>
    
    <!-- 키티퍼피 로고 -->
    <div class='ls navbar header-logo'>
        <i class='bi bi-exclamation-octagon-fill hidden'></i>
        <h1 class='text-center'>KittyPuppy</h1>
        <a href ='lostAniReport.html'><i class='bi bi-exclamation-octagon-fill report'></i></a>
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
	<div class='container out' id ='reload'>
        <!-- 검색창 -->
        <form action = 'FeedSearchCon.do' method = 'post'>
	        <div class='ls input-group rounded'>
	            <input name ='search' type='search' class='form-control rounded' placeholder='"닉네임" 또는 "#태그" 검색' aria-label='Search' aria-describedby='search-addon' />
	        	<label class='btn btn-default input-group-text border-0' id='search-addon' style='font-size: 30px;'>
	        		<i class='fas fa-search'> <input type='submit' hidden></i>
	    		</label>
	        </div>
        </form>
        <c:forEach var ='feed' items = '${feedList}'>
        	<c:set var = 'fdn' value = '${feed.feedNo}' scope = 'request'/>
        	<c:set var = 'fnick' value = '${feed.nick}' scope = 'request'/>
			<div class='row mt-3 text-center'>
				<div class='row justify-content-center'>
	                <div class='d-grid gap-sm-1 col-sm-6'>
	                    <!-- 게시자 정보 -->
	                    <%
	                    	String fnick = (String) request.getAttribute("fnick");
	                    	MemberDTO fm = dao.memberInfo(fnick);
	                    	pageContext.setAttribute("fm",fm);
	                    %>
		                    <div class = 'col-6'>
                 	            <a href = 'otherpage.jsp?nick=${feed.nick}'>
		                    	<c:choose>
		                    		<c:when test = "${empty fm.picAddress}">
		                    			<img src='https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png' class='rounded-circle img-thumbnail img-fluid float-start'>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<img src='${fm.picAddress}' class='rounded-circle img-thumbnail float-start'>
		                    		</c:otherwise>
		                    	</c:choose>
		                    	</a>
		                        <div align ='left' class="otherPageNick">
                                	<a href = 'otherpage.jsp?nick=${feed.nick}'>
			                        <br/><strong>${feed.nick}</strong><br/>
			                        ${fn:substring(feed.feedDate,0,10)} 
									</a>                    
		                        </div>
		                    </div>
	                    
	                    
	                    <!-- 첨부된 사진-->
	                    <div id="carouselExampleControls${feed.feedNo}"  class="carousel slide" data-bs-interval="false">
	                    	<div class="carousel-inner">
	                    		<c:set var = 'temp' value = '1' scope = 'request'/>
	                    		<c:forEach var ='src' items='${fn:split(feed.picAddress,",")}'>
	                    			<c:choose>
	                    				<c:when test="${requestScope.temp==1}">
	                    					<c:set var = 'temp' value = '2' scope = 'request'/>
	                    					<div class="carousel-item active" style = 'max-height:600px;'>
												<img src="${src}" style = 'max-width:100%; max-height:100%;' class="d-block w-100 img-fluid" alt="...">
											</div>
	                    				</c:when>
	                    				<c:otherwise>
		                    				<div class="carousel-item" style = 'height:600px;'>
												<img src="${src}" style = 'max-width:100%; max-height:100%;' class="d-block w-100 img-fluid" alt="...">
											</div>
	                    				</c:otherwise>
	                    			</c:choose>
	                    		</c:forEach>
	                    	</div>
	                    	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${feed.feedNo}" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${feed.feedNo}" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
	                    </div>
	                </div>
	                <!-- 피드 내용-->
	                <div class='col-sm-6'>
	                	
	                	<!-- 피드 본문 -->
	                    <div align = 'left' id ='collapseExample${feed.feedNo}'>${fn:replace(feed.content,enter,"<br>")}</div>
	                    
	                    <!--  해시 태그 -->
	                    <div class = 'tag' align = 'left'>${feed.tag}
	                    
	                    <!-- 좋아요 댓글 정보 -->
	                    <%
	                    	int fdn = (int)request.getAttribute("fdn");
	                    	int cnt = fldao.feedLikeShow(fdn).size();
	                    	int comCnt = fcdao.feedCommentShow(fdn).size()+fccdao.feedCoCommentShowByFeedNo(fdn).size();
	                    %>
	                    <div align = 'left'><span id ='like${feed.feedNo}'>좋아요 <%= cnt %></span> <span id ='comCnt${feed.feedNo}'>댓글 <%= comCnt%></span></div>
	                    
	                    <!--  피드 댓글 창 -->
	                    <div class = 'comment'  id ='comment${feed.feedNo}'>
	                    </div>
	                    
	                    <!-- 피드 배너 -->
	                    <div class = 'navbar like-com-scr-bar'>
	                    	<%
	                    		boolean check = fldao.feedLikeMark(new FeedLikeDTO(fdn,nick));
	                    		boolean checkS = sdao.scrapMark(new ScrapDTO(null,fdn,null,nick));
	                    	
	                    		if (check) {
	                    			pageContext.setAttribute("check",1);
	                    		} else {
	                    			pageContext.setAttribute("check",0);
	                    		}
	                    		
	                    		if (checkS) {
	                    			pageContext.setAttribute("checkS",1);
	                    		} else {
	                    			pageContext.setAttribute("checkS",0);
	                    		}
	                    		
	                    		
	                    	%>
	                    	<div id = 'likeCheck${feed.feedNo}'>
		                    	<c:choose>
		                    		<c:when test="${check==1}">
		                    			<button onclick='likeDelete(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")'><i class = 'fa fa-paw lcs'> 좋아요</i></button>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<button onclick='like(${feed.feedNo},"#like${feed.feedNo}","#likeCheck${feed.feedNo}")'><i class = 'fal fa-paw lcs'> 좋아요</i></button>
		                    		</c:otherwise>
		                    	</c:choose>
	                    	</div>
	                    	<div id = 'comLoad${feed.feedNo}'>
	                        	<button onclick='feedComLoad(${feed.feedNo},"${nick}","#comment${feed.feedNo}","#comLoad${feed.feedNo}")'><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>
	                        </div>
	                        
	                        <div id ='scrap${feed.feedNo}'>
	                        	<c:choose>
	                        		<c:when test="${checkS==1}">
	                        			<button onclick ='scrapDelete(${feed.feedNo},"#scrap${feed.feedNo}")'><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<button onclick ='scrap(${feed.feedNo},"#scrap${feed.feedNo}")'><i class = 'bi bi-bookmark lcs'> 스크랩</i></button>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
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
    
	<script type='text/javascript'>
		
		// 좋아요 개수 세기
		function likeCount(feedNo,id){
			 $.ajax({
				async: false,
			    url: "FeedLikeCountCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	console.log(id);
		        	$(id).html("좋아요 " + result);
		        	console.log($(id).html);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 체크
		function likeCheck(feedNo,id){
			 $.ajax({
				async: false,
			    url: "FeedLikeCheckCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	if (result == 0) {
		        		console.log("안좋은데..");
		        		$(id).html("<button onclick='like("+feedNo+","+'"#like'+feedNo+'","#likeCheck'+feedNo+'")'
		        				+"'><i class = 'fal fa-paw lcs'> 좋아요</i></button>");
		        	} else {
		        		console.log("좋아요♥");
		        		$(id).html("<button onclick='likeDelete("+feedNo+","+'"#like'+feedNo+'","#likeCheck'+feedNo+'")'
		        				+"'><i class = 'fa fa-paw lcs'> 좋아요</i></button>");
		        	}
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 누르기
		function like(feedNo,id1,id2){
			 $.ajax({
			    url: "FeedLikeCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	likeCount(feedNo,id1);
		        	likeCheck(feedNo,id2);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 좋아요 취소
		function likeDelete(feedNo,id1,id2){
			 $.ajax({
			    url: "FeedLikeDeleteCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	likeCount(feedNo,id1);
		        	likeCheck(feedNo,id2);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 체크
		function scrapCheck(feedNo,id){
			 $.ajax({
				async: false,
			    url: "ScrapCheckCon.do",
			    type: "post",
		        data: { feedNo: feedNo },
		        dataType : 'json',
		        success: function(result) {
		        	if (result == 0) {
		        		$(id).html("<button onclick ='scrap("+feedNo+',"#scrap'+feedNo+'")'+"'><i class = 'bi bi-bookmark lcs'> 스크랩</i></button>");
		        	} else {
		        		$(id).html("<button onclick ='scrapDelete("+feedNo+',"#scrap'+feedNo+'")'+"'><i class = 'bi bi-bookmark-fill lcs'> 스크랩</i></button>");
		        	}
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 하기
		function scrap(feedNo,id){
			 $.ajax({
			    url: "ScrapCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	scrapCheck(feedNo,id);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 스크랩 취소하기
		function scrapDelete(feedNo,id){
			 $.ajax({
			    url: "ScrapDeleteCon.do",
			    type: "post",
		        data: { feedNo: feedNo
		        },
		        dataType : 'json',
		        success: function(result) {
		        	scrapCheck(feedNo,id);
		        },
			    error: function() {
		    		console.log("err");
		    	}
			});
		};
		
		// 댓글 & 대댓글 개수 세기
		function feedComCount(feedNo,id) {
			$.ajax({
				url: "FeedComCountCon.do",
				type: "post",
				data: {feedNo: feedNo},
				dataType: 'json',
				success: function(result) {
					$(id).html("댓글 "+result);
				},
				error: function(){
					console.log("err");
				}
			});
		};
		

		// 댓글 새로고침
		function feedComLoad(feedNo,nick,id,id2) {
			$(id).load("temp.jsp #tempComment",{feedNo:feedNo, nick:nick});
			$(id2).html("<button onclick='feedComClear("+feedNo+","+'"'+nick+'"'+","+'"#comment'+feedNo+'","#comLoad'+feedNo+'")'+"'><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>");
		}
		
		// 댓글 창 비우기
		function feedComClear(feedNo,nick,id,id2) {
			$(id).empty();
			$(id2).html("<button onclick='feedComLoad("+feedNo+","+'"'+nick+'"'+","+'"#comment'+feedNo+'","#comLoad'+feedNo+'")'+"'><i class = 'bi bi-chat-dots lcs'> 댓글</i></button>");
		}
		
		// 댓글 작성
		function feedComCreate(feedNo,nick,id1,id2,id3,id4) {
			var text = $(id1).val();
			$.ajax({
				url: "FeedCommentCreateCon.do",
				type: "post",
				data: {feedNo: feedNo, text: text},
				dataType: 'json',
				success: function(result) {
					feedComCount(feedNo,id2);
					feedComLoad(feedNo,nick,id3,id4);
				},
				error : function(){
					console.log('err');
				}
			});
		};
		
		// 댓글 삭제
		function feedComDelete(feedNo,fcNo,nick,id,id2,id3) {
			$.ajax({
				url: "FeedCommentDeleteCon.do",
				type: "post",
				data: {fcNo: fcNo},
				dataType: 'json',
				success: function(result) {
					feedComCount(feedNo,id);
					feedComLoad(feedNo,nick,id2,id3);
				},
				error : function(){
					console.log('err');
				}
			});
		};
		
		// 대댓글 작성
		function feedCoComCreate(fcNo,feedNo,nick,id1,id2,id3,id4) {
			var text = $(id1).val();
			$.ajax({
				url: "FeedCoCommentCreateCon.do",
				type: "post",
				data: {fcNo: fcNo, feedNo:feedNo, text: text},
				dataType: 'json',
				success: function(result) {
					feedComCount(feedNo,id2);
					feedComLoad(feedNo,nick,id3,id4);
				},
				error : function(){
					console.log('err');
				}
			});
		};
		
		// 대댓글 삭제
		function feedCoComDelete(feedNo,coNo,nick,id,id2,id3) {
			$.ajax({
				url: "FeedCoCommentDeleteCon.do",
				type: "post",
				data: {coNo: coNo},
				dataType: 'json',
				success: function(result) {
					feedComCount(feedNo,id);
					feedComLoad(feedNo,nick,id2,id3);
				},
				error : function(){
					console.log('err');
				}
			});
		};
		
		// 스크롤이 끝까지 내려오면 다음 3개의 피드 로드
		
		var num1 = 1;
		var nick1 = "<c:out value='${nick}'/>";
		
		$(window).scroll(function() {
			if(Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()){
				$.ajax({
					url: "FeedCountCon.do",
					type: "post",
					data: {nick: nick1},
					dataType: 'json',
					success: function(result) {
						num1 += 3;
						if(result >= num1){
							console.log(num1);
							$("body").append("<div class = 'container out load' id = 'load"+num1+"''></div>");
							$("#load"+num1).load("feedSub.jsp #reload",{nick: nick1,startNum: num1});
						}
					},
					error : function(){
						console.log('err');
					}
				});
			}
		});
	</script>
</body>
</html>
