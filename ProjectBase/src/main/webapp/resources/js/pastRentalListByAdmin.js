/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	// 회원 정보 페이지로 이동
	$(document).on('click', '#memberInfoBtn', function() {
		location.href='memberInfoDetailForm.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page') 
		+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&b4Page=' + $(this).attr('data-b4Page')
		+ '&keyword=' + $(this).attr('data-keyword');// + '&idKeyword=' + $(this).attr('data-idKeyword') + '&nameKeyword=' + $(this).attr('data-nameKeyword');
	});
	
	// 메인 페이지로 이동
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){

})(jQuery);