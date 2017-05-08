$(document).ready(function() {
		$(function() {
			$("#birthday").flatpickr({});
		});
		
		var jsonResult = true;
		$('#userid').on('keyup', function() {
			var inputId = $(this).val();
			if(inputId.length < 5) {
				$('#idCheck').html('<font color="red">Between 5 and 15 characters</font>');
			} else {
				$.ajax({
					url : 'idCheck.do',
					type : 'POST',
					data : {userid : inputId},
					dataType: 'json',
					success : function(data) {
						if(data.result) {
							$('#idCheck').html('<font color="red">Duplicated account</font>');					
						} else
							$('#idCheck').html('<font color="green">Available account</font>');
						jsonResult = data.result;
					}, error : function() {
						alert('data error');
					}
				});
			}	
		}).on('blur', function(){
			if(jsonResult == false) {
				$('#idCheck').text('');
			}
		});
		
		var pwdValidation = false;
		$('input[type=password]').on('keyup', function(){
			var pwd = $('#pwd').val();
			var pwdChk = $('#pwdChk').val();
			var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if(pwd.length < 8) {
				$('#pwdCheck').html('<font color="red">between 8 and 20 digits</font>');
			} else if(!regPwd.test($('#pwd').val())) {
				$('#pwdCheck').html('<font color="red">Upper & Lower case + Number + special character</font>');
			} else if(pwd != pwdChk) {
				$('#pwdCheck').html('<font color="red">Password mismatch</font>');
			} else {
				$('#pwdCheck').html('<font color="green">Good</font>');
				pwdValidation = true;		
			}
		}).on('blur', function(){
			if(pwdValidation == true) {
				$('#pwdCheck').text('');				
			}
		});
		
		var emailValidation = false;
		$('#email').on('keyup', function() {
			var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if( !regEmail.test($('#email').val()) ) {
				$('#emailCheck').html('<font color="red">Invalid email address</font>');
			} else {
				$('#emailCheck').html('<font color="green">Good email</font>');
				emailValidation = true;
			}
		}).on('blur', function() {
			if(emailValidation == true) {
				$('#emailCheck').text('');
			}
		});
		
		$('input[type=submit]').on('click', function() {
			var submitValidation = false;
			if($('#firstName').val() == '') 
				$('#firstName').focus();			
			else if($('#lastName').val() == '')
				$('#lastName').focus();			
			else if($('#userid').val() == '' || jsonResult != false)
				$('#userid').focus();
			else if($('#pwd') == '' || pwdValidation == false)
				$('#pwd').focus();
			else if($('#email').val() == '' || emailValidation == false)
				$('#email').focus();
			else if($('#birthday').val() == '')
				$('#birthday').focus();
			else if($('#gender').val() == "gender")
				$('#gender').focus();
			else if($('#country').val() == "country")
				$('#country').focus();
			else if(!$('#agree').is(':checked')) {
				alert('You have to agree our Terms & Conditions');
				$('input[type=checkbox]').focus();
			} else
				submitValidation = true;
			return submitValidation;
		});
});