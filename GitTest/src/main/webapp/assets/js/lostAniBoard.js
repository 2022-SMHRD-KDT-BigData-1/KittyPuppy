//유실, 유기동물 게시판 페이지
// 필요 기능
// 모달 창 켜기/끄기 

// 모달 창 켜기
const modal = document.getElementById("modal");
const search = document.getElementById("search");

search.addEventListener("click", e => {
    modal.style.display = "flex";
});


// 모달 창 끄기 1. x 버튼 누르기  2. 모달 바깥 영역 클릭

//1. x 버튼 누르기
const back = modal.querySelector(".back");

back.addEventListener("click", e => {
    modal.style.display = "none";
});

//2. 모달 바깥 영역 클릭
modal.addEventListener("click", e => {
    const evTarget = e.target;
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none";
    }
}); 