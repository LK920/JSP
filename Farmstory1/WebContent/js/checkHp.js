var regHp = /^\d{3}-\d{3,4}-\d{4}$/;;
var isHpOk = false;

$(function(){
	
	var alreadyCheck = false;
	
	$('input[name=hp]').focusout(function(){
		
		if(alreadyCheck){
			alreadyCheck = false;
			return false;
			}
		
		var hp = $(this).val();
		var json = {"hp":hp};
		
		if(regHp.test(hp)==false){
			alert('전화번호를 다시 입력해주세요.');
			
			alreadyCheck = true;
			return false;
		}
		
		$.ajax({
			url : '/Farmstory1/user/proc/checkHp.jsp',
			style : 'get',
			data : json,
			dataType : 'json',
			success : function(data){
				if(data.result == 1){
					alert('해당 번호는 이미 가입된 번호입니다.');
				}else{
					alert('가입가능한 번호입니다.');
					isHpOk = true;
				}
			}
		});
	});
});