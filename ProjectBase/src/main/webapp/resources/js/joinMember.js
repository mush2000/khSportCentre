/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
/*	$(document).on('focusout', '#memberId', function() {
		checkId();
	});*/
	
	$("#joinForm").validate({
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
				minlength : 6,
				maxlength : 12,
				regx:/^[a-zA-Z0-9]*$/i //영어&숫자만
			},
			
			memberPw:{
				required : true,
				minlength : 8,
				maxlength : 18,
				regx:/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/ //영어2숫자1기호1 전체8자이상
			},
			
			memberRepeatPw:{
				required : true,
				equalTo : inputPassword
			},
			
			memberName:{
				required : true,
				minlength : 2,
				maxlength : 18,
				regx:/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/i
			},
			
			memberBirthday:{
				required : true,
				/*minlength : 10,
				maxlength : 11,
				regx:/^0[0-9]*$/i*/
			},
						
			memberAddr1:{
				required : true,
				maxlength : 50,
				//regx:/^0[0-9]*$/i
			},
			
			memberTel1_2:{
				required : true,
				minlength : 3,
				maxlength : 4,
				digits : true,
//				regx:/^0[0-9]*$/i
			},
			
			memberTel1_3:{
				required : true,
				minlength : 4,
				maxlength : 4,
				digits : true,
//				regx:/^0[0-9]*$/i
			},
			
			memberTel2_2:{
				minlength : 3,
				maxlength : 4,
				digits : true,
//				regx:/^0[0-9]*$/i
			},
			
			memberTel2_3:{
				minlength : 4,
				maxlength : 4,
				digits : true,
//				regx:/^0[0-9]*$/i
			},
			
			memberEmailId:{
				required : true,
				maxlength : 50,
			},
			
			memberEmailUri:{
				required : true,
				//url : true,
				maxlength : 50,
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
				required: '&nbsp;아이디는 필수항목입니다.',
				minlength:'&nbsp;아이디는 {0}자 이상 입력하세요.',
				maxlength:'&nbsp;아이디는 {0}자를 초과할 수 없습니다.',
				regx:'&nbsp;영어와 숫자만 가능합니다.'
			},
			
			memberPw:{
				required: '&nbsp;비밀번호는 필수항목입니다.',
				minlength:'&nbsp;비밀번호는 {0}자 이상 입력하세요.',
				maxlength:'&nbsp;비밀번호는 {0}자를 초과할 수 없습니다.',
				regx:'&nbsp;영어2자이상, 숫자, 특수기호사용 8자이상 가능합니다.'
			},
			
			memberRepeatPw:{
				required: '&nbsp;비밀번호 확인은 필수항목입니다.',
				equalTo : '&nbsp;입력하신 비밀번호와 일치하지 않습니다'
			},
			
			memberName:{
				required : '&nbsp;이름은 필수항목입니다.',
				minlength : '&nbsp;글자수가 너무 짧습니다',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				regx:'&nbsp;한글만 입력하세요.'
			},
			
			memberBirthday:{
				required : '&nbsp;생년월일은 필수항목입니다.',
				/*minlength : '길이가 짧습니다. 정확하게 입력했는지 확인하세요',
				maxlength : '길이가 깁니다. 정확하게 입력했는지 확인하세요',
				regx: '0으로 시작하는 숫자만 입력하세요'*/
			},
			
			memberAddr1:{
				required : '&nbsp;상세주소는 필수항목입니다.',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				//regx: '0으로 시작하는 숫자만 입력하세요'
			},
			
			memberTel1_2:{
				required : '&nbsp;가운데 번호 누락&nbsp;',
				minlength : '&nbsp;글자수가 너무 짧습니다',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				regx: '&nbsp;숫자가 아닙니다'
			},
			
			memberTel1_3:{
				required : '&nbsp;마지막 번호 누락&nbsp;',
				minlength : '&nbsp;글자수가 너무 짧습니다',
				maxlength : '&nbsp;글자수가 초과 되었습니다',
				regx: '&nbsp;숫자가 아닙니다'
			},

			memberEmailId:{
				required : '&nbsp;이메일 아이디 누락&nbsp;',
				// email : true,                //이메일만 입력 지정
				// url : true,                  //url만 입력 지정
				maxlength : '&nbsp;글자수가 초과 되었습니다',
			},
			
			memberEmailUri:{
				required : '&nbsp;이메일 URL 누락&nbsp;',
				// email : true,                //이메일만 입력 지정
				//url : '올바른형식이 아닙니다.',                  //url만 입력 지정
				maxlength : '&nbsp;글자수가 초과 되었습니다',
			},
		},
        //유효성검사 실패시 메시지 출력방식을 설정
