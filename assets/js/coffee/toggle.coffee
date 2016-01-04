dropCtrl = (ctrl, target) ->
  ctrl.click ->
    target.slideToggle "slow"

  ctrl.blur ->
    target.slideUp "slow"

$("#sidebar_controller").click ->
  $("#sidebar").toggleClass "is-sidebar-hidden"
  $("#content").toggleClass "is-content-decompressed"

dropCtrl $("#dropdown-ctrl-4"), $("#dropdown-4")
