'use strict'
 // 글자 길이 처리
   var listMessageContentElements = document.querySelectorAll('.listMessage_content');

   //모든 .listMessage_content 요소에 대한 처리
   listMessageContentElements.forEach(function(element) {
   // dto.content의 내용을 가져옵니다.
   var content = element.textContent;

   // 내용이 15자 이상인 경우에만 "..."을 추가합니다.
   if (content.length > 30) {
    // 문자열을 15자로 자릅니다.
    var truncatedContent = content.slice(0, 30) + "...";

    // 수정된 내용으로 업데이트합니다.
    element.textContent = truncatedContent;
   }
   })


   // 모달 열기 함수
   function openModal(idx ,title, content, Receiver, writer, category, isSpecialCondition=false) {
      var modal = document.getElementById('myModal')
      var messageTitle = document.getElementById('messageTitle')
      var messageWriter = document.getElementById('messageWriter')
      var messageReceiver = document.getElementById('messageReceiver')
      var messageCategory = document.getElementById('messageCategory')
      var messageText = document.getElementById('messageText')

      messageTitle.textContent = title
      messageWriter.textContent = writer
      messageReceiver.textContent = Receiver
      messageCategory.textContent = category
      messageText.textContent = content
       if(isSpecialCondition === true) {
             const url = cpath + '/result_update/' + idx
            const count = fetch(url).then(resp => resp.text())
            console.log(count)
          }


      modal.style.display = 'block'
   }

   // 모달 닫기 함수
   function closeModal() {
      var modal = document.getElementById('myModal')
      modal.style.display = 'none'
   }

   // "창 닫기" 버튼 클릭 이벤트 처리
   var closeButton = document.getElementById('close')
   closeButton.addEventListener('click', function() {
      closeModal()
      window.location.reload()
   })

   // 각 행을 클릭할 때 모달 열기
   var rows = document.querySelectorAll('.message-row')
   for (var i = 0; i < rows.length; i++) {
      rows[i].addEventListener('click', function(event) {
         // 클릭한 요소가 체크박스인 경우 모달 열지 않음
         if (event.target.type !== 'checkbox') {
            var idx = this.getAttribute('data-idx')
            var title = this.getAttribute('data-title')
            var content = this.getAttribute('data-content')
            var Receiver = this.getAttribute('data-Receiver')
            var writer = this.getAttribute('data-writer')
            var category = this.getAttribute('data-category')
            var isSpecialCondition = this.getAttribute('data-special') === "true"
            console.log("isSpecialCondition: ", isSpecialCondition); // 추가
            
            openModal(idx,title, content, Receiver, writer, category, isSpecialCondition)
         }
         
      });
   }
   
   // 전체 체크박스 선택/해제 함수
   function toggleAllCheckboxes() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var selectAllCheckbox = document.querySelector('.message-checkbox_All');

       for (var i = 0; i < checkboxes.length; i++) {
           checkboxes[i].checked = selectAllCheckbox.checked; // 전체 체크박스의 상태에 따라 개별 체크박스 상태 설정
       }
   }

   // 모든 체크박스가 체크되었는지 확인하고, 그에 따라 전체 선택 체크박스의 상태를 설정하는 함수
   function updateSelectAllCheckboxState() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var selectAllCheckbox = document.querySelector('.message-checkbox_All');

       var allChecked = true;  // 모든 체크박스가 체크되었는지의 여부

       for (var i = 0; i < checkboxes.length; i++) {
           if (!checkboxes[i].checked) {
               allChecked = false;
               break;
           }
       }

       selectAllCheckbox.checked = allChecked;
   }

   // 각 체크박스의 클릭 이벤트 처리
   var checkboxes = document.querySelectorAll('.message-checkbox');
   for (var i = 0; i < checkboxes.length; i++) {
       checkboxes[i].addEventListener('click', updateSelectAllCheckboxState);
   }
   
   // 체크박스 전체 선택/해제 이벤트 처리
   var selectAllCheckbox = document.querySelector('.message-checkbox_All');
   selectAllCheckbox.addEventListener('click', toggleAllCheckboxes);

   
   // 체크된 체크박스의 data-idx 값을 가져오는 함수
   function getCheckedCheckboxesIdx() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var checkedIdxes = [];

       checkboxes.forEach(function(checkbox) {
           if (checkbox.checked) {
               var idx = checkbox.getAttribute('data-idx');
               console.log("Checked checkbox data-idx:", idx); // 여기서 체크된 체크박스의 data-idx 값을 바로 출력
               checkedIdxes.push(idx);
           }
       })

       return checkedIdxes;
   }

   document.querySelector('.message_delete_button').addEventListener('click', async function() {
       var checkedValues = getCheckedCheckboxesIdx();
       console.log("Checked checkboxes data-idx values:", checkedValues);


       for(var i = 0; i < checkedValues.length; i++){
           var idx = checkedValues[i];
           const url = cpath + '/message_delete/' + idx;
           const count = await fetch(url).then(resp => resp.text()); 
           console.log(count);
           if(count != 0){
              alert("삭제가 완료되었습니다");
              location.reload();
           }
           else{
              alert("메시지가 삭제되지 않았습니다.");
           }
       }
       
   })

