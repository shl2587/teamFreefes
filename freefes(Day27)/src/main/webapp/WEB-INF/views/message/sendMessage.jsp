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
/* 폼 컨테이너 스타일 */
.sendAll {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	text-align: center; /* 중앙 정렬 */
	background-color: #f4f4f4;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 1000px;
}

/* 입력 필드 스타일 */
.sendAll input[type="text"], .sendAll select {
	width: 95%;
	padding: 15px 5px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 20px;
}

/* 컨텐츠 칸 스타일 */
.sendAll textarea {
	width: 100%;
	padding: 10px 1px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	resize: vertical; /* 세로 크기 조정 허용 */
	min-height: 150px;
	margin-bottom: 15px; /* 최소 높이 지정 */
}

/* 버튼 스타일 */
.sendAll input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

/* 버튼 호버 효과 */
.sendAll input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
<div class="listM">
	<a href="${cpath }/message/listMessage/${login.idx}">전체 쪽지 목록</a> <a
		href="${cpath }/message/sendMessage_List/${login.idx}">보낸 쪽지 목록</a> <a
		href="${cpath }/message/recievedMessage_List/${login.idx}">받은 쪽지
		목록</a> <a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a>
</div>
<br>

<div class="sendAllA">
	<form method="POST" id="aaaa">
		<div class="sendAll">
			<input type="hidden" name="writer" value="${login.idx }"> <input
				id="receiver_nickname" type="text" name="receiver_nickname"
				placeholder="받는 사람의 닉네임"> <input id="title" type="text"
				name="title" placeholder="제목(15자 이하)">
			<textarea id="content" name="content" placeholder="내용 (300자 이하)"></textarea>
			<select id="category" name="category">
				<option value="qna/user">문의글/계정</option>
				<option value="qna/event">문의글/행사</option>
				<option value="etcetera">기타</option>
				<option value="nickname">닉네임</option>
			</select> <input type="submit" value="메세지 보내기">
		</div>
	</form>
</div>

</body>
</html>

<script>
var receiverInput = document.getElementById("receiver_nickname");
var titleInput = document.getElementById("title");
var contentInput = document.getElementById("content");
var aaaa = document.getElementById("aaaa");
// 추가 검증 함수 정의
    async function isValidreceiver(receiver) {
       alert('들어오냐?')
        const url1 = '${cpath}/receiver_nickname/' + receiver;
        const count1 = await fetch(url1).then(resp => resp.text())
        alert('count1 :' + count1)
        return count1
 }
           async function isValidTitle(title) {
                alert('들어오냐? 제목에?')
                const url2 = '${cpath}/isValidTitle/' + title;
                const count2 = await fetch(url2).then(resp => resp.text())
                alert('count2 :' + count2)
                return event.preventDefault()
            }

                async function isValidContent(content) {
                    alert('들어오냐? 내용에?')
                    const url3 = '${cpath}/isValidContent/' + content;
                    const count3 = await fetch(url3).then(resp => resp.text())
                    alert('count3 :' + count3)
                    return event.preventDefault()
                }
   
    async function submitHandler(event) {
        event.preventDefault(); // 여기서 event 객체를 받아옵니다.
        alert('다시');
        

        // 각 필드값이 비어있는지 확인
        if (receiverInput.value.trim() === "" || titleInput.value.trim() === "" || contentInput.value.trim() === "") {
            alert("모든 필드를 채워주세요.")
            return; // event.preventDefault() 대신에 return을 사용하여 이벤트를 중지합니다.
        } else {
            alert ('ㅁㄴㅇㄹ : ' + receiverInput.value)
            if (await(isValidreceiver(receiverInput.value))==0) { // await 추가
                alert("받는 사람의 닉네임이 올바르지 않습니다.")
                event.preventDefault(); // 이벤트를 중지하지 않는다.
                return
            }
            // 추가 검증을 수행하고 필요한 경우 오류 메시지 표시
            if (await(isValidTitle(titleInput.value))==0) {
                alert("제목은 15자 이하로 입력해주세요.")
                event.preventDefault() // 이벤트를 중지하지 않는다.
                return
            } 
              if (await(isValidContent(contentInput.value))==0) {
                alert("내용은 300자 이하로 입력해주세요.")
                event.preventDefault() // 이벤트를 중지하지 않는다.
                return
            }  
              else {
                alert("쪽지를 보내기를 완료하였습니다.");
                window.location.href='../message/listMessage'
            }
        }
        event.target.submit()
    }
    aaaa.addEventListener("submit", submitHandler)

    
</script>
