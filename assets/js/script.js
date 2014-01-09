$(document).ready(function() {
	$('.navopen').click(function(e) {
		e.preventDefault();
		$(this).hide();
		$('.nav').show();
	});

	$('.navclose').click(function(e) {
    	e.preventDefault();
    	$(this).parent("div").hide();
    	$('.navopen').show();
	});
});