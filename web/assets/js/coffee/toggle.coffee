dropCtrl = (ctrl, target) ->
  ctrl.click () ->
    if target.hasClass("is-show")
      target.removeClass "is-show"
      target.children(".dropdown-menu").slideUp 200
    else
      target.addClass "is-show"

      target.children(".dropdown-menu").slideDown 200


chevronCtrl = (ctrl, target) ->
  ctrl.click ->
    if target.css("display") is "block"
      target.css "display", "none"
      ctrl.addClass "fa-angle-down"
      ctrl.removeClass "fa-angle-up"
    else
      target.css "display", "block"
      ctrl.addClass "fa-angle-up"
      ctrl.removeClass "fa-angle-down"

toggleCtrl = (ctrl, target) ->
  ctrl.click ->
    if target.css("left") is "9px"
      ctrl.children("div").css "backgroundColor", "#ccc"
      target.animate
        left: "1px"
      , 100
    else
      target.animate
        left: "9px"
      , 100
      ctrl.children("div").css "backgroundColor", "#4dd277"

$("#sidebar_controller").click ->
  if $("#sidebar").css("left") is "0px"
    $("#sidebar").removeClass "is-sidebar-show"
    $("#content").removeClass "is-content-compressed"
    $("#sidebar").addClass "is-sidebar-hidden"
    $("#content").addClass "is-content-decompressed"
  else if $("#sidebar").css("left") is "-220px"
    $("#sidebar").removeClass "is-sidebar-hidden"
    $("#content").removeClass "is-content-decompressed"
    $("#sidebar").addClass "is-sidebar-show"
    $("#content").addClass "is-content-compressed"

dropCtrl $("#dropdown-ctrl-1"), $("li.dropdown1")
dropCtrl $("#dropdown-ctrl-2"), $("li.dropdown2")
dropCtrl $("#dropdown-ctrl-3"), $("li.dropdown3")
dropCtrl $("#dropdown-ctrl-4"), $("li.dropdown4")
dropCtrl $("#dropdown-ctrl-5"), $("li.dropdown5")
dropCtrl $("#dropdown-ctrl-6"), $("li.dropdown6")
chevronCtrl $("#chevron-down-ctrl1"), $("#chevron-down1")
chevronCtrl $("#chevron-down-ctrl2"), $("#chevron-down2")
toggleCtrl $("#switchBut1"), $("#switch1")
$("body").on "mouseup", (e) ->
  if $(".is-show").has(e.target).length is 0
    $(".is-show").removeClass "is-show"
    $(".dropdown-menu").slideUp 200
  e.stopPropagation()
