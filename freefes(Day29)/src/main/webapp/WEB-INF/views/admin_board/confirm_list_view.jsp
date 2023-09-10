<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>

<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Confirm /
			<span style="color: #FF6969; font-size:27px;">No.${dto.idx }</span>
		</h3>
	</div>
	<div class="management_write_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/confirm_list">
	    <button>
	    	<i class="fa-solid fa-list" style="color: black;"></i>
	    	<span class="backlist-icon-text">list</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>

<div class="compass-frame">
  <div class="confirm_view_btn">
    <div class="confirm_y_btn"><a><button onclick="approve(1)">y</button></a></div>
    <div class="confirm_n_btn"><a><button onclick="approve(2)">n</button></a></div>
  </div>
</div>
<div class="confirm_list_view_form">
	<div>
		<div class="view_title">축제 기간</div>
		<div class="view_content">
			<fmt:formatDate value="${dto.start_date }" pattern="yyyy-MM-dd"/>
			 ~ 
			<fmt:formatDate value="${dto.end_date }" pattern="yyyy-MM-dd"/>
		</div> 
	</div>
	<div>
		<div class="view_title">개최 지역</div>
		<div class="view_content">
			${dto.region }region
		</div>
	</div>
	<div>
		<div class="view_title">개최 장소</div>
		<div class="view_content">
			${dto.place }place
		</div>
	</div>
	<div>
		<div class="view_title">축제 시간</div>
		<div class="view_content">
			${dto.time }time
		</div>
	</div>
	<div>
		<div class="view_title">축제 설명</div>
		<div class="view_content">
			${dto.content }content<br>
			참고 사이트 : ${dto.url }
		</div>
	</div>
	<div>
		<div class="view_title">참가 비용</div>
		<div class="view_content">
			${dto.fee}fee
		</div>
	</div>
	<div>
		<div class="view_title">연령 제한</div>
		<div class="view_content">
			${dto.age_limit }age_limit
		</div>
	</div>
	<div>
		<div class="view_title">주최자</div>
		<div class="view_content">
			${dto.host_org }host_org
		</div>
	</div>
</div>
</main>


<script>
/*approve 승인하면 1로 반환 거절하면 2로 반환. onclick으로  버튼에 걸어놓음*/
function approve(value) {
    $.ajax({
        url: "${cpath}/admin_board/approve",
        type: "POST",
        data: { idx: ${dto.idx}, approve: value },
        success: function(response) {
            alert("Confirm");
            window.location.href = "${cpath}/admin_board/confirm_list";
        },
        error: function(error) {
            alert("not Confirm");
        }
    });
}
</script>


</body>
</html>