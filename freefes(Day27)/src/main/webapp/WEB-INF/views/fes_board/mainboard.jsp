<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${login.role == 0 }">
	<style>
		#b_favorites {
 			display: none;
 		}
		#b_cancel_favorites {
			display: none;
		}
	</style>
</c:if>

<!-- 로그인이 비어있지 않고 login.idx와 favorites_result.member의 값이 같으면-->
<c:if test="${not empty login && check_favorites != 0 }">
	<style>
		#b_favorites {
	 		display: none;
	 	}
	</style>
</c:if>

<c:if test="${empty login || check_favorites == 0 }">
	<style>
		#b_cancel_favorites {
			display: none;
		}
	</style>
</c:if>


<div class="">
	<div class="">
		<h3>${board_view.title }</h3>
		<div>조회수 : ${board_view.count }</div>
		<div>
			작성일 : 
			<fmt:formatDate value="${board_view.write_date }" pattern="yyyy-MM-dd"/>
		</div>
		<div class="">
			<img src="">
			<div>
				<span>축제 기간</span>
				<fmt:formatDate value="${board_view.start_date }" pattern="yyyy-MM-dd"/>
				 ~ 
				<fmt:formatDate value="${board_view.end_date }" pattern="yyyy-MM-dd"/> 
			</div>
			<label>축제 내용</label>
			<div>
				<span>개최 지역</span>
				${board_view.region }
			</div>
			<div>
				<span>개최 장소</span>
				${board_view.place }
			</div>
			<div>
				<span>축제 시간</span>
				${board_view.time }
			</div>
			<div>
				<span>축제 설명</span>
				${board_view.content }
				<br>
				참고 사이트 : ${board_dto.url }
			</div>
			<div>
				<span>참가 비용</span>
				<br>
				${board_view.fee}
			</div>
			<div>
				<span>연령 제한</span>
				${board_view.age_limit }
			</div>
			<div>
				<span>주최자</span>
				${board_view.host_org }
			</div>
			<div>
				<span>문의</span>
				${board_view.inquire }
			</div>
			<div>
				<span>추천수</span>
				${board_view.favorites }
			</div>
		</div>
		<div>
			<button id="b_favorites">☆</button>
			<button id="b_cancel_favorites">★</button>
		</div>
	</div>

</div>

<script>

const fes_board_idx = "${board_view.idx}"
const login = "${session.login}"
const login_role = "${sessionScope.login.role}"


if (login != "" || login_role != 0) {
	$(document).ready(function() {
	
		const favorites_key = "favorites"
		const favorites = JSON.parse(localStorage.getItem(favorites_key)) || {}
		
		
			
		const update_favorites = () => {
			if (favorites[fes_board_idx]) {
				$("#b_favorites").hide()
				$("#b_cancel_favorites").show()
			} else {
				$("#b_favorites").show()
				$("#b_cancel_favorites").hide()
			}
		}
		
	
		$("#b_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites/" + fes_board_idx,
				type: "GET",
				success: function(data) {
					console.log(data)
					favorites[fes_board_idx] = true
					localStorage.setItem(favorites_key, JSON.stringify(favorites))
					update_favorites()
					alert("축제 리스트에 추가되었습니다!!!")
					location.reload()
				},
				error: function(error) {
					alert("이미 지난 축제이거나 없는 축제입니다. 다시 확인 부탁드립니다.")
				}
			})
		})
			
		$("#b_cancel_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites_delete/" + fes_board_idx,
	            type: "GET",
	            success: function(data) {
	                delete favorites[fes_board_idx]
	                
	                localStorage.setItem(favorites_key, JSON.stringify(favorites)) // 웹 스토리지에 저장
	                
	                update_favorites() 
	                
	                alert("축제 리스트에서 제외되었습니다. 다른 축제를 찾으러 가볼까요?")
	                location.reload()
	            },
				error: function(error) {
					alert("이미 리스트에서 제외된 축제입니다.")
				}
			})
		})
	})
}
else if (login == "") {
	$("#b_favorites").click(function() {
		let result = confirm("로그인 후 사용 가능합니다. 로그인 페이지로 이동하시겠습니까?")
		if (result === true) {
			location.href = '${cpath}/member/login'
		}
		else {
			location.href = '${cpath}/fes_board/mainboard/' + fes_board_idx
		}
	})
}

</script>
</body>
</html>