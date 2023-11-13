<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
.verify_bh {
   width: 450px;
   height: 550px;
   margin: 0 auto;
   padding: 30px;
   background-color: #fff;
   border-radius: 8px;
   box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
   margin-top: 10px;
}
.verify_bh>form>div {
   display: flex;
}
.verify_bh>form> p > input, 
.verify_bh>form>div>input {
   width: 250px;
   height: 15px;
   padding: 10px;
   margin-bottom: 10px;
   margin-right: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
}

.verify_bh > form>div > input[type="submit"] {
    width: 110px;
    height: 37px;
    background-color: #0068FF; 
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    text-align: center;
}
.answer_bh > input {
   width: 250px;
   height: 15px;
   padding: 10px;
   margin-bottom: 10px;
   margin-right: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
}
.verify_answer_submit {
    width: 110px;
    height: 47px;
    background-color: #FF6600;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    text-align: center;
}

.verify_answer_submit_bh:hover {
    background-color: #FF3300;
}
.verify_answer_submit_btn_bh > input[type="submit"].verify_answer_submit_bh{
      width: 272px;   
      }
</style>

<h1>질문 확인</h1>
<div class="verify_bh">
   <form method="POST" action="verify">
      <p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
      <p><input type="text" name="name" placeholder="이름" required></p>
      <div>
         <input type="email" name="email" placeholder="email" required>
         <input type="submit" value="확인">
      </div>
      <div style="color: red;">${msg }</div>
   </form>

   <form method="POST" action="answer" class="answer_bh">
      <input type="hidden" name="userid" value="${userid }">
      <h3>(1번질문) ${verify1 }</h3>
      <input type="text" name="answer1" placeholder="1번 질문 답" required>
      <h3>(2번질문) ${verify2 }</h3>
      <input type="text" name="answer2" placeholder="2번 질문 답" required>
      <div class="verify_answer_submit_btn_bh">
         <input type="submit" class="verify_answer_submit_bh" value="확인">
      </div>
      <div id="end"><div><a href="../member/login">나가기</a></div></div>
   </form>
</div>
</body>
</html>