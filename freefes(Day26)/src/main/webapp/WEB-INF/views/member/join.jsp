<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<style>
/* 기존 스타일은 그대로 유지 */
* {
  box-sizing: border-box;
}
html, body {
  height: 100%;
}
BODY {
/*   DISPLAY: FLEX; */
  MARGIN: 0;
  BACKGROUND-COLOR: #F5F6F7;
  FONT-FAMILY: -APPLE-SYSTEM, BLINKMACSYSTEMFONT, "SEGOE UI", ROBOTO, OXYGEN,
    UBUNTU, CANTARELL, "OPEN SANS", "HELVETICA NEUE", SANS-SERIF;
}
.wrap {
  height: 100vh;  /* 뷰포트 높이를 100%로 설정 */
}

.wrap .logo {
  text-align: center;
  margin-bottom: 10px;
}

.wrap .logo h1 {
  margin-bottom: 10px;
  font-size: 50px;
}
.wrap {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center;     /* 세로 중앙 정렬 */
    height: 100vh;           /* 뷰포트 높이를 100%로 설정 */
    flex-direction: column;  /* 추가: 자식 요소를 세로로 정렬 */
}

.wrap #joinFrom {
    /* 이전에 제공한 스타일 */
  padding: 50px;
   margin-bottom : 200px; /* 이용약관이 위에 헤더에 전체적으로 올라가게함*/
    background-color: #ffffff;
    border: 1px solid #dadada;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
    width: 50%;  /* 예시 폭; 원하는 폭에 따라 조정 */
}
</style>
<div class="wrap">
<div class="logo"><h1>freefes 회원가입</h1></div>

<form method="POST" id="joinFrom">
	<p>
		<input type="text" name="userid" placeholder="아이디" required onfocus>
		<br>
		<span id="dupMessage"></span>
	</p>
	
	<p>
		<input type="password" name="userpw" placeholder="비밀번호" required>
		<br>
		<span id="passCheckMessage"></span>
	</p>
	
	<p><input type="text" name="name" placeholder="이름" required></p>

	<p>생년월일<input type="date" name="birth" required></p>
	 <div class="select">
     <input type="radio" id="m" name="gender" value="m"><label for="m">남자</label>
     <input type="radio" id="w" name="gender" value="w"><label for="w">여자</label>
	</div>
	<p><input type="text" name="address" placeholder="주소" required></p>
	<p>
		<input type="text" name="nickname" placeholder="닉네임" required >
		<input id="nickNameCheckBtn" type="button" value="닉네임 중복확인">
		<br>
		<span id="nickCheckMessage"></span>
	</p>
	<p>
		<input type="email" name="email" placeholder="E-Mail" required >
		<input id="emailBtn" type="button" value="사용가능 이메일">
		<br>
		<span id="emailCheckMessage"></span>
	</p>
	<p><input type="text" name="phonenumber" placeholder="전화번호" required></p>
	<p>
		<select name="verify1">
			<option value="당신의 출신 도시는 어디인가요?">당신의 출신 도시는 어디인가요?</option>
			<option value="당신의 가장 친한 친구의 이름은 무엇인가요?">당신의 가장 친한 친구의 이름은 무엇인가요?</option>
			<option value="당신의 반려동물의 이름은 무엇인가요?">당신의 반려동물의 이름은 무엇인가요?</option>
			<option value="당신의 좋아하는 음식은 무엇인가요?">당신의 좋아하는 음식은 무엇인가요?</option>
			<option value="당신의 어릴 적 별명은 무엇인가요?">당신의 어릴 적 별명은 무엇인가요?</option>
		</select>
		<input type="text" name="answer1" placeholder="답변1">
	</p>
	<p>
		<select name="verify2">
			<option value="가장 기억에 남는 여행지는 어디인가요?">가장 기억에 남는 여행지는 어디인가요?</option>
			<option value="당신의 최애 도서나 영화는 무엇인가요?">당신의 최애 도서나 영화는 무엇인가요?</option>
			<option value="당신의 첫사랑 이름은 무엇인가요?">당신의 첫사랑 이름은 무엇인가요?</option>
			<option value="가장 기억에 남는 선물은 무엇인가요?">가장 기억에 남는 선물은 무엇인가요?</option>
			<option value="가장 기억에 남는 학창 시절의 순간은 무엇인가요?">가장 기억에 남는 학창 시절의 순간은 무엇인가요?</option>
		</select>
		<input type="text" name="answer2" placeholder="답변2">
	</p>
	<p><input type="submit" value="가입신청"></p>
</form>
</div>

