/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 이름 클릭시 회원 상세정보로 이동
	$(document).on('click', '.memberIdTd' , function() {
		
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var memberId = $(this).text();
		var delYn = $('#instDel').val();
		var keyword = $('#nowKeyword').val();
		
		location.href = 'memberInfoDetailForm.do?memberId=' + memberId + '&page=' + page + '&range=' + range + '&delYn=' + delYn + '&b4Page=I' + '&keyword=' + keyword;
		
	});
	
	// 강사 그만둔 강사 강사 지원자 선택시 각 목록으로 이동	
	$(document).on('change', '#instDel' , function() {
		var instDel = $('#instDel').val();
		
		location.href = 'adminB.do?delYn=' + instDel;
		
	});
	
	// 아이디와 이름으로 검색
	$(document).on('click', '#searchBtn' , function() {
		var keyword = $('#keyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#instDel').val();
		
		location.href = 'adminB.do?delYn=' + delYn + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});
	
	// 삭제된 강사를 다시 복귀
	$(document).on('click', '.returnInstInfo' , function() {
		var instNum = $(this).attr('data-instNum');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var keyword = $('#nowKeyword').val();
		var instDel = $('#instDel').val();
		
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		if(confirm('해당 강사를 다시 추가하시겠습니까?')) {
			alert('해당 강사를 추가합니다.');
			location.href = 'updateInstructorInstDel.do?instNum=' + instNum + '&instDel=N&page=' + page + '&range=' + range + '&keyword='
				+ keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword + '&delYn=' + instDel;
		} else {
			alert('취소');
		}
	});
	
	// 강사를 그만둠
	$(document).on('click', '.deleteInstInfo' , function() {
		var instNum = $(this).attr('data-instNum');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var keyword = $('#nowKeyword').val();
		var instDel = $('#instDel').val();
		
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		if(confirm('해당 강사를 삭제하시겠습니까?')) {
			alert('해당 강사를 삭제합니다.');
			location.href = 'updateInstructorInstDel.do?instNum=' + instNum + '&instDel=Y&page=' + page + '&range=' + range + '&keyword='
				+ keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword + '&delYn=' + instDel;
		} else {
			alert('취소');
		}
	});
	
	// 강사지원자를 강사로 등록
	$(document).on('click', '.insertInstInfo' , function() {
		var instNum = $(this).attr('data-instNum');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var keyword = $('#nowKeyword').val();
		var instDel = $('#instDel').val();
		
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		if(confirm('해당 지원자를 등록하시겠습니까?')) {
			alert('해당 지원자를 등록합니다.');
			location.href = 'updateInstructorInstDel.do?instNum=' + instNum + '&instDel=N&page=' + page + '&range=' + range + '&keyword='
				+ keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword + '&delYn=' + instDel;
		} else {
			alert('취소');
		}
	});
	
	// 강사지원자를 탈락 시킴
	$(document).on('click', '.rejectInstInfo' , function() {
		var instNum = $(this).attr('data-instNum');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var keyword = $('#nowKeyword').val();
		var instDel = $('#instDel').val();
		
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		if(confirm('해당 지원자를 삭제하시겠습니까?')) {
			alert('해당 지원자를 삭제합니다.');
			location.href = 'updateInstructorInstDel.do?instNum=' + instNum + '&instDel=U&page=' + page + '&range=' + range + '&keyword='
				+ keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword + '&delYn=' + instDel;
		} else {
			alert('취소');
		}
	});
	
	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var instDel = $('#instDel').val();
		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var url = 'adminB.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ instDel;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
			
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		
		var instDel = $('#instDel').val();
		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
		
		var url = 'adminB.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ instDel;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
			
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		
		var instDel = $('#instDel').val();
		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
		
		
		var url = 'adminB.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ instDel;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
		
	});
	
	
	
	
});


/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	
	
})(jQuery);