// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_slides(){
	$('#summary').slideUp();
	$('#wrapper').slideDown();
};

$(document).ready(function(){
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
});
