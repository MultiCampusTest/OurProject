<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--   커스텀 스크립트 -->
<script src="js/profile.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="css/review.css">

</head>
<body>
	<div class="well">
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tab1">
				<div class="container">
					<h1 class="page-header">Your Profile</h1>
					<div class="row">
						<!-- left column -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="text-center">
								<c:if test="${userImage.img_idx==null }">
									<img src="img/profile/user.png"
										class="avatar img-circle img-thumbnail profile_img"
										alt="avatar">
								</c:if>
								<c:if test="${userImage.img_idx!=null }">
									<img src="imageProfileView.do?img_code=${userid }"
										class="avatar img-circle img-thumbnail profile_img"
										alt="avatar">
								</c:if>
								<h3>${member.userid }</h3>
							</div>
						</div>

						<!-- right column -->
						<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
							<h3>Personal info</h3>
							<form class="form-horizontal" role="form" action="#">
								<div class="form-group">
									<label class="col-lg-3 control-label">First name:</label>
									<div class="col-lg-8">
										<pre class="form-control">${member.firstName}</pre>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Last name:</label>
									<div class="col-lg-8">
										<pre class="form-control">${member.lastName }</pre>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Contury:</label>
									<div class="col-lg-8">
										<pre class="form-control">${member.country}</pre>
									</div>
								</div>
								<!--                               <div class="form-group"> -->
								<!--                                  <label class="col-lg-3 control-label">Email:</label> -->
								<!--                                  <div class="col-lg-8"> -->
								<%--                                     <pre class="form-control">${member.email }</pre> --%>
								<!--                                  </div> -->
								<!--                               </div> -->
								<div class="form-group">
									<label class="col-lg-3 control-label">Birth:</label>
									<div class="col-lg-8">
										<pre class="form-control">${member.birthday }</pre>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Username:</label>
									<div class="col-md-8">
										<pre class="form-control">${member.userid }</pre>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">introduce:</label>
									<div class="col-md-8">
										<pre class="form-control">${member.introduce }</pre>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label"></label>
									<div class="col-md-8">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal">unsubscribe</button>
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog modal-sm">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Delete your account</h4>
													</div>
													<div class="modal-body">
														<p>
														<div class="form-group">
															<!--          						 								<form action="removeMember.do"> -->
															<p style="text-align: center">To delete your account,
																enter password.
															<p>
																<input type="hidden" class="form-control input-lg"
																	id="mypage_userid" name="userid" value="${userid}">
																<input type="password" class="form-control input-lg"
																	name="pwd" id="mypage_pwd">
															<div id="mypage_pwd_msg"></div>
														</div>
														</p>
													</div>
													<div class="modal-footer">
														<button type="button" id="deleteBtn"
															class="btn btn-primary" data-dismiss="modal">Confirm</button>
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">Cancel</button>
														<!-- 																</form> -->
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>