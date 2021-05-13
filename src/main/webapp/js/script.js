$(document).ready(function(){
  format_complete();
  $('.fixed-action-btn').floatingActionButton();
  $('.modal').modal();
  $('.modal_trigger').click(function(){
  	var modal_id = find_parent(this, "TR").id;
  	$("#"+ modal_id).modal('open');
	}); 
  $('#open_new_note').click(function(){
	  $('#new_note').modal('open');
	});
});

function format_complete(){
	var TDs = document.getElementsByClassName("complete_placeholder");
	$(TDs).each(function(key, value){
		complete(value);
	});
}

function find_parent(E, target){
	while(E.nodeName != target){
		E=E.parentElement;
	}
	return E;
}

function complete(E){
	E=find_parent(E, "TR");
	$(E).toggleClass("complete");
	$(E).toggleClass("strikeout");
}

function load_table(){
	$.get("/getTable.jsp", function(data){
		$("#inside").html(data);
	});
}

function form_submit(elm){
	var form = document.getElementById(elm);
	form.submit();
}
