# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  # If no search data is available, center map on Seattle city center
  # and no location marker for user
  map = null
  if $("#restroom_table").data("lat-near") == 47.6062095 && $("#restroom_table").data("long-near") == -122.3320708

    initialize = ->
      myLatlng = new google.maps.LatLng(47.6062095, -122.3320708)
      mapOptions =
        center: myLatlng
        zoom: 10
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
      image = 'assets/toilet.png';
      $(".restroom").each ->
        a = $(this).data("lat")
        b = $(this).data("long")

        rrLatLng = new google.maps.LatLng(a, b)
        marker = new google.maps.Marker(
          position: rrLatLng
          map: map
          icon: image
          #shape: shape
          #title: beach[0]
          #zIndex: beach[3]
        )

    google.maps.event.addDomListener window, "load", initialize

  else

    console.log $(".restroom")

    initialize = ->
      myLatlng = new google.maps.LatLng($("#restroom_table").data("lat-near"), $("#restroom_table").data("long-near"))
      mapOptions =
        center: myLatlng
        zoom: 14
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
      marker = new google.maps.Marker(
        position: myLatlng
        map: map
        title: "Hello World!"
      )
      image = 'assets/toilet.png';
      $(".restroom").each ->
        a = $(this).data("lat")
        b = $(this).data("long")

        rrLatLng = new google.maps.LatLng(a, b)
        marker = new google.maps.Marker(
          position: rrLatLng
          map: map
          icon: image
          #shape: shape
          #title: beach[0]
          #zIndex: beach[3]
        )

    google.maps.event.addDomListener window, "load", initialize
