/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	$(document).on('click', '#myInfoBtn', function() {
		location.href='memberInformation.do';
	});
	
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);