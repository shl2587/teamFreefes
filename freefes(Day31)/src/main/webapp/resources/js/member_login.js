
const loginForm = document.getElementById('loginForm')
   let count = 0
   let num = 0

   async function loginFormHandler(event) {
   event.preventDefault()
      const ob = {
         userid: event.target.querySelector('input[name="userid"]').value,
         userpw: event.target.querySelector('input[name="userpw"]').value,
      }
      const url = cpath + '/getLogin'
      const opt = {
         method: 'POST',
         body: JSON.stringify(ob),
         headers: {
            'Content-Type': 'application/json; charset=utf-8'
         }
      }
      const row = await fetch(url, opt).then(resp => resp.json())
      if(count >=5){
         alert('퍼즐을 먼저 풀어주세요')
      }
      else if(row == 0) {
         count = count + 1
         if(num == 1){
            num == 0
            window.location.href = '../member/login'
         }
         if(count <= 5){
            alert('계정 정보를 다시 확인해주세요')
         }
         if (count == 5) {
            lobot.style.display = "block" 
            lobotC.style.display = "block"
            count = count + 1
           }         
         return
      }      
      else {
         window.location.href = '../'
      }
   }

loginForm.addEventListener('submit', loginFormHandler)
//로그인 스크립트

//로딩 스크립트
  const lobotC = document.getElementById("lobotC")
  const puzzle = document.getElementById("puzzle")
  const loadingIndicator = document.getElementById("loading");
  const lobot = document.getElementById("lobot")
  const loading = document.getElementById("loading")
  const lobotText = document.getElementById("lobotText")

  lobotC.addEventListener("change", function() {
     if (lobotC.checked) {
          lobot.style.display = "none";
     }
    if (lobotC.checked) {
      loadingIndicator.style.display = "block"// 로딩 표시
      setTimeout(function() {
        loadingIndicator.style.display = "none"// 로딩 완료 시 로딩 표시 제거
        puzzle.style.display = "grid" // 그리드로 퍼즐 표시
        lobotC.style.display = "none"
        lobot.style.display = "none"
        lobotText.style.display = "block"
        createPuzzle()
        lobotC.checked = false
      }, 3000)
    } else {
      loadingIndicator.style.display = "none"
      puzzle.style.display = "none"
    }
  });
// 로딩 스크립트

//타일색깔 지정
function createPuzzle() {
     const tiles = document.querySelectorAll('.tile')
       const scoreElement = document.getElementById('score')
       const colors = ['blue', 'green', 'yellow', 'orange', 'purple']

       let score = 0
       let isPuzzleSolved = false

       function randomNum() {
         return Math.floor(Math.random() * 9)
       }

       function randomColor() {
         return Math.floor(Math.random() * colors.length)
       }

       const initialRedTileIndex = randomNum()
       tiles.forEach((tile, index) => {
         if (index !== initialRedTileIndex) {
           tile.classList.add(colors[randomColor()])
         } else {
           tile.classList.add('red')
         }

         tile.addEventListener('click', () => {
           if (!isPuzzleSolved) {
             if (tile.classList.contains('red')) {
               score += 1;
                    if(score == 1){
                     scoreElement.textContent = '🌒'
                    }
                    if(score == 2){
                     scoreElement.textContent = '🌓'
                    }
                    if(score == 3){
                     scoreElement.textContent = '🌔'
                    }
                    if(score == 4){
                     scoreElement.textContent = '🌕'
                    }
                    if(score == 5){
                     scoreElement.textContent = '🌝'
                     
                    }
               if (score >= 5) {
                 count = 0
                 num = 1
                 tiles.forEach(tile => (tile.style.backgroundColor = 'gray'))
                 isPuzzleSolved = true;
               }
               shuffleTiles()
             } else {
               score = 0;
               alert('사람이 맞습니까?');
               scoreElement.textContent = '🌚'
             }
           }
         });
       });
       function shuffleTiles() {
         const redTileIndex = randomNum()
         tiles.forEach((tile, index) => {
           tile.classList.remove('red', ...colors)
           if (index === redTileIndex) {
             tile.classList.add('red');
           } else {
             tile.classList.add(colors[randomColor()])
           }
         });
       }
}
//타일색깔 지정

// 비밀번호 모달
   const pw = document.getElementById('pw')
   const repw = document.getElementById('repw')
   const modal = document.getElementById('modal')
   const bt_close = document.getElementById('bt_close')
   
   function hiddenOpen(){
      modal.classList.remove('hidden')
      repw.classList.remove('hidden')
   }
   function hiddenClose(){
      modal.classList.add('hidden')
      repw.classList.add('hidden')
   }   
   pw.onclick = hiddenOpen
   bt_close.onclick = hiddenClose
//비밀번호 모달