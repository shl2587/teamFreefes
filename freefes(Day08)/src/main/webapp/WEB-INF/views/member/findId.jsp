<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<h1>아이디 찾기</h1>
<hr>

<form method="POST">
	<p>
		<input type="text" name="name" placeholder="이름" required autofocus>
		<input type="email" name="email" placeholder="email" required>
	</p>
		<input id="send_Auth_Number" type="button" value="이메일 보내기">
	<p>
		<input type="text" name="authNumber" placeholder="인증번호 입력">
		<button id="check_Auth_Number">확인</button>
		<span id="id_check_message"></span>
	</p>
		<input type="submit" value="아이디 찾기">
	<p>
	</p>
</form>

<script> 
	const sendAuthNumber = document.getElementById('send_Auth_Number')
	const checkAuthNumber = document.getElementById('check_Auth_Number')
	
	async function sendAuthNumberHandler(event){
		event.preventDefault()
		const ob = {
			user_name: event.target.querySelector('input[name="name"]').value,
			email: event.target.querySelector('input[name="email"]').value,
		}
		const url = '${cpath}/getEmail'
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers:{
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		const result = await fetch(url, opt).then(resp => resp.json())
		if(result.status == false){
			alert('계정 정보를 다시 확인해주세요')
			return
		}
		alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.");
	}
	sendAuthNumber.addEventListener('click', sendAuthNumberHandler)
 	
	
</script>



</body>
</html>