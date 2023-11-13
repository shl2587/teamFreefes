'use strict'

// 스크롤 한번에 100vh씩 이동
   let lastScrollTop = 0;

   window.addEventListener("wheel", function(e) {
     const viewportHeight = window.innerHeight;
     const currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;

     if (e.deltaY > 0) {
       window.scrollTo({
         top: currentScrollTop + viewportHeight,
         behavior: "smooth"
       });
     } else {
       window.scrollTo({
         top: currentScrollTop - viewportHeight,
         behavior: "smooth"
       });
     }

     lastScrollTop = currentScrollTop;
   }, false);

//불꽃놀이
setInterval(createFirework, 800);

function createFirework() {
    const firework = document.createElement("div");
    firework.className = 'firework';
  
    for (let i = 0; i < 50; i++) {
        const trail = document.createElement('div');
        trail.className = 'trail';
        trail.style.backgroundColor = getRandomColor();
        trail.style.transform = `rotate(${Math.random() * 360}deg)`;
        trail.style.animationDelay = `${Math.random() * 0.3}s`;
        firework.appendChild(trail);
    }
    firework.style.left = Math.random() * window.innerWidth + "px";
    firework.style.bottom = Math.random() * window.innerWidth + "px";
    firework.style.scale = Math.random();
    document.body.appendChild(firework);
    setTimeout(() => {
        firework.remove();
    }, 2000);
  };
  
  function getRandomColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
  }


// 배너 슬라이드 기능
const prev = document.querySelector('.prev')
const next = document.querySelector('.next')
const slide = document.querySelectorAll('.slide')
const page = document.querySelector('.banner_page_wrap')
const banner_page = document.querySelectorAll('.banner_page')
let current_idx = 0

function move_slide() {
	
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	
	current_idx++
	current_idx = current_idx > slide.length-1 ? 0 : current_idx
	
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
}

// 다음 버튼
function next_click() {
	move_slide()
}

// 이전버튼
function prev_click() {
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	
	current_idx--
	current_idx = current_idx < 0 ? slide.length-1 : current_idx
	
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
 }




// 포스터 사진 색에 따른 배너 배경 색 설정
function banner_color_change(e) {
	const image = e.querySelector('.image')
	
	const colorThief = new ColorThief();
	const dominantColor = colorThief.getColor(image);
	const color = 'rgb(' + dominantColor[0] + ',' + dominantColor[1] + ',' + dominantColor[2] + ')'
	e.style.background = 'linear-gradient(90deg, #111, ' + color + ',' + color + ', #111)';
//	e.style.background = 'linear-gradient(90deg,' + color + ', #111, ' + color + ')';
//	e.style.background = 'linear-gradient(180deg, ' + color + ',' + color + ', #111)';
	
	current_page_on()
}

// 페이지 버튼 클릭시 해당 페이지 포스터 보기
page.onclick = function (event) {
	const banner_idx = event.target.getAttribute('id')
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	current_idx = banner_idx
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
}

// 페이지 버튼 활성
function current_page_on() {
	for(let i = 0; i < banner_page.length; i++) {
		if(banner_page[i].classList.contains('on')) {
			banner_page[i].classList.remove('on')
		}
	}
	banner_page[current_idx].classList.add('on')
}

// 도윤 스크립트
document.querySelector('.hamburger button').addEventListener('click', function() {
	  var dropdownMenu = document.querySelector('.hamburger .dropdown-menu');
	  var barsIcon = document.querySelector('.fa-bars');
	  var arrowIcon = document.querySelector('.fa-arrow-down');

	  if (barsIcon.classList.contains('active-icon')) {
	    barsIcon.style.display = 'none';
	    arrowIcon.style.display = 'inline-block';
	    barsIcon.classList.remove('active-icon');
	    arrowIcon.classList.add('active-icon');
	    dropdownMenu.classList.add('show');
	  } else {
	    barsIcon.style.display = 'inline-block';
	    arrowIcon.style.display = 'none';
	    barsIcon.classList.add('active-icon');
	    arrowIcon.classList.remove('active-icon');
	    dropdownMenu.classList.remove('show');
	  }
	});
	
