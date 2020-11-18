/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 회원정보페이지로 이동
	$(document).on('click', '#myInfoBtn', function() {
		location.href='memberInfoDetailForm.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page') 
			+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&b4Page=' + $(this).attr('data-b4Page')
			+ '&keyword=' + $(this).attr('data-keyword');
	});
	
	// 메인페이지로 이동
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
	
	// 클릭한 강습의 수강생 정보 확인
	$(document).on('click', '.nowClassNameTd', function() {
		location.href='nowClassStudentInfo.do?classNum=' + $(this).attr('data-classNum');
	});

	// 클릭한 강습의 수강생 정보 후기 확인
	$(document).on('click', '.pastClassNameTd', function() {
		location.href='pastClassStudentInfo.do?classNum=' + $(this).attr('data-classNum');
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);