//		errorPlacement: function(error, element){
//			error.insertAfter(element);
//		},
		errorPlacement : function(error, element) {
			var n = element.attr("name");
			if (n == "memberTel1_2" || n == "memberTel1_3")
				error.insertAfter("#memberTel1_3");
			else if (n == "memberTel2_2" || n == "memberTel2_3")
				error.insertAfter("#memberTel2_3");
			else if (n == "memberEmailId" || n == "memberEmailUri")
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
	
	$(document).on('click', '#existId', function() {
		$('#existId').attr('data-click','true');
		checkId();
	});
	
	$(document).on('click', '.choiceAddr', function() {
		var str = '<input type="text" id="memberAddr1" style="width: 40em;" readonly><br>';
		str += '<input type="text" name="memberAddr1" id="memberAddr2" style="width: 40em;" readonly><br>';
		str += '<input type="hidden" name="memberAddr" id="memberAddr">';
		$("#list").html(str);
		
		$('#memberAddr1').val($(this).text());
		$('#memberAddr2').attr('readonly',false);
		
		$('#memberAddr2').focus();
	});
	
	$(document).on('click', '.pageNum', function() {
		$('#currentPage').val($(this).text());
		getAddrLoc();
	});
	
	$(document).on('click', '#submitBtn', function() {
		if($('#existId').attr('data-click') == 'false'){
			alert('아이디 중복체크를 해주세요.');
			return false;
		}else{
			$('#memberAddr').val($('#memberAddr1').val() + ' ' + $('#memberAddr2').val());
			$('#memberTel').val($('#memberTel1_1').val() + '-' + $('#memberTel1_2').val() + '-' + $('#memberTel1_3').val());
			$('#memberTel2').val($('#memberTel2_1').val() + '-' + $('#memberTel2_2').val() + '-' + $('#memberTel2_3').val());
			$('#memberEmail').val($('#memberEmail1').val() + '@' + $('#memberEmail2').val());
			submit();
		}
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
	
	$(document).on('keypress', '#inputPassword', function() {
		capsLock(event);
	});
	
	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
	checkId = function(){
		var tId = $('#memberId').val();
		if(tId == '' || tId == null) {
			//alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			url :"checkId.do",
			type:"post",
			data:{ "memberId": tId },
			success:function(result){
				if(result == 0)
					alert('사용 가능한 아이디입니다.');
				else {
					alert('이미 사용 중인 아이디입니다.\n다른 아이디를 사용해주세요.');
					$('#memberId').val('');
				}
				
			}
		    ,error: function(){
		    	alert("에러발생");
		    }
		});
	}
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
		var htmlStr = "";
		htmlStr += "<div style='height: 5px;'></div>";
		htmlStr += "<table class='table addrTable' style='margin-bottom: 0px;'>";
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
		
		htmlStr += "<div style='height: 5px;'></div>";
		htmlStr += "&nbsp;&nbsp;";
		
		for(i = startPage ; i <= endPage ; i++) {
			if(i == currentPage){
				htmlStr += "&nbsp;<span style='font-weight: bold;'>[" + i + "]</span>&nbsp;";
			}else{
				htmlStr += "&nbsp;<span class='pageNum'>" + i + "</span>&nbsp;";
			}
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