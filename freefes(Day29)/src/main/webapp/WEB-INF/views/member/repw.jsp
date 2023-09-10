<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h3>패스워드 재설정</h3>

<form id="passwordResetForm">
    <input type="hidden" id="sessionId" name="sessionId" value="${login.userid }">
    <p>
	    <input type="password" name="userpw1" placeholder="비밀번호 입력" autofocus>
    </p>
    <p>
	    <input type="password" name="userpw2" placeholder="비밀번호 확인">
    </p>
    <p>
	    <button id="resetBtn" type="submit">비밀번호 재설정</button>
    </p>
</form>

<script>
    const resetBtn = document.getElementById('resetBtn');

    async function resetBtnHandler(event) {
        event.preventDefault();  // 폼 제출 방지

        alert('하이');
        
        const sessionId = document.getElementById('sessionId').value
        const userpw1 = document.querySelector('input[name="userpw1"]').value;
        const userpw2 = document.querySelector('input[name="userpw2"]').value;

        if (userpw1 === userpw2) {
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