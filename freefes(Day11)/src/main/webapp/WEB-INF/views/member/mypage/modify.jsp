<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>
<%@include file="../../header.jsp" %>

로그인 유저 : ${login.userid }

<div class="item">
	<img src="${login.profile_img }" width="200">
</div>

<form method="POST" enctype="multipart/form-data" >

<p>
	<div class="img">
	<input type="file" name="upload" multiple> 
	<input type="hidden" value="${login.upload }">
	</div>
</p>

<div class="pw">
<p>
    <input type="password" id="userpw" name="userpw" placeholder="비밀번호" style="display: none;">
    <input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호" style="display: none;">
    <span id="passCheckMessage"></span>
    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="새 비밀번호 확인" style="display: none;">
    <input type="hidden" id="sessionId" name="sessionId" value="${login.userid }">
    <input type="button" id="passwd_bye" name="passwd_bye" value="취소하기"  style="display: none;">
    <input type="button" id="passwd_change1" name="passwd_change" value="이메일 변경하기1">
    <input type="button" id="passwd_change2" name="passwd_change2" value="비밀번호변경" style="display: none;">
    <input type="hidden" id="idx" value="${login.idx }">
		
</p>
</div>
		<input type="hidden" value="${login.userpw }"> 

<p>
	<input type="text" name="nickname" value="${login.nickname }" >
	<input type="hidden" value="닉네임 변경"> 
	<input id="nickNameCheckBtn" type="button" value="닉네임 중복확인">
	<br>
	<span id="nickCheckMessage"></span>
	
</p>
	
<p>
	<input type="text" name="phonenumber" placeholder="연락처 수정" >
	<input type="hidden" value="${login.phonenumber }"> 
	
</p>

<p>
	<input type="text" name="address" placeholder="주소 변경" >
	<input type="hidden" value="${login.address }"> 
</p>

<p>
	<input type="submit" value="수정">
</p>
</form>

<script>
	const passCheckMessage = document.getElementById('passCheckMessage');
	const newPassword = document.querySelector('input[name="newPassword"]')
	passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
	passCheckMessage.style.color = 'black';
	
	async function passCheckHandler(){
		
		if(userpw.value == ''){
			passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
			passCheckMessage.style.color = 'black';
			return
		}
		const url = '${cpath}/passCheck/' + userpw.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count == 0) {
			passCheckMessage.innerText = '대소영문자와 특수문자 숫자를 포함하지 않았습니다.'
			passCheckMessage.style.color = 'red'
		}
		else if(count == -1){
			passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.'
			passCheckMessage.style.color = 'red'
		}
		else{	// count 값이 0이 아닌 값이 들어가기 때문에 실행이 되고 있음
			passCheckMessage.innerText = '비밀번호 사용 가능합니다.'
			passCheckMessage.style.color = 'blue'
		}
	}
	  // "input" 이벤트에 함수 연결
    newPassword.addEventListener('input', passCheckHandler);
	
</script>

<script>
function showPasswordFields() {
    // 비밀번호 필드와 새 비밀번호 필드를 보이도록 설정
    document.getElementById('userpw').style.display = 'block';
    document.getElementById('passCheckMessage').style.display = 'block';
    document.getElementById('newPassword').style.display = 'block';
    document.getElementById('confirmPassword').style.display = 'block';
    document.getElementById('passwd_bye').style.display = 'inline'; // 'block' 대신 'inline'으로 변경
    document.getElementById('passwd_change1').style.display = 'none'; // '비밀번호 변경하기' 버튼 숨김
    document.getElementById('passwd_change2').style.display = 'block'; // '비밀번호 변경하기2' 버튼 나타남
}

function hidePasswordFields() {
    // 비밀번호 필드와 새 비밀번호 필드를 숨김
    document.getElementById('userpw').style.display = 'none';
    document.getElementById('newPassword').style.display = 'none';
    document.getElementById('passCheckMessage').style.display = 'none';
    document.getElementById('confirmPassword').style.display = 'none';
    document.getElementById('passwd_bye').style.display = 'none'; // 'block' 대신 'none'으로 변경
    document.getElementById('passwd_change1').style.display = 'block'; // '비밀번호 변경하기' 버튼 나타남
    document.getElementById('passwd_change2').style.display = 'none'; // '비밀번호 변경하기2' 버튼 숨김
}

// 초기에 "passwd_change2" 버튼를 숨김
document.getElementById('passwd_change2').style.display = 'none';
document.getElementById('passCheckMessage').style.display = 'none';

// "비밀번호 변경하기" 버튼 클릭 이벤트 처리
document.getElementById('passwd_change1').addEventListener('click', showPasswordFields);

// "취소하기" 버튼 클릭 이벤트 처리
document.getElementById('passwd_bye').addEventListener('click', hidePasswordFields);
</script>

<script>

const passwd_change2 = document.getElementById('passwd_change2')
const sessionId = document.getElementById('sessionId').value

async function passwd_change2Handler(event){
	event.preventDefault()
	const userpw = document.querySelector('input[name="userpw"]')
	const newPassword = document.querySelector('input[name="newPassword"]')
// 	const confirmPassword = document.querySelector('input[name="confirmPassword"]')
	
	const url = '${cpath}/userpwsam/' + userpw.value
	const count = await fetch(url).then(resp => resp.text())
	console.log('Count:', count); // 콘솔 로그 추가
	
	if(count != 0){
		console.log('이 안에는 들어오나?')
		const ob = {
			userid: sessionId,
			userpwNew: newPassword.value,
		}
		console.log('User Id',ob.userid)
		console.log('User pwNew',ob.userpwNew)
		
		 const url2 = '${cpath}/userpwNew'
		 const opt = {
				 method: 'POST',
				 body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		 }
		 const result = await fetch(url2, opt).then(resp => resp.json())
			if(result.status == false) {
				alert('계정 정보를 다시 확인해주세요')
				return
			}
	}
	else{
		alert('이전비밀번호와 일치하지 않습니다')
	}
}
passwd_change2.addEventListener('click', passwd_change2Handler)
passwd_change2.addEventListener('mousedown', () => {
	passwd_change2Handler();
});

</script>

<script>
	const nickNameCheckBtn = document.getElementById('nickNameCheckBtn');
	
	async function nickNameCheckHandler() {
		const nickCheckMessage = document.getElementById('nickCheckMessage');
		const nickname = document.querySelector('input[name="nickname"]')
		
		const url = '${cpath}/nicknNameCheck/'+nickname.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count != 0) {
			nickCheckMessage.innerText = '닉네임이 중복됩니다!'
			nickCheckMessage.style.color = 'red'
		}
		else if (count == 0){
			nickCheckMessage.innerText = '닉네임을 사용할 수 있습니다.'
			nickCheckMessage.style.color = 'blue'
		}
	}
	nickNameCheckBtn.addEventListener('click', nickNameCheckHandler)
	nickNameCheckBtn.addEventListener('mousedown', () => {
	// 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
	nickNameCheckHandler();
	});
</script>
</body>
</html>