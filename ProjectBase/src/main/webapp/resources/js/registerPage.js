/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$(document).on('click', '#regClass', function() {
		if (confirm('등록 하시겠습니까?'))
			location.href = 'joinClass.do?classNum=' + $(this).attr('data-classNum');
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);