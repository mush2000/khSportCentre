/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var holiday = $("#dayBar").attr("data-holiday");
	var hArray = holiday.split(',');
		
	//달력		
	var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    var date = null;
    
    $(document).ready(function() {
    	drawCalendar();
        initDate();
        drawDays();
        drawSche();
        $("#prevMonthBtn").on("click", function(){movePrevMonth();});
        $("#nextMonthBtn").on("click", function(){moveNextMonth();});
        
        displayCalendar();
    });
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("td span.doDate")
        $tdSche = $("td span.doReserve")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        date = today.getDate();
        
        if(month < 10){month = "0" + month;}
        firstDay = new Date(year, month-1, 1);
        lastDay = new Date(year, month, 0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#calTopYear").text(year);
        $("#calTopMonth").text(month);
        for(var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++){
            $tdDay.eq(i).text(++dayCount);
        }
    }
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month <= 0){
            month = 12;
            year--;
        }
        if(month < 10){
            month = String("0" + month);
        }
        getNewInfo();
        $.ajax({
		      url: 'placeRentalChangeMonth.do', //요청경로
		      type: 'post',
		      data: {'year':year, 'month':month}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    	  hArray = result.split(',');	    	  
		    	  displayCalendar();
		    	  $('.doDate').removeClass('selectedDay');
		      },
		      error: function(){ //ajax통신 실패 시 실행부분
		    	  alert('실패');
		      }
		});
        
    };
    
    function moveNextMonth(){
        month++;
        if(month > 12){
            month = 1;
            year++;
        }
        if(month < 10){
            month = String("0" + month);
        }
        getNewInfo();
        $.ajax({
		      url: 'placeRentalChangeMonth.do', //요청경로
		      type: 'post',
		      data: {'year':year, 'month':month}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    	  hArray = result.split(',');
		    	  displayCalendar();
					$('.doDate').removeClass('selectedDay');
		      },
		      error: function(){ //ajax통신 실패 시 실행부분
		    	  alert('실패');
		      }
		});
    };
    
    //예약버튼
    function displayCalendar() {
    	$('.doDate').each(function(index, element){
        	if($(element).text() != '') {
        		var tStr = "";
        		//토요일 예약가능 버튼 출력
        		if(index % 7 == 6){
        			$(element).remove;
        			$tdDay.eq(index).css("color","blue");
        			//평일 예약불가 버튼 출력, 공휴일은 예약가능버튼출력
        		}else if(index % 7 != 0){
        			$tdDay.eq(index).css("color","black");
        			$(element).remove;
        			var tStr = '';
        			//일요일 예약가능 버튼 출력
        		}else if(index % 7 == 0){
        			$(element).remove;
        			$tdDay.eq(index).css("color","red");
        		}
        		if(hArray != "" && hArray != null)
        			$(hArray).each(function(i,e){
        				if($(element).text() == e) {
        					$tdDay.eq(index).css("color","red");
        				}
        			});
	    	}
        });
    }
    
    //정보갱신
    function getNewInfo(){
        for(var i = 0; i < 42; i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year, month-1, 1);
        lastDay = new Date(year, month, 0);
        drawDays();
        drawSche();
    }
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2000":{
                "01":{
                    "15":"스포츠센터 개관일"
                }
            }
        }
    }
    
    //스케줄 그리기
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i - 1; 
                    $tdSche.eq(dateMatch).text(txt);
                }
            }
        }
    }

    //Calendar 그리기
    function drawCalendar(){
    	var setTableHTML = '';
    	for(var i = 0; i < 6; i++){
    		setTableHTML += '<tr>'
    			for(var j = 0; j < 7; j++){
    				if(j == 6) {
    					setTableHTML += '<td style="border-right: none; height: 60px; text-align: center; padding: 10px; vertical-align: middle;" class="doDateTd">';
    				}else{
    					setTableHTML += '<td style="border-right: 1px solid #ddd; height: 60px; text-align: center; padding: 10px; vertical-align: middle;" class="doDateTd">';
    				}
    				setTableHTML += '<span class="doDate"></span>';
    				setTableHTML += '</td>';
    			}
    		setTableHTML += '</tr>'
    	}
    	$(".calendarTable").append(setTableHTML);
    };
    
    //다시선택하기 버튼 클릭 이벤트
    $(document).on('click', '#reloadBtn', function() {
    	window.location.reload(true);
    });
    
    //step1 날짜 클릭 이벤트
	$(document).on('click', '.doDate', function() {
		loginInfo = $('#memberId').val();
		
		if(loginInfo == null || loginInfo == ''){
		var loginYN = confirm('로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?');
		if(loginYN){
			location.href = 'loginPage.do';
		}else{
			location.href = 'placeRentalApplyPage.do';
		}
	}
		
		var clickYear = $('#calTopYear').text();
		var clickMonth = $('#calTopMonth').text();
		var clickDay = $(this).text();
		var clickRentalTime = '';
		var clickRentalPlaceCode = '';
		
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        date = today.getDate();
        
	    if ((date+"").length < 2) {
	    	date = "0" + date;
	    }
	    if ((month+"").length < 2) {
	    	month = "0" + month;
	    }
	    if ((clickDay+"").length < 2) {
	    	clickDay = "0" + clickDay;
	    }
	    if ((clickMonth+"").length < 2) {
	    	clickMonth = "0" + clickMonth;
	    }

		if($(this).css('color') == 'rgb(0, 0, 0)'){
    		  $('.step2contentDiv').empty();
    		  var str = '';
    		  str += '<div>평일은 예약이 불가능합니다.</div>'
    		  $('.step2contentDiv').append(str);
    		  
    		  $('.step3contentDiv').empty();
    		  var str = '';
    		  str += '<div style="text-align: left;">평일은 예약이 불가능합니다.</div>'
    		  $('.step3contentDiv').append(str);
    		  
		}else if(clickYear+""+clickMonth+""+clickDay < year+""+month+""+date){
	  		  $('.step2contentDiv').empty();
			  var str = '';
			  str += '<div>이미 지난 날짜는 예약이 불가능 합니다.</div>'
			  $('.step2contentDiv').append(str);
			  
			  $('.step3contentDiv').empty();
			  var str = '';
			  str += '<div style="text-align: left;">이미 지난 날짜는 예약이 불가능 합니다.</div>'
			  $('.step3contentDiv').append(str);
			  
				$('.doDate').removeClass('selectedDay');
				$(this).addClass('selectedDay');
			
		}else if(clickYear+""+clickMonth+""+clickDay == year+""+month+""+date){
	  		  $('.step2contentDiv').empty();
			  var str = '';
			  str += '<div>당일 예약은 불가능 합니다.</div>'
			  $('.step2contentDiv').append(str);
			  
			  $('.step3contentDiv').empty();
			  var str = '';
			  str += '<div style="text-align: left;">당일 예약은 불가능 합니다.</div>'
			  $('.step3contentDiv').append(str);
			  
				$('.doDate').removeClass('selectedDay');
				$(this).addClass('selectedDay');
		}else{
			$('.doDate').removeClass('selectedDay');
			$(this).addClass('selectedDay');	
			
			clickYear = $('#calTopYear').text();
			clickMonth = $('#calTopMonth').text();
			clickDay = $('.selectedDay').text();
			
			$('.step3contentDiv').empty();
			var str = '';
			str += '<div style="text-align: left;">예약하실 시설을 선택해주세요.</div>'
			$('.step3contentDiv').append(str);

			//step1 Ajax 시작
			$.ajax({
			      url: 'step1.do', //요청경로
			      type: 'post',
			      data: {'clickYear':clickYear, 'clickMonth':clickMonth, 'clickDay':clickDay}, //요청경로로 던질 파라메터. '파레메터명':파라메터
			      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
			    		  $('.step2contentDiv').empty();
			    		  var str = '';
			    		  
			    		  $.each(result, function(index, element){
			    			  str += '<div class="rentalPlaceName" style="background: no-repeat 10px; background-position: right 50%;" data-rentalPlaceCode="' + element.placeCode + '">' + element.placeName + '</div>';
			    		  });
			    		  $('.step2contentDiv').append(str);
			    		  
			      },
			      error: function(){ //ajax통신 실패 시 실행부분
			    	  alert('조회실패');
			      }
			});
			//step1 Ajax 끝
		}		
	});
	
	//step2 시설이름 클릭 이벤트
	$(document).on('click', '.rentalPlaceName', function() {
			$('.rentalPlaceName').removeClass('selectedPlaceName');
			$(this).addClass('selectedPlaceName');
			
			clickYear = $('#calTopYear').text();
			clickMonth = $('#calTopMonth').text();
			clickDay = $('.selectedDay').text();
			clickRentalPlaceCode = $('.selectedPlaceName').attr('data-rentalPlaceCode');
			
			if(clickYear != null) {
				//step2 Ajax 시작
				$.ajax({
				      url: 'step2.do', //요청경로
				      type: 'post',
				      data: {'clickYear':clickYear, 'clickMonth':clickMonth, 'clickDay':clickDay, 'clickRentalPlaceCode':clickRentalPlaceCode}, //요청경로로 던질 파라메터. '파레메터명':파라메터
				      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				    	  if(result.rentalTime == 'A'){
				    		  $('.step3contentDiv').empty();
				    		  var str = '';
				    		  str += '<div><input type="checkbox" class="clickRentalTime" value="P">&emsp;오후(14:00 ~ 19:00)</div>';
				    		  $('.step3contentDiv').append(str);
				    	  }else if(result.rentalTime == 'P'){
				    		  $('.step3contentDiv').empty();
				    		  var str = '';
				    		  str += '<div><input type="checkbox" class="clickRentalTime" value="A">&emsp;오전(08:00 ~ 13:00)</div>';
				    		  $('.step3contentDiv').append(str);
				    	  }else if(result.rentalTime == null || result.rentalTime == '' || result.rentalTime == undefined){
				    		  $('.step3contentDiv').empty();
				    		  var str = '';
				    		  str += '<div><input type="radio" class="clickRentalTime" name="rentalTime" value="D">&emsp;종일(08:00 ~ 18:00)</div>';
				    		  str += '<div><input type="radio" class="clickRentalTime" name="rentalTime" value="A">&emsp;오전(08:00 ~ 13:00)</div>';
				    		  str += '<div><input type="radio" class="clickRentalTime" name="rentalTime" value="P">&emsp;오후(14:00 ~ 19:00)</div>';
				    		  $('.step3contentDiv').append(str);
				    	  }
				    	  
				      },
				      error: function(){ //ajax통신 실패 시 실행부분

				      }
				})
				//ste2 Ajax 끝
			}
	});
	
	
	//step3 시간선택 클릭 이벤트
	$(document).on('click', '.clickRentalTime', function() {
		$('.clickRentalTime').removeClass('checkedRentalTime');
		$(this).addClass('checkedRentalTime');
	});

	
	
	//선택예약하기 버튼 클릭 이벤트
	$(document).on('click', '#reserveBtn', function() {	
		clickYear = $('#calTopYear').text();
		clickMonth = $('#calTopMonth').text();
		clickDay = $('.selectedDay').text();
		clickRentalTime = $('.checkedRentalTime').val();
		clickRentalPlaceCode = $('.selectedPlaceName').attr('data-rentalPlaceCode');
		
		if(clickRentalTime == null || clickRentalTime == '' || clickRentalPlaceCode == null || clickRentalPlaceCode == ''){
			alert('선택되지 않은 옵션이 있습니다.\n옵션 선택을 완료 하시고 눌러주세요.');				
		}
		
		else{		
			//Ajax 시작
			$.ajax({
				url: 'insertReserve.do', //요청경로
				type: 'post',
				data: {'clickYear':clickYear, 'clickMonth':clickMonth, 'clickDay':clickDay, 'clickRentalPlaceCode':clickRentalPlaceCode, 'clickRentalTime':clickRentalTime, 'loginInfo':loginInfo}, //요청경로로 던질 파라메터. '파레메터명':파라메터
				success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
					if(result == 1) {
						alert('예약이 완료되었습니다.');
						location.href='placeRentalApplyPage.do';
					}
				},
				error: function(){ //ajax통신 실패 시 실행부분
					
				}
			});
		}
	});
	
	
});


/* 함수선언 영역*/
(function($){
	
	
})(jQuery);