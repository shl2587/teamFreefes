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

<div class="page_wrap">
   <div class="page_nation">
      <c:if test="${paging_dto.prev && paging_dto.page_begin > 1}">
	      <a class="arrow prev" href="${cpath }/admin_board/management_qna_list?request_page=${paging_dto.page_begin - paging_dto.per_page}"></a>
	  </c:if>
	  <c:forEach var="page_number" begin="${paging_dto.page_begin }" end="${paging_dto.page_end }">
      	  <a href="${cpath }/admin_board/management_qna_list?request_page=${page_number}" class="active">${page_number }</a>
      </c:forEach>
      <c:if test="${paging_dto.next && paging_dto.page_end < paging_dto.total_count}">
      	  <a class="arrow next" href="${cpath }/admin_board/management_qna_list?request_page=${paging_dto.page_end + 1 }"></a>
      </c:if>
   </div>
</div>

<script>
/*현재 페이지 백그라운드*/
const active = document.querySelectorAll('.active')
const request_page = ${param.request_page}
function on_fire_active() {
	for(let i in active) {
		if(active[i].innerText == request_page){
			active[i].classList.add('on_fire')
		}
	}
}
document.addEventListener('DOMContentLoaded', on_fire_active())
</script>
	
	
</main>

</body>
</html>