/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$(document).on('click', '#myInfoBtn', function() {
		location.href='memberInformation.do';
	});
	
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
	
	$(document).on('click', '.cancelClassBtn', function() {
		if(confirm('정말로 취소하시겠습니까?'))
			location.href='cancelClass.do?regClassNum=' + $(this).attr('data-regClassNum') + '&listSize=' + $(this).attr('data-listSize');
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);