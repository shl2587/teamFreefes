<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>


<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Notice</span>
		</h3>
	</div>
	<div class="management_write_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/management_notice_write">
	    <button>
	    	<i class="fa-solid fa-pen-nib" style="color: black;"></i>
	    	<span class="write-icon-text">Write</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>


<div id="management_notice_main">
		<table class="management_notice_table">
		  <thead>
		    <tr>
		      <th>No</th>
		      <th>Title</th>
		      <th>Date</th>
		      <c:if test="${login.role == 0 }">
		      <th>Edit notice</th>
		      </c:if>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="dto" items="${list}">
		      <tr>
		        <td>${dto.idx}</td>
		        <td><a href="${cpath}/admin_board/management_notice_view/${dto.idx}">${dto.title}</a></td>
		        <td><fmt:formatDate value="${dto.write_date }" pattern="yyyy-MM-dd" /></td>
				<c:if test="${login.role == 0 }">
		     	 <td><a href="${cpath}/admin_board/management_notice_modify/${dto.idx}">
		        	<button type="button" class="no-border">
		        		<i class="fa-regular fa-pen-to-square" style="color: #7292ca;"></i>
		        	</button>
		        </a></td>
		        </c:if>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>

</main>

</body>
</html>