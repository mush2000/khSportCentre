$(document).ready(function(){
//	var date = new Date().getDate();
//	if(date > 19 && date < 30) {
//	}
	
	var isModifying = 0;
	$('#modifyFinBtn').hide();
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	$(document).on('click', '#modifyBtn', function() {
		var str = '<tr id="changePwTr"><td class="title">비밀번호변경</td>';
		str += '<td colspan="2" id="newPwTd"><input type="button" value="비밀번호변경" id="changePwForm"></td></tr>';
		$('#memberIdTd').parent().after(str);
		
		$('#memberAddr').attr('colspan','1');
		str = '<td class="changeForm"><input type="button" value="수정" id="changeAddrBtn"></td>';
		$('#memberAddr').after(str);
		
		$('#memberTel').attr('colspan','1');
		str = '<td class="changeForm"><input type="button" value="수정" id="changeTelBtn"></td>';
		$('#memberTel').after(str);
		
		$('#memberTel2').attr('colspan','1');
		str = '<td class="changeForm"><input type="button" value="수정" id="changeTel2Btn"></td>';
		$('#memberTel2').after(str);
		
		$('#memberEmail').attr('colspan','1');
		str = '<td class="changeForm"><input type="button" value="수정" id="changeEmailBtn"></td>';
		$('#memberEmail').after(str);
		
		str = '<tr id="withdrawMember"><td class="title">회원 탈퇴</td>';
		str += '<td id="withdrawMemberTd" colspan="2"><input type="button" value="탈퇴" id="withdrawMemberBtn"></td></tr>';
		
		
		$('#memberInfo').append(str);
		
		$('#modifyBtn').hide();
		$('#modifyFinBtn').show();
	});
	
	$(document).on('click', '#modifyFinBtn', function() {
		if (isModifying == 0) {
			$('.memberDetail').attr('colspan','2');
			$('.changeForm').remove();
			
			$('#changePwTr').remove();
			$('#withdrawMember').remove();
			
			$('#modifyBtn').show();
			$('#modifyFinBtn').hide();
		} else {
			alert("수정중입니다.\n수정 완료후 다시 시도하세요");
		}
	});
	
	$(document).on('click', '#changePwForm', function() {
		isModifying++;
		var str = '<form action="changePw.do" method="post" id="changePw"><table>';
		str += '<tr><td style="padding:5px;">현재비밀번호</td><td style="padding:5px;"><input type="password" name="presentPw" id="presentPw"></td></tr>';
		str += '<tr><td style="padding:5px;">새비밀번호</td><td style="padding:5px;"><input type="password" name="nextPw" id="nextPw"></td></tr>';
		str += '<tr><td style="padding:5px;">새비밀번호확인</td><td style="padding:5px;"><input type="password" name="reNextPw"></td></tr></table>';
		str += '<div style="height: 5px;"></div>';
		str += '<input type="button" value="취소" id="changePwCancelBtn" style="background: #ffcc00; border: 1px solid #ffcc00;">';
		str += '<input type="submit" value="완료"></form>';
		$('#newPwTd').html(str);
		
		$("#changePw").validate({
			debug : false,
			onsubmit: true,
			onfocusin: true,
			onkeyup: true,
			onfocusout: function(element) { $(element).valid(); },
			rules : {
				presentPw:{
					required : true,
				},
				
				nextPw:{
					required : true,
					minlength : 8,
					maxlength : 18,
					regx:/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/ //영어2숫자1기호1 전체8자이상
				},
				
				reNextPw:{
					required : true,
					equalTo : nextPw
				},
			},
			messages : {
				presentPw:{
					required: '&nbsp;현재비밀번호를 입력하세요.',
				},
				
				nextPw:{
					required: '&nbsp;새비밀번호를 입력하세요.',
					minlength:'&nbsp;비밀번호는 {0}자 이상 입력하세요.',
					maxlength:'&nbsp;비밀번호는 {0}자를 초과할 수 없습니다.',
					regx:'&nbsp;영어2자이상 숫자 특수기호사용 8자이상 가능합니다.'
				},
				
				reNextPw:{
					required: '&nbsp;새비밀번호를 한번 더 입력하세요.',
					equalTo : '&nbsp;새비밀번호와 일치 하지 않습니다'
				},
			},
			errorPlacement : function(error, element) {
				error.insertAfter(element);
			},
			// 유효성검사 완료시 실행
			submitHandler: function(form) {
				var memberId = $('#memberIdTd').text();
				var memberPw = $('#presentPw').val();
				var nextPw = $('#nextPw').val();
				
				if(memberPw != nextPw){
					$.ajax({
						url: 'changePw.do', //요청경로
						type: 'post',
						data: {'memberId':memberId, 'memberPw':memberPw, 'memberNewPw':nextPw}, 
						//요청경로로 던질 파라메터. '파레메터명':파라메터
						success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
							if(result == 0) {
								alert("비밀번호가 틀렸습니다.");
							} else {
								alert("비밀번호가 변경되었습니다.");
								$('#newPwTd').html('<input type="button" value="비밀번호변경" id="changePwForm">');
							}
							isModifying--;
						},
						error: function(){ //ajax통신 실패 시 실행부분
							alert('예외발생')
						}
					});
				} else {
					alert("변경하려는 비밀번호가 이전 비밀번호와 같습니다.");
				}
				
			}
		});

		$(document).on('click', '#changePwCancelBtn', function() {
			$('#newPwTd').html('<input type="button" value="비밀번호변경" id="changePwForm">');
			isModifying--;
		});
	});
	
	$(document).on('click', '#changeAddrBtn', function() {
		isModifying++;
		var prevAddr = $('#memberAddr').text();
		$('#changeAddrBtn').hide();
		//$('#changeAddrBtn').val('취소');
		//$('#changeAddrBtn').attr('id','changeAddrCancelBtn');
		
		var str = '';
		str += '<form action="changeAddr.do" method="post" id="changeAddr">';
		str += '<table>';
		str += '<tr><td style="padding: 2px;">';
		str += '<input type="hidden" name="currentPage" id="currentPage" value="1">';
		str += '<input type="hidden" name="keyword" id="keyword">';
		str += '<input type="text" id="tKeyword" value="" onkeydown="enterSearch();">';
		str += '</td>';
		str += '<td style="padding: 2px;">';
		str += '<input type="checkbox" id="area">&nbsp;전지역';
		str += '</td>';
		str += '<td style="padding: 2px;">';
		str += '<input type="button" onClick="getAddrLoc();" value="주소검색하기">';		
		str += '</td></tr>';
		str += '<tr><td colspan="3" style="padding: 2px;">';
		str += '<div id="list"></div>';
		str += '</td></tr>';
		str += '<tr><td colspan="3" style="padding: 3px;">';
		str += '<input type="button" value="취소" id="changeAddrCancelBtn" style="background: #ffcc00; border: 1px solid #ffcc00;"><input type="submit" value="완료" id="changeAddrAccessBtn">';
		str += '</td></tr></table></form>';
		$('#memberAddr').html(str);
		
/*		$(document).on('click', '#changeAddrAccessBtn', function() {
			$('#changeAddrBtn').show();
		});*/
		
		var prevAddrArr = prevAddr.split(' ');
		var prevAddr1 = '';
		var prevAddr2 = '';
		for(i = 0 ; i < prevAddrArr.length ; i++) {
			if(i < 3)
				prevAddr1 += prevAddrArr[i] + ' ';
			else if(i == 3)
				prevAddr1 += prevAddrArr[i];
			else if(i == prevAddrArr.length - 1)
				prevAddr2 += prevAddrArr[i];
			else
				prevAddr2 += prevAddrArr[i] + ' ';
		}
		
		str2 = '';
		str2 += '<input type="text" id="memberAddr1" style="width: 250px;" value="' + prevAddr1 + '" readonly>';
		str2 += '&nbsp;';
		str2 += '<input type="text" name="memberAddr1" style="width: 250px;" id="memberAddr2" value="' + prevAddr2 + '">';
		$("#list").html(str2);
		
		$("#changeAddr").validate({
			debug : false,
			onsubmit: true,
			onfocusin: true,
			onkeyup: true,
			onfocusout: function(element) { $(element).valid(); },
			rules : {
				memberAddr1:{
					required : true,
					maxlength : 50,
				},
			},
			messages : {
				memberAddr1:{
					required : '&nbsp;주소를 입력하세요',
					maxlength : '&nbsp;길이가 깁니다. 정확하게 입력했는지 확인하세요',
				},
			},
			errorPlacement : function(error, element) {
				error.insertAfter(element);
			},
			submitHandler: function(form) {
				var memberId = $('#memberIdTd').text();
				var memberAddr = $('#memberAddr1').val() + ' ' + $('#memberAddr2').val();
				if(memberAddr != prevAddr){
					$.ajax({
						url: 'changeAddr.do', //요청경로
						type: 'post',
						data: {'memberId':memberId, 'memberAddr':memberAddr}, 
						//요청경로로 던질 파라메터. '파레메터명':파라메터
						success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
							if(result == 0) {
								alert("주소변경을 실패 했습니다.");
								$('#memberAddr').html(prevAddr);
								$('#changeAddrBtn').hide();
							} else {
								alert("주소가 변경되었습니다.");
								$('#memberAddr').html(memberAddr);
								$('#changeAddrBtn').show();
							}
							$('#changeAddrCancelBtn').val('수정');
							$('#changeAddrCancelBtn').attr('id','changeAddrBtn');
							isModifying--;
						},
						error: function(){ //ajax통신 실패 시 실행부분
							alert('예외발생')
						}
					});
				} else {
					$('#changeAddrBtn').hide();
					alert("변경하려는 주소가 이전 주소와 같습니다.");
				}
			}
		});
		
		$(document).on('click', '#changeAddrCancelBtn', function() {
			$('#memberAddr').html(prevAddr);
			$('#changeAddrCancelBtn').val('수정');
	    	$('#changeAddrCancelBtn').attr('id','changeAddrBtn');
	    	$('#changeAddrBtn').show();
	    	isModifying--;
		});
	});
	
	$(document).on('click', '#changeTelBtn', function() {
		isModifying++;
		var prevTel = $('#memberTel').text();
		var prevTelArr = prevTel.split('-');
		$('#changeTelBtn').hide();
		//$('#changeTelBtn').val('취소');
		//$('#changeTelBtn').attr('id','changeTelCancelBtn');
		var str = '<form action="changeTel.do" method="post" id="changeTel"><table>';
		str += '<tr><td style="padding: 2px;"><select id="memberTel1_1" style="width: 100px;">';
		str += prevTelArr[0] == '010' ? '<option selected>010</option>' : '<option>010</option>';
		str += prevTelArr[0] == '011' ? '<option selected>011</option>' : '<option>011</option>';
		str += prevTelArr[0] == '016' ? '<option selected>016</option>' : '<option>016</option>';
		str += prevTelArr[0] == '017' ? '<option selected>017</option>' : '<option>017</option>';
		str += prevTelArr[0] == '018' ? '<option selected>018</option>' : '<option>018</option>';
		str += prevTelArr[0] == '019' ? '<option selected>019</option>' : '<option>019</option>';
		str += '</select>&nbsp;-&nbsp;';
		str += '<input type="text" name="memberTel1_2" id="memberTel1_2" class="inputTel" value="' + prevTelArr[1] + '" style="width: 100px;">&nbsp;-&nbsp;';
		str += '<input type="text" name="memberTel1_3" id="memberTel1_3" class="inputTel" value="' + prevTelArr[2] + '" style="width: 100px;"></td>';
		str += '<tr><td colspan="2" style="padding: 2px;">';
		str += '<input type="button" value="취소" id="changeTelCancelBtn" style="background: #ffcc00; border: 1px solid #ffcc00;"><input type="submit" value="완료">';
		str += '</td></tr></table></form>';
		$('#memberTel').html(str);
		
		$("#changeTel").validate({
			debug : false,
			onsubmit: true,
			onfocusin: true,
			onkeyup: true,
			onfocusout: function(element) { $(element).valid(); },
			rules : {
				memberTel1_2:{
					required : true,
					minlength : 3,
					maxlength : 4,
					digits : true,
				},
				
				memberTel1_3:{
					required : true,
					minlength : 4,
					maxlength : 4,
					digits : true,
				},
			},
			messages : {
				memberTel1_2:{
					required : '&nbsp;전화번호를 입력하세요',
					minlength : '&nbsp;전화번호가 너무 짧습니다',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
					regx: '&nbsp;숫자가 아닙니다'
				},
				
				memberTel1_3:{
					required : '&nbsp;전화번호를 입력하세요',
					minlength : '&nbsp;전화번호가 너무 짧습니다',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
					regx: '&nbsp;숫자가 아닙니다'
				},
			},
			errorPlacement : function(error, element) {
				error.insertAfter("#memberTel1_3");
			},
			submitHandler: function(form) {
				var memberId = $('#memberIdTd').text();
				var memberTel = $('#memberTel1_1').val() + '-' + $('#memberTel1_2').val() + '-' + $('#memberTel1_3').val();
				
				if(memberTel != prevTel){
					$.ajax({
						url: 'changeTel.do', //요청경로
						type: 'post',
						data: {'memberId':memberId, 'memberTel':memberTel}, 
						//요청경로로 던질 파라메터. '파레메터명':파라메터
						success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
							if(result == 0) {
								alert("전화번호변경을 실패 했습니다.");
								$('#memberTel').html(prevTel);
							} else {
								alert("전화번호가 변경되었습니다.");
								$('#memberTel').html(memberTel);
								$('#changeTelBtn').show();
							}
							$('#changeTelCancelBtn').val('수정');
							$('#changeTelCancelBtn').attr('id','changeTelBtn');
							isModifying--;
						},
						error: function(){ //ajax통신 실패 시 실행부분
							alert('예외발생')
						}
					});
				} else {
					alert("변경하려는 전화번호가 이전 전화번호와 같습니다.");
				}
			}
		});
		
		$(document).on('click', '#changeTelCancelBtn', function() {
			$('#memberTel').html(prevTel);
			$('#changeTelCancelBtn').val('수정');
	    	$('#changeTelCancelBtn').attr('id','changeTelBtn');
	    	$('#changeTelBtn').show();
	    	isModifying--;
		});
	});
	
	$(document).on('click', '#changeTel2Btn', function() {
		isModifying++;
		var prevTel = $('#memberTel2').text();
		var prevTelArr = prevTel.split('-');
		$('#changeTel2Btn').hide();
		//$('#changeTel2Btn').val('취소');
		//$('#changeTel2Btn').attr('id','changeTel2CancelBtn');
		var str = '<form action="changeTel2.do" method="post" id="changeTel2"><table>';
		str += '<tr><td style="padding: 2px;"><select id="memberTel2_1" style="width: 100px;">';
		str += prevTelArr[0] == '010' ? '<option selected>010</option>' : '<option>010</option>';
		str += prevTelArr[0] == '011' ? '<option selected>011</option>' : '<option>011</option>';
		str += prevTelArr[0] == '016' ? '<option selected>016</option>' : '<option>016</option>';
		str += prevTelArr[0] == '017' ? '<option selected>017</option>' : '<option>017</option>';
		str += prevTelArr[0] == '018' ? '<option selected>018</option>' : '<option>018</option>';
		str += prevTelArr[0] == '019' ? '<option selected>019</option>' : '<option>019</option>';
		str += '</select>&nbsp;-&nbsp;';
		str += '<input type="text" name="memberTel2_2" id="memberTel2_2" class="inputTel" value="' + prevTelArr[1] + '" style="width: 100px;">&nbsp;-&nbsp;';
		str += '<input type="text" name="memberTel2_3" id="memberTel2_3" class="inputTel" value="' + prevTelArr[2] + '" style="width: 100px;"></td></tr>';
		str += '<tr><td colspan="2" style="padding: 2px;">';
		str += '<input type="button" value="취소" id="changeTel2CancelBtn" style="background: #ffcc00; border: 1px solid #ffcc00;"><input type="submit" value="완료">';
		str += '</td></tr></table></form>';
		$('#memberTel2').html(str);
		
		$("#changeTel2").validate({
			debug : false,
			onsubmit: true,
			onfocusin: true,
			onkeyup: true,
			onfocusout: function(element) { $(element).valid(); },
			rules : {
				memberTel2_2:{
					required : true,
					minlength : 3,
					maxlength : 4,
					digits : true,
				},
				
				memberTel2_3:{
					required : true,
					minlength : 4,
					maxlength : 4,
					digits : true,
				},
			},
			messages : {
				memberTel2_2:{
					required : '&nbsp;전화번호를 입력하세요',
					minlength : '&nbsp;전화번호가 너무 짧습니다',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
					regx: '&nbsp;숫자가 아닙니다'
				},
				
				memberTel2_3:{
					required : '&nbsp;전화번호를 입력하세요',
					minlength : '&nbsp;전화번호가 너무 짧습니다',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
					regx: '&nbsp;숫자가 아닙니다'
				},
			},
			errorPlacement : function(error, element) {
				error.insertAfter("#memberTel2_3");
			},
			submitHandler: function(form) {
				var memberId = $('#memberIdTd').text();
				var memberTel = $('#memberTel2_1').val() + '-' + $('#memberTel2_2').val() + '-' + $('#memberTel2_3').val();
				
				if(memberTel != prevTel){
					$.ajax({
						url: 'changeTel2.do', //요청경로
						type: 'post',
						data: {'memberId':memberId, 'memberTel2':memberTel}, 
						//요청경로로 던질 파라메터. '파레메터명':파라메터
						success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
							if(result == 0) {
								alert("전화번호 변경을 실패 했습니다.");
								$('#memberTel2').html(prevTel);
							} else {
								alert("전화번호가 변경되었습니다.");
								$('#memberTel2').html(memberTel);
								$('#changeTel2Btn').show();
							}
							$('#changeTel2CancelBtn').val('수정');
							$('#changeTel2CancelBtn').attr('id','changeTel2Btn');
							isModifying--;
						},
						error: function(){ //ajax통신 실패 시 실행부분
							alert('예외발생')
						}
					});
				} else {
					alert("변경하려는 전화번호가 이전 전화번호와 같습니다.");
				}
			}
		});
		
		$(document).on('click', '#changeTel2CancelBtn', function() {
			$('#memberTel2').html(prevTel);
			$('#changeTel2CancelBtn').val('수정');
	    	$('#changeTel2CancelBtn').attr('id','changeTel2Btn');
	    	$('#changeTel2Btn').show();
	    	isModifying--;
		});
	});
	
	$(document).on('click', '#changeEmailBtn', function() {
		isModifying++;
		var prevEmail = $('#memberEmail').text();
		var prevEmailArr = prevEmail.split('@');
		$('#changeEmailBtn').hide();
		//$('#changeEmailBtn').val('취소');
		//$('#changeEmailBtn').attr('id','changeEmailCancelBtn');
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
					required : '&nbsp;이메일를 입력하세요',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
				},
				
				memberEmailUri:{
					required : '&nbsp;이메일를 입력하세요',
					maxlength : '&nbsp;글자수가 초과 되었습니다',
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
						url: 'changeEmail.do', //요청경로
						type: 'post',
						data: {'memberId':memberId, 'memberEmail':memberEmail}, 
						//요청경로로 던질 파라메터. '파레메터명':파라메터
						success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
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
							isModifying--;
						},
						error: function(){ //ajax통신 실패 시 실행부분
							alert('예외발생')
						}
					});
				} else {
					alert("변경하려는 이메일이 이전 이메일과 같습니다.");
				}
			}
		});
		
		$(document).on('click', '#changeEmailCancelBtn', function() {
			$('#memberEmail').html(prevEmail);
			$('#changeEmailCancelBtn').val('수정');
	    	$('#changeEmailCancelBtn').attr('id','changeEmailBtn');
	    	$('#changeEmailBtn').show();
	    	isModifying--;
		});
	});
	
	$(document).on('click', '#withdrawMemberBtn', function() {
		isModifying++;
		$('#withdrawMemberTd').attr('colspan','1');
		var str = '<table><tr><td style="padding: 2px; color: black;">비밀번호확인</td><td style="padding: 2px;"><input type="password" id="withdrawPw"></td></tr>';
		str += '<tr><td colspan="2" style="padding: 2px;" id="withdrawMemberTd2"><input type="button" value="취소" style="background: #ffcc00; border: 1px solid #ffcc00;" id="withdrawCancelBtn">';
		str += '<input type="button" value="확인" id="withdrawBtn"></td></tr></table>';
		$('#withdrawMemberTd').html(str);
		
		$(document).on('click', '#withdrawCancelBtn', function() {
			$('#withdrawMemberTd2').remove();
			$('#withdrawMemberTd').attr('colspan','2');
			$('#withdrawMemberTd').html('<input type="button" value="탈퇴" id="withdrawMemberBtn">');
			
	    	isModifying--;
		});
		
		$(document).on('click', '#withdrawBtn', function() {
			if(confirm('정말 탈퇴 하시겠습니까?')){
				$.ajax({
					url: 'withdrawMember.do', //요청경로
					type: 'post',
					data: {'memberId':$('#memberIdTd').text(), 'memberPw':$('#withdrawPw').val()}, 
					//요청경로로 던질 파라메터. '파레메터명':파라메터
					success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
						if(result == 0) {
							alert("비밀번호가 틀렸습니다.");
						} else {
							alert("회원 탈퇴가 완료 되었습니다.");
							location.href='delMember.do';
						}
					},
					error: function(){ //ajax통신 실패 시 실행부분
						alert('예외발생')
					}
				});
			}
		});
	});
	
	$(document).on('click', '.choiceAddr', function() {
		var str4 = '';
		str4 += '<input type="text" id="memberAddr1" readonly>';
		str4 += '&nbsp;<input type="text" name="memberAddr1" id="memberAddr2" readonly>';
		$("#list").html(str4);
		
		$('#memberAddr1').val($(this).text());
		$('#memberAddr2').attr('readonly',false);
		
		$('#memberAddr2').focus();
	});
	
	$(document).on('click', '#regClass', function() {
		location.href='registerClassList.do?memberId='+$('#memberIdTd').text();
	});
	
	$(document).on('click', '#pastClass', function() {
		location.href='selectClassList.do?memberId='+$('#memberIdTd').text();
	});
