/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 회원정보페이지로 이동(이전 페이지)
	$(document).on('click', '#memberInfoBtn', function() {
		location.href='memberInfoDetailForm.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page') 
			+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&b4Page=' + $(this).attr('data-b4Page')
			+ '&keyword=' + $(this).attr('data-keyword');
	});
	
	// 메인페이지로 이동
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){
	
})(jQuery);