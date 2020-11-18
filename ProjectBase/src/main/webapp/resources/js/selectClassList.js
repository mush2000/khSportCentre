/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	
	$(document).on('click', '.writeSurvey', function() {
		var classNum = $(this).attr('data-classNum');
		var classesName = $(this).parent().parent().parent().children().eq(0).children().eq(1).html();
		var classDay = $(this).parent().parent().parent().children().eq(0).children().eq(3).html();
		var classTime = $(this).parent().parent().parent().children().eq(0).children().eq(5).html();
		var levelName = $(this).parent().parent().parent().children().eq(0).children().eq(7).html();
		var memberName = $(this).parent().parent().parent().children().eq(1).children().eq(1).html();
		var classDate = $(this).parent().parent().parent().children().eq(1).children().eq(5).html();
		
		var loc = '?classNum=' + classNum + '&classesName=' + classesName + '&classDay=' + classDay + '&memberId=' + $(this).attr('data-mId');
		loc += '&classTime=' + classTime + '&levelName=' + levelName + '&memberName=' + memberName + '&classDate=' + classDate;
		location.href= 'writeSurvey.do' + loc;
	});
	
	$(document).on('click', '.surveyContent', function() {
		var classNum = $(this).attr('data-classNum');
		var classesName = $(this).parent().parent().parent().children().eq(0).children().eq(1).html();
		var classDay = $(this).parent().parent().parent().children().eq(0).children().eq(3).html();
		var classTime = $(this).parent().parent().parent().children().eq(0).children().eq(5).html();
		var levelName = $(this).parent().parent().parent().children().eq(0).children().eq(7).html();
		var memberName = $(this).parent().parent().parent().children().eq(1).children().eq(1).html();
		var classDate = $(this).parent().parent().parent().children().eq(1).children().eq(5).html();
		
		var loc = '?classNum=' + classNum + '&classesName=' + classesName + '&classDay=' + classDay + '&memberId=' + $(this).attr('data-mId');;
		loc += '&classTime=' + classTime + '&levelName=' + levelName + '&memberName=' + memberName + '&classDate=' + classDate;
		location.href= 'selectSurvey.do' + loc + '&surveyNum=' + $(this).attr('data-surveyNum');
	});

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