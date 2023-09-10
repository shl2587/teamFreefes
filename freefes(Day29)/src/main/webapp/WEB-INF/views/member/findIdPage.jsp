<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
	<%
    String email = (String) session.getAttribute("saved_email"); // 세션에서 이메일 값을 가져옴
%>

	<p>
		<input type="number" name="authNumber" placeholder="인증번호 8자리" required>
		<input id="checkAuthNumber" type="button" value="인증번호확인"> <br>
		<span id="authMessage"></span>
		
	</p>
	<p><input type="submit" value="아이디 찾기"></p>
<script>
	const sendAuthNumber = document.getElementById('sendAuthNumber')
		async function sendAuthNumberHandler() {
		// input 중에서 name이 email인 요소를 불러온다
		// 서버의 sendAuthNumber 주소로 요청을 보내면서 email에 입력된 값을 함께 지출한다(쿼리스트링, 경로 변수)
		// 서버에서는 랜덤 정수 8자리를 생성하여 메일을 전송하고, 전송한 인증번호를 세션에 저장해둔다
		// alert을 이용하여 메일을 보냈다고 팝업을 띄운다 (만약 예외가 발생하면 문제가 발생했다고 띄운다)
		// 정상적으로 메일을 보냈다면 아래 있는 hidden 클래스를 제거하여 다음 내용을 진행할 수 있도록 준비한다
		
		// input중에 name이 email인 요소를 불러온다
		const email = '<%= email %>'
		
		// 서버의 sendAuthNumber 주소로 요청을 보내면서 email에 입력된 값을 함께 지출한다(쿼리스트링, 경로 변수)
		// alert을 이용하여 메일을 보냈다고 팝업을 띄운다 (만약 예외가 발생하면 문제가 발생했다고 띄운다)
		const url = '${cpath}/sendAuthNumber/' + email.value + '/'
		const json = await fetch(url).then(resp => resp.json())		
		alert(json.message)
		
		if(json.success == 1){
			document.querySelector('input[type="submit"]').disabled = 'disabled'
		}
	}
	
	// 이메일을 확인하여, 인증번호를 입력하고, 인증번호 확인 버튼을 눌렀을 때 실행되는 함수
	const checkAuthNumber = document.getElementById('checkAuthNumber')
   async function checkAuthNumberHandler(){
      const authNumber =  document.querySelector('input[name="authNumber"]')
      if(authNumber.value == ''){
    	  return
      }
      const url = '${cpath}/checkAuthNumber/' + authNumber.value
      const row =  await fetch(url).then(resp => resp.text()) 
      const authMessage = document.getElementById('authMessage')
      if(row != 0){
         document.querySelector('input[type="submit"]').removeAttribute('disabled')
         authMessage.innerText = '인증성공'
         authMessage.style.color = 'blue'
      }
      else{
         authMessage.innerText = '인증실패'
         authMessage.style.color = 'red'
      }
   }
   checkAuthNumber.onclick = checkAuthNumberHandler

</script>
</body>
</html>