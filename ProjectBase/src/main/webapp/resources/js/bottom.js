/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//Ajax 시작
	$.ajax({
	      url: 'lectureList.do', //요청경로
	      type: 'post',
	      data: {}, 
	    	  //요청경로로 던질 파라메터. '파레메터명':파라메터
	      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
			  var lec = '';
			  var inst = '';
	    	  $(result).each(function(index, element){
	    		  var temp = '강사';
	    		  lec += '<li><a href="classesDetail.do?classesCode='+ element.classesCode +'">' + element.classesName + '</a></li>';
	    		  if(element.classesCode == 61)
	    			  temp = '트레이너';
	    		  inst += '<li><a href="instructorDetail.do?classesCode='+ element.classesCode +'">' + element.classesName + temp + '</a></li>';
	    	  });

	    	  $('#classesInfo').html(lec);
	    	  $('#instInfo').html(inst);
	      },
	      error: function(){ //ajax통신 실패 시 실행부분
	    	  alert('예외발생')

	      }
	});
	
	
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);