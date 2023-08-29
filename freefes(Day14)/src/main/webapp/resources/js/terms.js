function updateNextButton() {
    const termsCheckbox = document.getElementById('termsOfService');
    const privacyCheckbox = document.getElementById('privacyPolicy');
    const promotionsCheckbox = document.getElementById('allowPromotions');
    const checkAllCheckbox = document.getElementById('checkAll');
    const nextButton = document.querySelector('.nextBtn');

    // 모든 박스가 눌러진 경우, checkAllCheckbox 자동으로 체크
    if (termsCheckbox.checked && privacyCheckbox.checked && promotionsCheckbox.checked) {
        checkAllCheckbox.checked = true;
        nextButton.removeAttribute('disabled');
    }
    else if(termsCheckbox.checked && privacyCheckbox.checked){
    	checkAllCheckbox.checked = false;
    	nextButton.removeAttribute('disabled');
    }
    else {
    	checkAllCheckbox.checked = false;
    	 nextButton.setAttribute('disabled', 'true');
    }
}

function is_checked1() {
    const checkbox = document.getElementById('termsOfService');
    const is_checked = checkbox.checked;

    updateNextButton();
}

function is_checked2() {
    const checkbox = document.getElementById('privacyPolicy');
    const is_checked = checkbox.checked;

    updateNextButton();
}

function is_checked3() {
    const checkbox = document.getElementById('allowPromotions');
    const is_checked = checkbox.checked;

    updateNextButton();
}

// checkAll 클릭 시 모든 하위 체크박스를 선택/해제
function checkAllClicked() {
    const termsCheckbox = document.getElementById('termsOfService');
    const privacyCheckbox = document.getElementById('privacyPolicy');
    const promotionsCheckbox = document.getElementById('allowPromotions');
    const checkAllCheckbox = document.getElementById('checkAll');

    const allChecked = checkAllCheckbox.checked;
    termsCheckbox.checked = allChecked;
    privacyCheckbox.checked = allChecked;
    promotionsCheckbox.checked = allChecked;

    updateNextButton();
}


// checkAll 클릭 이벤트 핸들러 등록
const checkAllCheckbox = document.getElementById('checkAll');
checkAllCheckbox.addEventListener('click', checkAllClicked);


// 초기 상태에서 nextBtn 비활성화
updateNextButton();