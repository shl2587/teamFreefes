<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<style>

#passwordResetForm{
   width: 450px;
   height: 200px;
   margin: 0 auto;
   padding: 30px;
   background-color: #fff;
   border-radius: 8px;
   box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
   margin-top: 10px;
}
#passwordResetForm > p > input{
   width: 250px;
   height: 15px;
   padding: 10px;
   margin-bottom: 10px;
   margin-right: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
   margin-left: 90px;
}
#resetBtn {
   width: 270px;
    height: 37px;
    background-color: #0068FF; 
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    text-align: center;
    margin-left: 90px;
}
#passCheckMessage{
	margin-top: -15px;
	font-size: 10.9px;
}
</style>
<h1>패스워드 재설정</h1>
<form id="passwordResetForm">
    <input type="hidden" id="sessionId" name="sessionId" value="${login.userid }">
    <p>
	    <input type="password" name="userpw1" placeholder="비밀번호 입력" required autofocus>
	    <div class="password2" id="passCheckMessage"></div>
    </p>
    <p>
	    <input type="password" name="userpw2" placeholder="비밀번호 확인" required>
    </p>
    <p>
	    <button id="resetBtn" type="submit">비밀번호 재설정</button>
    </p>
</form>

<script>
const passCheckMessage = document.getElementById('passCheckMessage');
const userpw = document.querySelector('input[name="userpw1"]');
passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
passCheckMessage.style.color = 'black';

async function passCheckHandler() {
    if (userpw.value === '') {
        passCheckMessage.innerText = '비밀번호를 모두 입력해주세요';
        passCheckMessage.style.color = 'black';
        return;
    }
    const url = '${cpath}/passCheck/' + userpw.value;
    const count = await fetch(url).then(resp => resp.text());
    console.log(count);
    if (count == 0) {
        passCheckMessage.innerText = '대소영문자와 특수문자 숫자를 포함하지 않았습니다.';
        passCheckMessage.style.color = 'red';
        return;
    } else if (count == -1) {
        passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.';
        passCheckMessage.style.color = 'red';
        return;
    } else {
        passCheckMessage.innerText = '비밀번호 사용 가능합니다.';
        passCheckMessage.style.color = 'blue';
    }
}
userpw.addEventListener('input', passCheckHandler);


	

    const resetBtn = document.getElementById('resetBtn');

    async function resetBtnHandler(event) {
        event.preventDefault();  // 폼 제출 방지
        
        const sessionId = document.getElementById('sessionId').value
        const userpw1 = document.querySelector('input[name="userpw1"]').value;
        const userpw2 = document.querySelector('input[name="userpw2"]').value;

        if(userpw1.value === '' || userpw2.value === ''){
        	alert('빈칸을 다 채워주세요~')
        	return
        }
        
        else if (userpw1 === userpw2) {
            const ob = {
                userid : sessionId,
                userpw : userpw2
            }
            const url = '${cpath}/passupdate/';
            const opt = {
                method: 'POST',
                body: JSON.stringify(ob),
                headers: {
                    'Content-Type': 'application/json; charset=utf-8'
                }
            }

            const count = await fetch(url, opt).then(resp => resp.text())
            alert('비밀번호 재설정이 완료되었습니다');
            window.location.href = '../';
        } else {
            alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.');
            window.location.reload();
        }
    }

    resetBtn.addEventListener('click', resetBtnHandler);
</script>

</body>
</html>