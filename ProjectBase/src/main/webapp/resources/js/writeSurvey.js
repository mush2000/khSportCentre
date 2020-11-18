/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	$(document).on('click', '#surveySubmit', function() {
		if(confirm('등록후에는 수정/삭제 할 수 없습니다. 등록하시겠습니까?')) {
			submit();
		}
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);