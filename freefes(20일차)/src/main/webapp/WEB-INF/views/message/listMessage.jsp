<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
.listM {
	display: flex;
	justify-content: space-around;
	background-color: #0A6B0D; /* 배경색을 원하는 색상으로 지정하세요 */
	color: white; /* 텍스트 색상을 원하는 색상으로 지정하세요 */
	padding: 10px 0; /* 위아래 10px, 좌우 0px의 안쪽 여백 */
	font-weight: bold; /* 텍스트의 글꼴 굵기 */
	text-decoration: none; /* 텍스트에 밑줄 없애기 */
}

.listM a {
	color: white; /* 링크 텍스트 색상을 원하는 색상으로 지정하세요 */
	text-decoration: none; /* 링크 텍스트에 밑줄 없애기 */
}

.listM a:hover {
	text-decoration: underline; /* 링크에 마우스 호버 시 밑줄 추가 */
}
/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

/* 쪽지 항목 스타일 */
.item {
	padding: 5px;
}

.title {
	font-weight: bold;
}

.reciever, .writer {
	font-style: italic;
}

.category {
	color: #007bff; /* 링크 색상 */
}

/* 마우스 호버 시 스타일 변경 */
tr:hover {
	background-color: #f5f5f5;
}
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-height: 80%;
	overflow-y: auto;
}
</style>

<div class="listM">
	<a href="${cpath }/message/listMessage/${login.idx}">전체 쪽지 목록</a> <a
		href="${cpath }/message/sendMessage_List/${login.idx}">보낸 쪽지 목록</a> <a
		href="${cpath }/message/recievedMessage_List/${login.idx}">받은 쪽지
		목록</a> <a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a>
</div>
<br>

<div class="deleteM">
	<button class="delete-button" data-idx="${dto.idx}">삭제하기</button>
</div>

<br>
<table>
	<thead>
		<tr>
			<th><input type="checkbox" class="message-checkbox_All"
				data-idx="${dto.idx}"></th>
			<th>제목</th>
			<th>내용</th>
			<th>받는 이</th>
			<th>보낸이</th>
			<th>카테고리</th>
			<th>날짜</th>
		</tr>
	</thead>

	<c:forEach var="dto" items="${list}">
		<tr class="message-row" data-title="${dto.title}"
			data-content="${dto.content}"
			data-reciever="${dto.reciever_nickname}"
			data-writer="${dto.writer_nickname}" data-category="${dto.category}"
			 data-date="${dto.date_column}">
			<td><input type="checkbox" class="message-checkbox"
				data-idx="${dto.idx}"></td>
			<td>
				<div class="item">
					<div class="title">${dto.title}</div>
				</div>
			</td>
			<td>
				<div class="item">
					<div class="content">${dto.content}</div>
				</div>
			</td>
			<td>
				<div class="item">
					<div class="reciever">${dto.reciever_nickname}</div>
				</div>
			</td>
			<td>
				<div class="item">
					<div class="writer">${dto.writer_nickname}</div>
				</div>
			</td>
			<td>
				<div class="item">
					<div class="category">${dto.category}</div>
				</div>
			</td>
				<td>
				<div class="item">
					<div class="date">${dto.date_column}</div>
				</div>
			</td>
		</tr>
	</c:forEach>
</table>

<div id="myModal" class="modal">
	<div class="modal-content" id="messageContent">
		<!-- 쪽지 내용을 보여주는 부분 -->
		<h2 id="messageTitle"></h2>
		<p>
			<strong>보낸이:</strong> <span id="messageWriter"></span>
		</p>
		<p>
			<strong>받는 이:</strong> <span id="messageReciever"></span>
		</p>
		<p>
			<strong>카테고리:</strong> <span id="messageCategory"></span>
		</p>
		<p id="messageText"></p>
		<button id="close">창 닫기</button>
	</div>
</div>

<script>
// 모달 열기 함수
function openModal(title, content, reciever, writer, category) {
    var modal = document.getElementById('myModal')
    var messageTitle = document.getElementById('messageTitle')
    var messageWriter = document.getElementById('messageWriter')
    var messageReciever = document.getElementById('messageReciever')
    var messageCategory = document.getElementById('messageCategory')
    var messageText = document.getElementById('messageText')

    messageTitle.textContent = title
    messageWriter.textContent = writer
    messageReciever.textContent = reciever
    messageCategory.textContent = category
    messageText.textContent = content

    modal.style.display = 'block'
}

// 모달 닫기 함수
function closeModal() {
    var modal = document.getElementById('myModal')
    modal.style.display = 'none'
}

// "창 닫기" 버튼 클릭 이벤트 처리
var closeButton = document.getElementById('close')
closeButton.addEventListener('click', function() {
    closeModal()
});

// 각 행을 클릭할 때 모달 열기
var rows = document.querySelectorAll('.message-row')
for (var i = 0; i < rows.length; i++) {
    rows[i].addEventListener('click', function(event) {
        // 클릭한 요소가 체크박스인 경우 모달 열지 않음
        if (event.target.type !== 'checkbox') {
            var title = this.getAttribute('data-title')
            var content = this.getAttribute('data-content')
            var reciever = this.getAttribute('data-reciever')
            var writer = this.getAttribute('data-writer')
            var category = this.getAttribute('data-category')

            openModal(title, content, reciever, writer, category)
        }
    });
}

var deleteButtons = document.querySelectorAll('.deleteM button');
var checkboxes = document.querySelectorAll('.message-checkbox');

// 삭제 버튼 클릭 이벤트 처리
for (var i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].addEventListener('click', function() {
        // 체크된 체크박스들을 모아둘 배열
        var checkedCheckboxes = [];
        
        // 체크박스들을 반복하며 체크 여부를 확인
        for (var j = 0; j < checkboxes.length; j++) {
            if (checkboxes[j].checked) {
                checkedCheckboxes.push(checkboxes[j]);
            }
        }

        // 체크된 체크박스들을 처리
        if (checkedCheckboxes.length > 0) {
            for (var k = 0; k < checkedCheckboxes.length; k++) {
                var idx = checkedCheckboxes[k].getAttribute('data-idx');
                const url = '${cpath}/delete/' + idx;
                fetch(url).then(function (resp) {
                    if (resp.ok) {
                        return resp.text();
                    } else {
                        throw new Error('삭제 실패');
                    }
                }).then(function (count) {
                    console.log(count);
                    if(count > 0){
                    alert("삭제가 완료되었습니다");
                    location.reload();
                    }
                })
            }
        } else {
            alert("체크된 항목이 없습니다");
        }
    });
}


//체크박스 전체 선택/해제 함수
function toggleAllCheckboxes() {
    var checkboxes = document.querySelectorAll('.message-checkbox');
    var selectAllCheckbox = document.querySelector('.message-checkbox_All');

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
}

// 체크박스 전체 선택/해제 이벤트 처리
var selectAllCheckbox = document.querySelector('.message-checkbox_All');
selectAllCheckbox.addEventListener('click', function() {
    toggleAllCheckboxes();
});

</script>

</body>
</html>