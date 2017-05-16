<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/stepwizard.css">

<!-- 달력 관련 CDN -->
<link rel="stylesheet" href="https://unpkg.com/flatpickr/dist/flatpickr.min.css">
<script src="https://unpkg.com/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ru.js"></script>
<link rel="stylesheet" href="css/calender.css">
<script type="text/javascript">
	$(function() {
		$("#birthday").flatpickr({

		});
	});
	
	$(function() {
		$("#file").on('change', function() {
			var ext = $(this).val().split('.').pop().toLowerCase();
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				$('input[type=file]').val('');
				alert('Please upload only image files');
			} else {
				readURL(this);
			}
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#profile').attr('src', e.target.result);
				$('#imageCheck').html(
						'<a href="javascript:fileReset();">(Delete image)</a>');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function fileReset() {
		$('#file').attr('value', '');
		$('#profile').attr('src', 'img/profile.jpg');
		$('#imageCheck').text('');
	}
		
	
	$(document).ready(function(){
		$('#userid').click(function(){
			alert("You can't change verified email");
		});
		
	});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="margin-section-top" style="margin-top: 5%"></div>
<div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">1</button>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-primary btn-circle">2</button>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">3</button>
            <p>Step 3</p>
        </div> 
    </div>
</div>
<div class="container">
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="joinProc.do" method="post" role="form" enctype="multipart/form-data">
			<h1 style="text-align: center">Sign Up&nbsp;<small>It's free and always will be.</small></h1><br>
			<div class="form-group" style="text-align: center">
				<c:choose>
					<c:when test="${ extImage.img_code != null }">
						<img id="profile" src="${extImage.img_code}" style="width: 150px; height: 150px; border-radius: 50%" onclick="document.getElementById('file').click();">				
					</c:when>
					<c:otherwise>
						<img id="profile" src="img/profile.jpg" style="width: 150px; height: 150px; border-radius: 50%" onclick="document.getElementById('file').click();">
					</c:otherwise>
				</c:choose>
				<div id="imageCheck">(Add image)</div>
			</div>
			<div class="form-group">
				<input type="file" name="file" id="file" class="form-control input-lg" style="display:none;" onchange="document.getElementById('txt').value=this.value;">
			</div>
			<div class="form-group">
				<input type="email" name="userid" id="userid" class="form-control input-lg"  style="background: white" placeholder="Email" value="${external.userid}" readonly="readonly">
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="First Name" value="${external.firstName}">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="lastName" id="lastName" class="form-control input-lg" placeholder="Last Name" value="${external.lastName}">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="pwd" id="pwd" class="form-control input-lg" placeholder="Password" maxlength="20">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="pwdChk" id="pwdChk" class="form-control input-lg" placeholder="Confirm Password" maxlength="20">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="birthday" id="birthday" class="form-control input-lg"  style="background: white" placeholder="Birthday">
			</div>
			<div class="form-group">
				<select name="gender" id="gender" class="form-control input-lg">
					<option value="">Male or Female</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</div>
			<div class="form-group">
						<select name="country" id="country" class="form-control input-lg">
							<option value="">Country</option>
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
							<option value="BL">Saint Barthelemy</option>
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
				<textarea class="form-control input-lg" name="introduce" placeholder="(Option) About yourself"></textarea>
			</div>
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<input type="checkbox" id="agree"> I Agree</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 By clicking <strong class="label label-primary" style="background: #FF605A">Submit</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-md-6">
				<div class="form-group">
				<input type="submit" value="SUBMIT" class="btn btn-primary btn-block btn-lg"></div>
				</div>
				<div class="col-xs-12 col-md-6">
				<div class="form-group">
				<button type="button" class="btn btn-primary btn-block btn-lg" onclick="location.href='main.do'">CANCEL</button></div>
				</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
			</div>
			<div class="modal-body">
				<p>
				Determine if you have the need for terms and conditions. If you are going to offer a service and that service will be available to a large number of people, you should consider drafting and implementing a series of terms and conditions. Some of the most common services people and companies offer that lend themselves well to terms and conditions include websites and mobile phone apps. These types of services are also available to the public at-large, which makes the use of terms and conditions particularly useful. If the service you are offering will not be available to a large number of people (e.g., consulting or other types of employment type relationships), consider using a more traditional and individualistic contract instead of terms and conditions.
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">AGREE</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<div class="margin-section-bottom" style="margin-bottom: 10%"></div>
</body>
</html>