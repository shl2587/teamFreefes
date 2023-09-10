'use strict'

// board_write.jsp 말머리 js
function addhorsehead() {
    var select = document.getElementById('m_horsehead');
    var titleInput = document.getElementById('m_title' + "");
    var horsehead = select.value !== "선택" ? select.options[select.selectedIndex].text : "";
    titleInput.value = horsehead + " " + titleInput.value;
 }





//////////////////////쪽지 모달/////////////////////
document.addEventListener("DOMContentLoaded", function() {
	  var sendMessageModal = document.getElementById("management_message_sendMessageModal");
	  var openModalBtn = document.getElementById("management_message_openModalBtn");
	  var closeModalBtn = document.getElementById("management_message_closeModalBtn");
	  var cancelModalBtn = document.getElementById("management_message_cancelModalBtn");
	  
	  openModalBtn.addEventListener("click", function(event) {
	    event.preventDefault();
	    sendMessageModal.style.display = "block";
	  });

	  closeModalBtn.addEventListener("click", function() {
	    sendMessageModal.style.display = "none";
	  });

	  cancelModalBtn.addEventListener("click", function() {
	    sendMessageModal.style.display = "none";
	  });
	  

	  /////////////보내기
	  var sendMessageForm = document.getElementById("management_message_sendMessageForm");

	  sendMessageForm.addEventListener("submit", function(event) {
		  var receiver = this["receiver_nickname"].value;
		  var title = this["title"].value; 
		  var content = this["content"].value;

		  if (!receiver || !title || !content) {
		    alert("내용을 모두 작성해주세요");
		    event.preventDefault();
		    return;
		  }

		  if (title.length > 15) {
		    alert("쪽지 제목은 15자 미만 작성할 수 있습니다.");
		    event.preventDefault();
		    return;
		  }

		  if (content.length > 300) {
		    alert("쪽지 내용은 300자 미만 작성할 수 있습니다.");
		    event.preventDefault();
		    return;
		  }
		})		
		
		// 무빙
		const dragWrap = document.getElementById('drag_wrap');
	  let offsetX, offsetY, isDragging = false;

	  dragWrap.addEventListener('mousedown', function(e) {
	    isDragging = true;
	    offsetX = e.clientX - dragWrap.getBoundingClientRect().left;
	    offsetY = e.clientY - dragWrap.getBoundingClientRect().top;
	  });

	  window.addEventListener('mousemove', function(e) {
	    if (isDragging) {
	      const x = e.clientX - offsetX;
	      const y = e.clientY - offsetY;
	      dragWrap.style.position = 'fixed';
	      dragWrap.style.left = x + 'px';
	      dragWrap.style.top = y + 'px';
	    }
	  });

	  window.addEventListener('mouseup', function() {
	    isDragging = false;
	  });
		
})


/////////전체 삭제



document.querySelectorAll('.delete-button').forEach(button => {
    button.addEventListener('click', async function() {
        const checkboxes = document.querySelectorAll('.deletecheckbox');
        
        const checkedCheckList = Array.from(checkboxes).filter(checkbox => checkbox.checked);

        if (checkedCheckList.length > 0) {
            const promises = checkedCheckList.map(checkbox => {
                const idx = checkbox.getAttribute('data-idx');
                const url = cpath + '/notice_delete/' + idx;
                return fetch(url)
                    .then(resp => {
                        if (resp.ok) return resp.text();
                        else throw new Error('fail');
                    });
            });

            try {
                await Promise.all(promises);
                alert("Complete");
                location.reload();
            } catch (error) {
                alert("fail");
            }
        } else {
            alert("no checked");
        }
    });
});


function toggleAllCheckboxes() {
    const checkboxes = document.querySelectorAll('.deletecheckbox');
    const selectAllCheckbox = document.querySelector('#notice_selectAll');
    checkboxes.forEach(checkbox => {
        checkbox.checked = selectAllCheckbox.checked;
    });
}

document.querySelector('#notice_selectAll').addEventListener('click', function() {
    toggleAllCheckboxes();
});




