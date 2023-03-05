$(document).on("turbolinks:load", function () {
    $(".user_menu").children("li").click(function(){
        $(this).children("ul").stop().slideToggle(180);
    });
});

