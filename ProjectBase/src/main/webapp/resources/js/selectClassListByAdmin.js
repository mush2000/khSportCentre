/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	// 후기 내용 확인
	$(document).on('click', '.surveyContent', function() {
		var classNum = $(this).attr('data-classNum');
		var classesName = $(this).parent().parent().parent().children().eq(0).children().eq(1).html();
		var classDay = $(this).parent().parent().parent().children().eq(0).children().eq(3).html();
		var classTime = $(this).parent().parent().parent().children().eq(0).children().eq(5).html();
		var levelName = $(this).parent().parent().parent().children().eq(0).children().eq(7).html();
		var memberName = $(this).parent().parent().parent().children().eq(1).children().eq(1).html();
		var classDate = $(this).parent().parent().parent().children().eq(1).children().eq(5).html();
		
		var loc = '?classNum=' + classNum + '&classesName=' + classesName + '&classDay=' + classDay;
		loc += '&classTime=' + classTime + '&levelName=' + levelName + '&memberName=' + memberName + '&classDate=' + classDate;
		location.href= 'selectSurveyByAdmin.do' + loc + '&surveyNum=' + $(this).attr('data-surveyNum') + '&memberId2=' + $('#memberInfoBtn').attr('data-mId')
			+ '&page=' + $('#memberInfoBtn').attr('data-page') + '&range=' + $('#memberInfoBtn').attr('data-range') + '&delYn=' + $('#memberInfoBtn').attr('data-delYn')
			+ '&b4Page=' + $('#memberInfoBtn').attr('data-b4Page') + '&keyword=' + $(this).attr('data-keyword');
	});
	
	// 회원 정보 페이지로 이동(이전 페이지)
	$(document).on('click', '#memberInfoBtn', function() {
		location.href='memberInfoDetailForm.do?memberId=' + $(this).attr('data-mId') + '&page=' + $(this).attr('data-page') 
			+ '&range=' + $(this).attr('data-range') + '&delYn=' + $(this).attr('data-delYn') + '&b4Page=' + $(this).attr('data-b4Page')
			+ '&keyword=' + $(this).attr('data-keyword');
	});
	
	// 메인페이지로 이동
	$(document).on('click', '#goHomeBtn', function() {
		location.href='mainPage.do';
	});
});

/* 함수선언 영역*/
(function($){

})(jQuery);