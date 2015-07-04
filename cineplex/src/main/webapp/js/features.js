//$(document).ready(function() {
//	$(".property-list>li").click(function() {
//		alert($(this).text());
//		$(this).toggleClass("selected-item");
//	});
//});

$(function() {
	// init Isotope
	var $grid = $('.grid').isotope({
		itemSelector : '.grid-item',
		layoutMode : 'vertical'
	});
	// filter functions
	var filterFns = {
		// language filter
		lang : function() {
			var language = $(this).find('.movie-lang').text();
			var checkedLang = $('.button-lang-group').find('.is-checked')
					.text();
			return language == checkedLang;
		},

		type : function() {
			var type = $(this).find('.movie-type').text();
			var checkedType = $('.button-type-group').find('.is-checked')
					.text();
			return type.indexOf(checkedType) > -1;
		},
		// show if number is greater than 50
		numberGreaterThan50 : function() {
			var number = $(this).find('.number').text();
			return parseInt(number, 10) > 50;
		},
		// show if name ends with -ium
		ium : function() {
			var name = $(this).find('.name').text();
			return name.match(/ium$/);
		}
	};
	// change is-checked class on buttons
	$('.button-group').each(function(i, buttonGroup) {
		var $buttonGroup = $(buttonGroup);
		$buttonGroup.on('click', 'button', function() {
			$buttonGroup.find('.is-checked').removeClass('is-checked');
			$(this).addClass('is-checked');
		});
	});

	// bind filter button click
	$('.filters-button-group').on('click', 'button', function() {
		var filterValue = $(this).attr('data-filter');
		// use filterFn if matches value
		filterValue = filterFns[filterValue] || filterValue;
		$grid.isotope({
			filter : filterValue
		});
	});

});