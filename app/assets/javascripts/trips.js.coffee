# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  updateTrips = ->
    $.get('trips/', $('#search').serialize(), (data, status, xhr) -> 
      $('#trips').animate({ opacity : 0 }, ->
        $('#trips').html($('#trips', $(data)).html())
        $('#trips').animate({ opacity : 1.0 })
      )
    )
  
  $('#go').click ->
    updateTrips()