//   메세지 보내는 스크립트
var receiverInput = document.getElementById("receiver_nickname");
var titleInput = document.getElementById("title");
var contentInput = document.getElementById("content");
var aaaa = document.getElementById("aaaa");
 // 추가 검증 함수 정의
    async function isValidreceiver(receiver) {
        const url1 = '${cpath}/receiver_nickname/' + receiver;
        const count1 = await fetch(url1).then(resp => resp.text())
        return count1
 }
           async function isValidTitle(title) {
                const url2 = '${cpath}/isValidTitle/' + title;
                const count2 = await fetch(url2).then(resp => resp.text())
                   if(count2 != 0){
                      return count2
                   }
                   else{
                      return event.preventDefault()
                   }
            }

                async function isValidContent(content) {
                    const url3 = '${cpath}/isValidContent/' + content;
                    const count3 = await fetch(url3).then(resp => resp.text())
                    if(count3 != 0){
                      return count3
                   }
                   else{
                      return event.preventDefault()
                   }
                }
   
    async function submitHandler(event) {
        event.preventDefault(); // 여기서 event 객체를 받아옵니다.
        

        // 각 필드값이 비어있는지 확인
        if (receiverInput.value.trim() === "" || titleInput.value.trim() === "" || contentInput.value.trim() === "") {
            alert("모든 필드를 채워주세요.")
            return; // event.preventDefault() 대신에 return을 사용하여 이벤트를 중지합니다.
        } else {
            if (await(isValidreceiver(receiverInput.value))==0) { // await 추가
                alert("받는 사람의 닉네임이 올바르지 않습니다.")
                event.preventDefault(); // 이벤트를 중지하지 않는다.
                return
            }
            // 추가 검증을 수행하고 필요한 경우 오류 메시지 표시
            if (await(isValidTitle(titleInput.value))==0) {
                alert("제목은 15자 이하로 입력해주세요.")
                event.preventDefault() // 이벤트를 중지하지 않는다.
                return
            } 
              if (await(isValidContent(contentInput.value))==0) {
                alert("내용은 300자 이하로 입력해주세요.")
                event.preventDefault() // 이벤트를 중지하지 않는다.
                return
            }  
              else {
                alert("쪽지를 보내기를 완료하였습니다.");
                window.location.href='../message/listMessage'
            }
        }
        event.target.submit()
    }
    aaaa.addEventListener("submit", submitHandler)

   // 모달 열기 함수
   function openModal(idx ,title, content, Receiver, writer, category, isSpecialCondition=false) {
      var modal = document.getElementById('myModal')
      var messageTitle = document.getElementById('messageTitle')
      var messageWriter = document.getElementById('messageWriter')
      var messageReceiver = document.getElementById('messageReceiver')
      var messageCategory = document.getElementById('messageCategory')
      var messageText = document.getElementById('messageText')

      messageTitle.textContent = title
      messageWriter.textContent = writer
      messageReceiver.textContent = Receiver
      messageCategory.textContent = category
      messageText.textContent = content
       if(isSpecialCondition === true) {
             const url = cpath + '/result_update/' + idx
            const count = fetch(url).then(resp => resp.text())
            console.log(count)
          }


      modal.style.display = 'block'
   }

   // 모달 닫기 함수
   function closeModal() {
      var modal = document.getElementById('myModal')
      modal.style.display = 'none'
   }

   // "창 닫기" 버튼 클릭 이벤트 처리
   var closeButton = document.getElementById('close')
   closeButton.addEventListener('click', function() {
      closeModal()
      window.location.reload()
   })

   // 각 행을 클릭할 때 모달 열기
   var rows = document.querySelectorAll('.message-row')
   for (var i = 0; i < rows.length; i++) {
      rows[i].addEventListener('click', function(event) {
         // 클릭한 요소가 체크박스인 경우 모달 열지 않음
         if (event.target.type !== 'checkbox') {
            var idx = this.getAttribute('data-idx')
            var title = this.getAttribute('data-title')
            var content = this.getAttribute('data-content')
            var Receiver = this.getAttribute('data-Receiver')
            var writer = this.getAttribute('data-writer')
            var category = this.getAttribute('data-category')
            var isSpecialCondition = this.getAttribute('data-special') === "true"
            console.log("isSpecialCondition: ", isSpecialCondition); // 추가
            
            openModal(idx,title, content, Receiver, writer, category, isSpecialCondition)
         }
         
      });
   }


   
   // 전체 체크박스 선택/해제 함수
   function toggleAllCheckboxes() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var selectAllCheckbox = document.querySelector('.message-checkbox_All');

       for (var i = 0; i < checkboxes.length; i++) {
           checkboxes[i].checked = selectAllCheckbox.checked; // 전체 체크박스의 상태에 따라 개별 체크박스 상태 설정
       }
   }

   // 모든 체크박스가 체크되었는지 확인하고, 그에 따라 전체 선택 체크박스의 상태를 설정하는 함수
   function updateSelectAllCheckboxState() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var selectAllCheckbox = document.querySelector('.message-checkbox_All');

       var allChecked = true;  // 모든 체크박스가 체크되었는지의 여부

       for (var i = 0; i < checkboxes.length; i++) {
           if (!checkboxes[i].checked) {
               allChecked = false;
               break;
           }
       }

       selectAllCheckbox.checked = allChecked;
   }

   // 각 체크박스의 클릭 이벤트 처리
   var checkboxes = document.querySelectorAll('.message-checkbox');
   for (var i = 0; i < checkboxes.length; i++) {
       checkboxes[i].addEventListener('click', updateSelectAllCheckboxState);
   }
   
   // 체크박스 전체 선택/해제 이벤트 처리
   var selectAllCheckbox = document.querySelector('.message-checkbox_All');
   selectAllCheckbox.addEventListener('click', toggleAllCheckboxes);

   
   // 체크된 체크박스의 data-idx 값을 가져오는 함수
   function getCheckedCheckboxesIdx() {
       var checkboxes = document.querySelectorAll('.message-checkbox');
       var checkedIdxes = [];

       checkboxes.forEach(function(checkbox) {
           if (checkbox.checked) {
               var idx = checkbox.getAttribute('data-idx');
               console.log("Checked checkbox data-idx:", idx); // 여기서 체크된 체크박스의 data-idx 값을 바로 출력
               checkedIdxes.push(idx);
           }
       })

       return checkedIdxes;
   }

   document.querySelector('.message_delete_button').addEventListener('click', async function() {
       var checkedValues = getCheckedCheckboxesIdx();
       console.log("Checked checkboxes data-idx values:", checkedValues);


       for(var i = 0; i < checkedValues.length; i++){
           var idx = checkedValues[i];
           const url = cpath + '/message_delete/' + idx;
           const count = await fetch(url).then(resp => resp.text()); 
           console.log(count);
           if(count != 0){
              alert("삭제가 완료되었습니다");
              location.reload();
           }
           else{
              alert("메시지가 삭제되지 않았습니다.");
           }
       }
       
   })

