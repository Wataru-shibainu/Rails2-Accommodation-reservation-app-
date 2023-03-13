$(document).on("turbolinks:load", function () {
    $(document).off().click(function(e){
      if ($(e.target).closest('.user_name').length) {
        $(".menu_list").slideToggle(180)
      }
      else {
        $(".menu_list").slideUp(180)
      }
    });
});

