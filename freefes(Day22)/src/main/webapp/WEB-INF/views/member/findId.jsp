<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

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

<h1>아이디 찾기</h1>
<hr>

<form id="find_Id" method="POST">
<h3>아이디 : <input type="hidden" name="name2" value="${name }"><span id="authMessage2"></span></h3>
		
	<p>
		<input type="text" name="name" placeholder="이름" required autofocus>
		<input type="email" name="email" placeholder="email" required>
		<input type="button" id="send_Auth_Idnum" value="이메일 보내기" >
	</p>
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
	
	const send_Auth_Idnum = document.getElementById('send_Auth_Idnum')
	const name = document.querySelector('input[name="name"]')
	const email = document.querySelector('input[name="email"]')
	
	async function send_Auth_IdnumHandler() {
		
	const ob = {
			name: name.value,
			email: email.value,
		}
		
		const url = '${cpath}/send_Auth_Idnum'
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
	send_Auth_Idnum.onclick = send_Auth_IdnumHandler
	
	const check_Number = document.getElementById('check_Number')
	const name2 =  document.querySelector('input[name="name2"]')
	async function check_NumberHandler(){
		const authNumber =  document.querySelector('input[name="authNumber"]')
		const url = '${cpath}/check_Number/' + authNumber.value
		const row =  await fetch(url).then(resp => resp.text())
		const authMessage = document.getElementById('authMessage')
		if(row != 0){
			authMessage2.innerText = name2.value
			authMessage2.style.color = 'red'
		}
		else{
			authMessage.innerText = '인증실패'
			authMessage.style.color = 'red'
		}
	}
	check_Number.onclick = check_NumberHandler
	
	const end = document.getElementById('end')	
	async function endHandler(){
		const url = '${cpath}/end'
		const row =  await fetch(url).then(resp => resp.text())
		
		const redirectUrl = '../member/login'; 
    	window.location.href = redirectUrl; 
	}
	end.onclick = endHandler
</script>


</body>
</html>