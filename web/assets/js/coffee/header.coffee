active = (target) ->
  $(target).click () ->
    $(target).css("borderBottom","5px solid black")
    console.log 'dsssssssssss'
active($('#home'))
active($('#release'))
active($('#personal'))
