	$(document).ready(function(){
		var userid = getCookie("userid");
	    $('#form_userid').val(userid); 
	     
	    if($('#form_userid').val() != "") {
	        $('#form_checkbox').attr("checked", true);
	    }
	     
	    $('#form_checkbox').change(function(){
	        if($('#form_checkbox').is(":checked")){
	            var userid = $('#form_userid').val();
	            setCookie("userid", userid, 7);
	        }else{
	            deleteCookie("userid");
	        }
	    });
	     
	    $('#form_userid').keyup(function(){
	        if($('#form_checkbox').is(":checked")){
	            var userid = $('#form_userid').val();
	            setCookie("userid", userid, 7);
	        }
	    });
	 
		function setCookie(cookieName, value, exdays){
	   		var exdate = new Date();
	  		exdate.setDate(exdate.getDate() + exdays);
	    	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    	document.cookie = cookieName + "=" + cookieValue;
		}
	 
		function deleteCookie(cookieName){
	    	var expireDate = new Date();
	    	expireDate.setDate(expireDate.getDate() - 1);
	    	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
	 
		function getCookie(cookieName) {
	    	cookieName = cookieName + '=';
	    	var cookieData = document.cookie;
	    	var start = cookieData.indexOf(cookieName);
	    	var cookieValue = '';
	    	if(start != -1){
	        	start += cookieName.length;
	        	var end = cookieData.indexOf(';', start);
	        	if(end == -1)end = cookieData.length;
	        	cookieValue = cookieData.substring(start, end);
	    	}
	    	return unescape(cookieValue);
		}
		
		$('#form_submit').click(function(){
			var logEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if($('#form_userid').val() == '') {
				$('#form_msg').html('<font color="#FF605A">enter email</font>');
				$('#form_userid').focus();
				return false;
			} else if( !logEmail.test($('#form_userid').val()) ) {
				$('#form_msg').html('<font color="#FF605A">wrong email</font>');
				$('#form_userid').focus();
				return false;
			} else if($('#form_pwd').val() == '') {
				$('#form_msg').html('<font color="#FF605A">enter password</font>');
				$('#form_pwd').focus();
				return false;
			} else {
				$('#form_msg').text('');
			}
		});
	});