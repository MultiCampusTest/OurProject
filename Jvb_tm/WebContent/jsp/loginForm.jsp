<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
<meta name="description" content="Responsive Login Page / Signup Page Template Design In HTML5 And CSS3 With html css source code"/>
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet'>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel='stylesheet'>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/login-style.css" rel="stylesheet">
<link href="css/layer-style.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });

	    }
	});
</script>
</head>
<body>
	<div id="login-form">
	
		<div class="section-logo">
			<img alt="logo" src="http://static2.traveltek.net/images/www.travelmaker.co.uk/img/Travelmakerlogo.gif">
		</div>

		<div class="section-out">
			<section class="login-section">
			<div class="login">
				<form action="loginProc.do" method="post">
					<ul class="ul-list">
						<li><input type="text" class="input" placeholder="Userid" /><span class="icon"></span></li>
						<li><input type="password" class="input"
							placeholder="Password" /><span class="icon"></span></li>
						<li><span class="remember"><input type="checkbox"
								id="check"> <label for="check">아이디 저장</label></span><span
							class="validation">Forgot<a href="#layer2" class="btn-example">&nbsp;Your Account</a> 
								<div class="dim-layer">
									<div class="dimBg"></div>
									<div id="layer2" class="pop-layer">
										<div class="pop-container">
											<div class="pop-conts">
												<!--content //-->
												<p class="ctxt mb20">
													<h1>Search for ID</h1><br>
													Fill in the form to find your ID<br>
													<ul class="ul-list">
													<li>
													<input type="text" class="input" placeholder="Your Name" name="name" id="id"><span class="icon"></span><br>
													</li>
													<li>
													<input type="text" class="input" name="email" placeholder="Your Email" id="email"><span class="icon"></span>
													</li>
													</ul>
													<div class="btn-c">
														<input type="button" value="Confirm" class="btn-confirm">
													</div>
												</p><br><br>
												<p class="ctxt mb20">
													<h1>Serch for Password</h1><br>
													Fill in the form to find your Password<br>
													<ul class="ul-list">
													<li>
													<input type="text" class="input" placeholder="Your Name" name="name" id="id"><span class="icon"></span><br>
													</li>
													<li>
													<input type="name" class="input" placeholder="Your ID" name="name" id="name"><span class="icon"></span>
													</li>
													<li>
													<input type="text" class="input" placeholder="Your Email" name="email" id="email"><span class="icon"></span>
													</li>
													</ul>
													<div class="btn-c">
														<input type="button" value="Confirm" class="btn-confirm">
													</div>
												</p>
												<div class="btn-r">
													<a href="#" class="btn-layerClose">Close</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								</span>
						
						</li>
						<li><input type="submit" value="SIGN IN" class="btn"></li>
					</ul>
				</form>
			</div>
			</section>
		</div>
		<div id="powered">
			Create you account right now&nbsp;<a href="joinForm.do" target="_blank">
			<b>Join Us</b></a>
		</div>
	</div>


	
</body>
</html>