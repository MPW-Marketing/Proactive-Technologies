// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_slides(){
	$('#summary').slideUp();
	$('#wrapper').slideDown();
};

function stop_music(){
	$('#jsPlayer').jPlayer("stop");
	$('#pause_btn').hide();
	$('#play_btn').show();
}

function play_music(){
	$('#jsPlayer').jPlayer("play");
	$('#pause_btn').show();
	$('#play_btn').hide();
}

function onOpenShadowbox(element){
	stop_music();
	return true;
}

function onCloseShadowbox(element){
	play_music();
	return true;
}

$(document).ready(function(){
	Shadowbox.init({
		onFinish: onOpenShadowbox,
		onClose: onCloseShadowbox
	});
	$('#play_btn').hide();
	$('#slideshow').bxCarousel({
		display_num: 5,
		auto_interval: 1,
		speed: 4000,
		move: 1,
		auto: true,
		controls: false,
		margin: 0,
		auto_hover: true
	});

	$('#jsPlayer').jPlayer({
		ready: function(){
			this.element.jPlayer("setFile", "prosound.mp3").jPlayer("play");
		},
		volume: 30
	});
	$('#jsPlayer').jPlayer("onSoundComplete", function() {
	  this.play(); // Auto-Repeat
	});
	
});

$("#about_link > a").click(function(){
	alert("Stop");
});