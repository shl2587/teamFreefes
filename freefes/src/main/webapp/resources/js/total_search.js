'use strict'

document.addEventListener("DOMContentLoaded", function () {
    const search_input = document.getElementById("searchInput");
    const search_button = document.getElementById("searchButton");
    const searchResults = document.getElementById("searchResults");
    
    // 검색 버튼 클릭 시 이벤트 처리
    searchButton.addEventListener("click", function () {
        const searchTerm = searchInput.value.toLowerCase();
        searchResults.innerHTML = ""; // 이전 검색 결과를 초기화
        
        // 웹 페이지 내의 모든 요소를 순회하며 검색어와 일치하는 것을 찾습니다.
        const allElements = document.body.querySelectorAll("*");

        allElements.forEach(function (element) {
            if (element.nodeType === 3) { // 텍스트 노드인 경우에만 검색
                const content = element.textContent.toLowerCase();
                if (content.includes(searchTerm)) {
                    const resultItem = document.createElement("p");
                    resultItem.textContent = content;
                    searchResults.appendChild(resultItem);
                }
            }
        });
    });
    
    // Enter 키로 검색할 수 있도록 이벤트 처리
    searchInput.addEventListener("keyup", function (event) {
        if (event.key === "Enter") {
            searchButton.click();
        }
    });
});