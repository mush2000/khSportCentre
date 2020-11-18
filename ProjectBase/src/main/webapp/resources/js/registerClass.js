/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$(document).on('click', '.classesName', function() {
		$('.selectedName').addClass('classesName');
		$('.selectedName').removeClass('selectedName');
		$(this).removeClass('classesName');
		$(this).addClass('selectedName');
		
		var classesCode = $(this).attr('data-classesCode');
		
		$.ajax({
			url: 'changeClasses.do', //요청경로
			type: 'post',
			data: {'classesCode':classesCode}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				var str='';
				str += '<tr><td class="title arrowTitle" style="border-right: 1px solid #ddd;">강의요일</td></tr>';
				
				if(result == null || result == ''){
					str += '<tr><td style="border-right: 1px solid #ddd;">';
					str += '<div style="height: 400px;"><div class="contentDiv">';
					str += '<span style="color: red;">등록된 강의가 없습니다.</span>';
					str += '</div></div>';
					str += '</td></tr>';
				}else{
					str += '<tr><td style="border-right: 1px solid #ddd;">';
					str += '<div style="height: 400px;">';
					$(result).each(function(index, element) {
						str += '<div class="contentDiv">';
						str += '<span class="classDay" data-classDayCode="' + element.classDayCode + '">' + element.classDay + '</span>';
						str += '</div>';
					});
					str += '</div>';
					str += '</td></tr>';
				}
				
				$('#classDayTable').html(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
		
		$('#classTimeTable').empty();
		$('#classLvTable').empty();
		$('#classesFeeTable').empty();
	});
	
	$(document).on('click', '.classDay', function() {
		$('.selectedDay').addClass('classDay');
		$('.selectedDay').removeClass('selectedDay');
		$(this).removeClass('classDay');
		$(this).addClass('selectedDay');
		
		var classDay = $(this).attr('data-classDayCode');
		var classesCode = $('.selectedName').attr('data-classesCode');
		
		$.ajax({
			url: 'selectClassDay.do', //요청경로
			type: 'post',
			async:false,
			data: {'classesCode':classesCode, 'classDayCode':classDay}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				$('#classTimeTable').empty();
				var str='';
				str += '<tr><td class="title arrowTitle" style="border-right: 1px solid #ddd;">강의시간</td></tr>';
				str += '<tr><td style="border-right: 1px solid #ddd;">';
				
				
				
				str += '<div class="one" style="background: white; margin: 0px; padding: 0; overflow: auto;">';
				str += '<div class="two" style="background: white; margin: 0px; padding: 0; overflow: auto;">';
				
				str += '<div style="height: 400px;">';
				$(result).each(function(index, element) {
					str += '<div class="contentDiv">';
					str += '<span class="classTime">' + element + '</span>&nbsp;<span class="textSpan">time</span>';
					str += '</div>';
				});
				str += '</div></div>';
				str += '</div></td></tr>';
				$('#classTimeTable').append(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
		
		$.ajax({
			url: 'checkRegClass.do', //요청경로
			type: 'post',
			async:false,
			data: {'classDayCode':classDay}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				var str='';
				$(result).each(function(index, element) {
					$('.classTime').each(function(i, e) {
						if (element.classTime == $(e).text()) {
							$(this).append('(' + element.classesName + ')');
							$(this).addClass('registeredTime');
							$(this).removeClass('classTime');
						}
					});
//					str += '<tr><td><span class="classTime">' + element + '</span></td></tr>';
				});
//				$('#classTimeTable').html(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
		
		$('#classLvTable').empty();
		$('#classesFeeTable').empty();
	});
	
	$(document).on('click', '.classTime', function() {
		$('.selectedTime').addClass('classTime');
		$('.selectedTime').removeClass('selectedTime');
		$(this).removeClass('classTime');
		$(this).addClass('selectedTime');
		
		var classTime = $(this).text();
		var classDay = $('.selectedDay').attr('data-classDayCode');
		var classesCode = $('.selectedName').attr('data-classesCode');
		
		var maxMember;
		var minMember;
		
		$.ajax({
			url: 'selectMaxMinMember.do', //요청경로
			type: 'post',
			async:false,
			data: {'classesCode':classesCode}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				maxMember = result.maxMember;
				minMember = result.minMember;
				var fee = result.classesFee;
				if ($('.selectedDay').attr('data-classDayCode') == 22)
					fee = 100 * Math.round(fee / 100 * .7);
//					fee *= 0.7;
				$('#classesFeeTable').html('<tr><td class="title">수강료</td></tr><tr><td><div style="height: 400px;"><div class="contentDiv"><span class="classFee">' + fee + '원</span></div></div></td></tr>');
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
		$.ajax({
			url: 'selectClassTime.do', //요청경로
			type: 'post',
			async:false,
			data: {'classesCode':classesCode, 'classDayCode':classDay, 'classTime':classTime}, 
			//요청경로로 던질 파라메터. '파레메터명':파라메터
			success: function(r) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				var str='';
				str += '<tr><td class="title arrowTitle" style="border-right: 1px solid #bbb;">강의수준</td></tr>';
				str += '<tr class="classLvTr"><td style="text-align: left; border-right: 1px solid #ddd;">';
				str += '<div class="one" style="background: white; margin: 0px; padding: 0; overflow: auto;">';
				str += '<div class="two" style="background: white; margin: 0px; padding: 0; overflow: auto;">';
				str += '<div style="height: 400px; width: 100%;">';
				$(r).each(function(i, e) {
					str += '<div class="contentDiv">';
					if(e.regMemberCnt >= maxMember) {
						str += '<span class="fullClassLv">';
					} else {
						str += '<span class="classLv" data-id="' + e.classNum + '">';
					}
					str += e.levelName + '</span>&emsp;<span>(장소&nbsp;:&nbsp;' + e.placeName + '&nbsp;/&nbsp;강사&nbsp;:&nbsp;' + e.memberName + ')</span>&emsp;<span>';
					if(e.regMemberCnt >= maxMember) {
						str += '마감되었습니다</span>';
					} else {
						str += e.regMemberCnt + '/' + maxMember + '(' + minMember + ')</span>';
					}
					str += '</div>';
				});
				str += '</div></tr></td>';
				str += '<div class="cover-bar"></div>';
				str += '</div></div>';
				$('#classLvTable').html(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('예외발생')
			}
		});
		
	});
	
	$(document).on('click', '.classLv', function() {
		location.href = 'registerPage.do?classNum=' + $(this).attr('data-id');
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);