//hover 로그인버튼에 효과
	document.querySelector('.login-icon').addEventListener('mouseover', function() {
	  var normalIcon = document.querySelector('.login-icon-normal');
	  var hoverIcon = document.querySelector('.login-icon-hover');
	  normalIcon.style.display = 'none';
	  hoverIcon.style.display = 'inline-block';
	});
	
	document.querySelector('.login-icon').addEventListener('mouseout', function() {
	  var normalIcon = document.querySelector('.login-icon-normal');
	  var hoverIcon = document.querySelector('.login-icon-hover');
	  normalIcon.style.display = 'inline-block';
	  hoverIcon.style.display = 'none';
	});
	
//hover 로그아웃 버튼에 효과
	document.querySelector('.login-icon').addEventListener('mouseover', function() {
	  var normalIcon = document.querySelector('.fa-arrow-right-from-bracket');
	  var hoverIcon = document.querySelector('.fa-arrow-right-from-bracket.fa-fade');
	  normalIcon.style.display = 'none';
	  hoverIcon.style.display = 'inline-block';
	});
	
	document.querySelector('.login-icon').addEventListener('mouseout', function() {
	  var normalIcon = document.querySelector('.fa-arrow-right-from-bracket');
	  var hoverIcon = document.querySelector('.fa-arrow-right-from-bracket.fa-fade');
	  normalIcon.style.display = 'inline-block';
	  hoverIcon.style.display = 'none';
	});

	
	function resetDropdownIcon() {
		  var barsIcon = document.querySelector('.fa-bars');
		  var arrowIcon = document.querySelector('.fa-arrow-down');
		  barsIcon.style.display = 'inline-block';
		  arrowIcon.style.display = 'none';
		  barsIcon.classList.add('active-icon');
		  arrowIcon.classList.remove('active-icon');
		}

		// 드랍다운 종료
		document.addEventListener('keydown', function(event) {
		  if (event.key === 'Escape') {
		    var dropdownMenu = document.querySelector('.hamburger .dropdown-menu');
		    dropdownMenu.classList.remove('show');
		    resetDropdownIcon();
		  }
		});

		document.addEventListener('click', function(event) {
		  var dropdownMenu = document.querySelector('.hamburger .dropdown-menu');
		  var hamburgerButton = document.querySelector('.hamburger button');
		  if (!dropdownMenu.contains(event.target) && !hamburgerButton.contains(event.target)) {
		    dropdownMenu.classList.remove('show');
		    resetDropdownIcon();
		  }
		});

function total_search() {
	$(document).ready(function () {
	    const total_search_form = $("#total_search_form");
	    const search_input = $("#search_input");
	    const search_results = $("#search_results");

	    total_search_form.submit(function (event) {
	        event.preventDefault(); // 기본 폼 제출 동작을 막음

	        const search_term = searchInput.val().toLowerCase();
	        searchResults.empty(); // 이전 검색 결과를 초기화

	        // 웹 페이지 내의 모든 요소를 순회하며 검색어와 일치하는 것을 찾습니다.
	        const all_elements = $("body *");

	        all_elements.each(function () {
	            const content = $(this).text().toLowerCase();
	            if (content.includes(search_term)) {
	                const result_item = $("<div>").text(content);
	                search_results.append(result_item);
	            }
	        })
	    })
	})
}	


//랭킹
const insert_rank1 = document.querySelector(".festival_ranking1")
const insert_rank2 = document.querySelector(".festival_ranking2")
const insert_rank3 = document.querySelector(".festival_ranking3")
const insert_rank4 = document.querySelector(".festival_ranking4")
const insert_rank5 = document.querySelector(".festival_ranking5")

const insert_ranks = [insert_rank1, insert_rank2, insert_rank3, insert_rank4, insert_rank5]
let rank = 'count'
window.onload = ranking(rank)
async function ranking(rank) {
	await fetch(cpath + "/fes_board/top5_list/" + rank, {
		method: "GET",
		cache: "no-cache"
	})
		.then(resp => resp.json())
		.then((data) => {
			for (let i = 0; i < 5; i++) {
				insert_ranks[i].innerHTML = `<a href="${cpath}/fes_board/mainboard/${data[i].idx}">${data[i].title}</a>`
			}

		})
	
}
