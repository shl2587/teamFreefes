<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<h1>아이디 찾기</h1>
   
   <div class="find_id">
      <h3><input type="hidden" name="name2" value="고객님의 아이디 : ${name }"><span id="authMessage2"> </span></h3>
      <form id="find_Id">
         <div>
            <div>
               <p><input type="text" name="find_name" placeholder="이름" required autofocus></p>
               <p><input type="email" name="find_email" placeholder="email" required></p>
            </div>
            <div>
               <p><input type="button" id="send_Auth_Idnum" value="인증받기" ></p>
            </div>
         </div>
         <div>
            <input type="number" class="authNumber" name="authNumber" placeholder="인증번호8자리" required>
            <input  type="button" id="check_Number" value="인증 확인">
         </div>
         <div id="end"><div>나가기</div></div>
      </form>
   </div>

<script defer src="${cpath }/resources/js/member_findid.js"></script>

</body>
</html>