//	$(document).on('click', '#presentClass', function() {
//	});
	
	$(document).on('click', '#myBoard', function() {
		$.ajax({
			url: 'myBoardList.do', //요청경로
			type: 'post',
			data: {'memberId':$('#memberIdTd').text()}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				var str = '<table width="100%" class="table table-bordered"><colgroup>';
				str += '<col width="14%"></col><col width="*"></col>';
				str += '<col width="10%"></col> <col width="10%"></col> <col width="15%"></col></colgroup>';
				str += '<thead> <tr><th style="text-align: center; back-ground: #ddd; font-weight: bold;">게시판종류</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">제목</th>';
				str += '<th style="text-align: center; back-ground: #ddd; font-weight: bold;">조회수</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">원본글</th> <th style="text-align: center; back-ground: #ddd; font-weight: bold;">작성일</th></tr></thead>';
				str += '<tbody>';
				$(result).each(function(index, element) {
//					str += '<tr><td><span class="classDay" data-classDayCode="' + element.classDayCode + '">' + element.classDay + '</span></td></tr>';
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
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
	});
	
	$(document).on('click', '.boardTitle', function() {
		location.href='boardDetail.do?boardNum=' + $(this).attr('data-boardNum') + '&chkKindCode=' + $(this).attr('data-kindCode');
	});
	
	$(document).on('click', '#myBoardCloseBtn', function() {
		$('#myBoardTd').html('<input type="button" value="작성글확인" id="myBoard">');
	});
	
	$(document).on('click', '#pastRentalList', function() {
		location.href='pastRentalList.do';
	});
	
	
	$(document).on('click', '#myClassList', function() {
		location.href='instClassInfo.do?memberId='+$('#memberIdTd').text();
	});
	
	$(document).on('click', '.pageNum', function() {
		$('#currentPage').val($(this).text());
		getAddrLoc();
	});

	$(document).on('keyup', '.inputTel', function() {
		if($(this).val().length == 4){
			$(this).next().focus();
		}
	});
	
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
	
	$(document).on('click', '#applyInst', function() {
		location.href='applyInstructor.do';
	});
	
	$(document).on('keypress', '#inputPassword', function() {
		capsLock(event);
	});
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
	
	getAddrLoc = function(){
		// 적용예 (api 호출 전에 검색어 체크)
		var keyword = $('#tKeyword').val();
		$('#keyword').val(keyword);
		if (!checkSearchedWord($('#keyword').val())) {
			return ;
		}
//		if ($('#keywordrmUlsan').val() != 'notUlsan') {			//serialize에서 주소빼서 따로 전송 또는 form 쓰지 않고 따로 전송
//			var kw= $('#keyword').val();
//			$('#keyword').val(kw+" 울산광역시");
//		}
		if (!$('#area').is(':checked')) {
			keyword += ' 울산광역시';
		}
		$('#keyword').val(keyword);

		$.ajax({
			url :"getAddrApi.do",
			type:"post",
//			data:$("#form").serialize(),
			data:{'keyword':$('#keyword').val(), 'currentPage':$('#currentPage').val()},
			dataType:"json",
			success:function(jsonStr){
//				jsonStr = encodeURI(jsonStr);
//				jsonStr = encodeURIComponent(jsonStr);
				$("#list").html("");
				var errCode = jsonStr.results.common.errorCode;
				var errDesc = jsonStr.results.common.errorMessage;
				if(errCode != "0"){
					alert(errCode+"="+errDesc);
				}else{
					if(jsonStr != null){
						makeListJson(jsonStr);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		});
	}
	
	makeListJson = function(jsonStr){
		var totalCnt = jsonStr.results.common.totalCount;
		var currentPage = jsonStr.results.common.currentPage;
		var lastPage = Math.ceil(totalCnt/10);
		var startPage = 1;
		var endPage = lastPage;
		var htmlStr = "<table>";
		$(jsonStr.results.juso).each(function(){
			htmlStr += "<tr>";
//			htmlStr += "<td>"+this.siNm+"</td>";
//			htmlStr += "<td>"+this.sggNm+"</td>";
//			htmlStr += "<td>"+this.zipNo;
			htmlStr += "<td><span class='choiceAddr'>"+this.roadAddrPart1;
			htmlStr += "</span></td><td> (<span class='choiceAddr'>"+this.jibunAddr+"</span>) </td></tr>";
		});
		htmlStr += "</table>";
		if (lastPage > 10) {
			if (currentPage < 5) {
				endPage = 10;
			} else if (currentPage > lastPage - 6) {
				startPage = lastPage - 9;
			} else {
				startPage = currentPage - 4;
				endPage = currentPage - 0 + 5;
			}
		}
		for(i = startPage ; i <= endPage ; i++) {
			if(i == currentPage)
				htmlStr += " <span>[" + i + "]</span>";
			else
				htmlStr += " <span class='pageNum'>" + i + "</span>";
		}
		$("#list").html(htmlStr);
	}
	
	
	//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
	checkSearchedWord = function(obj){
//		if(obj.value.length >0){
		if(obj.length >0){
			//특수문자 제거
			var expText = /[%=><]/ ;
//			if(expText.test(obj.value) == true){
			if(expText.test(obj) == true){
				alert("특수문자를 입력 할수 없습니다.") ;
//				obj.value = obj.value.split(expText).join(""); 
				obj.value = obj.split(expText).join(""); 
				return false;
			}
			
			//특정문자열(sql예약어의 앞뒤공백포함) 제거
			var sqlArray = new Array(
				//sql 예약어
				"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
	             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
			);
			
			var regex;
			for(var i=0; i<sqlArray.length; i++){
				regex = new RegExp( sqlArray[i] ,"gi") ;
				
				if (regex.test(obj.value) ) {
				    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
//					obj.value =obj.value.replace(regex, "");
					obj =obj.replace(regex, "");
					return false;
				}
			}
		}
		return true ;
	}
	
	enterSearch = function() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {    
			event.keyCode = 0;
			getAddrLoc(); 
		} 
	}
	
/*	inputCnt = function() {
		if($('#memberTel1_2').val().length == 4){
			$('#memberTel1_3').focus();
		}
	}*/
	
	capsLock = function(e){
		  var keyCode = 0;
		  var shiftKey=false;
		  keyCode=e.keyCode;
		  shiftKey=e.shiftKey;
		  if (((keyCode >= 65 && keyCode <= 90)&& !shiftKey) || ((keyCode >= 97 && keyCode <= 122) && shiftKey))
		  {
			  $('#inputPassword').tooltip('show');
			  return;
		  }
	}
})(jQuery);