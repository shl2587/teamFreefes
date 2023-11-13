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
	      <th>Delete-All<input type="checkbox" id="notice_selectAll" data-idx="${dto.idx}"></th>
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
	        	<td><input type="checkbox" class="deletecheckbox" value="${dto.idx }" data-idx="${dto.idx}"></td>
	        </c:if>
	      </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>
<div class="delete_btn">
	<button type="button" class="delete-button"  data-idx="${dto.idx}">
		<i class="fa-solid fa-trash" style="color: #434977;"></i>
	</button>
</div>
	
	
	
<div class="page_wrap">
   <div class="page_nation">
      <c:if test="${paging_dto.prev && paging_dto.page_begin > 1}">
	      <a class="arrow prev" href="${cpath }/admin_board/management_page?request_page=${paging_dto.page_begin - paging_dto.per_page}"></a>
	  </c:if>
	  <c:forEach var="page_number" begin="${paging_dto.page_begin }" end="${paging_dto.page_end }">
      	  <a href="${cpath }/admin_board/management_page?request_page=${page_number}" class="active">${page_number }</a>
      </c:forEach>
      <c:if test="${paging_dto.next && paging_dto.page_end < paging_dto.total_count}">
      	  <a class="arrow next" href="${cpath }/admin_board/management_page?request_page=${paging_dto.page_end + 1 }"></a>
      </c:if>
   </div>
</div>

</main>

</body>
</html>