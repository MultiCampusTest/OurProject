/**
 * 
 */



	function msgCount(){
		var userid=$('.msgCount').attr('id');

		
		$.ajax({
			url : 'msgReadCount.do',
			type : 'POST',
			dataType : 'json',
			success : function(data) {

				if(data.msgCount!=0){
					$('.msg_count_icon').css('display', '');
					$('#msgReadCountNum').html(data.msgCount);
				}
				else{
					$('.msg_count_icon').css('display', 'none');
					$('#msgReadCountNum').html("");
				}
				
				
				
			},
			error : function() {
				alert('에러에러에러 메시지 에러');
			}
		});
	}