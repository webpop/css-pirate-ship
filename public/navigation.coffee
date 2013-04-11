$ ->
  $wheel = $(".steering-wheel")
  $compass = $("#spinner")
  $left = $("#left")
  $right = $("#right")
  $directions = $("#directions")

  index = 0
  $right.on "click", ->
    index += 1
    rotate()

  $left.on "click", ->
    index -= 1
    rotate()

  rotate = =>
    $wheel.css
      transform: "rotate(" + index*360 + "deg)"
    $compass.css
      transform: "rotate(" + index*90 + "deg)"

    if index is 5
      $directions.removeClass().addClass("go-0-instant")
      index = 1
      rotate()
    else if index is -1
      $directions.removeClass().addClass("go-4-instant")
      index = 3
      rotate()
    else
      $directions.removeClass().addClass("go-#{index}")
    console.log(index)



