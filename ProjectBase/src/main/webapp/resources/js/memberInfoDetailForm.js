$(document).ready(function(){
	// 이메일 변경
	$(document).on('click', '#changeEmailBtn', function() {
		var prevEmail = $('#memberEmail').text();
		var prevEmailArr = prevEmail.split('@');
		$('#changeEmailBtn').hide();
		var str = '<form action="changeEmail.do" method="post" id="changeEmail"><table>';
		str += '<tr><td style="padding: 2px;"><input type="text" name="memberEmailId" style="width: 150px;" id="memberEmail1" value="' + prevEmailArr[0] + '">&nbsp;@&nbsp;';
		str += '<input type="text" style="width: 150px;" name="memberEmailUri" id="memberEmail2" value="' + prevEmailArr[1] + '">';
		str += '&nbsp;<select id="emailUri" style="width: 100px; height: 26px;">';
		str += '<option value="inputUri" selected>직접입력</option>';
		str += '<option value="naver.com">네이버</option>';
		str += '<option value="daum.net">다음</option>';
		str += '<option value="nate.com">네이트</option>';
		str += '<option value="gmail.com">구글</option>';
		str += '</select></td>';
		str += '<tr><td colspan="2" style="padding: 2px;">';
		str += '<input type="button" value="취소" id="changeEmailCancelBtn" style="background: #ffcc00; border: 1px solid #ffcc00;"><input type="submit" value="완료">';
		str += '</td></tr></table></form>';
		$('#memberEmail').html(str);
		
		$("#changeEmail").validate({
			debug : false,
			onsubmit: true,
			onfocusin: true,
			onkeyup: true,
			onfocusout: function(element) { $(element).valid(); },
			rules : {
				memberEmailId:{
					required : true,
					maxlength : 50,
				},
				
				memberEmailUri:{
					required : true,
					maxlength : 50,
				},
	
			},
			messages : {
				memberEmailId:{
					required : '이메일를 입력하세요',
					maxlength : '글자수가 초과 되었습니다',
				},
				
				memberEmailUri:{
					required : '이메일를 입력하세요',
					maxlength : '글자수가 초과 되었습니다',
				},
			},
			errorPlacement : function(error, element) {
				error.insertAfter("#emailUri");
			},
			submitHandler: function(form) {
				var memberId = $('#memberIdTd').text();
				var memberEmail = $('#memberEmail1').val() + '@' + $('#memberEmail2').val();
				
				if(prevEmail != memberEmail){
					$.ajax({
						url: 'changeEmail.do',
						type: 'post',
						data: {'memberId':memberId, 'memberEmail':memberEmail}, 
						success: function(result) {
							if(result == 0) {
								alert("이메일변경을 실패 했습니다.");
								$('#memberEmail').html(prevEmail);
							} else {
								alert("이메일이 변경되었습니다.");
								$('#memberEmail').html(memberEmail);
								$('#changeEmailBtn').show();
							}
							$('#changeEmailCancelBtn').val('수정');
							$('#changeEmailCancelBtn').attr('id','changeEmailBtn');
						},
						error: function(){
							alert('예외발생')
						}
					});
				} else {
					alert("변경하려는 이메일이 이전 이메일과 같습니다.");
				}
			}
		});
		
		// 변경취소
		$(document).on('click', '#changeEmailCancelBtn', function() {
			$('#memberEmail').html(prevEmail);
			$('#changeEmailCancelBtn').val('수정');
	    	$('#changeEmailCancelBtn').attr('id','changeEmailBtn');
	    	$('#changeEmailBtn').show();
		});
	});
	
	// 현재 수강중인 강습 목록으로 이동
	$(document).on('click', '#regClass', function() {
		location.href='registerClassListByAdmin.do?memberId=' + $('#memberIdTd').text() + '&page=' + $('#nowPage').val() + '&range='
				+ $('#nowRange').val() + '&delYn=' + $('#delYn').val() + '&b4Page=' + $('#b4Page').val() + '&keyword=' + $('#keyword').val();
	});
	
	// 이전 수강했던 강습 목록으로 이동
	$(document).on('click', '#pastClass', function() {
		location.href='selectClassListByAdmin.do?memberId='+$('#memberIdTd').text() + '&page=' + $('#nowPage').val() + '&range='
				+ $('#nowRange').val() + '&delYn=' + $('#delYn').val() + '&b4Page=' + $('#b4Page').val() + '&keyword=' + $('#keyword').val();
	});
	
	// 게시판에 작성한 글 출력
	$(document).on('click', '#myBoard', function() {
		$.ajax({
			url: 'myBoardList.do',
			type: 'post',
			data: {'memberId':$('#memberIdTd').text()}, 
			success: function(result) {
				var str = '<table width="100%" class="table table-bordered"><colgroup>';
				str += '<col width="14%"></col><col width="*"></col>';
				str += '<col width="10%"></col> <col width="10%"></col> <col width="15%"></col></colgroup>';
				str += '<thead> <tr><th style="text-align: center; back-ground: #ddd; font-weight: bold;">게시판종류</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">제목</th>';
				str += '<th style="text-align: center; back-ground: #ddd; font-weight: bold;">조회수</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">원본글</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">작성일</th></tr></thead>';
				str += '<tbody>';
				$(result).each(function(index, element) {
					str += '<tr><td style="text-align: center;">' + element.kindName + '</td>';
					str += '<td><span class="boardTitle" data-kindCode="' + element.kindCode + '" data-boardNum="' + element.boardNum + '">' + element.boardTitle + '</span></td>';
					str += '<td style="text-align: center;">' + element.viewCount + '</td>';
					str += '<td style="text-align: center;"><span>' + element.originBoard + '</td>';
					str += '<td style="text-align: center;">' + element.createDate + '</td><tr>';
				});
				str += '</tbody></table>';
				str += '<input type="button" value="닫기" id="myBoardCloseBtn">';
				$('#myBoardTd').html(str);
			},
			error: function(){
				alert('예외발생')
			}
		});
	});
	
	// 게시판 제목을 클릭하면 게시판으로 이동
	$(document).on('click', '.boardTitle', function() {
		location.href='boardDetail.do?boardNum=' + $(this).attr('data-boardNum') + '&chkKindCode=' + $(this).attr('data-kindCode');
	});
	
	// 게시판 작성 목록을 닫음
	$(document).on('click', '#myBoardCloseBtn', function() {
		$('#myBoardTd').html('<input type="button" value="게시글작성목록" id="myBoard">');
	});
	
	// 이전 대관 목록으로 이동
	$(document).on('click', '#pastRentalList', function() {
		location.href='pastRentalListByAdmin.do?memberId=' + $('#memberIdTd').text() + '&page=' + $('#nowPage').val() + '&range='
				+ $('#nowRange').val() + '&delYn=' + $('#delYn').val() + '&b4Page=' + $('#b4Page').val() + '&keyword=' + $('#keyword').val();
	});
	
	// 강사로 수업중인 강습 목록으로 이동
	$(document).on('click', '#myClassList', function() {
		location.href='instClassInfoByAdmin.do?memberId='+$('#memberIdTd').text() + '&page=' + $('#nowPage').val() + '&range='
				+ $('#nowRange').val() + '&delYn=' + $('#delYn').val() + '&b4Page=' + $('#b4Page').val() + '&keyword=' + $('#keyword').val();
	});
	
	// 회원의 비고를 작성
	$(document).on('click', '#writeNote', function() {
		var str = '<input type="button" value="완료" id="updateNoteBtn">';
		$('#memberNote2').html(str);
		str = '<textarea rows="10" style="width: 100%; height:100px; resize: none;" id="updateNote"></textarea>';
		$('#memberNote').html(str);
		
		$(document).on('click', '#updateNoteBtn', function() {
			var note = $('#updateNote').val();
			updateNote(note);
		});
	});
	
	// 회원의 비고를 수정
	$(document).on('click', '#changeNote', function() {
		var str = '<input type="button" value="완료" id="updateNoteBtn">';
		$('#memberNote2').html(str);
		var str = '<textarea rows="10" style="width: 100%; height:100px; resize: none;" id="updateNote"">';
		str += $(this).attr('data-note');
		str += '</textarea>';
		$('#memberNote').html(str);
		
		
		$(document).on('click', '#updateNoteBtn', function() {
			var note = $('#updateNote').val();
			updateNote(note);
		});
	});

	// 회원목록으로 이동(이전 페이지) 회원관리에서 온 경우
	$(document).on('click', '#memberListBtn', function() {
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#delYn').val();
		
		var keyword = $('#keyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		location.href = 'memberListManager.do?page=' + page + '&range=' + range + '&delYn=' + delYn
			+ '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});
	
	// 강사목록으로 이동(이전 페이지) 강사관리에서 온 경우
	$(document).on('click', '#instListBtn', function() {
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		var delYn = $('#delYn').val();
		
		var keyword = $('#keyword').val();
		var inko = new Inko();
		var idKeyword = inko.ko2en(keyword);
		var nameKeyword = inko.en2ko(keyword);
		
		location.href = 'adminB.do?page=' + page + '&range=' + range + '&instDel=' + delYn
		+ '&keyword=' + keyword + '&idKeyword=' + idKeyword + '&nameKeyword=' + nameKeyword;
	});
	
	// 메인화면으로 이동
	$(document).on('click', '#goHomeBtn', function() {
		location.href = 'mainPage.do';
	});

	// 이메일 주소 입력시 직접입력을 고르면 입력가능 상태로 목록에서 주소를 고르면 입력 불가능 상태로 변경
	$(document).on('change', '#emailUri', function() {
		if($(this).val() == 'inputUri') {
			$(this).prev().attr('readonly',false);
			$(this).prev().val('');
		}
		else {
			$(this).prev().attr('readonly',true);
			$(this).prev().val($(this).val());
		}
	});
});

/* 함수선언 영역*/
(function($){
	// 비고 입력, 수정하는 함수
	updateNote = function(note){
		$.ajax({
			url: 'updateNote.do',
			type: 'post',
			data: {'memberId':$('#memberIdTd').text(), 'note':note}, 
			success: function(result) {
				if(result == 0) {
					alert("비고 입력을 실패 했습니다.");
					$('#memberNote').html('<input type="button" value="작성" id="writeNote">');
					$('#memberNote2').html('');
				} else {
					$('#memberNote').html('<pre style="height: 100px;">' + note + '</pre>');
					$('#memberNote2').html('<input type="button" value="수정" id="changeNote">');
					$('#changeNote').attr('data-note', note);
				}
			},
			error: function(){
				alert('예외발생')
			}
		});
	};
})(jQuery);