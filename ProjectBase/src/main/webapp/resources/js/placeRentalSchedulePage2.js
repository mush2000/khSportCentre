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
	    
	    var rem0 = 0.857;
	    var rem1 = 1.857;
	    var rem2 = 2.857;
	    var rem3 = 3.857;
	    var rem4 = 4.857;
	    var rem5 = 5.857;
	    
	    $(document).ready(function() {
	    	drawCalendar();
	        initDate();
	        drawDays();
	        drawSche();
	        $("#prevMonthBtn").on("click", function(){movePrevMonth();});
	        $("#nextMonthBtn").on("click", function(){moveNextMonth();});
	        
	        $('.doDate').each(function(index, element){
	        	//토요일 예약가능 버튼 출력
	        	if($(element).text() != '' && ((index / 7).toFixed(3)) == rem0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem1){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem2){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY"`>예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem3){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem4){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem5){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	//평일 예약불가 버튼 출력, 공휴일은 예약가능버튼출력
	        	}else if($(element).text() != '' && index % 7 != 0){
	        		$(element).remove;
	        		var tStr = '<span class="doReserveN">예약불가</span>';
	        		$(hArray).each(function(i,e){
	        			if($(element).text() == e)
	        				tStr = '<span class="doReserveY"`>예약상황</span>';
	        		});
	        		$(element).after(tStr);
	        	//일요일 예약가능 버튼 출력
	        	}else if($(element).text() != '' && index % 7 == 0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY"`>예약상황</span>');
	        	}
	        });
	        
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
	        for(var i = 0; i < 42; i += 7){
	            $tdDay.eq(i).css("color","red");
	        }
	        for(var i = 6; i < 42; i += 7){
	            $tdDay.eq(i).css("color","blue");
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
	        
	        $('.doReserveN').remove();
	        $('.doReserveY').remove();
  		    $('.dataValue').empty();
	        $('.doDate').each(function(index, element){
	        	//토요일 예약가능 버튼 출력
	        	if($(element).text() != '' && ((index / 7).toFixed(3)) == rem0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem1){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem2){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem3){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem4){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem5){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	//평일 예약불가 버튼 출력
	        	}else if($(element).text() != '' && index % 7 != 0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveN">예약불가</span>');
	        	//일요일 예약가능 버튼 출력
	        	}else if($(element).text() != '' && index % 7 == 0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
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
	        $('.doReserveN').remove();
	        $('.doReserveY').remove();
  		  	$('.dataValue').empty();
	        $('.doDate').each(function(index, element){
	        	//토요일 예약가능 버튼 출력
	        	if($(element).text() != '' && ((index / 7).toFixed(3)) == rem0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem1){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem2){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem3){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem4){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}else if($(element).text() != '' && ((index / 7).toFixed(3)) == rem5){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	//평일 예약불가 버튼 출력
	        	}else if($(element).text() != '' && index % 7 != 0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveN">예약불가</span>');
	        	//일요일 예약가능 버튼 출력
	        	}else if($(element).text() != '' && index % 7 == 0){
	        		$(element).remove;
	        		$(element).after('<span class="doReserveY">예약상황</span>');
	        	}
	        });
	    };
	    
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
	            "2020":{
	                "07":{
	                    "17":"제헌절"
	                }
	                ,"08":{
	                    "7":"칠석"
	                    ,"15":"광복절"
	                    ,"23":"처서"
	                }
	                ,"09":{
	                    "13":"추석"
	                    ,"23":"추분"
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
	    				setTableHTML += '<span class="doDate"></span>'
	    				setTableHTML += '</td>';
	    			}
	    		setTableHTML += '</tr>'
	    	}
	    	$("#dayBar").after(setTableHTML);
	    };
	    
	    //모달창닫기시작
		$(".close").click(function(){
		  	var modalLayer = $("#modalLayer");
			var modalLink = $(".modalLink");
			modalLayer.hide();
			modalLink.focus();
			$("#mask").hide();  
		});        
		
		$("#mask").click(function () {
		  	var modalLayer = $("#modalLayer");
			var modalLink = $(".modalLink");
			modalLayer.hide();
			modalLink.focus();
			$("#mask").hide(); 
		});
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
			    		  str += '<table class="table dataValue">'
			    		  str += '<tr><td>'
			    		  str += '금일은 예약된 대관이 없습니다.'
			    		  str += '</td></tr>'
			    		  str += '</table>'
					      $('.dataValue').append(str);
			    		  modal();
			    	  }else {
			    		  $('.dataValue').empty();
				    	  var str = '';
				    	  
				    	  str += '<table class="table dataValue">'
				    	  str += '<tr>'
				    	  str += '<td>'
				    	  str += '대관장소명'
					      str += '</td>'
					      str += '<td>'
					      str += '대관가능일'
					      str += '</td>'
						  str += '<td>'
						  str += '대관가능시간'
						  str += '</td>'	    	  
						  str += '</tr>'
				    	  
				    	  $.each(result, function(index, element){
				    		  str += '<tr>';
				    		  str += '<td>' + element.placeName + '</td>'
				    		  str += '<td>' + element.rentalDate; + '</td>'
				    		  str += '<td>' + element.rentalTime; + '</td>'
				    		  str += '</tr>';
				    	  });
				    	  str += '</table>'
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