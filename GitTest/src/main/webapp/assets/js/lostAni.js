// 유실, 유기동물 정보 '자세히 보기' 페이지
// 보기페이지 아래에 현재 댓글 수와 댓글 작성 창, 댓글이 바로 나오고, 
// 맨 아래 댓글 아이콘과 게시글 수정 아이콘이 있음
// 댓글 아이콘을 클릭하면 현재 댓글, 댓글 작성창이 나타남.(ajax)

// <page작성시 페이지에서 작성할 기능>
// 댓글 작성창, 댓글 보여지는 스크롤 창 필요
// jsp 페이지에서 DAO가져오고 반복 출력
// 게시글과 댓글의 작성자에게만 삭제 가능한 x 버튼 만들기

// 1. 댓글 개수 보기 (dao댓글 가져와서 -> 개수 반환)
// 2. 댓글 작성 db 저장 기능
// 3. 작성시 댓글만 ajax 새로고침
// 


// 1. 댓글 개수 보기 (dao댓글 가져와서 -> 개수 반환)
function lostCommentCnt(){
    $.ajax({
        type: "post",
			data: { "lostNo": $('#lostNo').html() }, 
            // lostNo 값을 담은 id가 필요함. 방법을 못 찾을 경우, 
            // <span id="lostNo" style="display:none">${lostNo}</span>만들기
			
            url: "LostCommentCntCon.do",
			dataType: "text",
			success: function(data) {
                
                // <#lostComCnt></> 
				let comCnt = $('#lostComCnt').html(data);
                if(comCnt>0){
                    $('#lostComCnt').html("댓글"+data+"개");
                }else{
                    $('#lostComCnt').html("댓글 없음");
                }
			},
			error: function() {
				alert("ajax실패!");
			}
		});
}

// 2. 댓글 작성 db 저장 기능
function lostCommentCreate(){
    $.ajax({
        type: "post",
			data: { "lostComContent": $('#lostComContent').html(),
                    "lostNo": $('#lostNo').html()}, 
            url: "LostCommentCreateCon.do",
			dataType: "text",
			success: function(data) {
                alert(data);
			},
			error: function() {
				alert("ajax실패!");
			}
		});
}

// 3. 작성시 댓글만 ajax 새로고침
// 참고 링크 : 코드 작성중
//https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=hyss-jts&logNo=221193337644
function lostCommentRenew(){
    $.ajax({
        type: "post",
			data: {"lostNo": $('#lostNo').html()}, 
            url: "LostCommentCreateCon.do",
			dataType: "text",
			success: function(data) {
                alert(data);
			},
			error: function() {
				alert("ajax실패!");
			}
		});

}
