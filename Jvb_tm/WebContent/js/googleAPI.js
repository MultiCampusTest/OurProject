var googleUser = {};
var startApp = function() {
    gapi.load('auth2', function(){
      auth2 = gapi.auth2.init({
        client_id: '1043045607667-95t9tqe1aki5gib9qt5ipgpcp0grhas3.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };

  function attachSignin(element) {
    console.log(element.id);
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    		var response = {
    				userid : googleUser.getBasicProfile().getEmail(),
    				firstName : googleUser.getBasicProfile().getGivenName(),
    				lastName : googleUser.getBasicProfile().getFamilyName(),
    				fileuri : googleUser.getBasicProfile().getImageUrl()
    		}
    		$.ajax({
    			url : 'idCheck.do',
    			type : 'POST',
    			data : { userid : googleUser.getBasicProfile().getEmail() },
    			dataType : 'json',
    			success : function(data) {
    				if (data.result) {
    					alert('Already registered');
    					location.href="loginForm.do";
    				} else {
    					alert('Verified successfully');
    					var form = document.createElement("form");
    					form.setAttribute("method", "post");
    					form.setAttribute("action", "fbJoinForm.do");
    					for(var key in response) {
    						var hiddenField = document.createElement("input");
    						hiddenField.setAttribute("type", "hidden");
    						hiddenField.setAttribute("value", response[key]);
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

        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
}