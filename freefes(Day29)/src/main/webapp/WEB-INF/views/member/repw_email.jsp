<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1>이메일로 재설정</h1>
<div class="email_pw">
   <form method="POST">
         <p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
         <p><input type="text" name="name" placeholder="이름" required></p>
      <div>
         <input type="email" name="email" placeholder="email" required>
         <input type="button" id="send_Auth_pwnum" value="인증 받기" >
      </div>
   <div class="hidden">
      <input type="number" class="authNumber" name="authNumber" placeholder="인증번호8자리" required>
      <input  type="button" id="check_Number" value="인증 확인">
      <span id="authMessage"></span>
   </div>
      <div id="end"><div>나가기</div></div>
   </form>
</div>

<script defer src="${cpath }/resources/js/member_findpw.js"></script>
</body>
</html>