$(function () {
    $(".nav-menu").hover(function () {
        $(this).children("ul").slideDown();
    }, function () {
        $(this).children("ul").slideUp();
        }
    );
})