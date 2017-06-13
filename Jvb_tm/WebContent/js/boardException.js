/**
 * 
 */
function guideBoardCheck(){
	 
	 if(document.frm.title.value.length==0){
		 alert("Please enter the title");
		 document.frm.title.focus();
		 return false;
	 }
	 
	 if(document.frm.startDate.value.length==0){
		 alert("Please enter your travel dates");
		 document.frm.startDate.focus();
		 return false;
	 }
	 
	 if(document.frm.locCategory.value==''){
		 alert("Please choose a category");
		 document.frm.locCategory.focus();
		 return false;
	 }
	 
	 if(latLng.length==0){
		 alert("Please specify one or more locations");
		 $('#pac-input').focus();
		 return false;
	 }
	 
	 if(document.frm.contents.value.length==0){
		 alert("Please enter content");
		 document.frm.contents.focus();
		 return false;
	 }
	 
	 
	 return true;
 }
 
 
function travelBoardCheck(){
	 
	var result = true;
	
	
	 if(document.frm.title.value.length==0){
		 alert("Please enter the title");
		 document.frm.title.focus();
		 return false;
	 }
	 
	 if(document.frm.startDate.value.length==0){
		 alert("Please enter your travel dates");
		 document.frm.startDate.focus();
		 return false;
	 }
	 
	 if(document.frm.locCategory.value==''){
		 alert("Please choose a category");
		 document.frm.locCategory.focus();
		 return false;
	 }
	 
	 if(latLng.length==0){
		 alert("Please specify one or more locations");
		 $('#pac-input').focus();
		 return false;
	 }
	 
	 $('#content > textarea').each(function(){
		 if($(this).val().length == 0){
			 alert("Please Enter The Contents of "+$(this).attr('id'));
		 	result = false;
		 }

	 });
	
	 
	 return result;
}


 
function noticeBoardCheck(){
	 
	 if(document.frm.title.value.length==0){
		 alert("Please enter the title");
		 document.frm.title.focus();
		 return false;
	 }
	 
	 if(document.frm.contents.value.length==0){
		 alert("Please enter content");
		 document.frm.contents.focus();
		 return false;
	 }
	
	 
	 return true;
}