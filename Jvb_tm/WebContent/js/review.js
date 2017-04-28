/**
 * 
 */


$(function() {
	var divs = document.getElementsByClassName('imgDiv');
	for (var i = 0; i < divs.length; ++i) {
		var div = divs[i];
		var divAspect = div.offsetHeight / div.offsetWidth;
		div.style.overflow = 'hidden';

		var img = div.querySelector('img');
		var imgAspect = img.height / img.width;

		if (imgAspect <= divAspect) {
			// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
			var imgWidthActual = div.offsetHeight / imgAspect;
			var imgWidthToBe = div.offsetHeight / divAspect;
			var marginLeft = (imgWidthActual - imgWidthToBe) / 2;

			img.style.cssText = 'width: auto; height: 100%; margin-left: '
				+ marginLeft + 'px;';
		} else {
			// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
			img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		}
	}

});

// 이미지 파일 추가 함수
$(document).ready(function() {
	$('.label').on('click', function() {
		var id = $(this).attr('id');
		var num = id.substring(5);

		readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img' + num).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	});
});