// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery-ui
function doDialog(_id,modal){
    var id = "#"+_id;
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();	
    $('#mask').css({'height':maskHeight,'width':maskWidth,'display':'block','top':'0%','left':'0%'});
	$('#mask').fadeIn(10000);    
    $('#mask').fadeTo("slow",0.8);
	if(!modal) $('#mask').click(function(){endDialog(_id);});
	
	$(id).fadeIn(2000);
	$(id+ " .workAndClose").click(function(e){endDialog(_id);});
    $(id+" .close").click(function(e){e.preventDefault();endDialog(_id);});

}

function endDialog(_id){
    $('#mask').hide();
	var id = "#"+_id;
	$(id).hide();
}


function sendFriendRequest(to_id,from_id){
	$.post("/friendshiprequest/offer",{from:from_id,to:to_id,},function(){$("#add-friend").hide();});
}

function acceptFriendRequest(to_id,from_id){
	$.post("/friendshiprequest/accept",{from:from_id,to:to_id,});
}


//$(document).ready(function(){
	
	
	//$("a",".options").button();
//});

$(document).ready(function(){
   //$( "input:submit, a, button", ".options" ).button();
   $(".search-button").hover(function(){$(this).removeClass("search-button").addClass("search-button-hover");},
                             function(){$(this).removeClass("search-button-hover").addClass("search-button");});
 });

