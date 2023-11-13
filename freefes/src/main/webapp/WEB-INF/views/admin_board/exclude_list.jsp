<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>

<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Exclude-User</span>
		</h3>
	</div>
	<div class="management_addban_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/addExclude_member">
	    <button>
	    	<i class="fa-solid fa-user-plus" style="color:black; "></i>
	    	<span class="addban-icon-text">Add</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>


<div id="management_excludeList_list">
		<table class="management_excludeList_table">
		  <thead>
		    <tr>
		      <th>No</th>
		      <th>Nickname</th>
		      <th>Result</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="dto" items="${list }">
		      <tr>
		        <td>${dto.idx}</td>
			    <td>${dto.nickname}</td>
		        <td>${dto.ban_until }</td>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
</main>


</body>
</html>