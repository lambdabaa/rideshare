 // This is a manifest file that'll be compiled into application.js, which will include all the files
 // listed below.
 //
 // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
 // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
 //
 // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 // the compiled file.
 //
 // WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
 // GO AFTER THE REQUIRES BELOW.
 //
 //= require jquery
 //= require jquery_ujs
 //= require_tree .
$(document).ready(function() {
  countryPattern = /, ([^,]*)$/;
  googleAutocompleteAPI = function(query, add) {
    BASE_URL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
    API_KEY = "AIzaSyCD-EYa8HcfusvWEPNil8IR22BhXUwH7tA";
    MIDD_COORDS = "44.0153,-73.1678";
    $.getJSON("/locations/autocomplete_proxy?url=" + escape(BASE_URL + query.term + "&types=geocode&sensor=true" + "&location=" + MIDD_COORDS + "&radius=500" + "&key=" + API_KEY), 
        function(data) {
          var suggestions = [];      
          $.each(data.predictions, function(i, val) {  
              country = countryPattern.exec(val["description"])[1];
              if (country == "United States" || country == "Canada")
                suggestions.push(val["description"].replace(", " + country, ""));  
          });
          add(suggestions);
        }
    ); 
  }

  $(".location_autocomplete").autocomplete({source : googleAutocompleteAPI});
});
