// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_slides(){
	$('#summary').hide('blind', null, 500, null);
	$('#wrapper').show('blind', null, 4000, null);
	$('#slideshow').trigger( 'start' );
};


jQuery(function( $ ){
	$('#slideshow').serialScroll({
		items:'li',
		duration:2000,
		force:true,
		easing:'linear',
		interval:1,
		cycle:true,
		exclude:5
	});
	
	$('#slideshow').bind('mouseenter', function(){
		$(this).trigger( 'stop' );
	});
	
	$('#slideshow').bind('mouseleave', function(){
		$(this).trigger( 'start' );
	});
	
	$('#summary').bind('click', show_slides);
	
});

