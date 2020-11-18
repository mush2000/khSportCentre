/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	var prevTel = $('#memberTel').val();
	var prevTelArr = prevTel.split('-');
	$('#memberTel1_2').val(prevTelArr[1]);
	$('#memberTel1_3').val(prevTelArr[2]);
	
	
	var prevTel2 = $('#memberTel2').val();
	var prevTelArr2 = prevTel2.split('-');
	$('#memberTel2_2').val(prevTelArr2[1]);
	$('#memberTel2_3').val(prevTelArr2[2]);
	
	var prevEmail = $('#memberEmail').val();
	var prevEmailArr = prevEmail.split('@');
	$('#memberEmail1').val(prevEmailArr[0]);
	$('#memberEmail2').val(prevEmailArr[1]);
	
	var prevAddr = $('#memberAddr').val();
	var prevAddrArr = prevAddr.split(' ');
	

	var prevAddr1 = '';
	var prevAddr2 = '';
	for(i = 0 ; i < prevAddrArr.length ; i++) {
		if(i < 4)
			prevAddr1 += prevAddrArr[i] + ' ';
		else if(i == 4)
			prevAddr1 += prevAddrArr[i];
		else if(i == prevAddrArr.length - 1)
			prevAddr2 += prevAddrArr[i];
		else
			prevAddr2 += prevAddrArr[i] + ' ';
	}
	
	$('#tKeyword').attr("placeholder", prevAddr1);
	$('#memberAddr1').val(prevAddr1);
	$('#memberAddr2').val(prevAddr2);
	
	

	
	
	
	
	
	$(document).on('click', '#back' , function() {
		//ajax해야하는데 초기화한 값을 띄어주기 위해서 현재 페이지 값을 가져옴
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		
		location.href = 'memberListManager.do?page='+page+'&range='+range;
		
		
	});
	
	$(document).on('click', '#modifyBtn', function() {
		
		var suc = 0;
		
		
		if($('#memberName').val() == '') {
			alert('이름을 입력하세요');
			
		} else if ($('#memberAddr1').val() == null) {
			alert('주소를 입력하세요');
			
		} else if ($('#memberTel1_2').val() == '' || $('#memberTel1_3').val() == '' || $('#memberTel2_2').val() == '' || $('#memberTel2_3').val() == '') {
			alert('주소를 입력하세요');
			
		} else if ($('#memberEmail1').val() == '' || $('#memberEmail2').val() == '') {
			alert('이메일을 입력하세요');
			
		} else {
			
			
			$('#memberAddr').val($('#memberAddr1').val() + ' ' + $('#memberAddr2').val());
			
			$('#memberTel').val($('#memberTel1_1').val() + '-' + $('#memberTel1_2').val() + '-' + $('#memberTel1_3').val());
			$('#memberTel2').val($('#memberTel2_1').val() + '-' + $('#memberTel2_2').val() + '-' + $('#memberTel2_3').val());
			$('#memberEmail').val($('#memberEmail1').val() + '@' + $('#memberEmail2').val());
			
			
			alert('수정완료');
			$('#modifySubmit').submit();
			
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
	
	
	
	$(document).on('click', '.choiceAddr', function() {
		var str = '<input type="text" id="memberAddr1" style="width: 40em;" readonly><br>';
		str += '<input type="text"    id="memberAddr2" style="width: 40em;" readonly><br>';
		str += '<input type="hidden" name="memberAddr" id="memberAddr">';
		$("#addrList").html(str);
		
		$('#memberAddr1').val($(this).text());
		$('#memberAddr2').attr('readonly',false);
		
		$('#memberAddr2').focus(); 
	});
	
	$(document).on('click', '.pageNum', function() {
		$('#currentPage').val($(this).text());
		getAddrLoc();
	});
	
	
	
});


/* 함수선언 영역*/
(function($){
	
	
		
		
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
			url :"getAddrApis.do",
			type:"post",
//			data:$("#form").serialize(),
			data:{'keyword':$('#keyword').val(), 'currentPage':$('#currentPage').val()},
			dataType:"json",
			success:function(jsonStr){
//				jsonStr = encodeURI(jsonStr);
//				jsonStr = encodeURIComponent(jsonStr);
				
				
				var errCode = jsonStr.results.common.errorCode;
				var errDesc = jsonStr.results.common.errorMessage;
				if(errCode != "0"){
					alert(errCode+"="+errDesc);
				}else{
					if(jsonStr != null){
						$("#addrList").html("");
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
		$("#addrList").html(htmlStr);
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
	
	
	
})(jQuery);