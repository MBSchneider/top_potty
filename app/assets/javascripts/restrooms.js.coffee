# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

console.log "loading coffeescript"

$(document).ready ->
  console.log "Doc ready"
  drawTheMap()


window.drawTheMap = ->
  console.log "Calls draw map"
  unless $("#show_maps").length
    return
  console.log "URL SPLIT"
  console.log document.URL.split("restrooms")[0] + 'assets/toilet.png'


  image = document.URL.split("restrooms")[0] + 'assets/toilet.png'

  $("#map-canvas").height($("#map-canvas").width())
  console.log("drawing the map")
  # If no search data is available, center map on Seattle city center
  # and no location marker for user
  map = null

  theZoom = 10
  if $("#restroom_table").data("lat-near") == 0 && $("#restroom_table").data("long-near") == 0
    myLatlng = new google.maps.LatLng(47.6062095, -122.3320708)
  else
    myLatlng = new google.maps.LatLng($("#restroom_table").data("lat-near"), $("#restroom_table").data("long-near"))
    theZoom = 14
  bounds = new google.maps.LatLngBounds()
  bounds.extend myLatlng
  console.log "myLat = " + myLatlng

  mapOptions =
    center: myLatlng
    zoom: theZoom
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  console.log "Map: " + map

  unless $("#restroom_table").data("lat-near") == 0 && $("#restroom_table").data("long-near") == 0
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      title: "Hello World!"
    )

  $(".restroom").each ->
    a = $(this).data("lat")
    b = $(this).data("long")

    rrLatLng = new google.maps.LatLng(a, b)
    bounds.extend rrLatLng
    marker = new google.maps.Marker(
      position: rrLatLng
      map: map
      icon: image
      #shape: shape
      #title: beach[0]
      #zIndex: beach[3]
    )
  map.fitBounds bounds
