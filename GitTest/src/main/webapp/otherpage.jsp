<%@page import="com.kittypuppy.model.MemberDTO"%>
<%@page import="com.kittypuppy.model.MemberDAO"%>
<%@page import="com.kittypuppy.model.FollowDAO"%>
<%@page import="com.kittypuppy.model.FeedDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kittypuppy.model.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>KittyPuppy</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap" rel="stylesheet">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://bootsnipp.com/dist/bootsnipp.min.css" crossorigin="anonymouse">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <!-- Custom styles for this template -->
    <link href="narrow-jumbotron.css" rel="stylesheet">
    
    <!-- css 파일 -->
	<link rel="stylesheet" href="./assets/css/otherpage.css">

</head>
<body>
    
    <!-- 키티퍼피 로고 -->
    <div class="header-logo">
        <i class="bi bi-exclamation-octagon-fill hidden"></i>
        <h1 class="text-center">KittyPuppy</h1>
        <a href =''><i class="bi bi-exclamation-octagon-fill report"></i></a>
    </div>
        
    <br>
    <!-- 상단 고정된 메뉴바 -->
    <div class='text-center banner header-menu'>
        <a><i class = "bi bi-phone icon"></i></a>

        <a><i class="bi bi-megaphone icon"></i></a>

        <a><i class="bi bi-geo-alt icon"></i></a>

        <a><i class="bi bi-person icon"></i></a>

        <a><i class = "bi bi-chat-dots icon"></i></a>
    </div>
    
    <%
    	// 다른사람의 프로필 이미지를 눌렀을때 get방식으로 담겨오는 nick을 받아주는 것
    	String otherNick = request.getParameter("nick");
    	request.setAttribute("otherNick", otherNick);
    	
   		FeedDAO feed = new FeedDAO();
   		ArrayList<FeedDTO> feedList = feed.feedSelect(otherNick);
   		
   		
   		FollowDAO follow = new FollowDAO();
   		// 나를 팔로우 하는 사람들
   		ArrayList<String> followerList = follow.followerShow(otherNick);
   		// 내가 팔로잉중인 사람들
   		ArrayList<String> followingList = follow.followingShow(otherNick);
   		
   		MemberDAO dao = new MemberDAO();
   		MemberDTO otherMember = dao.memberInfo(otherNick);
   		
   		MemberDTO member = (MemberDTO)session.getAttribute("member");
   		
    %>


    <!-- 상단 로고,메뉴바 밑의 내용들 담고 있는 컨테이너 -->
    <div class="container out">
    
        <!-- 프로필 사진, 게시물, 팔로워 팔로잉 -->
        <div class="container profile">
            
            <span class="item img ">
            <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail img-fluid float-start" alt="프로필 사진 추가">
            </span>
           
            <!-- <div class="container profile-in text-center"> -->
                <div class="item post">
                    <%=feedList.size()%><br>
                    게시물
                </div>

                <div class="item follower">
                    <%=followerList.size()%><br>
                    팔로워
                </div>

                <div class="item following">
                    <%=followingList.size()%><br>
                    팔로잉
                </div>
            

                <!-- 닉네임, 프로필 소개글 -->
                
                <div class="item nick text-start mt-2 mx-2"><%=otherNick%></div>
                
                
                <div class="item intro text-start mb-2 mx-2"><%=otherMember.getProfile()%></div>
                
            
            
            
                <!-- 팔로우, 메세지 버튼 -->
                <div class="item update" id="followCheck">
                	<%
                		boolean check = follow.followMark(member.getNick(), otherNick);
                	
                		if(check){
                			pageContext.setAttribute("check", 1);
                		}else{
                			pageContext.setAttribute("check", 0);
                		}
                	%>
                	<c:choose>
                		<c:when test="${check==0}">
                			<button onclick='follow()'type="button" class="btn me-1 follow">팔로우</button>
                		</c:when>
						<c:otherwise>
							<button onclick='followDelete()'type="button" class="btn me-1 follow">팔로우</button>
						</c:otherwise>                		
                	</c:choose>
                </div>
                <div class="item write">
                    <button type="button" class="btn ms-1 message" onclick="location.href='' ">메세지</button>
                </div>
            <!-- </div> -->
        </div>
        <br>

        <!-- 반려동물 사진, 추가등록 버튼 -->
        <div class="animal row">
            <div class="col-auto">
                <a><img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail animal float-start" alt="프로필 사진 추가"></a>
            </div>   
            <div class="col-auto">
                <a href="aniJoin.jsp"><img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png" class="rounded-circle img-thumbnail animal float-start" alt="프로필 사진 추가"></a>
            </div>
        </div>
    
        <hr>

    </div>
    
    <div class="tab-content">
    	<!-- 스토리 : 내 피드 -->
                <% 
                	for(int i = 0; i < feedList.size(); i++){ 
                	String carouselid = "carouselExampleControls";
                	carouselid += i;
                	request.setAttribute("feedNO", feedList.get(i).getFeedNo());
                %>
						
               	
				<div class="row mt-3 text-center">
					<div class="row justify-content-center">
						<div class="d-grid gap-sm-1 col-sm-6">
							<!-- 게시자 정보 -->
							<div class='col-6'>
								<img
									src="https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049_960_720.png"
									class="rounded-circle img-thumbnail feed img-fluid float-start">
								<div align="left">
									<strong><%=feedList.get(i).getNick() %></strong><br />
									<%=feedList.get(i).getFeedDate() %>
								</div>
							</div>
							<!-- 첨부된 사진-->
							<div id="<%=carouselid %>"  class="carousel slide"
                            data-bs-interval="false">
								<div class="carousel-inner">
									<%
		                            	String src = feedList.get(i).getPicAddress();
		                            	String[] srclist = src.split(",");
		                            	String item = null;
		                            	
		                            	for(int j = 0; j < srclist.length; j++){
		                            		if(j == 0){
		                            			item = "carousel-item active";
		                            		}else{
		                            			item = "carousel-item";
		                            		}
                            		%>
                            	
									<div class="<%= item %>" style="max-width:500px; max-height:500px;">
										<img src="<%=srclist[j] %>" class="d-block w-100" alt="...">
									</div>
									
									<% } %>
								</div>
								<% carouselid = "#" + carouselid; %>
								<button class="carousel-control-prev" type="button"
									data-bs-target="<%=carouselid %>" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="<%=carouselid %>" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

						</div>
						<!-- 피드 내용-->
						<div class="col-sm-6">
							<div align='left'>
								<%=feedList.get(i).getContent() %>
								<button class='info feed-bt' onclick='more()'>더보기</button>
							</div>
							<div class="tag" align="left"><%=feedList.get(i).getTag() %></div>
							<div align='left'>
								좋아요 10 댓글 10
								<button class='info feed-bt' onclick='entire()'>전체보기</button>
							</div>
							<div>
								<button class="feed-bt">
									<i class='fa fa-paw lcs' onclick='like()'> 좋아요</i>
								</button>
								<!-- <button><i class = 'fal fa-paw lcs' onclick = 'likedelete()'> 좋아요</i></button> -->
								<button class="feed-bt">
									<i class="bi bi-chat-dots lcs" onclick='comment()'> 댓글</i>
								</button>
								<button class="feed-bt">
									<i class="bi bi-bookmark-fill lcs" onclick='scrap()'> 스크랩</i>
								</button>
								<!-- <button><i class = "bi bi-bookmark lcs" onclick = 'scrapdelete()'> 스크랩</i></button> -->
							</div>
						</div>
					</div>
				</div>
				<% } %>
    </div>



     <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
    
    <script src='jquery-3.6.0.min.js'></script>
    <script>
    	
    	// 팔로우 체크
    	function followCheck(){
    		$.ajax({
    			async: false,
				url: "Follow"    			
    		});
    		
    	};
    
    </script>
</body>
</html>