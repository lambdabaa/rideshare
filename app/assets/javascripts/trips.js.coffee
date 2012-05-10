# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
  # trips#show map
  initialize = () ->
    myOptions = mapTypeId : google.maps.MapTypeId.ROADMAP
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
    $.get('trips/', $('#search').serialize(), (data, status, xhr) -> 
      $('#trips').animate({ opacity : 0 }, ->
        $('#trips').html($('#trips', $(data)).html())
        $('#trips').animate({ opacity : 1.0 })
      )
    )
  
  $('#go').click ->
    updateTrips()

