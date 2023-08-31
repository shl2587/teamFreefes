<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
.hidden {
	display: none;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}
.login-container {
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.login-options {
    margin-top: 10px;
    text-align: center;
}

button {
    padding: 8px 16px;
    background-color: #ccc;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #999;
}
#modal-overlay {
	width: 100%;
	height: 100%;
	position: fixed;
	background-color: rgba(0, 0, 0, 0.3);
	top: 0;
	left: 0;
	z-index: 1;
}

#modal-content {
	width: fit-content;
	height: fit-content;
	position: fixed;
	top: 50%;
	left: 50%;
	z-index: 2;
	transform: translate(-50%, -50%);
	box-shadow: 5px 5px 5px grey;
	border-radius: 10px;
	background-color: white;
}

.center {
/* 	width: 600px;; */
/* 	height: 200px; */
/* 	position: fixed; */
/* 	top: 50%; */
/* 	left: 50%; */
/* 	z-index: 2; */
/* 	transform: translate(-50%, -50%); */
/* 	box-shadow: 5px 5px 5px grey; */
/* 	border-radius: 10px; */
/* 	background-color: white; */
	
	   display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100vh; /* 뷰포트의 높이만큼 세로 중앙 정렬 */
    background-color: rgba(0, 0, 0, 0.5); /* 흐린 배경 효과 */
    position: fixed;
    top: 0;
    left: 0;
    z-index: 2;
}

.center>h4 {
	text-align: center;
	color: white; 
}

.choice_pw {
	display: flex;
	justify-content: space-around;
}

.closebnt {
	display: flex;
	align-items: center;
	text-align: center;
	justify-content: center;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
}

.puzzle {
	display: grid;
	grid-template-columns: repeat(3, 50px);
	grid-template-rows: repeat(3, 50px);
	gap: 5px;
	margin-top: 20px;
	display: none;
	justify-self: center;
	margin-left: 20px;
}

.tile {
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	cursor: pointer;
}

.red {
	background-color: red;
}

.blue {
	background-color: blue;
}

.green {
	background-color: green;
}

.yellow {
	background-color: yellow;
}

.orange {
	background-color: orange;
}

.purple {
	background-color: purple;
}

#successMessage {
	text-align: center;
}

#loading {
	display: none;
	text-align: center;
}

#loading .loader {
	display: flex;
	border: 4px solid #f3f3f3;
	border-top: 4px solid #3498db;
	border-radius: 50%;
	width: 30px;
	height: 30px;
	animation: spin 2s linear infinite;
	margin: 10px auto;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg); /* 시계방향 회전 */
  }
}
.puzzle_text {
	display: none;
	color: red;
}
</style>

<body>
<div class="login-container">
<form method="POST"  id="loginForm">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="완료"></p>
</form>

<div class="login-options">
	<a href="${cpath }/member/findId"><button>아이디 찾기</button></a>
	<button id="pw">비밀번호 재설정</button>
</div>
<div class="join">
	<a href="${cpath }/member/terms"><button>회원가입</button></a>
</div>
</div>
<div id="modal" class="hidden">
	<div id="modal-overlay"></div>
	<div id="modal-content"></div>
</div>

<div id="repw" class="hidden">
	<div class="center">
		<h4>비밀번호 재설정</h4>
		<div class="bh_choice">
			<p><a href="${cpath }/member/repw_email">이메일</a></p>
			<p><a href="${cpath }/member/verify">질문</a></p>
		</div>
		<div>
			<button id="bh_close" class="closebnt">닫기</button>
		</div>
	</div>
</div>

<div class="container">
	<label class="lobot" id="lobot" style="display: none;">
		로봇이 아닙니다 <input type="checkbox" id="lobotC">
	</label>
	<div>
		<div class="lobotText" id="lobotText" style="display: none; color: red;">
			<h3>빨간색 타일을 클릭하세요</h3>
		</div>
		<div class="puzzle" id="puzzle">
			<div class="tile" id="tile1"></div>
			<div class="tile" id="tile2"></div>
			<div class="tile" id="tile3"></div>
			<div class="tile" id="tile4"></div>
			<div class="tile" id="tile5"></div>
			<div class="tile" id="tile6"></div>
			<div class="tile" id="tile7"></div>
			<div class="tile" id="tile8"></div>
			<div class="tile" id="tile9"></div>
			<div id="score" class="score">확인 : 0/5</div>
		</div>
	</div>
