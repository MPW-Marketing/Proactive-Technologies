// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_slides(){
	$('#summary').hide('blind', null, 500, null);
	$('#wrapper').show('blind', null, 4000, null);
	init_slides();
};

function init_slides(){
	$('#slideshow').serialScroll({
		items:'li',
		duration:4000,
		stop:false,
		start:0,
		lazy:true,
		easing:'linear',
		interval:1,
		exclude:3
		// onBefore: on_before,
		// onAfter: on_after
	});
};

function on_before( e, elem, $pane, $items, pos ){
	// $('#slides li:first-child').clone().appendTo('#slides');
};

function on_after(element, slideshow){
	// $('#slides li:first-child').hide().remove();
	// $('#slideshow').scrollTo($('#slides li:first-child'));
	// $('#slideshow').trigger( 'start' );
};

jQuery(function( $ ){
	
	init_slides();
	
	$('#slideshow').bind('mouseenter', function(){
		$(this).trigger( 'stop' );
	});
	
	$('#slideshow').bind('mouseleave', function(){
		$(this).trigger( 'start' );
	});
	
	$('#summary').bind('click', show_slides);
	
});

