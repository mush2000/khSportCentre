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
			    	  
			    	  $('.doReserveN').remove();
			    	  $('.doReserveY').remove();
			    	  $('.dataValue').empty();
			    	  
			    	  displayCalendar();
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
			    	  
			    	  $('.doReserveN').remove();
			    	  $('.doReserveY').remove();
			    	  $('.dataValue').empty();
			    	  
			    	  displayCalendar();
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
	        			tStr = '<span class="doReserveY">예약상황</span>';
	        			$tdDay.eq(index).css("color","blue");
	        			//평일 예약불가 버튼 출력, 공휴일은 예약가능버튼출력
	        		}else if(index % 7 != 0){
	        			$tdDay.eq(index).css("color","black");
	        			$(element).remove;
	        			var tStr = '<span class="doReserveN">예약불가</span>';
	        			//일요일 예약가능 버튼 출력
	        		}else if(index % 7 == 0){
	        			$(element).remove;
	        			tStr = '<span class="doReserveY">예약상황</span>';
	        			$tdDay.eq(index).css("color","red");
	        		}
	        		if(hArray != "" && hArray != null)
	        			$(hArray).each(function(i,e){
	        				if($(element).text() == e) {
	        					tStr = '<span class="doReserveY">예약상황</span>';
	        					$tdDay.eq(index).css("color","red");
	        				}
	        			});
	        		$(element).after(tStr);
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
	    					setTableHTML += '<td style="border-right: none; height: 100px;" class="doDateTd">';
	    				}else{
	    					setTableHTML += '<td style="border-right: 1px solid #ddd; height: 100px;" class="doDateTd">';
	    				}
	    				setTableHTML += '<span class="doDate"></span>';
	    				setTableHTML += '</td>';
	    			}
	    		setTableHTML += '</tr>'
	    	}
	    	$("#dayBar").after(setTableHTML);
	    };
	    
	    //모달창닫기시작
	    //X버튼 눌러서 닫기
		$(".close").click(function(){
		  	var modalLayer = $("#modalLayer");
			var modalLink = $(".modalLink");
			modalLayer.hide();
			modalLink.focus();
			$("#mask").hide();  
		});        
		
		//검은바탕 눌러서 닫기
		$("#mask").click(function () {
		  	var modalLayer = $("#modalLayer");
			var modalLink = $(".modalLink");
			modalLayer.hide();
			modalLink.focus();
			$("#mask").hide(); 
		});
		
		//ESC 눌러서 닫기
		window.onkeyup = function(e) {
			var key = e.keyCode ? e.keyCode : e.which;
			if(key == 27) {
			  	var modalLayer = $("#modalLayer");
				var modalLink = $(".modalLink");
				modalLayer.hide();
				modalLink.focus();
				$("#mask").hide();
			}
		}
		//모달창닫기끝
		
	    
	    //클릭 이벤트
		$(document).on('click', '.doReserveY', function() {
			var clickYear = $('#calTopYear').text();
			var clickMonth = $('#calTopMonth').text();
			var clickDay = $(this).prev().text();
			
			//Ajax 시작
			$.ajax({
			      url: 'selectReserveStatus.do', //요청경로
			      type: 'post',
			      data: {'clickYear':clickYear, 'clickMonth':clickMonth, 'clickDay':clickDay}, //요청경로로 던질 파라메터. '파레메터명':파라메터
			      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
			    	  if(result == null || result == ''){
			    		  $('.dataValue').empty();
			    		  var str = '';
			    		  str += '<tr style="padding: 15px;"><td style="padding: 15px; text-align: center;">';
			    		  str += '해당 날짜에 예약된 시설이 없습니다.'
					      $('.dataValue').append(str);
			    		  str += '</td></tr>';
			    		  modal();
			    	  }else {
			    		  $('.dataValue').empty();
				    	  var str = '';
				    	  
				    	  str += '<tr style="padding: 5px; text-align: center;">'
				    	  str += '<td style="padding: 5px; text-align: center;" class="rentalTableTitle">'
				    	  str += '대관장소명'
					      str += '</td>'
					      str += '<td style="padding: 5px; text-align: center;" class="rentalTableTitle">'
					      str += '예약된날짜'
					      str += '</td>'
						  str += '<td style="padding: 5px; text-align: center;" class="rentalTableTitle">'
						  str += '예약된시간'
						  str += '</td>'	    	  
						  str += '<td style="padding: 5px; text-align: center;" class="rentalTableTitle">'
						  str += '예약상태'
						  str += '</td>'	    	  
						  str += '</tr>'
				    	  
				    	  $.each(result, function(index, element){
				    		  str += '<tr style="padding: 5px; text-align: center;">';
				    		  str += '<td style="padding: 5px; text-align: center;">' + element.placeName + '</td>'
				    		  str += '<td style="padding: 5px; text-align: center;">' + element.rentalDate; + '</td>'
				    		  if(element.rentalTime == 'D') {
				    			  str += '<td style="padding: 5px; text-align: center;">종일예약</td>'
				    		  }else if(element.rentalTime == 'A') {
				    			  str += '<td style="padding: 5px; text-align: center;">오전예약</td>'
				    		  }else if(element.rentalTime == 'P') {
				    			  str += '<td style="padding: 5px; text-align: center;">오후예약</td>'
				    		  }
				    		  if(element.rentalApprovalYN == 'N'){
				    			  str += '<td style="padding: 5px; text-align: center;">예약승인요청중</td>'
				    		  }else{
				    			  str += '<td style="padding: 5px; text-align: center;">예약완료</td>'
				    		  }
				    		  str += '</tr>';
				    	  });
				    	  $('.dataValue').append(str);
				    	  modal();
			    	  }
			      },
			      error: function(){ //ajax통신 실패 시 실행부분
			    	  alert('실패');
			      }
			});
		});
});

/* 함수선언 영역*/
(function($){
	modal = function() {
  	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 
	 
	  modalLayer.fadeIn(0);
	  wrapWindowByMask();
	  modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	  $(this).blur();
	  $(".modalContent > a").focus(); 
	  return false;
	}
	
	wrapWindowByMask = function(){
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
        $("#mask").fadeTo("slow",0.6);    
    };	
})(jQuery);