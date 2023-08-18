<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>DB에 데이터 넣기</h1>
<hr>
<script src="${cpath }/resources/javaScript/2023년 지역축제 개최 계획(취합).js"></script>
<script>
const dataList = fes_arr; // Assuming fes_arr contains an array of map-like objects

fetch('saveFestivals', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify(dataList)
})
.then(response => response.text())
.then(message => {
  console.log(message);
})
.catch(error => {
  console.error('Error sending data:', error);
});

</script>


</body>
</html>