<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>

<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Exclude-User /
			<span style="color: #FF6969; font-size:27px;">Add-User</span>
		</h3>
	</div>
	<div class="management_addban_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/exclude_member">
	    <button>
	    	<i class="fa-solid fa-list" style="color: black;"></i>
	    	<span class="backlist-icon-text">Exclude-List</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>

<div id="addexclude-form" >
<div class="exclude-title">Exclude-User</div>
    <form method="POST">
        <label for="nickname"></label>
        <input type="text" id="nickname" name="nickname" placeholder="Write-Nickname" required>
        <div class="addban_btn"><button type="submit">Ban</button></div>
    </form>
</div>


</body>
</html>