<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
  var resp = {};
  var startApp = function() {
    gapi.load('auth2', function() {
    	auth2 = gapi.auth2.init({
    		client_id: '1043045607667-95t9tqe1aki5gib9qt5ipgpcp0grhas3.apps.googleusercontent.com',
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };

  function attachSignin(element) {
	  console.log(element.id);
	  auth2.attachClickHandler(element, {},
        function(googleUser) {
		  alert(googleUser.getBasicProfile().getId());
          alert(googleUser.getBasicProfile().getFamilyName());
          alert(googleUser.getBasicProfile().getGivenName());
          alert(googleUser.getBasicProfile().getEmail());
          alert(googleUser.getBasicProfile().getImageUrl());            
        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
  </script>
</head>
<body>
    <div id="customBtn" class="customGPlusSignIn">
      <a class="buttonText">Google</a>
    </div>
  <script>startApp();</script>
</body>
</html>