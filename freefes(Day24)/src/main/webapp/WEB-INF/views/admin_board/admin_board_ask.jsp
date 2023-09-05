<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<li><a href="${cpath }/qna/${login.role >= 1 ? 'qna_board' : 'qna_list'}">1:1 문의함</a>
		<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
		<li><a href="${cpath }/admin_board/surround">주위 시설</a></li>
	</ul>
</div>



<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">고객센터   / 
	<span style="color: #537188; font-size:27px;"> 자주 묻는 질문</span>
</h3>
</div>

<hr>

<div id="answer_modal"></div>
<div id="modal" class="modalOverlay">
    <div class="modalWindow">
        <div class="title">
            <h2 id="modalTitle"></h2>
        </div>
        <div class="close">X</div>
        <div class="content">
            <p id="modalContent"></p>
        </div>
    </div>
</div>
</main>

<script>
//board_ask.jsp 자주 묻는 질문 모달 js
const modalInfo = [
    { title: "회원가입 방법", content: "홈페이지에서 회원 가입 페이지로 접속하여 진행하실 수 있습니다." },
    { title: "아이디 찾기", content: "아이디 찾기 페이지에서 진행하실 수 있습니다." },
    { title: "비밀번호 찾기", content: "비밀번호 찾기 페이지에서 이메일 인증을 통해 진행하실 수 있습니다." },
    { title: "메일인증 오류", content: "해당 메일 스팸 차단 설정 서비스 차단 여부 등을 확인해주세요." },
    { title: "계정 도용 발생", content: "특수문자를 포함한 안전한 비밀번호로 변경 후 이용해 보세요." },	    
    { title: "마일리지 관련", content: "출석을 진행하면 다양한 상품을 추첨할 수 있는 포인트를 모을 수 있습니다." },	    
    { title: "게시글 복구", content: "작성자가 삭제한 게시글에 대해서는 복구할 수 없습니다 삭제에 주의를 기울여 주세요." },	    
    { title: "공지사항 관련", content: "저희 홈페이지 이용에 관련된 내용은 공지사항을 확인해 주세요." },
    { title: "기타 문의 사항", content: "기타 문의 사항은 1:1 문의를 통해 답변 드리겠습니다." },	    
];

const answer_modal = document.getElementById('answer_modal');
const modal = document.getElementById('modal');

const closeBtn = modal.querySelector('.close');

modalInfo.forEach((info, index) => {
    const button = document.createElement('button');
    button.className = 'modal-button';	//모달 배치용 버튼 만들고..
    button.textContent = info.title;
    button.onclick = () => modalOn(info.title, info.content);
    answer_modal.appendChild(button);
});

function modalOn(title, content) {
    document.getElementById('modalTitle').textContent = title;
    document.getElementById('modalContent').textContent = content;
    modal.style.display = 'flex';
}

function isModalOn() {
    return modal.style.display === 'flex';
}

function modalOff() {
    modal.style.display = 'none';
}

closeBtn.addEventListener('click', e => {
    modalOff();
});

modal.addEventListener('click', e => {
    const evTarget = e.target;
    if (evTarget.classList.contains('modalOverlay')) {
        modalOff();
    }
});

window.addEventListener('keyup', e => {
    if (isModalOn() && e.key === 'Escape') {
        modalOff();
    }
});
</script>

   
</body>
</html>