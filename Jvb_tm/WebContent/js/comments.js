/**
 * 
 */
function inputCommentEven(){
	if( $('#cm_content').val() == null || $('#cm_content').val() == "" ){
		alert('Please enter the comments');
		return false;
	}
	else{
		return true;		
	}
}

function updateCommentEven(){
	if( $('#cm_update_content').val() == null || $('#cm_update_content').val() == "" ){
		alert('Please enter the comments');
		return false;
	}
	else{
		return true;		
	}
}



function commentsInput(cm_idx, cm_parent, cm_writer, cm_depth){
	hideDiv("updateComments");
	var form  = document.reForm;
	var div = document.getElementById("commentsDiv"+cm_idx);
	var div2 = document.getElementById("reComments");
	div2.style.display="";
	
	form.cm_content.value = "";
	form.parent_cm.value=cm_writer;
	form.cm_parent.value=cm_parent;
	form.cm_depth.value=cm_depth;
	div.appendChild(div2);
}

//	창사라지기
function hideDiv(id){
    var div = document.getElementById(id);
    div.style.display = "none";
    document.body.appendChild(div);
}
function commentsCancel(){
    hideDiv("reComments");
} 

//	댓글 수정
function commentsUpdate(cm_idx){
	hideDiv("reComments");
	
	var form  = document.updateForm;
	var div = document.getElementById("commentsDiv"+cm_idx);
	var div2 = document.getElementById("updateComments");
	div2.style.display="";
	
	form.cm_idx.value = cm_idx;
	form.cm_content.value = "";
	div.appendChild(div2);
}
function commentsUpdateCancel(){
	hideDiv("updateComments");
}