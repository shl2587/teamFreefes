<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
<div class="h1">
<h1>로그인</h1>
</div>
<div class="login-container">
<form method="POST"  id="loginForm">
   <p><input type="text" name="userid" placeholder="ID" required autofocus></p>
   <p><input type="password" name="userpw" placeholder="Password" required></p>
   <p><input type="submit" value="로그인"></p>
</form>

<div class="login-options">
   <a href="${cpath }/member/findId"><button>아이디 찾기</button></a>
   <a><button id="pw">비밀번호 재설정</button></a>
   <a href="${cpath }/member/terms"><button>회원가입</button></a>
</div>
</div>
<div id="modal" class="hidden">
   <div id="modal-overlay"></div>
   <div id="modal-content"></div>
</div> 

<div id="repw" class="hidden">
   <div class="login_modal">
      <h1>비밀번호 재설정</h1>
      <div class="bt_choice">
         <p><a href="${cpath }/member/repw_email"><button>이메일</button></a></p>
         <p><a href="${cpath }/member/verify"><button>질문</button></a></p>
         <p><a><button id="bt_close" class="closebnt">닫기</button></a><p>
      </div>
   </div>
</div>

<div class="container">
   <label class="lobot" id="lobot" style="display: none;">
      <div class="lobot_checkbox">🤖로봇이 아닙니다🤖<input  type="checkbox" id="lobotC"></div>
   </label>
   <div>
      <div class="lobotText" id="lobotText" style="display: none; color: red;">
         <h3>빨간색 퍼즐을 클릭하세요</h3>
      </div>
      <div class="puzzle" id="puzzle">
         <div class="tile" id="tile1"></div>
         <div class="tile" id="tile2"></div>
         <div class="tile" id="tile3"></div>
         <div class="tile" id="tile4"></div>
         <div class="tile" id="tile5"></div>
         <div class="tile" id="tile6"></div>
         <div class="tile" id="tile7"></div>
         <div class="tile" id="tile8"></div>
         <div class="tile" id="tile9"></div>
         <div id="score" class="score" class="score">🌚</div>
      </div>
   </div>
</div>
<div id="loading">
   <div class="loader"></div>
   로딩 중...
</div>

<script defer src="${cpath }/resources/js/member_login.js"></script>

</body>
</html>