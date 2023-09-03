<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>



<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Question</span>
		</h3>
	</div>
	<div class="management_write_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/management_page">
	    <button>
	    	<i class="fa-solid fa-rotate-left" style="color: black;"></i>
	    	<span class="backlist-icon-text">back</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>


<div id="management_qna_main">
		<table class="management_qna_table">
		  <thead>
		    <tr>
		      <th>No</th>
		      <th>Title</th>
		      <th>Writer</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="dto" items="${list}">
		      <tr>
		        <td>${dto.idx}</td>
			    <td><a href="${cpath}/admin_board/management_qna_view/${dto.idx}">${dto.title}</a></td>
		        <td>${dto.nickname }</td>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
</main>

</body>
</html>