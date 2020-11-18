/* 페이지 로딩 후 실행 */
$(document).ready(function(){

	//글쓰기
	$(document).on('click', '#boardWriteBtn', function() {
		//게시글 insert 하기전에 공백검사
		
		let kindOfBoard = $('#kindOfBoard').val();   //게시판종류
		let memberId = $('#memberId').val();         //아이디
		let boardTitle = $('#boardTitle').val();     //제목
		let boardContent = $('#boardContent').val(); //내용
		
		if(kindOfBoard.trim() == "") {
			alert('게시판을 선택하세요');
			
		}  else if (memberId.trim() == "") {
			alert('로그인이 되어있지않습니다');
			
		} else if (boardTitle.trim() == "") {
			alert('제목을 입력하세요');
			
		} else if (boardContent.trim() == "") {
			alert('내용을 입력하세요');
			
		} else if (~-encodeURI(boardTitle).split(/%..|./).length > 100) {
			alert('제목이 너무 깁니다 (최대 100자) 현재 : '+ ~-encodeURI(boardTitle).split(/%..|./).length +'자');
			
		} else if (~-encodeURI(boardContent).split(/%..|./).length > 1000) {
			alert('내용이 너무 깁니다 (최대 1000자) 현재 : '+ ~-encodeURI(boardContent).split(/%..|./).length +'자');
			
		} else {
			alert('글을 등록합니다');
			$('#writeBoard').submit();
		}
		
		
		
	});
	
	//비밀글
	$(document).on('click', '#chkIsSecret', function() {
		
		str = "";
		if($('input:checkbox[id="chkIsSecret"]').is(":checked") == true) {
			$('#hid').empty();
			str = `<input type="hidden" name="isSecret" id="isSecret" value="Y">`;
			
			$('#hid').append(str);
		} else {
			$('#hid').empty();
			str = `<input type="hidden" name="isSecret" id="isSecret" value="N">`;
			
			
			$('#hid').append(str);
		}
	});
	
	
	//파일 용량체크
	$(document).on('change', '.files', function() {
		if( !$(this).val() ) return;
		var f = this.files[0];
        var size = f.size || f.fileSize;
         
        var limit = 20000000;
                     
        if( size > limit )
        {
            alert( '첨부파일은 20mb 를 넘을수 없습니다.' );
            $(this).val('');
            return;
        }
                 
    $(this).parent().find('input[type=text]').val( $(this).val() );
		
	});
	
	//내용 입력 최대값을 넘어가면
	$(document).on('keyup', '#boardContent', function() {
		
		let boardContent = $(this).val(); //내용
		let maxByte = 1000;
		
		//현재 바이트수를 알려주고 그 최대입력값을 넘으면 페이지에 띄워준다

		var str = boardContent;
	    var str_len = str.length;


	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";

	    for(var i=0; i<str_len; i++) {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4) {
	            rbyte += 3;                                         //한글 3Byte
	        } else {
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }

	        if(rbyte <= maxByte) {
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }

	     if(rbyte > maxByte) {
	    	 $(this).next().text("현재 "+ rbyte + "Byte / 최대 입력 "+maxByte+"Byte를 초과했습니다");
	    	 
		 } else {
			 $(this).next().text("");
			  
		 }

	});
	
	//제목 최대값을 넘어가면
	$(document).on('keyup', '#boardTitle', function() {
		
		let boardTitle = $(this).val(); //내용
		let maxByte = 100; // 제목 최대입력가능값
		
		//현재 바이트수를 알려주고 그 최대입력값을 넘으면 페이지에 띄워준다

		var str = boardTitle;
	    var str_len = str.length;


	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";

	    for(var i=0; i<str_len; i++) {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4) {
	            rbyte += 3;                                         //한글 3Byte
	        } else {
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }

	        if(rbyte <= maxByte) {
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }

	     if(rbyte > maxByte) {
	    	 $(this).next().text("현재 "+ rbyte + "Byte / 최대 입력 "+maxByte+"Byte를 초과했습니다");
	    	 
		 } else {
			  $(this).next().text("");
			  
		 }

	});
	
	//파일 추가 누르면
	$(document).on('click', '#insertFile', function() {
		let str = "";
		
		let random = Math.random().toString(36).substr(2,11);
		let boardFile = $('#boardFile').val();
		boardFile = parseInt(boardFile);
		
		if(boardFile < 2) {
			str+= `<div><input type="file" name="${random}" class="files" style="display: inline-block; width: auto;"><input type="button" class="deleteInsertFile" value="삭제"></div>`;
			$('#boardFile').val(boardFile+1);
			
		} else if (boardFile == 2) {
			str+= `<div><input type="file" name="${random}" class="files" style="display: inline-block; width: auto;"><input type="button" class="deleteInsertFile" value="삭제"></div>`;
			$('#boardFile').val(boardFile+1);
			$('#hidInsertBtn').hide();
			
		} else {
			alert('첨부파일의 최대개수는 3개입니다');
			
		}
		
		$('#insertFiles').append(str);
	});
	
	//추가할 파일삭제
	$(document).on('click', '.deleteInsertFile', function() {
		let boardFile = $('#boardFile').val();
		$('#boardFile').val(boardFile-1);
		
		if(boardFile < 4) {
			$('#hidInsertBtn').show();
		}
		
		
		$(this).prev().remove();
		$(this).remove();
	});
	
	
	


	
	
});

/* 함수선언 영역*/
(function($){
	
	
	 
	
})(jQuery);