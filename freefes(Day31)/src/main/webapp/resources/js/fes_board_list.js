'use strict'


const gov_name_data = [
		{
			name: "서울",
			region: ["종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"
		]},
		{
			name: "부산",
			region: ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군"
		]},
		{
			name: "인천",
			region: [
			"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"
		]},
		{
			name: "대구",
			region: [
			"중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"
		]},
		{
			name: "광주",
			region: [
			"동구", "서구", "남구", "북구", "광산구"
		]},
		{
			name: "대전",
			region: [
			"동구", "중구", "서구", "유성구", "대덕구"
		]},
		{
			name: "울산",
			region: [
			"중구", "남구", "동구", "북구", "울주군"
		]},
		{
			name: "세종",
			region: ["세종특별자치시"
			
		]},
		{
			name: "경기",
			region: [
			"가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"
		]},
		{

			name: "강원",
			region: [
			"원주시", "춘천시", "강릉시", "동해시", "속초시", "삼척시", "홍천군", "태백시", "철원군", "횡성군", "평창군", "영월군", "정선군", "인제군", "고성군", "양양군", "화천군", "양구군"
		]},
		{
			name: "충청북도",
			region: [
			"청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"
		]},
		{
			name: "충청남도",
			region: [
			"천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"
		]},
		{
			name: "경상북도",
			region: [
			"포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"
		]},
		{
			name: "경상남도",
			region: [
			"창원시", "김해시", "진주시", "양산시", "거제시", "통영시", "사천시", "밀양시", "함안군", "거창군", "창녕군", "고성군", "하동군", "합천군", "남해군", "함양군", "산청군", "의령군"
		]},
		{
			name: "전라북도",
			region: [
			"전주시", "익산시", "군산시", "정읍시", "완주군", "김제시", "남원시", "고창군", "부안군", "임실군", "순창군", "진안군", "장수군", "무주군"
		]},
		{
			name: "전라남도",
			region: [
			"여수시", "순천시", "목포시", "광양시", "나주시", "무안군", "해남군", "고흥군", "화순군", "영암군", "영광군", "완도군", "담양군", "장성군", "보성군", "신안군", "장흥군", "강진군", "함평군", "진도군", "곡성군", "구례군"
		]},
		{
			name: "제주",
			region: [
			"제주시", "서귀포시"
		]}
		
	]




//해당 시/도에 따라 시/군/구 select 삽입
function local_gov_list(initial_local_gov, initial_region_section) {
	const select = document.getElementById("local_gov")
	const region_section_select = document.getElementById("region_section")
	
	if (initial_local_gov) {
		select.value = initial_local_gov
		update_region_section(initial_local_gov, initial_region_section)
	}
	
	select.addEventListener('change', () => {
		const selected_option = select.options[select.selectedIndex].value
		update_region_section(selected_option)
		
	})
}

function update_region_section(seleted_option, initial_region_section = null) {
	const region_section_select = document.getElementById("region_section")
	region_section_select.innerHTML = '<option value="">=== 시 /군 /구 선택 ===</option>'
	if (seleted_option) {
		let selected_data = gov_name_data.find(item => item.name === seleted_option)
		if (selected_data) {
			selected_data.region.forEach((region) => {
				const option = document.createElement("option")
				option.value = region
				option.text = region
				if (region === initial_region_section) {
					option.selected = true
				}
				region_section_select.appendChild(option)
			})
		}
	}
}


$(document).ready(function() {
	const region_param = new URLSearchParams(location.search) + "&request_page=1"
	performSearch(region_param)
})

$(document).ready(function() {
	$(".fes_search_form").submit(function (event) {
		event.preventDefault();
		const form_data = $(this).serialize();
		performSearch(form_data)
	})
})




