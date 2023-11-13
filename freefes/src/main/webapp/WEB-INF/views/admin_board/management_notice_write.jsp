<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>



<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Notice-write</span>
		</h3>
	</div>
	<div class="management_backlist_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/management_page">
	    <button>
	    	<i class="fa-solid fa-list" style="color: black;"></i>
	    	<span class="backlist-icon-text">List</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>

<div class="management_notice_write_form">
	<form method="POST">
		<div>
			<label for="title"></label>
			<input type="text" id="m_title" name="title" placeholder="Notice Title" required autofocus>
			<label for="horsehead"></label>
			<select name="horsehead" id="m_horsehead" onchange="addhorsehead()">
				<option value="선택">말머리</option>
				<option value="공지">[공지]</option>
				<option value="이벤트">[이벤트]</option>
			</select>
		</div>
		<div>
			<label for="content"></label>
			<textarea id="m_content" name="content" placeholder="Write Notice Content" required></textarea>
		</div>
		<div class="notice_write_btn"><button type="submit">등록</button></div>
	</form>
</div>
</main>





</body>
</html>