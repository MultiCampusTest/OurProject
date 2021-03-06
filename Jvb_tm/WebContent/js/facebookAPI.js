window.fbAsyncInit = function() {
	FB.init({
		appId : '534503966938051',
		xfbml : true,
		version : 'v2.9'
	});
	FB.AppEvents.logPageView();
};

function fbAjaxRequest(response) {
	$.ajax({
		url : 'idCheck.do',
		type : 'POST',
		data : { userid : response.email },
		dataType : 'json',
		success : function(data) {
			if (data.result) {
				alert('Fail : alreay verified email');
				logout();
				location.href="loginForm.do";
			} else {
				alert('Success : continue to sign up');
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "fbJoinForm.do");
				for(var key in response) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					if(key == 'id')
					{
						hiddenField.setAttribute("value", "https://graph.facebook.com/" + response[key] + "/picture?type=large");
						key = 'img_code';
					} else {
						hiddenField.setAttribute("value", response[key]);						
					}
					
					if(key == 'email') {
						key = 'userid';						
					} else if(key == 'first_name') {
						key = 'firstName';						
					} else if(key == 'last_name') {
						key = 'lastName';
					}
					hiddenField.setAttribute("name", key);
					form.appendChild(hiddenField);
				}
				document.body.appendChild(form);
				logout();
				form.submit();
			}
		}, error : function() {
			alert('data error');
			}
	});
}

function facebook_btn() {
	FB.login(function(response) {
		if (response.authResponse) {
			console.log('Welcome!  Fetching your information.');
			FB.api('/me?fields=id,email,first_name,last_name,gender', function(response) {
				fbAjaxRequest(response);
			});
		} else {
			console.log('User cancelled login or did not fully authorize.');
		}
	}, { scope : 'public_profile, email', return_scopes : true });
};

function logout() {
	FB.logout(function(response) {
		  // user is now logged out
	});
}

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));