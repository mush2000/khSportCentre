/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	
	
	//글쓰기
	$(document).on('click', '#boardWriteBtn', function() {
		let chkKindCode = $('#chkKindCode').val()
		location.href = 'boardWriteForm.do?chkKindCode='+chkKindCode;
	});
	
	//답글쓰기
	$(document).on('click', '#boardReplyWriteBtn', function() {
		let chkKindCode = $('#chkKindCode').val()
		let originBoard = $('#originBoard').val()
		
		location.href = 'boardWriteForm.do?chkKindCode='+chkKindCode+'&originBoard='+originBoard;
	});
	
	//글삭제
	$(document).on('click', '#deleteBoardBtn', function() {
		let kindCode = $('#chkKindCode').val();
		let boardNum = $('#originBoard').val();
		
		var confirmYN = confirm('정말 삭제 하시겠습니까?');
		
		if(confirmYN) {
			//boardNum이 담길 배열 생성
			var deleteBoardNums = new Array();
			
			//체크박스 중 체크가 된 노드의 value 값(boardNum)을 가져옴
				var deleteBoardNum = $('#originBoard').val();
				deleteBoardNums[0] = deleteBoardNum;
				
			alert('선택한 게시글을 삭제합니다');
			location.href = 'deleteBoard.do?kindCode='+kindCode+'&deleteBoardNums='+deleteBoardNums+'&boardNum='+boardNum;
		}
	
	});
	
	
	
	
	
	//글 수정
	$(document).on('click', '#updateBoardBtn', function() {
		let chkKindCode = $('#chkKindCode').val()
		let boardNum = $('#originBoard').val()
		
		location.href = 'boardUpdateForm.do?chkKindCode='+chkKindCode+'&boardNum='+boardNum;
	});
	
	
	
	
	//비밀덧글
	$(document).on('click', '#chkIsSecret', function() {
		str = "";
		if($('input:checkbox[id="chkIsSecret"]').is(":checked") == true) {
			$('#hid').empty();
			str = `<input type="hidden" name="replyIsSecret" id="replyIsSecret" value="Y">`;
			
			$('#hid').append(str);
		} else {
			$('#hid').empty();
			str = `<input type="hidden" name="replyIsSecret" id="replyIsSecret" value="N">`;
			
			
			$('#hid').append(str);
		}
	});
	
	//덧글달기
	$(document).on('click', '#insertBtn', function() {
		let replyContent = $(this).prev().prev().val();
		
		let replyBoardNum = $('#originBoard').val();
		let replyMemberId = $('#memberId').val();
		let replyIsSecret = $('#replyIsSecret').val();
		
		
		let chkKindCode = $('#chkKindCode').val();
		
		//덧글 공백으로 채워진건지 검사
		if(replyContent.trim() == "") {
			alert('내용을 입력하세요');
		} else if (~-encodeURIComponent(replyContent).split(/%..|./).length > 500) {
			alert('내용이 너무 깁니다 (최대 500Byte) 현재 : '+ ~-encodeURIComponent(replyContent).split(/%..|./).length +'자 덧글달기');
		} else  {
			
			
			location.href = "writeReply.do?replyBoardNum="+replyBoardNum+
			"&replyMemberId="+replyMemberId+"&replyContent="+encodeURIComponent(replyContent)+"&replyIsSecret="+replyIsSecret+"&chkKindCode="+chkKindCode;
				
			
		}
	});
	
	//스크롤바 위로이동
	$(document).on('click', '#TOP', function() {
		$('html, body').scrollTop(0);
	});
	
	//목록이동
	$(document).on('click', '.board', function() {
		let kindCode = $('.board').attr('data-kindCode');
		
		location.href = 'board.do?kindCode='+kindCode;
	});
	
	//덧글 삭제
	$(document).on('click', '.deleteReply', function() {
		let confirmYN = confirm('정말 삭제 하시겠습니까?');
		
		if(confirmYN) {
		
		let chkKindCode = $('#chkKindCode').val();
		let boardNum = $('#originBoard').val();
		let replyNum = $(this).attr('data-replyNum');
		let sessionId = $('#memberId').val();
		
		location.href = 'deleteReply.do?boardNum='+boardNum+'&chkKindCode='+chkKindCode+'&replyNum='+replyNum;
		
		}
	});
	
	//덧글 수정 form 열기 수정할 값 byte도 입력하기
	$(document).on('click', '.updateReply', function() {
		$('.hideTr').hide();
		$('.showTr').show();
		
//		//안씀
//		//수정할글을 불러온다
//		nowContent = $(this).parent().parent().next().children().next().children().val();
//		nowByte = ~-encodeURI(nowContent).split(/%..|./).length;
//		
//		//바이트값을 넣어준다
//		$(this).parent().parent().next().children().next().children().next().text(nowByte);
		
		//화면 보이게 하는 부분
		
		let viewTr = $(this).parent().parent();
		viewTr.hide();
		
		let writeTr = $(this).parent().parent().next();
		writeTr.show();
	});
	
	//덧글 수정 취소
	$(document).on('click', '.cancelUpdate', function() {
		
		
		let viewTr = $(this).parent().parent().prev();
		viewTr.show();
		
		let writeTr = $(this).parent().parent();
		writeTr.hide();
	});
	
	//덧글 수정 
	$(document).on('click', '.updateReplyBtn', function() {
		
		let replyNum = $(this).attr('data-replyNum');
		let replyContent = $(this).parent().prev().children().val();
		
		let chkKindCode = $('#chkKindCode').val();
		let replyBoardNum = $('#originBoard').val();
		let sessionId = $('#memberId').val();
		
		
		
		let confirmYN = confirm('수정하시겠습니까?');
		if(confirmYN){
			
			if(replyContent.trim() == ""){
				alert('입력된 내용이 없습니다');
			} else if (~-encodeURIComponent(replyContent).split(/%..|./).length > 500) {
				alert('내용이 너무 깁니다 (최대 500Byte) 현재 : '+ ~-encodeURIComponent(replyContent).split(/%..|./).length +'자');
			} else {
				location.href = 'updateReply.do?replyNum='+replyNum+'&replyContent='+encodeURIComponent(replyContent)
				+'&chkKindCode='+chkKindCode+'&replyBoardNum='+replyBoardNum;
			}
		}
	});
	
	
	//다운로드
	$(document).on('click', '.download', function() {
		let fileNum = $(this).attr('data-fileNum');
		
		location.href = "downloadFile.do?fileNum="+fileNum;
	});
	
	//내용 입력 최대값을 넘어가면
	$(document).on('keyup', '.boardContent', function() {
		
		let replyContent = $(this).val(); //내용
		let maxByte = 500;
		
		let replyLength = ~-encodeURIComponent(replyContent).split(/%..|./).length;
		
		
		
		
		//현재 바이트수를 알려주고 그 최대입력값을 넘으면 페이지에 띄워준다

 
	     if(~-encodeURIComponent(replyContent).split(/%..|./).length > maxByte) {
	    	 $(this).next().text("현재 "+ replyLength + "Byte / 최대 입력 "+maxByte+"Byte를 초과했습니다");
	    	 
		 } else {
			  $(this).next().text("");
			  
		 }

	});
	
	
	
	
});

/* 함수선언 영역*/
(function($){
	
	
	
})(jQuery);