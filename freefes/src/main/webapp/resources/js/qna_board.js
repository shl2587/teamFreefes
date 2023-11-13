'use strict'

// qna_write.jsp 말머리 js
function addcategory() {
    var select = document.getElementById('category');
    var titleInput = document.getElementById('q_title');
    var addcategory = select.value !== "선택" ? select.options[select.selectedIndex].text : "";
    titleInput.value = addcategory + " " + titleInput.value;
  }


var deleteButtoncheck = document.querySelectorAll('.delete-button');
var checkboxes = document.querySelectorAll('.deletecheckbox');


//삭제 버튼 클릭 이벤트 처리
document.querySelectorAll('.delete-button').forEach(button => {
    button.addEventListener('click', async function() {
        const checkboxes = document.querySelectorAll('.deletecheckbox');
        
        // 체크된 체크박스만 필터링
        const checkedCheckList = Array.from(checkboxes).filter(checkbox => checkbox.checked);

        if (checkedCheckList.length > 0) {
            const promises = checkedCheckList.map(checkbox => {
                const idx = checkbox.getAttribute('data-idx');
                const url = cpath + '/qna_delete/' + idx;
                return fetch(url)
                    .then(resp => {
                        if (resp.ok) return resp.text();
                        else throw new Error('삭제 실패');
                    });
            });

            try {
                const results = await Promise.all(promises);
                alert("삭제가 완료되었습니다");
                location.reload();
            } catch (error) {
                alert("삭제 중 오류가 발생했습니다");
            }
        } else {
            alert("체크된 항목이 없습니다");
        }
    });
});

// 체크박스 전체 선택/해제 함수
function toggleAllCheckboxes() {
    const checkboxes = document.querySelectorAll('.deletecheckbox');
    const selectAllCheckbox = document.querySelector('#selectAll');
    checkboxes.forEach(checkbox => {
        checkbox.checked = selectAllCheckbox.checked;
    });
}

// 체크박스 전체 선택/해제 이벤트 처리
document.querySelector('#selectAll').addEventListener('click', function() {
    toggleAllCheckboxes();
});