function performSearch(form_data) {
	$.ajax({
	    type: "POST",
	    url: cpath + "/fes_board/" + fes_page_href,
	    data: form_data,
	    success: function (response) {
	    	let result_div = $(".result_div")
	        result_div.empty();
	        let board_list = response.fes_boardList
	        if (typeof board_list != 'string') {
	            board_list.forEach(function (board) {

            	 const start_date = new Date(board.start_date)
                 const end_date = new Date(board.start_date)
                  
                 const formatted_start_date = formatDate(start_date)   // 시작일 ''월 ''일 형식 포맷
                 const formatted_end_date = formatDate(end_date)   // 끝일 ''월 ''일 형식 포맷
                  
                 const filePath = board.file_path   // 파일 경로
                 const index = filePath.indexOf('&')
                 const slicedPath = index !== -1 ? filePath.substring(0, index) : filePath // poster.xxx 받아오기
                   
                 let festival_list = `
                    <div class="festival_list">
                         <div class="festival_poster">
                     <a href="${cpath }/fes_board/mainboard/${board.idx }">
                        <img src="${cpath }/upload/${board.title }/${slicedPath}">
                     </a>
                     </div>
                     <div>
                                <a href="${cpath}/fes_board/mainboard/${board.idx}">
                           <span class="board_idx">${board.idx }</span>
                           <span class="board_title">${board.title }</span><br>
                           <span class="board_region">${board.region }</span>|
                           <span class="board_count">조회수 ${board.count }</span>|
                           <span class="board_date">${formatted_start_date} ~ ${formatted_end_date}</span>
                        </a>
                        <div class="board_grade">${board.grade }</div>
                        <div class="board_favorites">추천수 ${board.favorites }</div>
                            </div>
                       </div>`   // jsp와 형태 맞췄습니다.
                   $(festival_list).appendTo(result_div)
               })
           } 

	        else {
	            const message = response.fes_boardList.toString()
	        	result_div.html(message)
	        }
	
	        // 페이지 번호 업데이트 코드 (기존 코드를 그대로 사용)
	        let query_string = null
	        if (form_data.includes('&request_page=')) {
	        	query_string = form_data.substring(0, form_data.indexOf('&request_page='))
	        	query_string += '&request_page='
	        }
	        else {
	        	query_string = form_data + '&request_page='
	        }
	        
	        update_paging(response.fes_paging_dto, query_string)
	        grades = document.querySelectorAll(".board_grade")
	        star()
	        
	        
	    },
	    error: function (jqXHR, textStatus, errorThrown) {
	        console.log("AJAX Error:", textStatus, errorThrown);
	    }
	})
}

$(document).ready(function() {
	$(".fes_board_paging").on("click", ".paging_number", function(event) {
		event.preventDefault()
		const href = $(this).attr("href")
        const params = href.split('?')[1]
        let form_data = params
        performSearch(form_data)
	})
})

// 페이징 업데이트 함수 (기존 코드)
function update_paging(paging_data, query_string) {
	const fes_board_paging = $(".fes_board_paging");
	if (paging_data != null) {
		fes_board_paging.empty();
		if (paging_data.prev && paging_data.page_begin > 1) {
			fes_board_paging.append(`<a class="paging_number" href=
			"${cpath}/fes_board/` + fes_page_href + `?` + query_string + `${paging_data.page_begin - 1}">◀이전</a>`);
		}
		
		for (let page_number = paging_data.page_begin; page_number <= paging_data.page_end; page_number++) {
			fes_board_paging.append(`<a class="paging_number" href=
			"${cpath}/fes_board/` + fes_page_href + `?` + query_string + `${page_number}">[${page_number}]</a>`);
		}
		
		if (paging_data.next && paging_data.page_end < paging_data.total_count) {
			fes_board_paging.append(`<a class="paging_number" href=
			"${cpath}/fes_board/` + fes_page_href + `?` + query_string + `${paging_data.page_end + 1}">다음▶</a>`);
		}
	}
	else {
		fes_board_paging.empty();
	}
}


/*   동영 추가   */

let grades = document.querySelectorAll(".board_grade")   // 평점 선택


function star() {
  for (const grade of grades) {
    let percent = parseFloat(grade.innerText) * 20; // 문자열을 숫자로 변환
    grade.innerHTML = `<div class="starpoint_wrap">
         <div class="starpoint_box">
            <div class="label_star" style="width: 100px"></div>
            <span class="starpoint_bg" style="width: ${percent}%"></span>
         </div>
      </div>`;
  }
}

// ''월 ''일 형식 포맷 코드
function formatDate(date) {
     const month = String(date.getMonth() + 1).padStart(2, '0');
     const day = String(date.getDate()).padStart(2, '0');

     return month + '월 ' + day + '일 ';
}



