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
               checkedIdxes.push(idx);
           }
       })

       return checkedIdxes;
   }
   
   let messagenum = 0;

   document.querySelector('.message_delete_button').addEventListener('click', async function() {
       var checkedValues = getCheckedCheckboxesIdx();

       for(var i = 0; i < checkedValues.length; i++){
           var idx = checkedValues[i]
           const url = cpath + '/message_delete/' + idx
           const count = await fetch(url).then(resp => resp.text())
          
           if(count != 0){
               messagenum = 1
           } else {
               messagenum = 2
               break  // 하나라도 삭제되지 않은 메시지가 있다면 루프를 종료합니다.
           }
       }

       if(messagenum == 1){
           alert("삭제가 완료되었습니다")
           location.reload()
       } else if(messagenum == 2){
           alert("메시지가 삭제되지 않았습니다.")
       }
   })



