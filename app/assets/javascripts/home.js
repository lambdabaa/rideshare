// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function() {
  googleAutocompleteAPI = function(query, add) {
    $.getJSON("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=" + query.term + "&types=geocode&sensor=true&key=AIzaSyCD-EYa8HcfusvWEPNil8IR22BhXUwH7tA", function(data) {
      var suggestions = []; 	    
      $.each(data.predictions, function(i, val){  
        suggestions.push(val["description"]);  
      });
  	  add(suggestions);
    }); 
  }
	$("#fromLocation").autocomplete({source: googleAutocompleteAPI});
	$("#toLocation").autocomplete({source: googleAutocompleteAPI});
});