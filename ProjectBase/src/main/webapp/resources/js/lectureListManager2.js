/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	$(document).on('click', '#allChkbox2', function() {
		$('.chkbox2').each(function(){
			$(this).prop('checked',$('#allChkbox2').is(':checked'));
		});
	});
	
	$(document).on('click', '#allChkbox', function() {
		$('.chkbox').each(function(){
			$(this).prop('checked',$('#allChkbox').is(':checked'));
		});
	});
	
	
	$(document).on('click', '#deleteClassInfo', function() {
		if($('.chkbox:checked').length == 0) {
			alert('강습을 선택하세요.');
		} else 	if(confirm('선택한 강습을 모두 삭제 하시겠습니까?')){
			var page = $('#nowPage').val();
			var range = $('#nowRange').val();
			var nextPage = $('#nowNextPage').val();
			var nextRange = $('#nowNextRange').val();
			
			var str = "&page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classesCode=" + $('#classesCode').val() + "&classTime=" + $('#classTime').val();
			
			var classNumList = '';
			$('.chkbox:checked').each(function(){
				if(classNumList != '') classNumList += ',';
				classNumList += $(this).parent().parent().children(':last').children(':first').attr('data-classNum');
			});
			
			location.href = 'deleteNextMonthClassList.do?classNumList=' + classNumList + str;
		}
	});
	
	$(document).on('click', '.deleteClassInfo', function() {
		if(confirm('강습을 정말 삭제 하시겠습니까?')){
			var page = $('#nowPage').val();
			var range = $('#nowRange').val();
			var nextPage = $('#nowNextPage').val();
			var nextRange = $('#nowNextRange').val();
			
			var str = "&page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classesCode=" + $('#classesCode').val() + "&classTime=" + $('#classTime').val();
			location.href = 'deleteNextMonthClass.do?classNum=' + $(this).attr('data-classNum') + str;
		}
	});
	
//	$(document).on('click', '.modifyClassInfo', function() {
//		
//	});
	
	$(document).on('click', '#registerClassList', function() {
		if($('.chkbox2:checked').length == 0) {
			alert('강습을 선택하세요.');
		} else 	if(confirm('선택한 강습을 모두 등록 하시겠습니까?')){
			var page = $('#nowPage').val();
			var range = $('#nowRange').val();
			var nextPage = $('#nowNextPage').val();
			var nextRange = $('#nowNextRange').val();
			
			var str = "&page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classesCode=" + $('#classesCode').val() + "&classTime=" + $('#classTime').val();
			
			var classNumList = '';
			$('.chkbox2:checked').each(function(){
				if(classNumList != '') classNumList += ',';
				classNumList += $(this).parent().parent().children(':last').children(':first').attr('data-classNum');
			});
			
			location.href = 'registerNextMonthClassList.do?classNumList=' + classNumList + str;
		}
	});
	
	$(document).on('click', '.registerClass', function() {
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var nextPage = $('#nowNextPage').val();
		var nextRange = $('#nowNextRange').val();
		
		var str = "&page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classesCode=" + $('#classesCode').val() + "&classTime=" + $('#classTime').val();
		location.href = 'registerNextMonthClass.do?classNum=' + $(this).attr('data-classNum') + str;
	});
	
	//페이징 실행 
	$(document).on('click', '.nextPageNum', function() {
		var nextPage = $(this).attr('data-page');
		var nextRange = $(this).attr('data-range');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
//		var page = $('.pagePrev').attr('data-page');
//		var range = $('.pagePrev').attr('data-range');

		var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
		
		location.href = url;
	});
	
	//이전버튼 페이징
	$(document).on('click', '.nextPagePrev', function() {
			var nextPage = $(this).attr('data-page');
			var nextRange = $(this).attr('data-range');
			var nextRangeSize = $(this).attr('data-rangeSize');
			var page = $('#nowPage').val();
			var range = $('#nowRange').val();
//			var page = $('.pagePrev').attr('data-page');
//			var range = $('.pagePrev').attr('data-range');
//			var rangeSize = $('.pagePrev').attr('data-rangeSize');
			
			nextPage = ((nextRange - 2) * nextRangeSize) + 10;
			nextRange = nextRange - 1;
//			page = ((range - 2) * rangeSize) + 10;
//			range = range - 1;
			var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
			
			location.href = url;
	});
	
	//다음버튼 페이징
	$(document).on('click', '.nextPageNext', function() {
		var nextPage = $(this).attr('data-page');
		var nextRange = $(this).attr('data-range');
		var nextRangeSize = $(this).attr('data-rangeSize');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
//		var page = $('.pagePrev').attr('data-page');
//		var range = $('.pagePrev').attr('data-range');
//		var rangeSize = $('.pagePrev').attr('data-rangeSize');
		
		nextPage = parseInt((nextRange * nextRangeSize)) + 1;
		nextRange = parseInt(parseInt(nextRange)) + 1;
//		page = parseInt((range * rangeSize)) + 1;
//		range = parseInt(range) + 1;
		var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
		
		location.href = url;
	});
	
	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var nextPage = $('#nowNextPage').val();
		var nextRange = $('#nowNextRange').val();
//		var nextPage = $('.nextPagePrev').attr('data-page');
//		var nextRange = $('.nextPagePrev').attr('data-range');
		
		var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
		
		location.href = url;
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var nextPage = $('#nowNextPage').val();
		var nextRange = $('#nowNextRange').val();
//		var nextPage = $('.nextPagePrev').attr('data-page');
//		var nextRange = $('.nextPagePrev').attr('data-range');
//		var nextRangeSize = $('.nextPagePrev').attr('data-rangeSize');
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
//		nextPage = ((nextRange - 2) * nextRangeSize) + 10; // 10으로 수정해본다
//		nextRange = nextRange - 1;
		var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
		
		location.href = url;
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var nextPage = $('#nowNextPage').val();
		var nextRange = $('#nowNextRange').val();
//		var nextPage = $('.nextPagePrev').attr('data-page');
//		var nextRange = $('.nextPagePrev').attr('data-range');
//		var nextRangeSize = $('.nextPagePrev').attr('data-rangeSize');
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
//		nextPage = parseInt((nextRange * nextRangeSize)) + 1;
//		nextRange = parseInt(nextRange) + 1;
		var url = "lectureListManager.do" + "?page=" + page + "&range=" + range + "&nextPage=" + nextPage + "&nextRange=" + nextRange + "&classTime=" + $('#classTime').val();
		
		location.href = url;
	});
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);