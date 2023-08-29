<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${cpath }/resources/css/qna_board.css" type="text/css" />
<head>
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>
<% 
if (session.getAttribute("headerIncluded") == null) {
  session.setAttribute("headerIncluded", "true");
%>
<% } %>
<h1><a href="${cpath }">freefes</a></h1>

<hr>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>