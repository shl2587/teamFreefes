<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>고객센터  / 자주 묻는 질문</h3>
<hr>

<details>
	<summary></summary>
	<fieldset>
		<legend>자주묻는 질문 하위 아이템 조절</legend>
		로그인, 비밀번호, 행사, 마일리지 관련해서 자주묻는 질문 클릭을 없애고 hover만 남길것인지..<br>
		아니면 클릭해서 들어오면 세부적으로 메뉴바를 하나 더 만들어 둬서 인터페이스를 만질 것인지. 선택<br>
		목록을 버튼으로 만들어 클릭 시 모달로 만들어도 ㄱㅊ
	</fieldset>
</details>


<div id="container"></div>
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
    
    
    
    
<script>
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
	
	const container = document.getElementById('container');
	const modal = document.getElementById('modal');
	const closeBtn = modal.querySelector('.close');
	
	modalInfo.forEach((info, index) => {
	    const button = document.createElement('button');
	    button.textContent = info.title;
	    button.onclick = () => modalOn(info.title, info.content);
	    container.appendChild(button);
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