/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var date = new Date().getDate();
	if(date > 14 && date < 26) {
//	if(date == 13) {
		if($('#classTbody').attr('data-session') != ''){
			$('.fee').append('<div style="height: 10px;"></div><input type="button" value="수강신청" id="registerClass">');
		} else {
			$('#displayNotice').html('지금은 <strong>수강신청</strong> 기간입니다.<br>수강신청 하시려면 <strong>로그인</strong>하세요.</div><div style="height: 10px;">');
		}
		$(document).on('click', '#registerClass', function() {
			var classesCode = $(this).parent().parent().next().next().next().attr('data-classCode');
			location.href='registerClass.do?classesCode='+ classesCode;
		});
	}
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {
	//});
//	$(document).on('click', '.className', function() {
//		location.href= 'classes' + $(this).attr('data-classCode') + '.do';
//	});
});

/* 함수선언 영역*/
(function($){
	//# sourceMappingURL=inko.min.js.map

	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);