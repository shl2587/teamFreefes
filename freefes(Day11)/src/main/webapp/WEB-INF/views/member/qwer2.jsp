<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

  <style>
.puzzle {
    display: grid;
    grid-template-columns: repeat(3, 100px);
    grid-template-rows: repeat(3, 100px);
    gap: 5px;
    margin-top: 20px;
    display: none;
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

</head>
<body>
  <label for="showImage">로봇이 아닙니다:</label>
  <input type="checkbox" id="showImage">
  <div id="loading">
    <div class="loader"></div>
    로딩 중...
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
<p>확인 : <span id="score">0</span>/5</p>
</div>
<!-- 점수 표시 -->
<!-- 성공 메시지 -->
<p id="successMessage" style="display: none; color: green;">성공!</p>

  <script>
    const showImageCheckbox = document.getElementById("showImage");
    const puzzle = document.getElementById("puzzle");
    const loadingIndicator = document.getElementById("loading");

    showImageCheckbox.addEventListener("change", function() {
    	  if (showImageCheckbox.checked) {
    	    loadingIndicator.style.display = "block"; // 로딩 표시
    	    setTimeout(function() {
    	      loadingIndicator.style.display = "none"; // 로딩 완료 시 로딩 표시 제거
    	      puzzle.style.display = "grid"; // 그리드로 퍼즐 표시
    	      showImageCheckbox.style.display = "none"; // 체크박스 숨기기
    	      
    	      // '로봇이 아닙니다' 글자를 숨김
    	      const robotText = document.querySelector('label[for="showImage"]');
    	      robotText.style.display = "none";
    	      
    	    }, 2000); // 2초(2000ms) 대기 후 퍼즐 표시
    	  } else {
    	    loadingIndicator.style.display = "none";
    	    puzzle.style.display = "none"; // 퍼즐 숨기기
    	    showImageCheckbox.style.display = "block"; // 체크박스 다시 보이게 하기
    	    
    	    // '로봇이 아닙니다' 글자를 다시 표시
    	    const robotText = document.querySelector('label[for="showImage"]');
    	    robotText.style.display = "block";
    	  }
    	});
  </script>
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
// 퍼즐 타일 요소들을 가져옴
const tiles = document.querySelectorAll('.tile');
// 점수와 점수를 표시하는 요소를 가져옴
const scoreElement = document.getElementById('score');
let score = 0;
let isPuzzleSolved = false; // 퍼즐 해결 여부 확인

// 랜덤한 타일 인덱스 반환 함수
function getRandomTileIndex() {
  return Math.floor(Math.random() * 9);
}

// 빨간색 타일 이동 함수
function moveRedTile() {
  const redTile = document.querySelector('.red');
  const randomTileIndex = getRandomTileIndex();

  redTile.classList.remove('red');
  tiles[randomTileIndex].classList.add('red');
}

// 퍼즐 클릭 이벤트 핸들러
tiles.forEach(tile => {
  tile.addEventListener('click', () => {
    if (!isPuzzleSolved) {
      if (tile.classList.contains('red')) {
        // 올바른 선택 시 점수 증가 및 빨간색 타일 이동
        score += 1;
        scoreElement.textContent = score;

        if (score >= 5) {
          // 5점 이상일 경우 성공 메시지 표시 및 퍼즐 단색으로 변경
          showSuccessMessage();
          changeTileColors();
          isPuzzleSolved = true; // 퍼즐 해결 플래그 설정
        }

        moveRedTile();
      } else {
        // 잘못된 선택 시 점수 감소
        score = 0;
        alert('사람이 맞습니까?')
        scoreElement.textContent = score;
      }
    }
  });
});

// 성공 메시지 표시 함수
function showSuccessMessage() {
  const successMessage = document.getElementById('successMessage');
  successMessage.style.display = 'block';
}

// 퍼즐 단색으로 변경 함수
function changeTileColors() {
  tiles.forEach(tile => {
    tile.style.backgroundColor = 'gray'; // 원하는 단색으로 변경 가능
  });
}

// 초기 빨간색 타일 설정
const initialRedTileIndex = getRandomTileIndex();
tiles[initialRedTileIndex].classList.add('red');
</script>
</body>
</html>