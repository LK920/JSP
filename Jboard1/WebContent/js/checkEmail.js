	//정규표현식
    var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;    // 이메일 검사식
	// 최종점검을 위한 상태변수 선언
	var isEmailOk = false;          
    
    $(document).ready(function(){
    		
    	var alreadyCheck = false;
    		
    	$('input[name=email]').focusout(function(){
    			
    		if(alreadyCheck){
    			alreadyCheck = false;
    			return false;
   			}
   			
    		var tag = $(this);
    		var email = tag.val();
    		var json = {"email":email};
    			
    		if(regEmail.test(email) == false){
    			alert('이메일이 정확하지 않습니다. 다시 확인해주세요.');
    			tag.focus();
    			alreadyCheck = true;
    			return false;
    		}
    		//모든 검증이 통과되고 통신시작
    		$.ajax({
        		url : '/Jboard1/user/proc/checkEmail.jsp',
        		style : 'get',
        		data : json,
        		dataType : 'json',
        		success: function(data){
        			if(data.result == 1){
        				$('.resultEmail').css('color', 'red').text('사용 불가능한 이메일입니다.');
        				
        			}else{
        				$('.resultEmail').css('color', 'green').text('사용 가능한 이메일입니다.');
        				isEmailOk = true;
        			}
        		}
        	});
    	});
    });
    