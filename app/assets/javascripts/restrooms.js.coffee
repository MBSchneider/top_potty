# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showMarkers = null
theZoom = null
myLatlng = null

$(document).ready ->
  showMarkers = true
  theZoom = 14
  myLatlng = null
  drawTheMap()

window.drawTheMap = ->
  console.log "Calls draw map"
  unless $("#show_maps").length
    return
  getLatLong()

getLatLong = ->
  if $("#restroom_table").data("lat-near") == 0 && $("#restroom_table").data("long-near") == 0 # No search input has been entered

    if navigator.geolocation
      # If geolocation is possible, sets search to user location
      navigator.geolocation.getCurrentPosition (position) ->
        drawMapAtLatLong(new google.maps.LatLng(position.coords.latitude, position.coords.longitude))
    else
      # If geolocation not possible, centers map on seattle, zooms out,
      # doesn't show 'you are here' marker
      showMarkers = false
      theZoom = 10
      drawMapAtLatLong(new google.maps.LatLng(47.6062095, -122.3320708))
  else
    drawMapAtLatLong(new google.maps.LatLng($("#restroom_table").data("lat-near"), $("#restroom_table").data("long-near")))

drawMapAtLatLong = (myLatlng) ->
  # sets restroom icon
  image = document.URL.split("restrooms")[0] + 'assets/toilet.png'

  # Sets map canvas width equal to height
  $("#map-canvas").height($("#map-canvas").width())

  map = null

  # Creates new bounds to make sure all markers and user location are
  # included in map
  bounds = new google.maps.LatLngBounds()
  bounds.extend myLatlng

  mapOptions =
    center: myLatlng
    zoom: theZoom
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  console.log $("#restroom_table").data("is-search")
  unless $("#restroom_table").data("is-search") == "false"
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      title: "You are here"
    )

  $(".restroom").each ->
    rrLatLng = new google.maps.LatLng($(this).data("lat"), $(this).data("long"))
    bounds.extend rrLatLng
    marker = new google.maps.Marker(
      position: rrLatLng
      map: map
      icon: image
      title: $(this).data("address")
    )
  map.fitBounds bounds
