/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	
	
	//강의 종류가 바뀔때 강의할 장소와 신청가능한 요일리스트가 변경됌 
	$(document).on('change', '#year' , function() {
		
		let toDay = new Date();
		
		$('#classMonth').empty();
		var str = "";
		
		if(toDay.getFullYear() != $('#year').val()) {
			str+=`<select name="month">`;
			str+=`<option value="1">1</option>`;
			str+=`<option value="2">2</option>`;
			str+=`<option value="3">3</option>`;
			str+=`<option value="4">4</option>`;
			str+=`<option value="5">5</option>`;
			str+=`<option value="6">6</option>`;
			str+=`<option value="7">7</option>`;
			str+=`<option value="8">8</option>`;
			str+=`<option value="9">9</option>`;
			str+=`<option value="10">10</option>`;
			str+=`<option value="11">11</option>`;
			str+=`<option value="12">12</option>`;
			str+=`</select>`;
		} else {
			let startMonth = toDay.getMonth()+1;
			str+=`<select name="month">`;
			for (startMonth; startMonth < 13 ; startMonth++) {
				str+= `<option value="${startMonth}">${startMonth}</option>`;
			}
			str+=`</select>`;
			
		}
		
		
		
		
		$('#classMonth').append(str);
		
			
	});
	
	
	//강의 종류가 바뀔때 강의할 장소와 신청가능한 요일리스트가 변경됌 
	$(document).on('change', '#classesCode' , function() {
			
			
			var classesCode = $('#classesCode').val();
			var frontPlaceCode = $('#classesCode>option:selected').attr('data-frontPlaceCode');
			var frontDayCode = $('#classesCode>option:selected').attr('data-frontDayCode');
			 
			getClassPlaceDay(frontPlaceCode, frontDayCode, classesCode);
				
			
	});
	
	// 입력되지 않은 데이터가있는지 확인하고 없으면 submit 한다
	$(document).on('click', '#insertBtn' , function() {
		
		var result = confirm('강의정보를 수정 하겠습니까?');
		
		if(result) {
			if($('#locCode').val() != "" && $('#classDayCode').val() != "" && $('#instNum').val() != "") {
				
				alert('강의정보 수정 합니다');
				$('#insertLecture').submit();
			} else {
				alert('입력하지 못한 데이터가 있습니다')
			}
		} else {
			alert('등록 취소');
		}
			 
			
	});
	
	$(document).on('click', '#back' , function() {
		//ajax해야하는데 초기화한 값을 띄어주기 위해서 현재 페이지 값을 가져옴
		var page = $('#nowPage').val();
		var range = $('#nowRange').val();
		
		location.href = 'lectureListManager.do?page='+page+'&range='+range;
	});

	
	
	
	
	
});


/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	
	
	
	getClassPlaceDay = function(frontPlaceCode, frontDayCode, classesCode) {
		//Ajax 시작
		$.ajax({
		      url: 'getClassPlaceDay.do', //요청경로
		      type: 'post',
		      data: {'frontPlaceCode':frontPlaceCode, 'frontDayCode':frontDayCode, 'classesCode':classesCode}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    	  
		    	  
		    	  $('#classPlace').empty();
		    	  $('#classDay').empty();
		    	  $('#inst').empty();
		    	  
		    	  var str = "";
		    	  var str1 = ""; 
		    	  var str2 = "";
		    	  
		    	  if(result.classPlace.length == 0) {
		    		  str+=`<input name="locCode" id="locCode" type="text" value="" placeholder="대관 가능한 장소가 없습니다" readonly>`;
		    		  str1+=`<input name="classDayCode" id="classDayCode" type="text" value="" placeholder="요일을 선택할수 없습니다" readonly>`;
					  
				  } else {
					  str+=`<select name="locCode" id="locCode">`;
					  
					  $.each(result.classPlace, function(index, element){
							str+=`<option value="${element.placeCode }">${element.placeName }</option>`;
						  });
					  
					  str+=`</select>`;
					  
					  str1+=`<select name="classDayCode" id="classDayCode">`;
					  $.each(result.classDay, function(index, element){
							str1+=`<option value="${element.classDayCode }">${element.classDay }</option>`;
						  });
					  
					  str1+=`</select>`;
					  
				  }
		    	  if(result.inst.length == 0) {
		    		  str2+=`<input name="instNum" id="instNum" type="text" value="" placeholder="등록된 강사가 없습니다" readonly>`;
		    		  
		    	  } else {
		    		  str2+=`<select name="instNum" id="instNum">`;
					  $.each(result.inst, function(index, element){
							str2+=`<option value="${element.instNum }">${element.memberName }(${element.memberId })</option>`;
						  });
					  
					  str2+=`</select>`;
					  
		    	  }
		    	 
			 	  $('#classPlace').append(str);
			 	  $('#classDay').append(str1);
			 	  $('#inst').append(str2);
			 	  
			 	 
			 
			 	  
			 	  
			 	 
		       
		      },
		      error: function(){ //ajax통신 실패 시 실행부분

		      }
		});
		
		
	};
	
		 
	
	formatDate = function(date) { 
		var d = new Date(date)
		, month = '' + (d.getMonth() + 1)
		, day = '' + d.getDate()
		, year = d.getFullYear(); 
		
		if (month.length < 2) 
			month = '0' + month; 
		if (day.length < 2) 
			day = '0' + day; 
		return [year, month, day].join('-'); 
	};

	
	
})(jQuery);