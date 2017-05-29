<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/review.css">

<!-- 섬머노트 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var cnt = 0;
	$('#fileAdd').click(function(){
		var div = document.getElementById('preDiv');
		$('#container').append( $(div).html() );
		$('.file').each(function(index){
			$(this).attr('id', 'idtest'+index);
			$(this).attr('name','file');
		});
		$('.inputLabel').each(function(index) {
			$(this).attr('for', 'idtest'+index);
		})
		$('.inputImage').each(function(index){
			$(this).attr('id', 'inputImage'+index);
			if($(this).attr('id') > cnt)
				$(this).attr('src', 'img/review/noimage.png');
		})
		cnt++;
	})
	
	$(document).ready(function() {
      $('.summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
         }
        }
      });
    });
});

function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: 'imageWrite.do',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(data) {
        $('.summernote').summernote('insertImage', 'imageView.do?img_idx='+data.img_idx);
      }
    });
}

function readURL(input) {
// 	alert($(input).attr('id'));
	var id = $(input).attr('id');
	var num = id.substring(6);
	
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#image' + id).attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
		
	}
}

function read(input) {
// 	alert($(input).attr('id'));
	var id = $(input).attr('id');
	var num = id.substring(6);
	
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#inputImage' + num).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
	function hidden(){
		
	}
}
</script>
</head>
<body>
	<div class="container">
		<div>
			<h3>후기게시판</h3>
		</div>
		<div class="row">
			<form action="reviewUpdate.do" method="post" enctype="multipart/form-data">
				<div class="col-md-12">
					<h2>게시글을 수정하시오</h2>
					<div class="form-group">
						<label class="control-label ">TITLE:</label> 
						<input class="form-control" name="title" value="${review.title }" type="text">
					</div>
					<div class="form-group">
						<label class="control-label">CATEGORY:</label>
						<div class="ui-select">
							<select name="subCategory" id="review_category" class="form-control">
								<option value="select">select</option>
								<option value="food" id="food">food</option>
								<option value="shopping" id="shopping">shopping</option>
								<option value="stay" id="stay">stay</option>
								<option value="tour" id="tour">tour</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">CONTENT:</label>
						<textarea  name="contents" class="summernote" rows="10" style="resize: none;">${contents.contents }</textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="modify" class="btn btn-primary">
						<input type="reset" value="reset" class="btn btn-primary">
						<input type="button" value="list" class="btn btn-primary"
							onclick="location.href='reviewList.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>