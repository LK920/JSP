//폼 검증에 사용될 것
var isUidOk = false;

$(document).ready(function(){
	
	var inputUid  = $('input[name=uid]');
	
	inputUid.focusout(function(){
		
		var uid = $(this).val();
		
		$.ajax({
			url: '/Jboard2/user/checkUid.do?uid='+uid,
			type: 'get',
			datatype: 'json',
			//데이터타입은 클라이언트한테 보내는 데이터 타입
			success: function (data) {
				
				var json = JSON.parse(data);
				
				alert(json.result);
				
				if(json.result == 1 ){
					$('.resultId').css('color', 'red').text('이미 사용 중인 아이디입니다.');
					isUidOk = false;
				}else{
					$('.resultId').css('color', 'green').text('사용 할 수 있는 아이디입니다.');
					isUidOk = true;
				}
			}
		});
	});
});
