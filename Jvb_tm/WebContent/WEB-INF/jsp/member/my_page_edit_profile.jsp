<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--   커스텀 스크립트 -->
<script src="js/profile.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="css/review.css">

<title>Travel Maker</title>

<script type="text/javascript">



</script>

</head>
<body>

	<div class="tab-pane fade in" id="tab2">
		<div class="container">
			<h1 class="page-header">Edit Profile</h1>
			<div class="row">
				<!-- left column -->
				<form class="form-horizontal" role="form" action="updateMember.do"
					method="POST" enctype="multipart/form-data">
					<div class="row text-center col-md-4 col-sm-6 col-xs-12">
						<div class="text-center">
							<!--                               <img src="http://lorempixel.com/200/200/people/9/" -->
							<!--                                  class="avatar img-circle img-thumbnail" alt="avatar"> -->
							<c:if test="${userImage.img_idx==null }">
								<img src="img/profile/user.png"
									class="avatar img-circle img-thumbnail profile_img"
									alt="avatar">
							</c:if>
							<c:if test="${userImage.img_idx!=null }">
								<img src="imageProfileView.do?img_code=${userid }"
									id="img_change"
									class="avatar img-circle img-thumbnail profile_img"
									alt="avatar">
							</c:if>
							<h6>Upload a different photo...</h6>
						</div>
						<div class="text-center filebox">
							<label for="idtestfirst" id="label" class="label">choose
								file</label> <input type="file" id="idtestfirst" name="file"
								class="ex_file" onchange="readURL(this)">
						</div>
					</div>
					<!-- edit form column -->
					<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
						<!--                            <div class="alert alert-info alert-dismissable"> -->
						<!--                               <a class="panel-close close" data-dismiss="alert">×</a> <i -->
						<!--                                  class="fa fa-coffee"></i> This is an <strong>.alert</strong>. -->
						<!--                               Use this to show important messages to the user. -->
						<!--                            </div> -->
						<h3>Personal info</h3>

						<div class="form-group">
							<label class="col-lg-3 control-label">First name:</label>
							<div class="col-lg-8">
								<input class="form-control" value="${member.firstName}"
									name="firstName" id="firstName" type="text"> <span
									id="fname_msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Last name:</label>
							<div class="col-lg-8">
								<input class="form-control" value="${member.lastName }"
									name="lastName" id="lastName" type="text"> <span
									id="lname_msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Contury:</label>
							<div class="col-lg-8">
								<div class="ui-select">
									<select id="user_time_zone" class="form-control" name="country">
										<option value="country">Country *</option>
										<option selected="${member.country }">${member.country }</option>
										<optgroup label="A"></optgroup>
										<option value="Afghanistan">Afghanistan</option>
										<option value="Albania">Albania</option>
										<option value="Algeria">Algeria</option>
										<option value="American Samoa">American Samoa</option>
										<option value="Andorra">Andorra</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antigua and Barbuda">Antigua and
											Barbuda</option>
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
										<option value="Bosnia and Herzegovina">Bosnia and
											Herzegovina</option>
										<option value="BW">Botswana</option>
										<option value="Brazil">Brazil</option>
										<option value="British Virgin Islands">British Virgin
											Islands</option>
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
										<option value="Central African Republic">Central
											African Republic</option>
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
										<option value="Democratic Republic of the Congo">Democratic
											Republic of the Congo</option>
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
										<option value="French Southern Territories">French
											Southern Territories</option>
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
										<option value="Netherlands Antilles">Netherlands
											Antilles</option>
										<option value="New Caledonia">New Caledonia</option>
										<option value="New Zealand">New Zealand</option>
										<option value="Nicaragua">Nicaragua</option>
										<option value="Niger">Niger</option>
										<option value="Nigeria">Nigeria</option>
										<option value="Niue">Niue</option>
										<option value="North Korea">North Korea</option>
										<option value="Northern Mariana Islands">Northern
											Mariana Islands</option>
										<option value="Norway">Norway</option>
										<optgroup label="O"></optgroup>
										<option value="Oman">Oman</option>
										<optgroup label="P"></optgroup>
										<option value="Pakistan">Pakistan</option>
										<option value="Palau">Palau</option>
										<option value="Palestinian Territory">Palestinian
											Territory</option>
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
										<option value="Republic of the Congo">Republic of the
											Congo</option>
										<option value="Reunion">Reunion</option>
										<option value="Romania">Romania</option>
										<option value="Russia">Russia</option>
										<option value="Rwanda">Rwanda</option>
										<optgroup label="S"></optgroup>
										<option value="Saint Barthelemy">Saint Barthelemy</option>
										<option value="Saint Helena">Saint Helena</option>
										<option value="Saint Kitts and Nevis">Saint Kitts and
											Nevis</option>
										<option value="Saint Lucia">Saint Lucia</option>
										<option value="Saint Martin">Saint Martin</option>
										<option value="Saint Pierre and Miquelon">Saint
											Pierre and Miquelon</option>
										<option value="Saint Vincent and the Grenadines">Saint
											Vincent and the Grenadines</option>
										<option value="Samoa">Samoa</option>
										<option value="San Marino">San Marino</option>
										<option value="Sao Tome and Principe">Sao Tome and
											Principe</option>
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
										<option value="Svalbard and Jan Mayen">Svalbard and
											Jan Mayen</option>
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
										<option value="Trinidad and Tobago">Trinidad and
											Tobago</option>
										<option value="Tunisia">Tunisia</option>
										<option value="Turkey">Turkey</option>
										<option value="Turkmenistan">Turkmenistan</option>
										<option value="Turks and Caicos Islands">Turks and
											Caicos Islands</option>
										<option value="Tuvalu">Tuvalu</option>
										<optgroup label="U"></optgroup>
										<option value="U.S. Virgin Islands">U.S. Virgin
											Islands</option>
										<option value="Uganda">Uganda</option>
										<option value="Ukraine">Ukraine</option>
										<option value="United Arab Emirates">United Arab
											Emirates</option>
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
								<span id="country_msg"></span>
							</div>
						</div>
						<!--                               <div class="form-group"> -->
						<!--                                  <label class="col-lg-3 control-label">Email:</label> -->
						<!--                                  <div class="col-lg-8"> -->
						<%--                                     <input class="form-control" value="${member.email }" --%>
						<!--                                        type="text"> -->
						<!--                                  </div> -->
						<!--                               </div> -->
						<div class="form-group">
							<label class="col-md-3 control-label">Username:</label>
							<div class="col-md-8">
								<pre class="form-control">${member.userid }</pre>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">introduce:</label>
							<div class="col-md-8">
								<input class="form-control" value="${member.introduce }"
									name="introduce" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Password:</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="Password"
									type="password" name="pwd" id="pwd"
									onfocus="this.value='';return true;"> <span
									id="pwd_msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Confirm password:</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="Confirm Password"
									type="password" id="pwdChk"
									onfocus="this.value='';return true;"> <span
									id="pwd_msg"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-8">
								<input type="submit" class="btn btn-primary change_profile_btn"
									value="Save Changes" id="change_profile_btn"> <span></span>
								<input class="btn btn-default" value="Cancel" type="reset">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>