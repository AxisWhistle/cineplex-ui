$(document).ready(function() {
	$(".property-list>li").click(function() {
		alert($(this).text());
		$(this).toggleClass("selected-item");
	});
});