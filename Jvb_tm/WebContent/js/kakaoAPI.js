Kakao.init('5857c3a666da7e794d2b1d07ce1214fa');
function loginWithKakao() {
	Kakao.Auth.login({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					$.ajax({
		    			url : 'idCheck.do',
		    			type : 'POST',
		    			data : { userid : res.kaccount_email },
		    			dataType : 'json',
		    			success : function(data) {
		    				if (data.result) {
		    					alert('Fail : alreay verified email');
		    					location.href="loginForm.do";
		    				} else {
		    					alert('Success : continue to sign up');
		    					var form = document.createElement("form");
		    					form.setAttribute("method", "post");
		    					form.setAttribute("action", "fbJoinForm.do");
		    					var hiddenField = document.createElement("input");
		    					hiddenField.setAttribute("type", "hidden");
		    					hiddenField.setAttribute("value", res.kaccount_email);
		    					hiddenField.setAttribute("name", "userid");
		    					form.appendChild(hiddenField);
		    					Kakao.Auth.logout();
		    					document.body.appendChild(form);
		    					form.submit();
		    				}
		    			}, error : function() {
		    				alert('data error');
		    				}
		    		});
				},
				fail : function(error) {

				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
}