<script>
	const dupMessage = document.getElementById('dupMessage')
	const userid = document.querySelector('input[name="userid"]')
		dupMessage.innerText = '중복확인'
		dupMessage.style.color = 'black'
	
	async function dupCheckHandler() {
		
		if(userid.value == '') {
			userid.focus()
			alert('먼저 사용할 ID를 입력해주세요')
			dupMessage.innerText = '중복확인'
			dupMessage.style.color = 'black'
			return
		}
		else{
			const url = '${cpath}/dupCheck/' + userid.value
			const count = await fetch(url).then(resp => resp.text())
			console.log(count)
			if(count == 0) {
				dupMessage.innerText = '사용 가능한 ID입니다'
				dupMessage.style.color = 'blue'
			}
			else {
				dupMessage.innerText = '이미 사용중인 ID입니다'
				dupMessage.style.color = 'red'
				userid.select()
				return
			}
		}
		}

    // "input" 이벤트에 함수 연결
    userid.addEventListener('input', dupCheckHandler);

  
	// onfocus : 마우스나 키보드에 의해 문서요소가 선택되었을 때 발생하는 이벤트 리스너
	// onblur : 포커스 상태에서 선택을 상실할 때 발생하는 이벤트 리스너 (다른 요소로 포커스가 넘어가버리면 발생)
</script>

<script>
const passCheckMessage = document.getElementById('passCheckMessage')
const userpw = document.querySelector('input[name="userpw"]')
passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.'
passCheckMessage.style.color = 'black';

async function passCheckHandler(){
	
	if(userpw.value == ''){
		passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.'
		passCheckMessage.style.color = 'black'
		return
	}
	const url = '${cpath}/passCheck/' + userpw.value
	const count = await fetch(url).then(resp => resp.text())
	console.log(count)
	if(count == 0) {
		passCheckMessage.innerText = '대소영문자와 특수문자 숫자를 포함하지 않았습니다.'
		passCheckMessage.style.color = 'red'
			return
	}
	else if(count == -1){
		passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.'
		passCheckMessage.style.color = 'red'
			return
	}
	else{	// count 값이 0이 아닌 값이 들어가기 때문에 실행이 되고 있음
		passCheckMessage.innerText = '비밀번호 사용 가능합니다.'
		passCheckMessage.style.color = 'blue'
	}
}
  // "input" 이벤트에 함수 연결
userpw.addEventListener('input', passCheckHandler)
	
</script>

<script>
	const nickNameCheckBtn = document.getElementById('nickNameCheckBtn')
	
	async function nickNameCheckHandler() {
		const nickCheckMessage = document.getElementById('nickCheckMessage')
		const nickname = document.querySelector('input[name="nickname"]')
		console.log(nickname)
		const url = '${cpath}/nicknNameCheck/'+nickname.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count != 0) {
			nickCheckMessage.innerText = '닉네임이 중복됩니다!'
			nickCheckMessage.style.color = 'red'
				return
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
	
<script>
	const emailBtn = document.getElementById('emailBtn')
	
	async function emailCheckHandler() {
		const emailCheckMessage = document.getElementById('emailCheckMessage')
		const email = document.querySelector('input[name="email"]').value
		console.log('이메일 체크')
		const url = '${cpath}/emailCheck/'+email
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count != 0) {
			emailCheckMessage.innerText = '이메일이 중복됩니다!'
			emailCheckMessage.style.color = 'red'
		}
		else if (count == 0){
			emailCheckMessage.innerText = '이메일을 사용할 수 있습니다.'
			emailCheckMessage.style.color = 'blue'
		}
	}
	emailBtn.addEventListener('click', emailCheckHandler)
	emailBtn.addEventListener('mousedown', () => {
		// 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
		emailCheckHandler()
	})
</script>

<script>
document.querySelector('form').addEventListener('submit', function(e){
    // ID 중복 확인 메시지
    const dupMsg = document.getElementById('dupMessage').innerText
    // 비밀번호 확인 메시지
    const passMsg = document.getElementById('passCheckMessage').innerText
    // 닉네임 확인 메시지
    const nickMsg = document.getElementById('nickCheckMessage').innerText
    // 이메일 확인 메시지
    const emailMsg = document.getElementById('emailCheckMessage').innerText

    // 유효하지 않은 메시지를 가진 경우를 나열
    if(dupMsg === '이미 사용중인 ID입니다' ||
       passMsg === '대소영문자와 특수문자 숫자를 포함하지 않았습니다.' ||
       passMsg === '8자리 이상 20자리 이하의 비밀번호여야 합니다.' ||
       nickMsg === '닉네임이 중복됩니다!' ||
       emailMsg === '이메일이 중복됩니다!') {
        alert('입력하신 정보에 문제가 있습니다. 다시 확인해주세요.')
        e.preventDefault() // 기본 동작 막기 (폼 제출 막기)
    }
})



</script>

</body>
</html>