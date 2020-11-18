/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	if (confirm('로그아웃 하시겠습니까?')) {
		alert('로그아웃 되었습니다.');
		location.href='logoutMember.do';
		return;
	} else
		history.back();
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);