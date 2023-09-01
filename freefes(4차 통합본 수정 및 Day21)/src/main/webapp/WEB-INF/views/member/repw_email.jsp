<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
<style>
	.hidden {
		display: none;
	}
	#end{
		border: 1px solid black;
		 
	}
	#endBtn{
		border: 1px solid red; 
	}
</style>

<h3>이메일로 찾기</h3>

<form method="POST">
		<input type="text" name="userid" placeholder="아이디" required autofocus>
		<input type="text" name="name" placeholder="이름" required>
		<input type="email" name="email" placeholder="email" required>
		<input type="button" id="send_Auth_pwnum" value="이메일 보내기" >
</form>

<div class="hidden">
		<input type="number" name="authNumber" placeholder="인증번호8자리" required>
		<input id="check_Number" type="button" value="인증 확인">
		<br>
		<span id="authMessage"></span>
	</div>
	<br>
	<br>
	<button id="end">나가기</button>
<script>
	
	const send_Auth_pwnum = document.getElementById('send_Auth_pwnum')
	
	const userid = document.querySelector('input[name="userid"]')
	const name = document.querySelector('input[name="name"]')
	const email = document.querySelector('input[name="email"]')
	
	async function send_Auth_pwnumHandler() {
		
	const ob = {
			userid: userid.value,
			name: name.value,
			email: email.value,
		}
		
		const url = '${cpath}/send_Auth_pwnum'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.json())
		alert(result.message)
		if(result.success != 0){
			document.querySelector('.hidden').classList.remove('hidden');
		}
	}
	send_Auth_pwnum.onclick = send_Auth_pwnumHandler	
	
	const check_Number = document.getElementById('check_Number')
	
	async function check_NumberHandler(){
		const authNumber =  document.querySelector('input[name="authNumber"]')
		const url = '${cpath}/check_Number/' + authNumber.value
		const row =  await fetch(url).then(resp => resp.text()) 
		const authMessage = document.getElementById('authMessage')
		if(row != 0){
			const redirectUrl = '../member/repw'; 
	    	window.location.href = redirectUrl; 
		}
		else{
			authMessage.innerText = '인증실패'
			authMessage.style.color = 'red'
		}
	}
	check_Number.onclick = check_NumberHandler
</script>
</body>
</html>