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
<!--   커스텀 스크립트 -->
  <script src="js/profile.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">

<title>Travel Maker</title>
</head>
<body>
<div class="col-lg-12 col-sm-12">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="img/header.jpg">
        </div>
        <div class="useravatar">
            <img alt="" src="img/header.jpg">
        </div>
        <div class="card-info"> <span class="card-title">이 름</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="myPage" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">내 정보</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="update" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                <div class="hidden-xs">정보 수정</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="message" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                <div class="hidden-xs">메시지함</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="matching" class="btn btn-default" href="#tab4" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">매칭</div>
            </button>
        </div>
    </div>

    <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
          <div class="container" style="padding-top: 60px;">
			  <h1 class="page-header">Your Profile</h1>
			  <div class="row">
			    <!-- left column -->
			    <div class="col-md-4 col-sm-6 col-xs-12">
			      <div class="text-center">
			        <img src="http://lorempixel.com/200/200/people/9/" class="avatar img-circle img-thumbnail" alt="avatar">
			        <h3>Your Name</h3>
			      </div>
			    </div>
			    <!-- right column -->
			    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
			      <h3>Personal info</h3>
			      <form class="form-horizontal" role="form">
			        <div class="form-group">
			          <label class="col-lg-3 control-label">First name:</label>
			          <div class="col-lg-8">
			            <pre class="form-control">your first name</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Last name:</label>
			          <div class="col-lg-8">
			            <pre class="form-control">your last name</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Contury:</label>
			          <div class="col-lg-8">
			            <pre class="form-control">your contury</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Email:</label>
			          <div class="col-lg-8">
			            <pre class="form-control">your email</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Birth:</label>
			          <div class="col-lg-8">
					  	<pre class="form-control">your birth</pre> 						
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">Username:</label>
			          <div class="col-md-8">
			            <pre class="form-control">your username</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">introduce:</label>
			          <div class="col-md-8">
			            <pre class="form-control">yout introduce </pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label"></label>
			          <div class="col-md-8">
			            <input class="btn btn-primary" value="회원 탈퇴 " type="button">
			            <span></span>
			          </div>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>
        </div>
        <div class="tab-pane fade in" id="tab2">
   			<div class="container" style="padding-top: 60px;">
			  <h1 class="page-header">Edit Profile</h1>
			  <div class="row">
			    <!-- left column -->
			    <div class="col-md-4 col-sm-6 col-xs-12">
			      <div class="text-center">
			        <img src="http://lorempixel.com/200/200/people/9/" class="avatar img-circle img-thumbnail" alt="avatar">
			        <h6>Upload a different photo...</h6>
			        <input type="file" class="text-center center-block well well-sm">
			      </div>
			    </div>
			    <!-- edit form column -->
			    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
			      <div class="alert alert-info alert-dismissable">
			        <a class="panel-close close" data-dismiss="alert">×</a> 
			        <i class="fa fa-coffee"></i>
			        This is an <strong>.alert</strong>. Use this to show important messages to the user.
			      </div>
			      <h3>Personal info</h3>
			      <form class="form-horizontal" role="form">
			        <div class="form-group">
			          <label class="col-lg-3 control-label">First name:</label>
			          <div class="col-lg-8">
			            <input class="form-control" value="Jane" type="text">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Last name:</label>
			          <div class="col-lg-8">
			            <input class="form-control" value="Bishop" type="text">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Contury:</label>
			          <div class="col-lg-8">
			            <div class="ui-select">
			              <select id="user_time_zone" class="form-control">
			                <option value="Hawaii">(GMT-10:00) Hawaii</option>
			                <option value="Alaska">(GMT-09:00) Alaska</option>
			                <option value="Pacific Time (US & Canada)">(GMT-08:00) Pacific Time (US & Canada)</option>
			                <option value="Arizona">(GMT-07:00) Arizona</option>
			                <option value="Mountain Time (US & Canada)">(GMT-07:00) Mountain Time (US & Canada)</option>
			                <option value="Central Time (US & Canada)" selected="selected">(GMT-06:00) Central Time (US & Canada)</option>
			                <option value="Eastern Time (US & Canada)">(GMT-05:00) Eastern Time (US & Canada)</option>
			                <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
			              </select>
			            </div>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Email:</label>
			          <div class="col-lg-8">
			            <input class="form-control" value="janesemail@gmail.com" type="text">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">Username:</label>
			          <div class="col-md-8">
			            <pre class="form-control">your username</pre>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">introduce:</label>
			          <div class="col-md-8">
			            <input class="form-control" value="inroduce" type="text">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">Password:</label>
			          <div class="col-md-8">
			            <input class="form-control" value="11111122333" type="password">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label">Confirm password:</label>
			          <div class="col-md-8">
			            <input class="form-control" value="11111122333" type="password">
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-md-3 control-label"></label>
			          <div class="col-md-8">
			            <input class="btn btn-primary" value="Save Changes" type="button">
			            <span></span>
			            <input class="btn btn-default" value="Cancel" type="reset">
			          </div>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>
        </div>
        <div class="tab-pane fade in" id="tab3">
          <h3>This is tab 3</h3>
        </div>
        <div class="tab-pane fade in" id="tab4">
          <h3>This is tab 4</h3>
        </div>
      </div>
    </div>
</div>
</body>
</html>