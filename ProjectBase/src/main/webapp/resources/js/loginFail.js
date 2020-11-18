/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var wId = $('#wrongId').val();
	if (wId == '5times') {
		alert('비밀번호를 5회 이상 틀렸습니다. 비밀번호 찾기를 이용해서 비밀번호를 다시 설정하세요');
		location.href='searchPwPage.do';
		return;
	}
	if (wId == 'true')
		alert('존재하지 않는 아이디 입니다.');
	else 
		alert('비밀번호가 틀렸습니다.\n5회이상 틀릴시 로그인이 제한될 수 있습니다.');
		
	location.href='loginPage.do';
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