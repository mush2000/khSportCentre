/* 페이지 로딩 후 실행 */
$(document).ready(function(){

	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var searchWord = $(this).attr('data-searchWord');
		
		var url = "searchPage.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchWord=" + searchWord;
		
		
		location.href = url;
		
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
			
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var searchWord = $(this).attr('data-searchWord');
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
		
		var url = "searchPage.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchWord=" + searchWord;
		
		location.href = url;
			
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var searchWord = $(this).attr('data-searchWord');
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
		
		var url = "searchPage.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchWord=" + searchWord;
		
		location.href = url;
		
	});
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);