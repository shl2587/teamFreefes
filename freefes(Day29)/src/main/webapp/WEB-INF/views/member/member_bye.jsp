<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage/mypage.jsp" %>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f8fa;
            margin: 0;
            padding: 0;
        }

        h1 {
            font-size: 32px;
            color: #333;
            text-align: center;
            border-bottom: 3px solid #007BFF;
            padding: 20px 0;
            margin-bottom: 30px;
            background-color: #f9f9f9;
        }

        /* 폼 스타일 */
        form#log_bye_user {
            background-color: #f9f9f9;
            border: 1px solid #e1e4e8;
            border-radius: 4px;
            padding: 20px;
            margin: 20px auto; /* 가운데 정렬을 위한 마진 설정 */
            max-width: 400px; /* 폼의 최대 너비 */
        }

        form#log_bye_user p {
            margin: 15px 0; /* p 태그의 마진 설정 */
        }

        form#log_bye_user input[type="text"], form#log_bye_user input[type="password"] {
            width: 100%; /* 입력 항목의 너비를 100%로 설정 */
            padding: 10px;
            border: 1px solid #e1e4e8;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box; /* padding과 border가 너비에 포함되도록 설정 */
        }

        form#log_bye_user input[type="text"]:focus, form#log_bye_user input[type="password"]:focus {
            outline: none;
            border-color: #007BFF; /* 포커스 시 테두리 색상 변경 */
        }

        button#submitButton {
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            width: 100%;
            text-align: center;
            margin-top: 15px;
        }

        button#submitButton:hover {
            background-color: #0056b3;
        }

    </style>
<h1>회원 탈퇴 확인</h1>
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