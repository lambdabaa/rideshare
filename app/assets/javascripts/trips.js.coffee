# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
  # trips#show map
  initialize = () ->
    myOptions = { mapTypeId : google.maps.MapTypeId.ROADMAP, scrollwheel : false }
    map = new google.maps.Map(document.getElementById('map'), myOptions)
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();    
    directionsDisplay.setMap(map);

    start = $('#from').html()
    end = $('#to').html()
    request = { origin : start, destination : end, travelMode : google.maps.TravelMode.DRIVING }

    directionsService.route(request, (result, status) -> 
      directionsDisplay.setDirections(result) if (status == google.maps.DirectionsStatus.OK)
    )
  
  google.maps.event.addDomListener(window, 'load', initialize)
  
  # trips#index
  updateTrips = ->
    $.get('trips/', $('#search_form').serialize(), (data, status, xhr) -> 
      $('#showTrips').animate({ opacity : 0 }, ->
        $('#showTrips').html($('#showTrips', $(data)).html())
        $('#showTrips').animate({ opacity : 1.0 })
      )
    )
  
  $('#search_button').click ->
    updateTrips()
  
  $('#start_location').focus( ->
    $(this).val('');
  )
  $('#start_location').blur( ->
    $(this).val('From...') if ($(this).val() == '')
  )

  $('#end_location').focus( ->
    $(this).val('');
  )
  $('#end_location').blur( ->
    $(this).val('To..') if ($(this).val() == '')
  )
