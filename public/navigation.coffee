$ ->
  $wheel = $(".steering-wheel")
  $compass = $("#spinner")

  $left = $("#left")
  $right = $("#right")

  $directions = $(".directions")

  index = 4
  degree = 0
  percentage = 0
  turningLeft = false
  turningRight = false

  rotate = (degree) =>
    $wheel.css
      transform: "rotate(" + degree + "deg)"

    $compass.css
      transform: "rotate(" + degree/4 + "deg)"

  jump_sky = (percentage) =>
    $directions.css("left": + percentage + "%")

  slide_sky = (percentage) =>
    $directions.animate
      "left": + percentage + "%"
      , 3000, ->
        turningLeft = false
        turningRight = false


  $left.on "click", ->
    unless turningLeft is true
      turningRight = false
      $directions.stop()
      turningLeft = true
      if index is 4
        index = 1
        percentage -=400
        jump_sky( percentage )
      else
        index += 1
      percentage += 100
      slide_sky( percentage )
      degree -= 360
      rotate( degree )


  $right.on "click", ->
    unless turningRight is true
      turningLeft = false
      $directions.stop()
      turningRight = true
      if index is 0
        percentage += 400
        jump_sky( percentage )
        index = 3
      else
        index -= 1
      percentage -= 100
      slide_sky( percentage )
      degree += 360
      rotate( degree )


