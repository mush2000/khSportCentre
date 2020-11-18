/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
/*	$(document).on('focusout', '#memberId', function() {
		checkId();
	});*/
	
	$("#resumeForm").validate({
		debug : false,
		onsubmit: true,
		onfocusin: true,
		onkeyup: true,
		onfocusout: function(element) { $(element).valid(); },
		
		rules : {
			regNum_1:{
				required : true,
				minlength : 6,
				maxlength : 6,
				digits : true,
			},
			
			regNum_2:{
				required : true,
				minlength : 7,
				maxlength : 7,
				digits : true,
			},
			
			career:{
				required : true,
			},
		},
		
		messages : {
			regNum_1:{
				required : '&nbsp;앞자리 번호 누락&nbsp;',
				minlength : '&nbsp;글자수가 너무 짧습니다',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				regx: '&nbsp;숫자가 아닙니다'
			},
			
			regNum_2:{
				required : '&nbsp;뒷자리 번호 누락&nbsp;',
				minlength : '&nbsp;글자수가 너무 짧습니다',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				regx: '&nbsp;숫자가 아닙니다'
			},
			
			career:{
				required : '&nbsp;경력을 입력하세요',
			},
		},
		errorPlacement : function(error, element) {
			if (element.attr("name") == "career")
				error.insertAfter(element);
			else 
				error.insertAfter("#regNum_2");
		},

		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$(document).on('keyup', '#regNum_1', function() {
		if($(this).val().length == 6){
			$(this).next().focus();
		}
	});
	
	$(document).on('keyup', '#regNum_2', function() {
		if($(this).val().length == 7){
			$(this).next().focus();
		}
	});

	$(document).on('click', '#submitBtn', function() {
		$('#regNum').val($('#regNum_1').val() + '-' + $('#regNum_2').val());		
		submit();
	});

	
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
	
})(jQuery);