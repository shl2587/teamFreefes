<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif; 
        background-color: #f4f4f4;
    }

   h1.favorites_list_title  {
        text-align: center;
        font-size: 28px;
        padding: 15px 0;
        color: #07277d;
        border-bottom: 3px solid #07277d;
        margin-bottom: 40px;
    }

    #festivalTable {
        border-collapse: collapse; 
        width: 85%; 
        margin: 20px auto; 
        background-color: #fff;
        box-shadow: 0 0 25px rgba(0,0,0,0.15);
    }

    #festivalTable th,
    .favorites_list_item {
        padding: 12px; 
        border: 1px solid #ccc;
    }

    #festivalTable th {
        background-color: #07277d; 
        color: white;
    }

    .favorites-row:hover {
        background-color: rgba(7, 39, 125, 0.05);
    }

    .favorites_list_item a {
        color: #007BFF;
        text-decoration: none; 
    }

    .favorites_list_item a:hover {
        text-decoration: underline;
        color: #0056b3;
    }

    .favorites_paging {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 25px 0;
        padding: 12px;
        background-color: #fff;
        box-shadow: 0 0 25px rgba(0,0,0,0.15);
        border-radius: 6px;
    }

    .favorites_paging a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #07277d;
        color: white;
        margin: 0 8px;
        border-radius: 6px;
        text-decoration: none;
        height: 38px;
        width: 38px;
        transition: background-color 0.3s;
    }

    .favorites_paging a:hover {
        background-color: #053c9f;
    }

    .favorites_paging a:not(:contains("◀")):not(:contains("▶")) {
        line-height: 1.2;
        font-size: 12px;
    }
</style>

<h1 class="favorites_list_title">좋아요 리스트</h1>

<table id="festivalTable">
    <thead>
        <tr>
            <th>게시판 번호</th>
            <th>축제 지역</th>
            <th>축제 이름</th>
            <th>축제 내용</th>
        </tr>
    </thead>

    <c:forEach var="dto" items="${fav}">
        <tr class="favorites-row">
            <td class="favorites_list_item">
                ${dto.idx}
            <td class="favorites_list_item">
               ${dto.region}
            </td>
            <td class="favorites_list_item">
                <a href="../../../fes_board/mainboard/${dto.idx}">${dto.title}</a>
            </td>
            <td class="favorites_list_item">
              <a href="../../../fes_board/mainboard/${dto.idx}">${dto.content}</a>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="favorites_paging">
		<c:if test="${favorites_pagingdto.prev }">
			<a href="${cpath }/member/mypage/favorites/${login.idx }?request_page=
				${favorites_pagingdto.page_begin - 1}">
				◀이전
			</a>
		</c:if>
		<c:forEach var="page_number" begin="${favorites_pagingdto.page_begin }" end="${favorites_pagingdto.page_end }">
			<a href="${cpath }/member/mypage/favorites/${login.idx }?request_page=${page_number}">
				[${page_number }]
			</a>
		</c:forEach>
		<c:if test="${favorites_pagingdto.next }">
			<a href="${cpath }/member/mypage/favorites/${login.idx }?request_page=
				${favorites_pagingdto.page_end + 1 }">
				다음▶
			</a>
		</c:if>
	</div>

</body>
</html>
