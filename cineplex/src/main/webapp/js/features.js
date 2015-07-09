$(function() {
	// init Isotope
	var $grid = $('.grid').isotope({
		itemSelector : '.grid-item',
		layoutMode : 'vertical'
	});
	// filter functions
	var filterFns = {
		// show if language is the same with selected language
		lang : function() {
			var language = $(this).find('.movie-lang').text();
			var checkedLang = $('.button-lang-group').find('.is-checked')
					.text();
			return language == checkedLang;
		},
		// show if type is contained in selected types
		type : function() {
			var type = $(this).find('.movie-type').text();
			var checkedType = $('.button-type-group').find('.is-checked')
					.text();
			return type.indexOf(checkedType) > -1;
		},
		name : function() {
			var key = $("#search-name-input").val();
			var name = $(this).find('.movie-name').text();
			return name.indexOf(key) > -1;
		}
	};
	// change is-checked class on buttons
	$('.button-group').each(function(i, buttonGroup) {
		var $buttonGroup = $(buttonGroup);
		$buttonGroup.on('click', '.button', function() {
			$buttonGroup.find('.is-checked').removeClass('btn-primary');
			$buttonGroup.find('.is-checked').removeClass('is-checked');
			$(this).addClass('is-checked');
			$(this).addClass('btn-primary');
		});
	});

	// bind filter button click
	$('.filters-button-group').on('click', '.button', function() {
		var filterValue = $(this).attr('data-filter');
		// use filterFn if matches value
		filterValue = filterFns[filterValue] || filterValue;
		$grid.isotope({
			filter : filterValue
		});
	});

	$('.search-div .button').click(function() {
		var filterValue = $(this).attr('data-filter');
		// use filterFn if matches value
		filterValue = filterFns[filterValue] || filterValue;
		$grid.isotope({
			filter : filterValue
		});
	});
});