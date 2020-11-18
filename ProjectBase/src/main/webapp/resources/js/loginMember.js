/* 페이지 로딩 후 실행 */
$(document).ready(function(){
//	var inko = new Inko();
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	
	//밸리데이션 줄바꿈

	
	$("#loginForm").validate({
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
				regx:/^[a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/i //영어&숫자만
			},
			
			memberPw:{
				required : true,
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
				required: 'ID는 필수항목입니다.',
				regx:'영어와 숫자만 사용가능합니다.'
			},
			
			memberPw:{
				required: '비밀번호는 필수항목입니다.',
			},
		},
        //유효성검사 실패시 메시지 출력방식을 설정
		errorPlacement: function(error, element){
			var memberId = element.attr('id');
			var memberPw = element.attr('id');
			
			if(memberId == 'memberId'){
				error.insertAfter('#idDiv');
			}else if(memberPw == 'inputPassword'){
				error.insertAfter('#pwDiv');
			}else{
				error.insertAfter(element);
			}
		},
		
		//유효성검사 완료시 실행
		submitHandler: function(form) {
			form.submit();
          // $( "#dialog-confirm" ).dialog( "open" );
		}
	});
	//$(document).on('click', '선택자', function() {

	//});
	$(document).on('click', '#searchPw', function() {
		location.href='searchPwPage.do';
	});
	
	$(document).on('click', '#searchId', function() {
		location.href='searchIdPage.do';
	});
	
	$(document).on('keypress', '#inputPassword', function() {
		capsLock(event);
	});
	
	$(document).on('click', '#submitBtn', function() {
		var inko = new Inko();
		var realId = inko.ko2en($('#memberId').val());
		$('#memberId').val(realId);
		submit();
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
//	checkId = function(){
//		alert('1234');
//		alert($('#memberId').val());
//		$.ajax({
//			url :"checkId.do",
//			type:"post",
//			data:$("#memberId").val(),
//			success:function(result){
//				if(result == 1)
//					alert('사용 가능한  아이디입니다.');
//				else
//					alert('사용할 수 없는 아이디 입니다.<br> 다시입력하세요');
//			}
//		    ,error: function(){
//		    	alert("에러발생");
//		    }
//		});
//	}

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
	
//	enterSearch = function() {
//		var evt_code = (window.netscape) ? ev.which : event.keyCode;
//		if (evt_code == 13) {    
//			event.keyCode = 0;
//			getAddrLoc(); 
//		} 
//	}
})(jQuery);