<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- step 스타일 -->
<link rel="stylesheet" href="css/stepwizard.css">
<!-- 달력 관련 CDN -->
<link rel="stylesheet" href="https://unpkg.com/flatpickr/dist/flatpickr.min.css">
<script src="https://unpkg.com/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ru.js"></script>
<link rel="stylesheet" href="css/calender.css">
<!-- 예외처리 -->
<script type="text/javascript" src="js/joinException.js"></script>
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
			<h1 style="text-align: center">Sign Up</h1><br>
			<div class="form-group" style="text-align: center">
				<c:choose>
					<c:when test="${ extImage.img_code != null }">
						<a href="javascript:document.getElementById('file').click();"><img id="profile" src="${extImage.img_code}" style="width: 150px; height: 150px; border-radius: 50%"></a>				
					</c:when>
					<c:otherwise>
						<a href="javascript:document.getElementById('file').click();"><img id="profile" src="img/profile.jpg" style="width: 150px; height: 150px; border-radius: 50%"></a>
					</c:otherwise>
				</c:choose>
				<div id="imageCheck"><a href="javascript:fileReset();">(Delete image)</a></div>
			</div>
			<div class="form-group">
				<input type="file" name="file" id="file" class="form-control input-lg" style="display:none;" onchange="document.getElementById('txt').value=this.value;">
			</div>
			<div class="form-group" style="text-align: center">
				<input type="hidden" id="img_code" name="img_code" value="${extImage.img_code}">
			</div>
			<br>
			<div class="form-group">
				<div style="color: #FF605A; font-size: 20px; font-style: bold; float: left">Basic Info</div>
				<div style="color: red; float: right">* required fields</div>
			</div>
			<div class="form-group">
				<input type="text" name="userid" class="form-control input-lg"  style="background: white" placeholder="Email *" value="${external.userid}" readonly="readonly">
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="First Name *" value="${external.firstName}">
					</div>
					<div class="form-group">
						<div id="fname_msg" style="text-align: center"></div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="lastName" id="lastName" class="form-control input-lg" placeholder="Last Name *" value="${external.lastName}">
					</div>
					<div class="form-group">
						<div id="lname_msg" style="text-align: center"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="pwd" id="pwd" class="form-control input-lg" placeholder="Password *" maxlength="20">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="pwdChk" id="pwdChk" class="form-control input-lg" placeholder="Confirm Password *" maxlength="20">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div id="pwd_msg" style="text-align: center"></div>			
			</div>
			<div class="form-group">
				<div style="color: #FF605A; font-size: 20px; font-style: bold; float: left">Additional Info</div>
			</div>
			<div class="form-group">
				<input type="text" name="birthday" id="birthday" class="form-control input-lg"  style="background: white" placeholder="Birthday *">
			</div>
			<div class="form-group">
				<div id="birthday_msg" style="text-align: center"></div>			
			</div>
			<div class="form-group">
				<select name="gender" id="gender" class="form-control input-lg">
					<option value="list">Gender *</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</div>
			<div class="form-group">
				<div id="gender_msg" style="text-align: center"></div>			
			</div>
			<div class="form-group">
						<select name="country" id="country" class="form-control input-lg">
							<option value="list">Country *</option>
							<optgroup label="A"></optgroup>
							<option value="Afghanistan">Afghanistan</option>
							<option value="Albania">Albania</option>
							<option value="Algeria">Algeria</option>
							<option value="American Samoa">American Samoa</option>
							<option value="Andorra">Andorra</option>
							<option value="Angola">Angola</option>
							<option value="Anguilla">Anguilla</option>
							<option value="Antigua and Barbuda">Antigua and Barbuda</option>
							<option value="Argentina">Argentina</option>
							<option value="Armenia">Armenia</option>
							<option value="Aruba">Aruba</option>
							<option value="Australia">Australia</option>
							<option value="Austria">Austria</option>
							<option value="Azerbaijan">Azerbaijan</option>
							<optgroup label="B"></optgroup>
							<option value="Bahamas">Bahamas</option>
							<option value="Bahrain">Bahrain</option>
							<option value="Bangladesh">Bangladesh</option>
							<option value="Barbados">Barbados</option>
							<option value="Belarus">Belarus</option>
							<option value="Belgium">Belgium</option>
							<option value="Belize">Belize</option>
							<option value="Benin">Benin</option>
							<option value="Bermuda">Bermuda</option>
							<option value="Bhutan">Bhutan</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
							<option value="BW">Botswana</option>
							<option value="Brazil">Brazil</option>
							<option value="British Virgin Islands">British Virgin Islands</option>
							<option value="Brunei">Brunei</option>
							<option value="Bulgaria">Bulgaria</option>
							<option value="Burking Faso">Burkina Faso</option>
							<option value="Burundi">Burundi</option>
							<optgroup label="C"></optgroup>
							<option value="Cambodia">Cambodia</option>
							<option value="Cameroon">Cameroon</option>
							<option value="Canada">Canada</option>
							<option value="Cape Verde">Cape Verde</option>
							<option value="Cayman Islands">Cayman Islands</option>
							<option value="Central African Republic">Central African Republic</option>
							<option value="Chad">Chad</option>
							<option value="Chile">Chile</option>
							<option value="China">China</option>
							<option value="Cocos">Cocos Islands</option>
							<option value="Colombia">Colombia</option>
							<option value="Comoros">Comoros</option>
							<option value="Cook Islands">Cook Islands</option>
							<option value="Costa Rica">Costa Rica</option>
							<option value="Croatia">Croatia</option>
							<option value="Cuba">Cuba</option>
							<option value="Cyprus">Cyprus</option>
							<option value="Czech Republic">Czech Republic</option>
							<optgroup label="D"></optgroup>
							<option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
							<option value="Denmark">Denmark</option>
							<option value="Djibouti">Djibouti</option>
							<option value="Dominica">Dominica</option>
							<option value="Dominican Republic">Dominican Republic</option>
							<optgroup label="E"></optgroup>
							<option value="East Timor">East Timor</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Egypt">Egypt</option>
							<option value="El Salvador">El Salvador</option>
							<option value="Equatorial Guinea">Equatorial Guinea</option>
							<option value="Eritrea">Eritrea</option>
							<option value="Estonia">Estonia</option>
							<option value="Ethiopia">Ethiopia</option>
							<optgroup label="F"></optgroup>
							<option value="Falkland Islands">Falkland Islands</option>
							<option value="Faroe Islands">Faroe Islands</option>
							<option value="Fiji">Fiji</option>
							<option value="Finland">Finland</option>
							<option value="France">France</option>
							<option value="French Guiana">French Guiana</option>
							<option value="French Polynesia">French Polynesia</option>
							<option value="French Southern Territories">French Southern Territories</option>
							<optgroup label="G"></optgroup>
							<option value="Gabon">Gabon</option>
							<option value="Gambia">Gambia</option>
							<option value="Georgia">Georgia</option>
							<option value="Germany">Germany</option>
							<option value="Ghana">Ghana</option>
							<option value="Gibraltar">Gibraltar</option>
							<option value="Greece">Greece</option>
							<option value="Greenland">Greenland</option>
							<option value="Grenada">Grenada</option>
							<option value="Guadeloupe">Guadeloupe</option>
							<option value="Guam">Guam</option>
							<option value="Guatemala">Guatemala</option>
							<option value="Guernsey">Guernsey</option>
							<option value="Guinea">Guinea</option>
							<option value="Guinea-Bissau">Guinea-Bissau</option>
							<option value="Guyana">Guyana</option>
							<optgroup label="H"></optgroup>
							<option value="Haiti">Haiti</option>
							<option value="Honduras">Honduras</option>
							<option value="Hong Kong">Hong Kong</option>
							<option value="Hungary">Hungary</option>
							<optgroup label="I"></optgroup>
							<option value="Iceland">Iceland</option>
							<option value="India">India</option>
							<option value="Indonesia">Indonesia</option>
							<option value="Iran">Iran</option>
							<option value="Iraq">Iraq</option>
							<option value="Ireland">Ireland</option>
							<option value="Isle of Man">Isle of Man</option>
							<option value="Israel">Israel</option>
							<option value="Italy">Italy</option>
							<option value="Ivory Coast">Ivory Coast</option>
							<optgroup label="J"></optgroup>
							<option value="Jamaica">Jamaica</option>
							<option value="Japan">Japan</option>
							<option value="Jersey">Jersey</option>
							<option value="Jordan">Jordan</option>
							<optgroup label="K"></optgroup>
							<option value="Kazakhstan">Kazakhstan</option>
							<option value="Kenya">Kenya</option>
							<option value="Kiribati">Kiribati</option>
							<option value="Kuwait">Kuwait</option>
							<option value="Kyrgyzstan">Kyrgyzstan</option>
							<optgroup label="L"></optgroup>
							<option value="Laos">Laos</option>
							<option value="Latvia">Latvia</option>
							<option value="Lebanon">Lebanon</option>
							<option value="Lesotho">Lesotho</option>
							<option value="Liberia">Liberia</option>
							<option value="Libya">Libya</option>
							<option value="Liechtenstein">Liechtenstein</option>
							<option value="Lithuania">Lithuania</option>
							<option value="Luxembourg">Luxembourg</option>
							<optgroup label="M"></optgroup>
							<option value="Macao">Macao</option>
							<option value="Macedonia">Macedonia</option>
							<option value="Madagascar">Madagascar</option>
							<option value="Malawi">Malawi</option>
							<option value="Malaysia">Malaysia</option>
							<option value="Maldives">Maldives</option>
							<option value="Mali">Mali</option>
							<option value="Malta">Malta</option>
							<option value="Marshall Islands">Marshall Islands</option>
							<option value="Martinique">Martinique</option>
							<option value="Mauritania">Mauritania</option>
							<option value="Mauritius">Mauritius</option>
							<option value="Mayotte">Mayotte</option>
							<option value="Mexico">Mexico</option>
							<option value="Micronesia">Micronesia</option>
							<option value="Moldova">Moldova</option>
							<option value="Monaco">Monaco</option>
							<option value="Mogolia">Mongolia</option>
							<option value="Montenegro">Montenegro</option>
							<option value="Montserrat">Montserrat</option>
							<option value="Morocco">Morocco</option>
							<option value="Mozambique">Mozambique</option>
							<option value="Myanmar">Myanmar</option>
							<optgroup label="N"></optgroup>
							<option value="Namibia">Namibia</option>
							<option value="Nepal">Nepal</option>
							<option value="Netherlands">Netherlands</option>
							<option value="Netherlands Antilles">Netherlands Antilles</option>
							<option value="New Caledonia">New Caledonia</option>
							<option value="New Zealand">New Zealand</option>
							<option value="Nicaragua">Nicaragua</option>
							<option value="Niger">Niger</option>
							<option value="Nigeria">Nigeria</option>
							<option value="Niue">Niue</option>
							<option value="North Korea">North Korea</option>
							<option value="Northern Mariana Islands">Northern Mariana Islands</option>
							<option value="Norway">Norway</option>
							<optgroup label="O"></optgroup>
							<option value="Oman">Oman</option>
							<optgroup label="P"></optgroup>
							<option value="Pakistan">Pakistan</option>
							<option value="Palau">Palau</option>
							<option value="Palestinian Territory">Palestinian Territory</option>
							<option value="Panama">Panama</option>
							<option value="Papua New Guinea">Papua New Guinea</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Peru">Peru</option>
							<option value="Philippines">Philippines</option>
							<option value="Poland">Poland</option>
							<option value="Portugal">Portugal</option>
							<option value="Puerto Rico">Puerto Rico</option>
							<optgroup label="Q"></optgroup>
							<option value="Qatar">Qatar</option>
							<optgroup label="R"></optgroup>
							<option value="Republic of the Congo">Republic of the Congo</option>
							<option value="Reunion">Reunion</option>
							<option value="Romania">Romania</option>
							<option value="Russia">Russia</option>
							<option value="Rwanda">Rwanda</option>
							<optgroup label="S"></optgroup>
							<option value="Saint Barthelemy">Saint Barthelemy</option>
							<option value="Saint Helena">Saint Helena</option>
							<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
							<option value="Saint Lucia">Saint Lucia</option>
							<option value="Saint Martin">Saint Martin</option>
							<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
							<option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
							<option value="Samoa">Samoa</option>
							<option value="San Marino">San Marino</option>
							<option value="Sao Tome and Principe">Sao Tome and Principe</option>
							<option value="Saudi Arabia">Saudi Arabia</option>
							<option value="Senegal">Senegal</option>
							<option value="Serbia">Serbia</option>
							<option value="Seychelles">Seychelles</option>
							<option value="Sierra Leone">Sierra Leone</option>
							<option value="Singapore">Singapore</option>
							<option value="Slovakia">Slovakia</option>
							<option value="Slovenia">Slovenia</option>
							<option value="Solomon Islands">Solomon Islands</option>
							<option value="Somaila">Somalia</option>
							<option value="South Africa">South Africa</option>
							<option value="South Korea♥">South Korea♥</option>
							<option value="Spain">Spain</option>
							<option value="Sri Lanka">Sri Lanka</option>
							<option value="Sudan">Sudan</option>
							<option value="Suriname">Suriname</option>
							<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
							<option value="Swaziland">Swaziland</option>
							<option value="Sweden">Sweden</option>
							<option value="Switzerland">Switzerland</option>
							<option value="Syria">Syria</option>
							<optgroup label="T"></optgroup>
							<option value="Taiwan">Taiwan</option>
							<option value="Tajikistan">Tajikistan</option>
							<option value="Tanzania">Tanzania</option>
							<option value="Thiland">Thailand</option>
							<option value="Togo">Togo</option>
							<option value="Tonga">Tonga</option>
							<option value="Trinidad and Tobago">Trinidad and Tobago</option>
							<option value="Tunisia">Tunisia</option>
							<option value="Turkey">Turkey</option>
							<option value="Turkmenistan">Turkmenistan</option>
							<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
							<option value="Tuvalu">Tuvalu</option>
							<optgroup label="U"></optgroup>
							<option value="U.S. Virgin Islands">U.S. Virgin Islands</option>
							<option value="Uganda">Uganda</option>
							<option value="Ukraine">Ukraine</option>
							<option value="United Arab Emirates">United Arab Emirates</option>
							<option value="United Kingdom">United Kingdom</option>
							<option value="United States">United States</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Uzbekistan">Uzbekistan</option>
							<optgroup label="V"></optgroup>
							<option value="Vanuatu">Vanuatu</option>
							<option value="Vatican">Vatican</option>
							<option value="Venezuela">Venezuela</option>
							<option value="Vietnam">Vietnam</option>
							<optgroup label="W"></optgroup>
							<option value="Wallis and Futuna">Wallis and Futuna</option>
							<option value="western Sahara">Western Sahara</option>
							<optgroup label="Y"></optgroup>
							<option value="Yemen">Yemen</option>
							<optgroup label="Z"></optgroup>
							<option value="Zambia">Zambia</option>
							<option value="Zimbabwe">Zimbabwe</option>
						</select>
					</div>
				<div class="form-group">
					<div id="country_msg" style="text-align: center"></div>			
				</div>
			<div class="form-group">
				<textarea class="form-control input-lg" name="introduce" placeholder="Introduce"></textarea>
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
			</div><br>
			
			<div class="row">
				<div class="col-xs-12 col-md-6">
				<div class="form-group">
				<input type="submit" id="join_submit" value="SUBMIT" class="btn btn-primary btn-block btn-lg"></div>
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