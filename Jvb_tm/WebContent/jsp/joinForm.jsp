<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--   커스텀CSS -->
<link href="css/noticeView.css" rel="stylesheet">

<!-- 회원가입 폼 CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/join-style.css">


<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
 
<!-- 달력 관련 CDN -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#birthday").datepicker({
			nextText : 'Next Month',
			prevText : 'Previous Month',
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : 'Today',
			closeText : 'Close',
			dateFormat : "yy-mm-dd",
			yearRange : 'c-100:c+10'

		});
	});
</script>

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function file_check() {
		isCheck = false;
		filename = document.regform.file1.value;
		file_len = filename.length;
		file_gubun = filename.substr(file_len - 3, file_len);

		if (file_gubun.toLowerCase() == "jpg"
				|| file_gubun.toLowerCase() == "gif") {
			isCheck = true;
		}
		if (isCheck == false) {
			alert("확장자가 jpg, gif 인 파일만 업로드가 가능합니다.");
			document.regform.file1.select();
			document.selection.clear();
			return false;
		} else {
			return true;
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#pwdVali').hide();
		$('input[type=password]').on('keyup', function() {
			var pw1 = $('#pwd').val();
			var pw2 = $('#pwd2').val();
			if(pw1 != pw2) {
				$('#pwdVali').html('<font color="#FF605A"><b>Warning! please check your password</b></font>');
				$('#pwdVali').show();
			} else {
				$('#pwdVali').hide();
			}
		});
		
		$('button[type=submit]').on('click', function(){
			alert('테스트');
		});
	});
</script>

