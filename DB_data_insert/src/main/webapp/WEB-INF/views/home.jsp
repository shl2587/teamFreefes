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


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<h1>DB에 데이터 넣기</h1>
<hr>
<script src="${cpath }/resources/javaScript/2023년 지역축제 개최 계획(취합).js"></script>
<button id="data_insert">데이터 삽입</button>
<script>
	const data_insert =	document.getElementById("data_insert")
	data_insert.onclick = DB_insert
	function DB_insert() {
		const dataList = fes_arr
		fetch('saveFestivals', {
		  method: 'POST',
		  headers: {
		    'Content-Type': 'application/json'
		  },
		  body: JSON.stringify(dataList)
		})
		.then(response => response.text())
		.then(message => {
		  console.log(message)
		})
		.catch(error => {
		  console.error('Error sending data:', error);
		})
	}
</script>
<a href="${cpath }/dataList"><button id="data_input_btn">DB테이블 데이터 옮기기</button></a>

<h3>${row }행 성공</h3>


</body>
</html>