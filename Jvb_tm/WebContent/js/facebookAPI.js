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
		data : { userid : response.id },
		dataType : 'json',
		success : function(data) {
			if (data.result) {
				alert('이미 가입하셨습니다.');
			} else {
				alert('회원가입이 가능합니다.');
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "fbJoinForm.do");
				for(var key in response) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("value", response[key]);
					if(key == 'id') {
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
			FB.api('/me?fields=id,email,first_name,last_name,gender,birthday', function(response) {
				fbAjaxRequest(response);
			});
		} else {
			console.log('User cancelled login or did not fully authorize.');
		}
	}, { scope : 'public_profile, email', return_scopes : true });
};

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