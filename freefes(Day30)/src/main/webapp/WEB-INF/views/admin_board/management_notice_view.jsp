<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>



<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Notice-View.(${dto.idx })</span>
		</h3>
	</div>
	<div class="management_backlist_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/management_page">
	    <button>
	    	<i class="fa-solid fa-list" style="color: black;"></i>
	    	<span class="backlist-icon-text">list</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>

<div class="management_notice_write_form">
	<div class="notice_view_title">공지 내용</div>
	<div>
		<label for="content"></label>
		<textarea id="m_content" name="content" class="notice_view_content" readonly required>${dto.content }</textarea>
	</div>
</div>


</main>
</body>
</html>