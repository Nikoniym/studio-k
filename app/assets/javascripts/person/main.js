function tdHeight() {
    if ($(window).width() < 600) {
        $('tr.date_table td').attr('colspan', '2');

        $('.time_teacher td:nth-last-child(1)').each(function () {
            $(this).height($(this).parent().height() - 16);
        })
        $('.write_table td:nth-last-child(1)').each(function () {
            $(this).height($(this).parent().height() - 16);
        })
    }else {
        $('.time_teacher td:nth-last-child(1)').css('height', 'auto');
        $('.write_table td:nth-last-child(1)').css('height', 'auto');
    }
}
function submitAvatar() {
    $('.edit_user').submit();
}
$(document).ready(function (){
    tdHeight();
    $( "#datepicker" ).datepicker();
    $( ".datepicker" ).datepicker();
    if ($(window).width() < 900) {
        $('body *').unbind('mouseenter mouseleave');
        $('nav').removeClass('cl-effect-14');
    }else{
        $('body *').bind('mouseenter mouseleave');
        if (!$('nav').hasClass("cl-effect-14")) {
            $('nav').addClass('cl-effect-14');
        }
    }
    if ($(window).width() < 600) {
        $('.time_teacher tr.date_table td').attr('colspan','2');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','2');
    }else{
        $('.time_teacher tr.date_table td').attr('colspan','1');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','1');
    }
});

$( window ).resize(function() {
    tdHeight();
    if ($(window).width() < 900) {
        $('body *').unbind('mouseenter mouseleave');
        $('nav').removeClass('cl-effect-14');
    }else{
        $('body *').bind('mouseenter mouseleave');
        if (!$('nav').hasClass("cl-effect-14")) {
            $('nav').addClass('cl-effect-14');
        }
    }
    if ($(window).width() < 600) {
        $('.time_teacher tr.date_table td').attr('colspan','2');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','2');
    }else{
        $('.time_teacher tr.date_table td').attr('colspan','1');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','1');
    }
});