/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	$(document).on('click', '#surveyListBtn', function() {
		location.href='surveyList.do';
	});
	
	$(document).on('click', '#myClassListBtn', function() {
		location.href='selectClassList.do?memberId=' + $(this).attr('data-mId');
	});
	
	$(document).on('click', '#myInfoBtn', function() {
		location.href='memberInformation.do';
	});
	
	$(document).on('click', '#mainPageBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);