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
  COUNTRY_PATTERN = /, ([^,]*)$/;
  googleAutocompleteAPI = function(query, add) {
    BASE_URL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
    API_KEY = "AIzaSyCD-EYa8HcfusvWEPNil8IR22BhXUwH7tA";
    MIDD_COORDS = "44.0153,-73.1678";
    $.getJSON("/locations/autocomplete_proxy?url=" + escape(BASE_URL + query.term + "&types=geocode&sensor=true" + "&location=" + MIDD_COORDS + "&radius=500" + "&key=" + API_KEY), 
        function(data) {
          // this is the list of places that will finally be displayed
          var suggestions = [];      
          // iterate over the predictions returned by google maps
          $.each(data.predictions, function(i, val) {  
              country = COUNTRY_PATTERN.exec(val["description"])[1];
              // add those from the US and Canada
              if (country == "United States" || country == "Canada")
                // remove the name of the country
                suggestions.push(val["description"].replace(", " + country, ""));  
          });
          add(suggestions);
        }
    ); 
  }

  $(".location_autocomplete").autocomplete({source : googleAutocompleteAPI});
});