</div>
<p id="successMessage" style="display: none; color: green;">사람인증!</p>
<div id="loading">
	<div class="loader"></div>
	로딩 중...
</div>
<script>
const loginForm = document.getElementById('loginForm')
let count = 0
	async function loginFormHandler(event) {
	event.preventDefault()
		const ob = {
			userid: event.target.querySelector('input[name="userid"]').value,
			userpw: event.target.querySelector('input[name="userpw"]').value,
		}
		const url = '${cpath}/getLogin'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const row = await fetch(url, opt).then(resp => resp.json())
		if(row == 0) {
			if(count == -1){
				window.location.href = '../member/login'
			}
			count = count + 1
			if(count <= 5){
				alert('계정 정보를 다시 확인해주세요')
			}
			if (count == 5) {
				lobot.style.display = "block" // 카운터가 5 이상이면 로봇 체크박스를 보이도록 설정
				lobotC.style.display = "block"
				count = count + 1
			  }			
			else if (count >= 5){
				alert('퍼즐을 먼저 풀어주세요')
			}
			alert(count)
			return
		}		
		else {
			window.location.href = '../'
		}
	}

	loginForm.addEventListener('submit', loginFormHandler);
</script>

<script>
    const lobotC = document.getElementById("lobotC");
    const puzzle = document.getElementById("puzzle");
    const loadingIndicator = document.getElementById("loading");
    const lobot = document.getElementById("lobot")
    const loading = document.getElementById("loading")
    const lobotText = document.getElementById("lobotText")

    lobotC.addEventListener("change", function() {
      if (lobotC.checked) {
        loadingIndicator.style.display = "block"; // 로딩 표시
        setTimeout(function() {
          loadingIndicator.style.display = "none"; // 로딩 완료 시 로딩 표시 제거
          puzzle.style.display = "grid"; // 그리드로 퍼즐 표시
          lobotC.style.display = "none";
          lobot.style.display = "none";
          lobotText.style.display = "block"
          createPuzzle()
          lobotC.checked = false;
        }, 2000); // 2초(2000ms) 대기 후 퍼즐 표시
      } else {
        loadingIndicator.style.display = "none";
        puzzle.style.display = "none";
      }
    });
  </script>
  <script>
	const pw = document.getElementById('pw')
	const repw = document.getElementById('repw')
	const modal = document.getElementById('modal')
	const bh_close = document.getElementById('bh_close')
	
	function hiddenOpen(){
		modal.classList.remove('hidden')
		repw.classList.remove('hidden')
	}
	function hiddenClose(){
		modal.classList.add('hidden')
		repw.classList.add('hidden')
	}	
	pw.onclick = hiddenOpen
	bh_close.onclick = hiddenClose
	
</script>
<script>
  function createPuzzle() {
	  const tiles = document.querySelectorAll('.tile');
	    const scoreElement = document.getElementById('score');
	    const colors = ['blue', 'green', 'yellow', 'orange', 'purple'];

	    let score = 0;
	    let isPuzzleSolved = false;

	    function randomNum() {
	      return Math.floor(Math.random() * 9);
	    }

	    function randomColor() {
	      return Math.floor(Math.random() * colors.length);
	    }

	    const initialRedTileIndex = randomNum();
	    tiles.forEach((tile, index) => {
	      if (index !== initialRedTileIndex) {
	        tile.classList.add(colors[randomColor()]);
	      } else {
	        tile.classList.add('red');
	      }

	      tile.addEventListener('click', () => {
	        if (!isPuzzleSolved) {
	          if (tile.classList.contains('red')) {
	            score += 1;
	            scoreElement.textContent = score + '/5';

	            if (score >= 5) {
	              showSuccessMessage();
	              count = -1
	              tiles.forEach(tile => (tile.style.backgroundColor = 'gray'));
	              isPuzzleSolved = true;
	            }
	            shuffleTiles();
	          } else {
	            score = 0;
	            alert('사람이 맞습니까?');
	            scoreElement.textContent = score + '/5';
	          }
	        }
	      });
	    });
	    function shuffleTiles() {
	      const redTileIndex = randomNum();
	      tiles.forEach((tile, index) => {
	        tile.classList.remove('red', ...colors);
	        if (index === redTileIndex) {
	          tile.classList.add('red');
	        } else {
	          tile.classList.add(colors[randomColor()]);
	        }
	      });
	    }

	    function showSuccessMessage() {
	      const successMessage = document.getElementById('successMessage');
	      successMessage.style.display = 'block';
	    }
  }

</script>

</body>
</html>