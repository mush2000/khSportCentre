/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
//	$(document).on('focusout', '#memberId', function() {
//		checkId();
//	});
	$("#searchPwForm").validate({
        //테스트를 위하여 유효성 검사가 완료되어도 submit을 처리하지 않음.
		debug : false,
		onsubmit: true,
        //입력태그에 focus가 들어왔을때 유효성을 검사한다
		onfocusin: true,
		onkeyup: true,
		onfocusout: function(element) { $(element).valid(); },
//		onfocusout: false,
		//검사할 필드와 검사 항목의 나열
//        groups:{
//           socialNum : 'socialNum1 socialNum2',
//           emergencyPhoneNum : 'emergencyPhoneNum2 emergencyPhoneNum3',
//           phoneNum : 'phoneNum2 phoneNum3'
//        },
//		groups:{
//			chkMemberId : 'memberId chkId',
			//emergencyPhoneNum : 'emergencyPhoneNum2 emergencyPhoneNum3',
			//phoneNum : 'phoneNum2 phoneNum3'
//		},groups:{
		rules : {
          // className:{
          //    required : true             //필수여부 지정
                //digits : true,               //숫자만 입력 지정
               // email : true,                //이메일만 입력 지정
               // url : true,                  //url만 입력 지정
               // minlength : 4,               //최소길이 지정
               // maxlength : 8,               //최대길이 지정
               // equalTo : "대상요소의 id 값" //특정 요소와 입력값이 같은지 여부 검사
          // },
			memberId:{
				required : true,
//				minlength : 6,
//				maxlength : 12,
//				regx:/^[a-zA-Z0-9]*$/i //영어&숫자만
			},
			memberName:{
				required : true,
//				minlength : 3,
//				maxlength : 18,
			},
			
			memberEmailId:{
				required : true,
//				maxlength : 50,
			},
			
			memberEmailUri:{
				required : true,
				//url : true,
//				maxlength : 50,
			},

		},
        //검사를 충족하지 못할 경우 표시될 메시지의 나열
		messages : {
          // className : "과정명을 입력하세요.",
          // className : {
          //      required : "필수 입력 항목 입니다.",
           //     number : "숫자만 입력하세요.",
          //      minlength : "최소 {0}글자 입니다.",
           //     maxlength : "최대 {0}글자 입니다.",
           //     equalTo : "입력이 잘못되었습니다."
           // },
           //memberId:'ID를 입력하세요',
			memberId:{
				required: '&nbsp;아이디를 입력하세요&nbsp;',
//				minlength:'ID는 {0}자 이상 입력하세요.',
//				maxlength:'ID는 {0}자를 초과할 수 없습니다.',
//				regx:'영어와 숫자만 사용가능합니다.'
			},
			memberName:{
				required : '&nbsp;이름을 입력하세요&nbsp;',
//				minlength : '너무 짧습니다',
//				maxlength : '글자수 제한을 넘었습니다',
			},
			
			memberEmailId:{
				required : '&nbsp;이메일 아이디 누락&nbsp;',
				// email : true,                //이메일만 입력 지정
				// url : true,                  //url만 입력 지정
//				maxlength : '글자수가 초과 되었습니다',
			},
			
			memberEmailUri:{
				required : '&nbsp;이메일 URI 누락&nbsp;',
				// email : true,                //이메일만 입력 지정
				//url : '올바른형식이 아닙니다.',                  //url만 입력 지정
//				maxlength : '글자수가 초과 되었습니다',
			},
		},
        //유효성검사 실패시 메시지 출력방식을 설정
		errorPlacement : function(error, element) {
			var n = element.attr("name");
			if (n == "memberEmailId" || n == "memberEmailUri")
				error.insertAfter("#emailUri");
			else
				error.insertAfter(element);
		},
		// 유효성검사 완료시 실행
		submitHandler: function(form) {
			form.submit();
          // $( "#dialog-confirm" ).dialog( "open" );
		}
	});
	
//	$(document).on('click', '#existId', function() {
//		checkId();
//	});
	
	$(document).on('click', '#submitBtn', function() {
		//var inko = new Inko();
		//var realId = inko.ko2en($('#memberId').val());
		//$('#memberId').val(realId);
		//var realName = inko.en2ko($('#memberName').val());
		//$('#memberName').val(realName);
		$('#memberEmail').val($('#memberEmail1').val() + '@' + $('#memberEmail2').val());
		$('#searchPwForm').submit();
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
	
	$(document).on('click', '#searchId', function() {
		location.href='searchIdPage.do';
	});
	
	$(document).on('click', '#login', function() {
		location.href='loginPage.do';
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
//	checkId = function(){
//		var tId = $('#memberId').val();
//		if(tId == '' || tId == null) {
//			alert("아이디를 입력하세요");
//			return;
//		}
//		$.ajax({
//			url :"checkId.do",
//			type:"post",
//			data:{ "memberId": tId },
//			success:function(result){
//				if(result == 0)
//					alert('사용 가능한  아이디입니다.');
//				else {
//					alert('사용할 수 없는 아이디 입니다.\n다시입력하세요');
//					$('#memberId').val('');
//				}
//				
//			}
//		    ,error: function(){
//		    	alert("에러발생");
//		    }
//		});
//	}
	
})(jQuery);