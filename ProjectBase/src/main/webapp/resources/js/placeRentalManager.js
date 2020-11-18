/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//검색 버튼 클릭시 클릭 시..
	$(document).on('click', '#searchBtn', function() {
		var selectBox = $('.searchKeywordSelect').val();
		var searchValue = $('#searchValue').val();
		if(selectBox == '1' && searchValue != '' || selectBox == null && searchValue != ''){
			alert('검색 조건을 선택하세요.');
		}else if(selectBox == '1' && searchValue == '' || selectBox == null && searchValue == ''){
			$('.form').submit();
		}else {
			$('.form').submit();
		}
	});
	
	//엔터키 클릭 시 submit 막기
	$('.form').keydown(function(key) {
		if (key.keyCode == 13) {
            if (window.event){
                event.preventDefault();
                return;
            }
		}
	});

	
	
	//전체 체크박스 클릭 시..
	$(document).on('click', '#checkAll', function() {
		//아이디가 checkAll인 것이 체크 되어있는지 확인 후 isChecked 함수에 담음
		//체크 되어있다면 true, 안되어있으면 false를 값으로 가짐
		var isChecked = $('#checkAll').is(':checked');
		
		//체크되어있다면..
		if(isChecked) {
			//클래스명이 chk인 것의 프로퍼티(특성)를 checked(true)로 설정해줌
			$('.chk').prop('checked', true);		
		//체크되어있지 않으면..	
		}else{
			//클래스명이 chk인 것의 프로퍼티(특성)에서 checked를 없애줌(false)
			$('.chk').prop('checked', false);			
		}
	});
	
	//하위 체크박스 모두 클릭 시..
	$(document).on('click', '.chk', function() {
		//하위 체크박스의 총 수량을 chkBoxCnt이라는 이름의 변수에 담음
		var chkBoxCnt = $('.chk').length;
		//하위 체크박스 중에서 체크된 체크박스의 수량을 checkedCnt이라는 이름의 변수에 담음
		var checkedCnt = $('.chk:checked').length;
		
		//체크박스의 총 수량과 체크된 체크박스의 수량이 같다면 
		if(chkBoxCnt == checkedCnt) {
			//id가 checkAll인 체크박스의 프로퍼티(특성)를 checked로 설정해줌(true)
			$('#checkAll').prop('checked', true);
		//그렇지 않다면
		}else{
			//id가 checkAll인 체크박스의 프로퍼티(특성)에서 checked를 없애줌(false)
			$('#checkAll').prop('checked', false);			
		}
	});
	
	//선택예약승인 버튼 클릭 시
	$(document).on('click', '#selectApproval', function() {
		var checkedCnt = $('.chk:checked').length;
		
		if(checkedCnt == 0) {
			alert('예약승인 항목을 선택하세요.');
			return;
		}
		
		var confirmYN = confirm('선택한 예약을 모두 승인 하시겠습니까?');
		
		if(confirmYN) {
			//rentalCode가 담길 배열 생성
			var rentalCodes = new Array();
			
			//체크박스 중 체크가 된 노드의 value 값(rentalCode)을 가져옴
			$('.chk:checked').each(function(index, element){
				var rentalCode = $(element).val();
				
				//rentalCodes라는 배열의 index(0,1,2...)번째 마다 rentalCode 값을 넣어줌
				rentalCodes[index] = rentalCode;
			});
			alert('승인이 완료되었습니다.');
			location.href = 'updateRentalApprovalYNList.do?rentalCodes=' + rentalCodes;
		}
	
	});
	
	//선택예약취소 버튼 클릭 시
	$(document).on('click', '#selectCancel', function() {
		var checkedCnt = $('.chk:checked').length;
		
		
		if(checkedCnt == 0) {
			alert('예약취소 항목을 선택하세요.');
			return;
		}
		
		var confirmYN = confirm('선택한 예약을 모두 취소 하시겠습니까?');
			if(confirmYN) {
				//rentalCode가 담길 배열 생성
				var rentalCodes = new Array();
				
				//체크박스 중 체크가 된 노드의 value 값(rentalCode)을 가져옴
				$('.chk:checked').each(function(index, element){
					var rentalCode = $(element).val();
					
					//rentalCodes라는 배열의 index(0,1,2...)번째 마다 rentalCode 값을 넣어줌
					rentalCodes[index] = rentalCode;
				});
				alert('예약이 취소되었습니다..');
				location.href = 'deleteRentalList.do?rentalCodes=' + rentalCodes;
			}
	});
	
	
	//예약승인버튼 클릭 이벤트
	$(document).on('click', '.approvalBtn', function() {
		var confirmYN = confirm('정말 승인 하시겠습니까?');
		var rentalCode = $(this).attr('data-approvalCode');
		var isConfirmTd = $(this).parent().parent();
		var isConfirmInput = $(this).parent().parent().prev().prev().prev().prev().prev().prev().prev();
		
		if(confirmYN) {
			//Ajax 시작
			$.ajax({
			      url: 'updateRentalApprovalYN.do', //요청경로
			      type: 'post',
			      data: {'rentalCode':rentalCode}, //요청경로로 던질 파라메터. '파레메터명':파라메터
			      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
			    	  if(result == 1){
			    		  location.reload(true);
			    		  alert('승인이 완료되었습니다.');
			    		  $(isConfirmTd).empty();
			    		  var str1 = '';
			    		  str1 += '<span style="color: blue; font-weight: bold;">예약완료</span>';
			    		  $(isConfirmTd).append(str1);
			    		  var str2 = '';
			    		  $(isConfirmInput).empty();
			    		  str2 += '<input type="checkbox" disabled class="noChk" value="${rentalInfo.rentalCode }">';
			    		  $(isConfirmInput).append(str2);
			    	  }else{
			    		  alert('승인오류')
			    	  }
			      },
			      error: function(){ //ajax통신 실패 시 실행부분
			    	  alert('통신오류');
			      }
			});
		}
	});
	
	
	//예약취소 버튼 클릭 이벤트
	$(document).on('click', '.cancelBtn', function() {
		var confirmYN = confirm('정말 취소 하시겠습니까?');
		var rentalCode = $(this).attr('data-cancelCode');
		var isCancelTr = $(this).parent().parent().parent();
		if(confirmYN) {
			//Ajax 시작
			$.ajax({
				url: 'deleteRental.do', //요청경로
				type: 'post',
				data: {'rentalCode':rentalCode}, //요청경로로 던질 파라메터. '파레메터명':파라메터
				success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
					if(result == 1){
						location.reload(true);
						alert('예약이 취소되었습니다.');
			    		$(isCancelTr).remove();
					}else{
						alert('취소오류')
					}
				},
				error: function(){ //ajax통신 실패 시 실행부분
					alert('통신오류');
				}
			});
		}
		
	});
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);