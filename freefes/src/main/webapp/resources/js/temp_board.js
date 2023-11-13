'use strict'


		
const temp_buttons = document.querySelectorAll('.temp_button')
let temp_board_idx = null
const temp_save = document.getElementById('temp_save')
const load_temp_save = document.getElementById("load_temp_save")
const block = document.querySelector(".block")

const hidden_temp = document.querySelector(".hidden_temp")

const temp_deletes = document.querySelectorAll(".temp_delete")

temp_save.addEventListener('click', function(event) {
  event.preventDefault();
  saveTempBoard();
});


// 임시저장글 X버튼 클릭
temp_deletes.forEach(function(e) {
	e.addEventListener('click', function() {
		const deleteIdx = e.getAttribute("value")
		const result = confirm("정말 삭제하시겠습니까?")
		if(result) {
			temp_delete(deleteIdx)
		}
	})
})	

// 임시저장글 목록 누르면 자동 입력
temp_buttons.forEach(function(e) {
	e.addEventListener('click', function() {
		const idxInput = e.querySelector('.temp_board_idx')
		temp_board_idx = idxInput.value
		fetchData()
	})
})



// 임시저장글 삭제

async function temp_delete(deleteIdx) {
    const url = cpath + "/fes_board/temp_delete/" + deleteIdx;
    try {
        await fetch(url)

        // 클릭한 버튼의 부모 요소를 찾아 삭제
        const button = document.querySelector(`.temp_delete[value="${deleteIdx}"]`)
        if (button) {
            const entry = button.closest('.temp_entry')
            if (entry) {
                entry.remove()
            }
        }
        if (!document.querySelector('.temp_entry')) {
        	const empty_temp = document.createElement('div')
    		empty_temp.style.paddingTop = "5px"
        	empty_temp.id = "no_save"
            empty_temp.innerText = '임시저장글이 없습니다.'
            
        	hidden_temp.appendChild(empty_temp)
        }
        
        alert('임시 저장글이 삭제되었습니다')
    } catch (err) {
        console.error("에러 : ", err)
        alert('오류로 인해 임시 저장글 삭제가 실패했습니다')
    }
}



// 마우스 올리면 목록나옴
load_temp_save.addEventListener("mouseover", function() {
	if (block) {
		block.style.display = "block"
	}
})


// 마우스 벗어나면 목록 사라짐
load_temp_save.addEventListener("mouseout", function() {
	if (block) {
		block.style.display = "none"
	}
})


// 임시저장글 불러오기
async function fetchData() {
	
	if (temp_board_idx === null) {
		return alert("임시 저장 글을 선택하세요!")
	}
	
	await fetch(cpath + "/fes_board/load_temp_board/" + temp_board_idx, {
	    method: "GET",
	    cache: "no-cache"
	})
		.then((resp) => resp.json())
		.then((data) => {
			const form = document.getElementById('form')
			
			// 날짜 포맷하기
			const startDateTimestamp = data.start_date
			const endDateTimestamp = data.end_date
			
			const startDate = new Date(startDateTimestamp)
			const endDate = new Date(endDateTimestamp)
			
			const formattedStartDate = startDate.toISOString().split('T')[0]
			const formattedEndDate = endDate.toISOString().split('T')[0]
			
			const fullRegion = data.region.split(" ")
			const region = fullRegion[0]
			const region_section = fullRegion[1]
			
		    form.querySelector('select[name="region"]').value = region
		    update_region_section(region)
		    form.querySelector('select[name="region_section"]').value = region_section
		    form.querySelector('select[name="festival_category"]').value = data.festival_category
		    form.querySelector('input[name="title"]').value = data.title
		    form.querySelector('textarea[name="content"]').value = data.content
		    form.querySelector('input[name="start_date"]').value = formattedStartDate
			form.querySelector('input[name="end_date"]').value = formattedEndDate
			form.querySelector('input[name="place"]').value = data.place
			form.querySelector('input[name="time"]').value = data.time
			form.querySelector('input[name="url"]').value = data.url
			form.querySelector('input[name="fee"]').value = data.fee
			form.querySelector('input[name="age_limit"]').value = data.age_limit
			form.querySelector('input[name="host_org"]').value = data.host_org
			form.querySelector('input[name="inquire"]').value = data.inquire
			form.querySelector('input[name="way_to_come"]').value = data.way_to_come
		})
}


