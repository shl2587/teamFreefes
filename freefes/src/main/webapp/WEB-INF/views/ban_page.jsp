<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${cpath }/resources/css/ban_page.css" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">


<head>
<meta charset="UTF-8">
<title>banpage</title>
</head>
<body>
<script defer src="${cpath }/resources/js/ban_page.js"></script>




<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
	  <p>회원님의 ID는 이용이 <span style="color:#FFB84C; font-weight:bold;">정지</span> 되었습니다.</p>
    <div class="ban-details">
      <p><strong>정지 사유 : </strong>홈페이지 사용 규정 위반</p>
      <p><strong>정지 기한 : ~ <span style="color:#FFB84C; font-weight:bold;">3</span>일 </strong></p>
    </div>
    <button id="home_btn">홈으로 이동</button>
  </div>
</div>



</body>
</html>