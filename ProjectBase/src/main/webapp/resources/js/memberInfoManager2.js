/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 모든회원, 회원, 삭제된 회원 선택시 해당 데이터를 가져옴
	$(document).on('change', '#delYn' , function() {
		var delYn = $('#delYn').val();
		
		location.href = 'memberListManager.do?delYn='+delYn;
	});
	
	// 아이디, 이름으로 검색했을 때
	$(document).on('click', '#searchBtn' , function() {
		var keyword = $('#keyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#delYn').val();
		
		location.href = 'memberListManager.do?delYn=' + delYn + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});

	// 아이디를 클릭하면 해당 회원의 상세정보 페이지로 이동
	$(document).on('click', '.memberIdTd' , function() {
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#delYn').val();
		var memberId = $(this).text();
		var keyword = $('#keyword').val();
		
		location.href = 'memberInfoDetailForm.do?memberId=' + memberId + '&page=' + page + '&range=' + range + '&delYn=' + delYn + '&b4Page=M' + '&keyword=' + keyword;
	});
	
	$(document).on('click', '.deleteMemberInfo' , function() {
		var memberId = $(this).attr('data-memberId');
		var delYn = $('#delYn').val();
		
		var YN = confirm('해당 멤버를 삭제하시겠습니까?');
		
		if(YN) {
			alert('해당 멤버 삭제합니다.');
			location.href = 'deleteMember2.do?memberId=' + memberId + '&delYn=' + delYn;
		} else {
			alert('취소');
		}
	});
	
	$(document).on('click', '.restoreMemberInfo' , function() {
		var memberId = $(this).attr('data-memberId');
		var delYn = $('#delYn').val();
		
		var YN = confirm('해당 멤버를 복구하시겠습니까?');
		
		if(YN) {
			alert('해당 멤버 복구합니다.');
			location.href = 'restoreMember.do?memberId=' + memberId + '&delYn=' + delYn;
		} else {
			alert('취소');
		}
	});
	
	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var delYn = $('#delYn').val();
		
		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
			
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');

		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var delYn = $('#delYn').val();
		
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
			
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');

		var keyword = $('#nowKeyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		var delYn = $('#delYn').val();
		
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
		
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url + '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
		
	});
	
	
	
	
});

(function($){
	
})(jQuery);