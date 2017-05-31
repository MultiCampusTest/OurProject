

$(document).ready(function() {
	

	
	// 이미지 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img_change').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

	




	
		
	$('#deleteBtn').click(function(){
		if($('#mypage_pwd').val() == '')
		{
			$('#mypage_pwd').focus();
			$('#mypage_pwd_msg').html('<font color="#FF605A">enter password</font>');
			return false;
		} 
		else
		{
			var email = $('#mypage_userid').val();
			var password = $('#mypage_pwd').val();
			$.ajax({
				url : 'removeMember.do',
				type : 'POST',
				data : { userid : email, pwd : password },
				dataType : 'json',
				success : function(data) {
					if(data.result) {
						alert('Thank you for that time.');
						location.href="main.do";
					} else {
						$('#mypage_pwd').val('');
						alert('password error');
					}
				}, error : function(data) {
					alert('data error');
				}
			});
		}
		
	});
	
	
	
	
	
	
	//성
			$('#firstName').focus(function(){
				if($(this).val() == '') {
					$('#fname_msg').html('<font color="#FF605A">enter first name</font>');
				}
			}).blur(function(){
				if($(this).val() != '') {
					$('#fname_msg').text('');
				}
			}).keyup(function(){
				if($(this).val() == '') {
					$('#fname_msg').html('<font color="#FF605A">enter first name</font>');
				} else {				
					$('#fname_msg').text('');
				}
			});
			
			//이름
			$('#lastName').focus(function(){
				if($('#lastName').val() == '') {
					$('#lname_msg').html('<font color="#FF605A">enter last name</font>');
				}
			}).blur(function(){
				if($('#lastName').val() != '') {
					$('#lname_msg').text('');
				}
			}).keyup(function(){
				if($('#lastName').val() == '') {
					$('#lname_msg').html('<font color="#FF605A">enter last name</font>');
				} else {				
					$('#lname_msg').text('');
				}
			});
			
			//비밀번호
			 var regPass = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		      $('input[type=password]').focus(function () {
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         }
		      }).blur(function() {
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         } else if($('#pwd').val() == $('#pwdChk').val()) {
		            $('#pwd_msg').text('');
		         }
		      }).keyup(function(){
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if($('#pwd').val() != $('#pwdChk').val()) {
		            $('#pwd_msg').html('<font color="#FF605A">not matched</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         } else {
		            $('#pwd_msg').text('');
		         }         
		      });
			
			//생년월일
			$('#birthday').focus(function(){
				if($(this).val() == '') {
					$('#birthday_msg').html('<font color="#FF605A">select birthday</font>');
				}
			}).blur(function(){
				if($(this).val() != '') {
					$('#birthday_msg').text('');
				}
			});
			
			//성별
			$('#gender').focus(function(){
				if($(this).val() == 'list' || $(this).val() == 'list') {
					$('#gender_msg').html('<font color="#FF605A">select gender</font>');
				}
			}).blur(function(){
				if($(this).val() == 'list') {
					$('#gender_msg').html('<font color="#FF605A">select gender</font>');
				} else {
					$('#gender_msg').text('');				
				}
			});
			
			//국가
			$('#country').focus(function(){
				if($(this).val() == 'list' || $(this).val() == 'list') {
					$('#country_msg').html('<font color="#FF605A">select country</font>');
				}
			}).blur(function(){
				if($(this).val() == 'list') {
					$('#country_msg').html('<font color="#FF605A">select country</font>');
				} else {
					$('#country_msg').text('');
				}
			});
			
			
			
			
			$('#change_profile_btn').click(function(){
				var confirm = false;
				if($('#firstName').val() == '')
					$('#firstName').focus();
				else if($('#lastName').val() == '')
					$('#lastName').focus();
				else if($('#pwd').val() == '')
					$('#pwd').focus();
				else if($('#pwd').val() == '' || 
						$('#pwd').val() != $('#pwdChk').val() || 
						($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8))
					$('#pwdChk').focus();
				
				else if($('#country').val() == 'list')
					$('#country').focus();
				
				else
					confirm = true;
				return confirm;
			});
	
	
});


