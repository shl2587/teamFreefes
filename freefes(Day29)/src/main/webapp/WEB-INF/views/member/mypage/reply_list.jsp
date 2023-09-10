<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif; 
        background-color: #f4f4f4;
    }

    h1.reply_list_title_h1 {
        text-align: center;
        font-size: 28px;
         padding: 15px 0;
        color: #07277d;
        border-bottom: 3px solid #07277d;
        margin-bottom: 40px;
    }

    table.reply_list_all_board  {
        border-collapse: collapse; 
        width: 80%; 
        margin: 20px auto; 
        background-color: #fff;
        box-shadow: 0 0 20px rgba(0,0,0,0.15);
    }

    th.reply_list_idx,
    th.reply_list_content,
    th.reply_list_write_date {
        background-color: #07277d; 
        color: white; 
        padding: 10px; 
        border: 1px solid #ccc;
    }

    tr.reply_list_tr {
        border: 1px solid #ccc; 
    }

    td.Rep_list_board {
        padding: 8px;
        text-align: center;
        border: 1px solid #ccc;
    }

    td a.Rep_list_board_a {
        color: #007BFF;
        text-decoration: none; 
    }

    td a.Rep_list_board_a:hover {
        text-decoration: underline;
    }

    .reply_paging {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
        padding: 10px;
        background-color: #fff;
        box-shadow: 0 0 20px rgba(0,0,0,0.15);
        border-radius: 5px;
    }

    .reply_paging a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #07277d;
        color: white;
        margin: 0 5px;
        border-radius: 5px;
        text-decoration: none;
        height: 36px;
        width: 36px;
    }

    .reply_paging a:not(:contains("◀")):not(:contains("▶")) {
        line-height: 1;
        font-size: 10px;
    }

    .reply_paging a:hover {
        background-color: #053c9f;
    }

    .reply_paging a.replt_list_prev-next {
        width: 100px; /* 이 값을 조절하여 원하는 너비로 설정할 수 있습니다. */
    }
</style>

<h1 class="reply_list_title_h1">댓글 내역</h1>

<table class="reply_list_all_board">
    <thead>
        <tr class="reply_list_tr">
            <th class="reply_list_idx">제목</th>
            <th class="reply_list_content">내용</th>
            <th class="reply_list_write_date">작성일시</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="Rep" items="${Rep}">
            <tr class="reply_list_tr">
                <td class="Rep_list_board"><a class="Rep_list_board_a" href="../../../fes_board/mainboard/${Rep.board}">${Rep.title}</a></td>
                <td class="Rep_list_board"><a class="Rep_list_board_a" href="../../../fes_board/mainboard/${Rep.board}">${Rep.content}</a></td>
                <td class="Rep_list_board">${Rep.write_date}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="reply_paging">
    <c:if test="${reply_pagingdto.prev}">
        <a class="replt_list_prev-next" href="${cpath}/member/mypage/reply_list/${login.idx}?request_page=${reply_pagingdto.page_begin - 1}">◀이전</a>
    </c:if>
    <c:forEach var="page_number" begin="${reply_pagingdto.page_begin}" end="${reply_pagingdto.page_end}">
        <a href="${cpath}/member/mypage/reply_list/${login.idx}?request_page=${page_number}">[${page_number}]</a>
    </c:forEach>
    <c:if test="${reply_pagingdto.next}">
        <a class="replt_list_prev-next" href="${cpath}/member/mypage/reply_list/${login.idx}?request_page=${reply_pagingdto.page_end + 1}">다음▶</a>
    </c:if>
</div>

</body>
</html>