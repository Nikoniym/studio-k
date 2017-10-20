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
    $('.avatar_wrapper .back').fadeOut(0);
    $('.edit_user').fadeOut(0);
    $('.pre-loader.avatar').fadeIn(150);
}
function cropAvatar() {
    $('.pre-loader.avatar').fadeIn(150);
    $('.edit_user').fadeOut(0);
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
        // $('.time_teacher tr.date_table td').attr('colspan','2');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','2');
    }else{
        // $('.time_teacher tr.date_table td').attr('colspan','2');
        $('.write_table tr.date_table td:nth-child(1)').attr('colspan','1');
    }

    $('.show_link').on('click', function(){
        if ($('.new_users_list').hasClass('show_count')){
            $('.new_users_list').removeClass('show_count').addClass('show_email');
            $('.show_link').text('Показать тариф');
        }else{
            $('.new_users_list').removeClass('show_email').addClass('show_count');
            $('.show_link').text('Показать email и телефон');
        }
    });
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