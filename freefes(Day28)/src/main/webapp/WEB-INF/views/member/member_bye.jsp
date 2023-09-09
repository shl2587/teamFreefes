<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage/mypage.jsp" %>

<form id="log_bye_user">
	<p><input type="text" name="userid" placeholder="ID" value="${login.userid }" autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<button id="submitButton">회원탈퇴</button>
</form>

</body>
</html>

<script>
	document.getElementById("submitButton").addEventListener("click", async function(event) {
 		event.preventDefault()

 		// 사용자가 입력한 값을 얻기 위해 여기서 userid와 userpw를 가져옵니다.
 		const userid = document.querySelector('input[name="userid"]').value
 		const userpw = document.querySelector('input[name="userpw"]').value
 	
 		const ob = {
 	            userid: userid,
 	            userpw: userpw
 	      };
 	      
 	      const url = '${cpath}/login_bye_check/'
 	      const opt = {
 	         method: 'POST', // 요청 메서드 설정 (GET, POST, 등)
 	         body: JSON.stringify(ob), // 요청 본문 설정
 	         headers: {
 	            'Content-Type': 'application/json; charset=utf-8' // 요청 헤더 설정
 	         }
 	      };

 	      const count = await fetch(url, opt).then(resp => resp.text())
 	      if(count != 0) {
 	    	  alert('회원이 탈퇴 되셨습니다')
 	    	 window.location.href = '../'
 	      } else {
 	    	  alert('회원정보를 다시 확인해주세요')
 	    	  return
 	      }
	})
</script>