	$(document).ready(function() {
		$(function() {
			$("#birthday").flatpickr({});
		});
		
		$('#disagree').on('click', function() {
			alert("You can't sign up without agreement to Terms and Conditions.");
		});
		
		var jsonFalse = null;
		$('#userid').on('keyup', function() {
			var inputId = $(this).val();
			$.ajax({
				url : 'idCheck.do',
				type : 'POST',
				data : {userid : inputId},
				dataType: 'json',
				success : function(data) {
					if(data.result) {
						$('#idCheck').html('<font color="red">Duplicated account</font>');					
					}
					else
						$('#idCheck').html('<font color="green">Available account</font>');
						jsonFalse = data.result;
				}, error : function() {
					alert('data error');
				}
			});
		}).on('blur', function(){
			if(jsonFalse == false) {
				$('#idCheck').text('');
			}
		});
		
		var pwd, pwdChk = null;
		$('input[type=password]').on('keyup', function(){
			pwd = $('#pwd').val();
			pwdChk = $('#pwdChk').val();
			if(pwd != pwdChk) {
				$('#pwdCheck').html('<font color="red">Please reenter your password</font>');			
			} else
				$('#pwdCheck').text('');	
		});
		
		var email = null;
		$('#email').on('keyup', function() {
			var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if( !regEmail.test($('#email').val()) ) {
				$('#emailCheck').html('<font color="red">Invalid email address</font>');
				email = false;
			} else {
				email = true;
			}
		}).on('blur', function() {
			if(email == true) {
				$('#emailCheck').text('');
			}
		});
		
		$('input[type=submit]').on('click', function() {			
			if($('#firstName').val() == '') {
				$('#firstName').focus();
				return false;				
			}
			
			if($('#lastName').val() == '') {
				$('#lastName').focus();
				return false;				
			}
			
			if($('#userid').val() == '') {
				$('#userid').focus();
				return false;
			}

			
			if(jsonFalse != false) {
				$('#userid').focus();
				return false;
			}
			
			if($('#pwd').val() == '') {
				$('#pwd').focus();
				return false;
			} else if($('#pwdChk').val() == '') {
				$('#pwdChk').focus();
				return false;
			} else if(pwd != pwdChk) {
				$('#pwdChk').focus();
				return false;
			}
			
			if($('#email').val() == '' || email == false) {
				$('#email').focus();
				return false;
			}
			
			if($('#birthday').val() == '') {
				$('#birthday').focus();
				return false;
			}
			
			if($('#gender').val() == "gender") {
				$('#gender').focus();
				return false;
			}
			
			if($('#country').val() == "country") {
				$('#country').focus();
				return false;
			}
			
			if(!$('#agree').is(':checked')) {
				alert('You have to agree our Terms & Conditions');
				return false;				
			}
		});
		
	});