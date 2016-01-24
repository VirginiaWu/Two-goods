active = (target) ->
  target.click () ->
    target.css("borderBottom","5px solid black")
active($('#home'))
active($('#release'))
active($('#personal'))