<title>Sing Up</title>
</head>
<body>
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">

				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h3>where we provide pleasant travelling and exciting
							memories</h3>
						<div class="description">
							<p>
							<h1>
								Welcome to&nbsp;<a href="main.do"><b>Travel Maker</b></a>
							</h1>
							</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">

						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Sign Up Now</h3>
									<p>Fill in the form below to get instant access:</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>

							<div class="form-bottom">
								<form action="regProc.do" method="post" class="registration-form">
									<div class="form-group">
										<label class="sr-only" for="form-email">email</label>
										<input type="text" id="email" name="email" class="form-first-name form-control" placeholder="example@domain.com" value="${params.email}">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-pwd">pwd</label>
										<input type="password" id="pwd" name="pwd" maxlength="12" placeholder="Password" class="form-control">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-pwdChk">pwdCheck</label>
										<input type="password" id="pwd2" name="pwd2" maxlength="12" placeholder="Check Password" class="form-control">
										<span id="pwdVali"></span>
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-first-name">firstName</label>
										<input type="text" id="f_name" name="f_name" placeholder="First Name" class="form-control">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-last-name">lastName</label>
										<input type="text" id="l_name" name="l_name" placeholder="Last Name" class="form-control">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-gender">gender</label>
										<select class="nation">
											<option>Choose your Gender</option>
											<option value="m">Male</option>
											<option value="f">Female</option>
										</select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-birthday">birthday</label>
										<input type="text" id="birthday" name="birthday" class="form-control" placeholder="Date of Birthday">
									</div>

									<div class="form-group">
										<label class="sr-only" for="form-country">Country</label>
										<select class="nation">
											<option value="">Where are you from</option>
											<optgroup label="A"></optgroup>
											<option value="AF">Afghanistan</option>
											<option value="AL">Albania</option>
											<option value="DZ">Algeria</option>
											<option value="AS">American Samoa</option>
											<option value="AD">Andorra</option>
											<option value="AO">Angola</option>
											<option value="AI">Anguilla</option>
											<option value="AG">Antigua and Barbuda</option>
											<option value="AR">Argentina</option>
											<option value="AM">Armenia</option>
											<option value="AW">Aruba</option>
											<option value="AU">Australia</option>
											<option value="AT">Austria</option>
											<option value="AZ">Azerbaijan</option>
											<optgroup label="B"></optgroup>
											<option value="BS">Bahamas</option>
											<option value="BH">Bahrain</option>
											<option value="BD">Bangladesh</option>
											<option value="BB">Barbados</option>
											<option value="BY">Belarus</option>
											<option value="BE">Belgium</option>
											<option value="BZ">Belize</option>
											<option value="BJ">Benin</option>
											<option value="BM">Bermuda</option>
											<option value="BT">Bhutan</option>
											<option value="BO">Bolivia</option>
											<option value="BA">Bosnia and Herzegovina</option>
											<option value="BW">Botswana</option>
											<option value="BR">Brazil</option>
											<option value="VG">British Virgin Islands</option>
											<option value="BN">Brunei</option>
											<option value="BG">Bulgaria</option>
											<option value="BF">Burkina Faso</option>
											<option value="BI">Burundi</option>
											<optgroup label="C"></optgroup>
											<option value="KH">Cambodia</option>
											<option value="CM">Cameroon</option>
											<option value="CA">Canada</option>
											<option value="CV">Cape Verde</option>
											<option value="KY">Cayman Islands</option>
											<option value="CF">Central African Republic</option>
											<option value="TD">Chad</option>
											<option value="CL">Chile</option>
											<option value="CN">China</option>
											<option value="CC">Cocos Islands</option>
											<option value="CO">Colombia</option>
											<option value="KM">Comoros</option>
											<option value="CK">Cook Islands</option>
											<option value="CR">Costa Rica</option>
											<option value="HR">Croatia</option>
											<option value="CU">Cuba</option>
											<option value="CY">Cyprus</option>
											<option value="CZ">Czech Republic</option>
											<optgroup label="D"></optgroup>
											<option value="CD">Democratic Republic of the Congo</option>
											<option value="DK">Denmark</option>
											<option value="DJ">Djibouti</option>
											<option value="DM">Dominica</option>
											<option value="DO">Dominican Republic</option>
											<optgroup label="E"></optgroup>
											<option value="TL">East Timor</option>
											<option value="EC">Ecuador</option>
											<option value="EG">Egypt</option>
											<option value="SV">El Salvador</option>
											<option value="GQ">Equatorial Guinea</option>
											<option value="ER">Eritrea</option>
											<option value="EE">Estonia</option>
											<option value="ET">Ethiopia</option>
											<optgroup label="F"></optgroup>
											<option value="FK">Falkland Islands</option>
											<option value="FO">Faroe Islands</option>
											<option value="FJ">Fiji</option>
											<option value="FI">Finland</option>
											<option value="FR">France</option>
											<option value="GF">French Guiana</option>
											<option value="PF">French Polynesia</option>
											<option value="TF">French Southern Territories</option>
											<optgroup label="G"></optgroup>
											<option value="GA">Gabon</option>
											<option value="GM">Gambia</option>
											<option value="GE">Georgia</option>
											<option value="DE">Germany</option>
											<option value="GH">Ghana</option>
											<option value="GI">Gibraltar</option>
											<option value="GR">Greece</option>
											<option value="GL">Greenland</option>
											<option value="GD">Grenada</option>
											<option value="GP">Guadeloupe</option>
											<option value="GU">Guam</option>
											<option value="GT">Guatemala</option>
											<option value="GG">Guernsey</option>
											<option value="GN">Guinea</option>
											<option value="GW">Guinea-Bissau</option>
											<option value="GY">Guyana</option>
											<optgroup label="H"></optgroup>
											<option value="HT">Haiti</option>
											<option value="HN">Honduras</option>
											<option value="HK">Hong Kong</option>
											<option value="HU">Hungary</option>
											<optgroup label="I"></optgroup>
											<option value="IS">Iceland</option>
											<option value="IN">India</option>
											<option value="ID">Indonesia</option>
											<option value="IR">Iran</option>
											<option value="IQ">Iraq</option>
											<option value="IE">Ireland</option>
											<option value="IM">Isle of Man</option>
											<option value="IL">Israel</option>
											<option value="IT">Italy</option>
											<option value="CI">Ivory Coast</option>
											<optgroup label="J"></optgroup>
											<option value="JM">Jamaica</option>
											<option value="JP">Japan</option>
											<option value="JE">Jersey</option>
											<option value="JO">Jordan</option>
											<optgroup label="K"></optgroup>
											<option value="KZ">Kazakhstan</option>
											<option value="KE">Kenya</option>
											<option value="KI">Kiribati</option>
											<option value="KW">Kuwait</option>
											<option value="KG">Kyrgyzstan</option>
											<optgroup label="L"></optgroup>
											<option value="LA">Laos</option>
											<option value="LV">Latvia</option>
											<option value="LB">Lebanon</option>
											<option value="LS">Lesotho</option>
											<option value="LR">Liberia</option>
											<option value="LY">Libya</option>
											<option value="LI">Liechtenstein</option>
											<option value="LT">Lithuania</option>
											<option value="LU">Luxembourg</option>
											<optgroup label="M"></optgroup>
											<option value="MO">Macao</option>
											<option value="MK">Macedonia</option>
											<option value="MG">Madagascar</option>
											<option value="MW">Malawi</option>
											<option value="MY">Malaysia</option>
											<option value="MV">Maldives</option>
											<option value="ML">Mali</option>
											<option value="MT">Malta</option>
											<option value="MH">Marshall Islands</option>
											<option value="MQ">Martinique</option>
											<option value="MR">Mauritania</option>
											<option value="MU">Mauritius</option>
											<option value="YT">Mayotte</option>
											<option value="MX">Mexico</option>
											<option value="FM">Micronesia</option>
											<option value="MD">Moldova</option>
											<option value="MC">Monaco</option>
											<option value="MN">Mongolia</option>
											<option value="ME">Montenegro</option>
											<option value="MS">Montserrat</option>
											<option value="MA">Morocco</option>
											<option value="MZ">Mozambique</option>
											<option value="MM">Myanmar</option>
											<optgroup label="N"></optgroup>
											<option value="NA">Namibia</option>
											<option value="NP">Nepal</option>
											<option value="NL">Netherlands</option>
											<option value="AN">Netherlands Antilles</option>
											<option value="NC">New Caledonia</option>
											<option value="NZ">New Zealand</option>
											<option value="NI">Nicaragua</option>
											<option value="NE">Niger</option>
											<option value="NG">Nigeria</option>
											<option value="NU">Niue</option>
											<option value="KP">North Korea</option>
											<option value="MP">Northern Mariana Islands</option>
											<option value="NO">Norway</option>
											<optgroup label="O"></optgroup>
											<option value="OM">Oman</option>
											<optgroup label="P"></optgroup>
											<option value="PK">Pakistan</option>
											<option value="PW">Palau</option>
											<option value="PS">Palestinian Territory</option>
											<option value="PA">Panama</option>
											<option value="PG">Papua New Guinea</option>
											<option value="PY">Paraguay</option>
											<option value="PE">Peru</option>
											<option value="PH">Philippines</option>
											<option value="PL">Poland</option>
											<option value="PT">Portugal</option>
											<option value="PR">Puerto Rico</option>
											<optgroup label="Q"></optgroup>
											<option value="QA">Qatar</option>
											<optgroup label="R"></optgroup>
											<option value="CG">Republic of the Congo</option>
											<option value="RE">Reunion</option>
											<option value="RO">Romania</option>
											<option value="RU">Russia</option>
											<option value="RW">Rwanda</option>
											<optgroup label="S"></optgroup>
											<option value="BL">Saint Barthélemy</option>
											<option value="SH">Saint Helena</option>
											<option value="KN">Saint Kitts and Nevis</option>
											<option value="LC">Saint Lucia</option>
											<option value="MF">Saint Martin</option>
											<option value="PM">Saint Pierre and Miquelon</option>
											<option value="VC">Saint Vincent and the Grenadines</option>
											<option value="WS">Samoa</option>
											<option value="SM">San Marino</option>
											<option value="ST">Sao Tome and Principe</option>
											<option value="SA">Saudi Arabia</option>
											<option value="SN">Senegal</option>
											<option value="RS">Serbia</option>
											<option value="SC">Seychelles</option>
											<option value="SL">Sierra Leone</option>
											<option value="SG">Singapore</option>
											<option value="SK">Slovakia</option>
											<option value="SI">Slovenia</option>
											<option value="SB">Solomon Islands</option>
											<option value="SO">Somalia</option>
											<option value="ZA">South Africa</option>
											<option value="KR">South Korea</option>
											<option value="ES">Spain</option>
											<option value="LK">Sri Lanka</option>
											<option value="SD">Sudan</option>
											<option value="SR">Suriname</option>
											<option value="SJ">Svalbard and Jan Mayen</option>
											<option value="SZ">Swaziland</option>
											<option value="SE">Sweden</option>
											<option value="CH">Switzerland</option>
											<option value="SY">Syria</option>
											<optgroup label="T"></optgroup>
											<option value="TW">Taiwan</option>
											<option value="TJ">Tajikistan</option>
											<option value="TZ">Tanzania</option>
											<option value="TH">Thailand</option>
											<option value="TG">Togo</option>
											<option value="TO">Tonga</option>
											<option value="TT">Trinidad and Tobago</option>
											<option value="TN">Tunisia</option>
											<option value="TR">Turkey</option>
											<option value="TM">Turkmenistan</option>
											<option value="TC">Turks and Caicos Islands</option>
											<option value="TV">Tuvalu</option>
											<optgroup label="U"></optgroup>
											<option value="VI">U.S. Virgin Islands</option>
											<option value="UG">Uganda</option>
											<option value="UA">Ukraine</option>
											<option value="AE">United Arab Emirates</option>
											<option value="GB">United Kingdom</option>
											<option value="US">United States</option>
											<option value="UY">Uruguay</option>
											<option value="UZ">Uzbekistan</option>
											<optgroup label="V"></optgroup>
											<option value="VU">Vanuatu</option>
											<option value="VA">Vatican</option>
											<option value="VE">Venezuela</option>
											<option value="VN">Vietnam</option>
											<optgroup label="W"></optgroup>
											<option value="WF">Wallis and Futuna</option>
											<option value="EH">Western Sahara</option>
											<optgroup label="Y"></optgroup>
											<option value="YE">Yemen</option>
											<optgroup label="Z"></optgroup>
											<option value="ZM">Zambia</option>
											<option value="ZW">Zimbabwe</option>
										</select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-image">image</label>
										<img id="UploadedImg" src="img/profile.jpg" width="300" height="300"><br>
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-file">file</label>
										<input type="file" id="fileuri" name="fileuri" onchange="readURL(this);" class="form-control">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-introduce">Introduce</label>
										<textarea id="introduce" name="introduce" placeholder="About yourself" class="form-control"></textarea>
									</div>
									<button type="submit" class="btn">SIGN UP</button>
								</form>
							</div>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>