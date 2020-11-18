/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	$(document).on('click', '#myInfoBtn', function() {
		location.href='memberInformation.do';
	});
	
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
	
	$(document).on('click', '.nowClassNameTd', function() {
		location.href='nowClassStudentInfo.do?classNum=' + $(this).attr('data-classNum');
	});
	
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