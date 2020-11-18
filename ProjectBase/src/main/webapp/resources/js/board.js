/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var kindCode = $(this).attr('data-kindCode');
		var searchType = $(this).attr('data-searchType');
		var keyword = $(this).attr('data-keyword');
		
		var url = "board.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&kindCode=" + kindCode;
		
		
		location.href = url;
		
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
			
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var kindCode = $(this).attr('data-kindCode');
		var searchType = $(this).attr('data-searchType');
		var keyword = $(this).attr('data-keyword');
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
		
		var url = "board.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&kindCode=" + kindCode;
		
		location.href = url;
			
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		var kindCode = $(this).attr('data-kindCode');
		var searchType = $(this).attr('data-searchType');
		var keyword = $(this).attr('data-keyword');
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
		
		var url = "board.do";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		url = url + "&kindCode=" + kindCode;
		
		location.href = url;
		
	});
	
	
	//글쓰기
	$(document).on('click', '#boardWriteBtn', function() {
		let chkKindCode = $('#boardWriteBtn').attr('data-chkKindCode');
		location.href = 'boardWriteForm.do?chkKindCode='+chkKindCode;
	});
	
	//글쓰기
	$(document).on('click', '#secretBoard', function() {
		alert('비밀글입니다');
	});
	
	//전체 체크박스 클릭 시..
	$(document).on('click', '#chkAllBoard', function() {
		//아이디가 checkAll인 것이 체크 되어있는지 확인 후 isChecked 함수에 담음
		//체크 되어있다면 true, 안되어있으면 false를 값으로 가짐
		var isChecked = $('#chkAllBoard').is(':checked');
		
		//체크되어있다면..
		if(isChecked) {
			//클래스명이 chk인 것의 프로퍼티(특성)를 checked(true)로 설정해줌
			$('.chkBoard').prop('checked', true);		
		//체크되어있지 않으면..	
		}else{
			//클래스명이 chk인 것의 프로퍼티(특성)에서 checked를 없애줌(false)
			$('.chkBoard').prop('checked', false);			
		}
	});
	
	//하위 체크박스 모두 클릭 시..
	$(document).on('click', '.chkBoard', function() {
		//하위 체크박스의 총 수량을 chkBoxCnt이라는 이름의 변수에 담음
		var chkBoxCnt = $('.chkBoard').length;
		//하위 체크박스 중에서 체크된 체크박스의 수량을 checkedCnt이라는 이름의 변수에 담음
		var checkedCnt = $('.chkBoard:checked').length;
		
		//체크박스의 총 수량과 체크된 체크박스의 수량이 같다면 
		if(chkBoxCnt == checkedCnt) {
			//id가 checkAll인 체크박스의 프로퍼티(특성)를 checked로 설정해줌(true)
			$('#chkAllBoard').prop('checked', true);
		//그렇지 않다면
		}else{
			//id가 checkAll인 체크박스의 프로퍼티(특성)에서 checked를 없애줌(false)
			$('#chkAllBoard').prop('checked', false);			
		}
	});
	
	$(document).on('click', '#deleteBoardBtn', function() {
		var checkedCnt = $('.chkBoard:checked').length;
		let kindCode = $('#kindCode').val();
		
		if(checkedCnt == 0) {
			alert('삭제할 게시글을 선택하세요.');
			return;
		}
		
		var confirmYN = confirm('정말 삭제 하시겠습니까?');
		
		if(confirmYN) {
			//boardNum이 담길 배열 생성
			var deleteBoardNums = new Array();
			
			//체크박스 중 체크가 된 노드의 value 값(boardNum)을 가져옴
			$('.chkBoard:checked').each(function(index, element){
				var deleteBoardNum = $(element).val();
				
				//deleteBoardNums라는 배열의 index(0,1,2...)번째 마다 deleteBoardNum 값을 넣어줌
				deleteBoardNums[index] = deleteBoardNum;
			});
			alert('선택한 게시글을 삭제합니다');
			location.href = 'deleteBoard.do?kindCode='+kindCode+'&deleteBoardNums='+deleteBoardNums;
		}
	
	});
	
	
	
	
});

/* 함수선언 영역*/
(function($){
	
})(jQuery);