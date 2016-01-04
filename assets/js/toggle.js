$("#sidebar_controller").click(function() {
  $("#sidebar").toggleClass("is-sidebar-hidden");
  $("#content").toggleClass("is-content-decompressed");
});
function dropCtrl(ctrl,target) {
  ctrl.click(function() {
    target.slideToggle("slow");
  });
  ctrl.blur(function(){
    target.slideUp("slow");
  });
}
dropCtrl($("#dropdown-ctrl-4"), $("#dropdown-4"));
