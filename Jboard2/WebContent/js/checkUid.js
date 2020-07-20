//폼 검증에 사용될 것
var isUidOk = false;

$(document).ready(function(){
	
	var inputUid  = $('input[name=uid]');
	
	inputUid.focusout(function(){
		
		var uid = $(this).val();
		
		$.ajax({
			url: '/Jboard2/user/checkUid.do?uid='+uid,
			type: 'get',
			dataType: 'json',
			//데이터타입은 클라이언트한테 보내는 데이터 타입, 이때 dataType이거 T대문자 사용
			//안 할 경우 json 객체로 못 받아들이기 때문에 필히 확인 할거 안할시 그냥 문자열로만 받아옴
			success: function (data) {
				
							
				//확인용 alert(data.result);
				
				if(data.result == 1 ){
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
