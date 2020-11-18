/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 이전 수강했던 강습 목록으로 이동
	$(document).on('click', '#memberClassListBtn', function() {
		location.href='selectClassListByAdmin.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page') + '&b4Page=' + $(this).attr('data-b4Page') 
			+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&keyword=' + $(this).attr('data-keyword');
	});
	// 회원정보 페이지로 이동
	$(document).on('click', '#memberInfoBtn', function() {
		location.href='memberInfoDetailForm.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page')  + '&b4Page=' + $(this).attr('data-b4Page')
			+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&keyword=' + $(this).attr('data-keyword');
	});
	// 메인페이지로 이동
	$(document).on('click', '#mainPageBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){

})(jQuery);