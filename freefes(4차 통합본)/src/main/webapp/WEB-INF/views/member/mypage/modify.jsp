<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

로그인 유저 : ${login.userid }

<!-- <div class="item"> -->
<%--    <img src="${login.profile_img }" width="200"> --%>
<!-- </div> -->

<form method="POST" enctype="multipart/form-data" >

<div class="pw">
<p>
   ${login.userpw }
    <input type="text" name="userpw" placeholder="비밀번호">
     <input type="hidden" id="sessionId" name="sessionId" value="${login.userid }">
    <input type="button" id="passwd_change" name="passwd_change" value="비밀번호변경">
    <input type="hidden" id="idx" value="${login.idx }">
      
</p>
</div>
      <input type="hidden" value="${login.userpw }"> 

<p>
   <input type="text" name="nickname" value="${login.nickname }" >
   <input type="hidden" value="닉네임 변경"> 
   <input id="nickNameCheckBtn" type="button" value="닉네임 중복확인">
   <br>
   <span id="nickCheckMessage"></span>
   
</p>
   
<p>
   <input type="text" name="phonenumber" placeholder="연락처 수정" >
   <input type="hidden" value="${login.phonenumber }"> 
   
</p>

<p>
   <input type="text" name="address" placeholder="주소 변경" >
   <input type="hidden" value="${login.address }"> 
</p>

<p>
   <input type="submit" value="수정">
</p>
</form>

<p><button id="logLeaveBtn">회원탈퇴</button></p>

<script>
   const passwd_changeBtn = document.getElementById('passwd_change')
   const userpw = document.querySelector('input[name="userpw"]')
   const sessionId = document.getElementById('sessionId').value

   async function passwd_changeHandler(){
      alert("아이디 비번 일치 불일치")
      const ob = {
            userid : sessionId,
            userpw : userpw.value
      }
      const url = '${cpath}/passCheck_before/'
      const opt = {
         method: 'POST', // 요청 메서드 설정 (GET, POST, 등)
         body: JSON.stringify(ob), // 요청 본문 설정
         headers: {
            'Content-Type': 'application/json; charset=utf-8' // 요청 헤더 설정
         }
      }

      const count = await fetch(url, opt).then(resp => resp.text());
      alert('이까지 오나?')
      alert(count)
      if(count !=0){
           window.location.href = '../../qwer' // 새로운 페이지로 이동
      }
      else{
         return
      }
   }
   
   passwd_changeBtn.addEventListener('click', passwd_changeHandler)
</script>

<script>
   const nickNameCheckBtn = document.getElementById('nickNameCheckBtn');
   
   async function nickNameCheckHandler() {
      const nickCheckMessage = document.getElementById('nickCheckMessage');
      const nickname = document.querySelector('input[name="nickname"]')
      
      const url = '${cpath}/nicknNameCheck/'+nickname.value
      const count = await fetch(url).then(resp => resp.text())
      console.log(count)
      if(count != 0) {
         nickCheckMessage.innerText = '닉네임이 중복됩니다!'
         nickCheckMessage.style.color = 'red'
      }
      else if (count == 0){
         nickCheckMessage.innerText = '닉네임을 사용할 수 있습니다.'
         nickCheckMessage.style.color = 'blue'
      }
   }
   nickNameCheckBtn.addEventListener('click', nickNameCheckHandler)
   nickNameCheckBtn.addEventListener('mousedown', () => {
   // 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
   nickNameCheckHandler()
   })
</script>

<script>
   const logLeaveBtn = document.getElementById('logLeaveBtn')
   
   function logLeaveHandler() {
	   window.location.href = '../../cancel' // 새로운 페이지로 이동
   }
   logLeaveBtn.addEventListener('click', logLeaveHandler)
   logLeaveBtn.addEventListener('mousedown', () => {
   // 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
   logLeaveHandler()
   })
</script>

</body>
</html>