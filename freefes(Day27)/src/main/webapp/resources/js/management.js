'use strict'

// board_write.jsp 말머리 js
function addhorsehead() {
    var select = document.getElementById('m_horsehead');
    var titleInput = document.getElementById('m_title' + "");
    var horsehead = select.value !== "선택" ? select.options[select.selectedIndex].text : "";
    titleInput.value = horsehead + " " + titleInput.value;
 }