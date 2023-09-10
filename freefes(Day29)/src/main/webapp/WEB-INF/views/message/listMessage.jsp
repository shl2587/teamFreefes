<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
.listM {
	display: flex;
	justify-content: space-around;
	background-color: #07277d; /* 배경색을 원하는 색상으로 지정하세요 */
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
table.listMessage_table_all {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

th.listMessage_table_th, td.listMessage_table_td {
	padding: 10px;
	text-align: center; /* 가로 중앙 정렬 */
	border-bottom: 1px solid #ddd;
	vertical-align: middle; /* 세로 중앙 정렬 */
}

th.listMessage_table_th {
	background-color: #f2f2f2;
}
tr > td.listMessage_table_td > div {
	height: 30px;
	margin: 0px;
}
td.listMessage_table_td > div {
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가로 중앙 정렬 */
	height: 100%;
}

.tr > td.listMessage_table_td > div {
	height: 30px;
}

/* 쪽지 항목 스타일 */
.listMessage_item_one {
	padding: 5px;
}

.listMessage_title {
	font-weight: bold;
}

.listMessage_Receiver, .listMessage_writer {
	font-style: italic;
}

.listMessage_category {
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
@keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0.3;
    }
    100% {
        opacity: 1;
    }
}

.blinking {
    animation: blink 1s infinite;
}
.message_modal_btn_bye {
    display: flex;
    justify-content: center; /* Horizontal centering */
    align-items: center; /* Vertical centering */
}

#close {
    background-color: #07277d; /* Button background color */
    color: white; /* Button text color */
    border: none;
    padding: 10px 20px; /* Button padding */
    cursor: pointer;
    font-size: 10px;
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s ease; /* Smooth hover effect */
    width: 150px;
}
#close:hover {
    background-color: #0056b3; /* Hover background color */
}
/* Button Base Style */
.message_delete_button {
    padding: 5px 10px;  /* 내부 여백 */
    background-color: #f44336;  /* 배경색 - 빨간색 */
    border: none;  /* 테두리 제거 */
    border-radius: 3px;  /* 모서리 둥글게 */
    color: white;  /* 글자색 - 흰색 */
    font-size: 11px;  /* 글자 크기 */
    cursor: pointer;  /* 마우스를 올렸을 때 커서 모양 변경 */
    transition: background-color 0.3s ease;  /* 배경색 효과 */
    display: flex;  /* Flexbox 사용 */
    align-items: center;  /* 아이콘과 텍스트 수직 중앙 정렬 */
    margin-bottom: 3px;
    margin-top: 3px;
}

/* Hover Effect */
.message_delete_button:hover {
    background-color: #d32f2f;  /* 마우스를 올렸을 때의 배경색 - 진한 빨간색 */
}

/* Active Effect (when the button is clicked) */
.message_delete_button:active {
    background-color: #b71c1c;  /* 버튼을 클릭했을 때의 배경색 - 더 진한 빨간색 */
}

/* Icon Style */
.message_delete_button .icon {
    margin-right: 5px;  /* 아이콘과 텍스트 사이의 여백 */
}
</style>

<div class="listM">
	<a href="${cpath }/message/listMessage/${login.idx}">전체 쪽지 목록</a> <a
		href="${cpath }/message/sendMessage_List/${login.idx}">보낸 쪽지 목록</a> <a
		href="${cpath }/message/recievedMessage_List/${login.idx}">받은 쪽지 목록</a> 
		<a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a>
</div>


<div class="deleteM">
	<button class="message_delete_button" data-idx="${dto.idx}">삭제하기🗑️</button>
</div>


<table class="listMessage_table_all">
	<thead>
		<tr>
			<th class="listMessage_table_th"><input type="checkbox" class="message-checkbox_All"
				data-idx="${dto.idx}"></th>
			<th class="listMessage_table_th">제목</th>
			<th class="listMessage_table_th">내용</th>
			<th class="listMessage_table_th">받는 이</th>
			<th class="listMessage_table_th">보낸이</th>
			<th class="listMessage_table_th">카테고리</th>
			<th class="listMessage_table_th">날짜</th>
			<th class="listMessage_table_th">읽음 여부</th>
		</tr>
	</thead>

	<c:forEach var="dto" items="${list}">
		<tr class="message-row" data-title="${dto.title}"
			data-content="${dto.content}" data-idx="${dto.idx}"
			data-Receiver="${dto.receiver_nickname}"
			data-writer="${dto.writer_nickname}" data-category="${dto.category}"
			data-date="${dto.date_column}" date-result="${dto.result }"
			data-special="${dto.writer != login.idx && dto.result != 1}">
			<td class="listMessage_table_td"><input type="checkbox" class="message-checkbox" data-idx="${dto.idx}"></td>
			<td class="listMessage_table_td">
				
				<div class="listMessage_item_one">
					<div class="listMessage_title">${dto.title}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_content">${dto.content}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_Receiver">${dto.receiver_nickname}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_writer">${dto.writer_nickname}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_category">${dto.category}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_date">${dto.date_column}</div>
				</div>
			</td>
			<td class="listMessage_table_td">
				<div class="listMessage_item_one">
					<div class="listMessage_result">
<%-- 						${dto.result} --%>
						<c:if test="${dto.writer != login.idx}">
							<c:if test="${dto.result != 1}">
                	<span class="blinking" style="font-size: 20px; display: flex; align-items: center;"><div>🆕</div></span>
            </c:if>
							<c:if test="${dto.result == 1}">
                	📭
            </c:if>
						</c:if>
						<c:if test="${dto.writer == login.idx}">
                		📨
						<c:if test="${dto.receiver == login.idx}">
						➡↩️
						</c:if>
        		</c:if>
					</div>
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
			<strong>받는 이:</strong> <span id="messageReceiver"></span>
		</p>
		<p>
			<strong>카테고리:</strong> <span id="messageCategory"></span>
		</p>
		<p id="messageText"></p>
		<div class="message_modal_btn_bye"><button id="close">메세지 닫기</button></div>
	</div>
</div>

</body>
</html>