// 임시저장버튼
async function saveTempBoard(event) {
	
	const form = document.getElementById('form')
	const ob = {
	    region: form.querySelector('select[name="region"]').value + " " + form.querySelector('select[name="region_section"]').value,
	    festival_category: form.querySelector('select[name="festival_category"]').value,
	    member: memberIdx,
	    title: form.querySelector('input[name="title"]').value,
	    start_date: form.querySelector('input[name="start_date"]').value,
	    end_date: form.querySelector('input[name="end_date"]').value,
	    content: form.querySelector('textarea[name="content"]').value,
	    place: form.querySelector('input[name="place"]').value,
	    time: form.querySelector('input[name="time"]').value,
	    url: form.querySelector('input[name="url"]').value,
	    fee: form.querySelector('input[name="fee"]').value,
	    age_limit: form.querySelector('input[name="age_limit"]').value,
	    host_org: form.querySelector('input[name="host_org"]').value,
	    inquire: form.querySelector('input[name="inquire"]').value,
	    way_to_come: form.querySelector('input[name="way_to_come"]').value
	    
	}
	
	

	
	// 빈 제목이면 기능을 끝낸다
	if(ob.title === '') {	
		return alert("제목을 입력해주세요!")
	}
	
	// DB에 저장
	try {
		
		const resp = await fetch(cpath + '/fes_board/temp_board_save', {
			method: 'POST',
			cache: 'no-cache',
			headers: {
		        'Content-Type': 'application/json; charset=utf-8'
		    },
			body: JSON.stringify(ob)
		})
		
		const data = await resp.json()
		const dataDate = new Date(data.write_date)
		const write_date = formatDate(dataDate)
		const title = data.title
		const idx = data.idx
		const no_save = document.getElementById("no_save")
		
		if(no_save) {
			no_save.parentNode.removeChild(no_save)
		}
		
		const temp_idxes = document.querySelectorAll('.temp_board_idx')
		let temp_exist = false
		temp_idxes.forEach(function(e) {
			if (e.value == idx) {
				temp_exist = true
				return
			}
		})
		
		if(!temp_exist) {
			const tempButtonDiv = document.createElement('div')
			tempButtonDiv.classList.add("temp_entry")
				tempButtonDiv.innerHTML = `
					<div class="temp_button">
					<strong class="temp_save_title">${title}</strong>
					<div>${write_date}</div>
					<input type="hidden" class="temp_board_idx" value="${idx}">
					</div>
					<button class="temp_delete" value="${idx}">X</button>
					`
					hidden_temp.appendChild(tempButtonDiv)
					
					tempButtonDiv.querySelector('.temp_delete').addEventListener('click', function () {
						const deleteIdx = idx
						temp_delete(deleteIdx)
					})
					
					tempButtonDiv.addEventListener('click', function () {
						const idxInput = tempButtonDiv.querySelector('.temp_board_idx')
						temp_board_idx = idxInput.value
						fetchData()
					})
		}
        
        alert('임시저장되었습니다')
        
	} catch (error) {
		console.error("에러 : ", error)
		alert('오류로 인해 임시저장에 실패했습니다')
	}
}

function formatDate(date) {
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  const hours = String(date.getHours()).padStart(2, '0');
	  const minutes = String(date.getMinutes()).padStart(2, '0');
	  const seconds = String(date.getSeconds()).padStart(2, '0');

	  return year + '년 ' + month + '월 ' + day + '일 ' + hours + '시 ' + minutes + '분 ' + seconds + '초에 저장된 글';
	}

$("#poster").on('change',function(){
	  const fileName = $("#poster").val()
	  $(".poster-name").val(fileName)
	})
	
$("#photo").on('change',function(){
	const fileName = $("#photo").val()
	$(".photo-name").val(fileName)
})

