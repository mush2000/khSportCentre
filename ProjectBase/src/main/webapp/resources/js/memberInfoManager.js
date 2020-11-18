/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	$(document).on('change', '#delYn' , function() {
		var delYn = $('#delYn').val();
		
		location.href = 'memberListManager.do?delYn='+delYn;
		
	});


	
	$(document).on('click', '.modifyMemberInfo' , function() {
		
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var memberId = $(this).attr('data-memberId');
		
		location.href = 'modifyMemberInfoForm.do?memberId='+memberId+'&page='+page+'&range='+range;
		
	});
	
	$(document).on('click', '.deleteMemberInfo' , function() {
		var memberId = $(this).attr('data-memberId');
		var page = $('#nowPage').val();
		var range = $('#nowRange').val(); 
		
		var YN = confirm('해당 멤버를 삭제하시겠습니까?');
		
		if(YN) {
			alert('해당 멤버 삭제합니다.');
			location.href = 'deleteMember.do?memberId='+memberId+'&page='+page+'&range='+range;
		} else {
			alert('취소');
		}
		
	});
	
	//현재 페이지의 wrongPwCntReset 해버리기
	$(document).on('click', '.wrongPwCntReset' , function() {
		//ajax해야하는데 초기화한 값을 띄어주기 위해서 현재 페이지 값을 가져옴
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#delYn').val();
		
	
		
		//초기화할 memberId 를 가져옴
		var memberId = $(this).attr('data-memberId');
		
		
		wrongPwCntReset(memberId);
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url;	
		
	});
	
	
	//페이징 실행 
	$(document).on('click', '.pageNum', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var delYn = $('#delYn').val();
		
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url;
	});
	
	//이전버튼 페이징
	$(document).on('click', '.pagePrev', function() {
			
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		
		var delYn = $('#delYn').val();
		
		
		page = ((range - 2) * rangeSize) + 10; // 10으로 수정해본다
		range = range - 1;
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url;
			
	});
	
	//다음버튼 페이징
	$(document).on('click', '.pageNext', function() {
		
		var page = $(this).attr('data-page');
		var range = $(this).attr('data-range');
		var rangeSize = $(this).attr('data-rangeSize');
		
		var delYn = $('#delYn').val();
		
		
		page = parseInt((range * rangeSize)) + 1;
		range = parseInt(range) + 1;
		
		
		var url = 'memberListManager.do';
		
		url += '?page=' + page;
		url += '&range='+ range;
		url += '&delYn='+ delYn;
		
		location.href = url;
		
	});
	
	
	
	
});


/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	
	
	wrongPwCntReset= function(memberId){
		//Ajax 시작
		$.ajax({
		      url: 'wrongPwCntReset.do', //요청경로
		      type: 'post',
		      data: {'memberId':memberId}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    	  alert('비밀번호 틀린 횟수가 초기화 되었습니다.');
		      },
		      error: function(){ //ajax통신 실패 시 실행부분
		    	  alert('wrongPwCnt 예외발생');
		      }
		});
		
	};
	
	
})(jQuery);