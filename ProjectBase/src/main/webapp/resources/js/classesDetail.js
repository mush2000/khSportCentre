/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var date = new Date().getDate();
	var currentTd = $('#classFeeTd'); 
	if(date == 15) {
		currentTd.attr('colspan', 1)
		currentTd.after('<td colspan="2" style="text-align: center; border-left: 1px solid #ddd; color: red;">내일부터 수강신청 기간입니다.');
		$('#classFeeTd').addClass('classFeeTd');
	}
	
	var str = '';
	if(currentTd.attr('data-session') != ''){
		str += '<input type="button" value="수강신청" id="registerClass">';
		$('#classFeeTd').addClass('classFeeTd');
	} else {
		str += '<span style="color: red;">지금은 <strong>수강신청</strong> 기간입니다.<br>수강신청 하시려면 <strong>로그인</strong>하세요.</span>';
		$('#classFeeTd').addClass('classFeeTd');
	}
	if(date > 14 && date < 26) {
		currentTd.attr('colspan', 1)
		currentTd.after('</td><td colspan="2" class="title2" padding-top: 5px !important; padding-bottom: 5px !important;>' + str);
		$(document).on('click', '#registerClass', function() {
			location.href='registerClass.do?classesCode='+ $('#classesCode').val();
		});
	}else{
		$('#classFeeTd').removeClass('classFeeTd');
	}
});

/* 함수선언 영역*/
(function($){


})(jQuery);