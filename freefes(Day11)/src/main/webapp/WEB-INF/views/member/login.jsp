<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
  .puzzle {
    display: grid;
    grid-template-columns: repeat(3, 100px);
    grid-template-rows: repeat(3, 100px);
    gap: 5px;
  }
  .tile {
    width: 100px;
    height: 100px;
    background-color: #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px;
    cursor: pointer;
  }
  .red {
    background-color: red;
  }
  
   .hidden-image {
    display: none;
  }

  #loading {
    display: none;
    text-align: center;
  }

  #loading .loader {
    border: 4px solid #f3f3f3;
    border-top: 4px solid #3498db;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    animation: spin 2s linear infinite;
    margin: 10px auto;
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
</style>


<h3>로그인</h3>

<form id="loginForm" method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>

<h4><button id="pw">비밀번호찾기</button></h4>

<div id="modal" class="hidden">
	<div id="modal-overlay"></div>
	<div id="modal-content"></div>
</div>

<div id="repw" class="hidden">
	<div class="center">
		<h4>비밀번호 재설정</h4>
		<div class="qqqq">
			<p><a href="${cpath }/member/repw_email">이메일</a></p>
			<p><a href="${cpath }/bb">질문</a></p>
		</div>
		<div>
			<button id="cc" class="closebnt">닫기</button>
		</div>
	</div>
</div>

<p id="successMessage" style="display: none; color: green;">성공!</p>

<script>
	const pw = document.getElementById('pw')
	const repw = document.getElementById('repw')
	const cc = document.getElementById('cc')
	const modal = document.getElementById('modal')
	
	function hiddenOpen(){
		modal.classList.remove('hidden')
		repw.classList.remove('hidden')
	}
	function hiddencc(){
		modal.classList.add('hidden')
		repw.classList.add('hidden')
	}
	pw.onclick = hiddenOpen
	cc.onclick = hiddencc
	
</script>
<script>

	const loginForm = document.getElementById('loginForm')

	async function loginFormHandler(event) {
		event.preventDefault()
		const ob = {
			userid: event.target.querySelector('input[name="userid"]').value,
			userpw: event.target.querySelector('input[name="userpw"]').value,
		}
		const url = '${cpath}/getlogin'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.json())
		if(result.status == false) {
			alert('계정 정보를 다시 확인해주세요')
			return
		}
	}
</script>
</body>
</html>