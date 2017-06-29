var onImgLoad = function(selector, callback){
    $(selector).each(function(){
        if (this.complete || /*for IE 10-*/ $(this).height() > 0) {
            callback.apply(this);
        }
        else {
            $(this).on('load', function(){
                callback.apply(this);
            });
        }
    });
};

function hoverMenu() {
    if ($(window).width() > 900) {
        $('#info_menu_wrapper').hover(
            function () {
                $(this).addClass('show')
            },
            function () {
                if (!($('#info_content_wrapper').hasClass("show"))) {
                    $(this).removeClass('show');
                }
            });
    }
    if ($(window).width() < 1030 && $(window).width() > 901)  {
        $('.icon_menu:not(.close_menu)').on('click', function() {
            $('#info_menu_wrapper').addClass('show')
        });
    }
}
function hoverMeet() {
    if ($(window).width() > 900) {
        $('.meet_wrapper').hover(
            function () {
                $(this).addClass('show');
            },
            function () {
                $(this).removeClass('show');
            });
    }
    if ($(window).width() < 1030 && $(window).width() > 901)  {
        $('.icon_menu:not(.close_menu)').on('click', function() {
            $('#info_menu_wrapper').addClass('show')
        });
    }
}


function sizeImg() {
    if ($('.img-wrap').height() < $('.img-wrap img').height()){
        var top = ($('.img-wrap img').height() - $('.img-wrap').height())/2;
        top = top/$('.img-wrap').height()*100;
        $('.img-wrap img').css('top', -top + '%');
    }else{
        $('.img-wrap img').css('top','0px');
	}
    if ($('.img-wrap').width() < $('.img-wrap img').width()){
        var top = ($('.img-wrap img').width() - $('.img-wrap').width())/2;
        top = top/$('.img-wrap').width()*100;
        $('.img-wrap img').css('left', -top + '%');
    }else{
        $('.img-wrap img').css('left','0px');
    }
}


function telNumber() {
    // if ($(window).width() <= 900) {
    //     $(".telephone  span.icon_text").text('Позвонить');
    // }else{
    //     $(".telephone  span.icon_text").text('+7(916) 635-16-95');
    // }
}
function galleryAlign() {
    $('#lightgallery .box').each(function(){
        $(this).height($('#lightgallery .box').first().width()-3);
    });
    $('.albums .box').each(function(){
        $(this).height($('.albums .box').first().width());
    });
}
// Ajax download page



function openGallery(){
    $(".gallery_inner").animate({opacity: "0"}, 500);
    $(".gallery #mCSB_4_scrollbar_vertical").animate({opacity: "0"}, 200);
    setTimeout(function() {
        $(".gallery_inner").animate({opacity: "1"}, 500);
        $("#lightgallery").css('display','none');
        $(".gallery_inner .return").css('display','none');
        $(".albums").css('display','block');
        galleryAlign();
        boxhover();
    }, 500);
}

$(document).on('click','.gallery_inner .return',function(){
    $('.icon_menu.photo_galary').addClass('freeze');
    openGallery();
});


///////////////////scroll page

$(window).on("load",function(){
	$.mCustomScrollbar.defaults.scrollButtons.enable=true; //enable scrolling buttons by default
	$.mCustomScrollbar.defaults.axis="y"; //enable 2 axis scrollbars by default

    if ($(window).width() > 900) {
        $(".scroll").mCustomScrollbar({theme:"inset", });
        $("#scroll").mCustomScrollbar({theme:"minimal-dark"});
        $("#minimal").mCustomScrollbar({theme:"minimal"});
    }else{
        $('.scroll').css('overflow-y', 'scroll');
        $('#scroll').css('overflow-y', 'scroll');
        $('#minimal').css('overflow-y', 'scroll');
    }
    if ($(window).width() > 660) {
        $(".price_wrapper.scroll").mCustomScrollbar({theme:"inset"});
    }else{
        $(".price_wrapper.scroll").css('overflow-y', 'visible');
    }
    galleryAlign();
    sizeImg();


    setTimeout(function(){
        $(".overlay").css('display','none');
        $("#header").removeClass('overlay_face');
    }, 1500);
});


$(document).on('click','.filter_arrow',function(){
    if ($('.filter_inner').hasClass("show")){
        $('.filter_inner').removeClass('show');
    }else{
        $('.filter_inner').addClass('show');
    }
});


$(document).ready(function (){
    $('.pre-loader.face').fadeIn(0);
    boxhover();
    telNumber();
    hoverMenu();
    hoverMeet();
    galleryAlign();
    onImgLoad('.img-wrap img', function(){
        $(this).animate({opacity: "1"}, 500);
        sizeImg();
    });
    $('.data-img').dataImg({
        sml: 450,
        med: 1030,
        lrg: 2000,
        resize: false
    });
    // if ($( window).width() > 900) {
    //     $('body').removeClass().addClass('dark');
    // }

    $('.meet_icon').on('click', function(){
        if ($( window).width() <= 900) {
            $('body').removeClass().addClass('blue');
            $(this).css('display', 'none')
            $('.meet_wrapper').addClass('show');
            $('.meet_wrapper').css('opacity', "0");
            $('.meet_wrapper').animate({opacity: "1"}, 500);
            $('.mobile_navigation').addClass('show');
        }
    });
    $('.meet_wrapper').on('click', function(){
        if ($( window).width() <= 900) {
            $('body').removeClass().addClass('blue');
            $('.meet_wrapper').addClass('show');
            $('.meet_wrapper').css('opacity', "0");
            $('.meet_wrapper').animate({opacity: "1"}, 500);
            $('.mobile_navigation').addClass('show');
        }
    });

    $('body').keydown(function(eventObject){
        var key = eventObject.which;
        if (!$('.logo_studio').hasClass("switch-min")){
            if (key == 40) {
                if (!$('.logo_studio').hasClass("open")){
                    contentSwith();
                    $('.logo_studio').addClass("open");
                }

            }
            if (key == 38) {
                if ($('.logo_studio').hasClass("open")){
                    contentSwith();
                    $('.logo_studio').removeClass("open");
                }
            }
        }
    });


	$('.icon_menu.open_content').on('click', function(){
        $('#info_content_wrapper').addClass('show');
        $('body').removeClass().addClass('blue');
        if ($( window).width() > 900) {
            $('.close_menu').addClass('show');
        }
        if ($( window).width() <= 900) {
            setTimeout(function() {
                $('.mobile_navigation').addClass('show') }, 500);
            $('.navigations').css('display', "none");
        }
        // $('.icon_menu.open_content').removeClass('current');
        // $(this).addClass('current');
        if ($('.content_inner .gallery').hasClass('show')){
            if (!$(this).hasClass('freeze')){
                openGallery();
                $(this).addClass('freeze');
            }
        }
        $('#info_content_wrapper .content_inner .slide_inner').removeClass('show');
		if ($(this).hasClass("time_table")){
			$('.content_inner .timetable').addClass('show');
		}
		if ($(this).hasClass("contact")){
			$('.content_inner .contacts').addClass('show');
		}
		if ($(this).hasClass("photo_galary")){
			$('.content_inner .gallery').addClass('show');
		}
        if ($(this).hasClass("share_price")){
            $('.content_inner .share_price').addClass('show');
        }
    });

    $('#mobile_close').on('click', function(){
        $('body').removeClass().addClass('white');
        $('.navigations').css('display', "block");
        $('#info_menu_wrapper').removeClass('mobile_tell');
        $('#info_menu_wrapper').removeClass('show');
        $('.meet_wrapper').removeClass('show');
        $('.meet_icon').css('display', 'block');
        $('#info_content_wrapper').removeClass('show');
        $('.mobile_navigation').removeClass('show');
	});
	$('.close_menu span').on('click', function(){
        $('body').removeClass().addClass('white');
        if ($( window).width() > 900) {
            $('#info_content_wrapper').removeClass('show');
            $('#info_menu_wrapper').removeClass('show');
            $('.close_menu').removeClass('show');
        }else{
            $('body').removeClass().addClass('white');
        	$('#info_menu_wrapper').removeClass('mobile_tell');
            $('#info_menu_wrapper').removeClass('show');
            $('#info_content_wrapper').removeClass('show');
            $('.meet_icon').css('display', 'block');
		}
    });
    $('#mobile_menu span').on('click', function(){
        if ($('#mobile_menu').hasClass("show")){
            $('.navigations').css('display', "block");
            $('#info_content_wrapper').removeClass('show');
            $('.mobile_navigation').removeClass('show');
            if ($('.meet_wrapper').hasClass("show")){
                $('.meet_wrapper').removeClass("show")
                $('#info_menu_wrapper').addClass('mobile_tell');
            }
		}else{
            $('#info_menu_wrapper').addClass('mobile_tell');
		}
        if ($( window).width() <= 900) {
            $('body').removeClass().addClass('dark');
        }
    });
    //Показать скрыть
    function contentSwith() {
        if ($('#info_menu_wrapper').hasClass("hide")){
            $('#info_menu_wrapper').removeClass('hide');
            $('.meet_icon').removeClass('hide');
            $('body').removeClass().addClass('white');
            if ($( window).width() <= 900) {
                $('#mobile_menu').removeClass('hide');
            }
        }else{
            $('#info_menu_wrapper').addClass('hide');
            $('.meet_icon').addClass('hide');
            $('body').removeClass().addClass('yellow');
            if ($( window).width() <= 900) {
                $('#mobile_menu').addClass('hide');
            }
        }
    }
    $('.content-switch').on('click', function(){
        contentSwith();
        $('.logo_studio').toggleClass("open");
        // if ($( window).width() <= 900) {
        //     if ($('#mobile_menu').hasClass("hide")) {
        //         $('#mobile_menu').removeClass('hide');
        //     } else {
        //         $('#mobile_menu').addClass('hide');
        //     }
        // }
    });
    function elementHide() {
        if ($('#info_menu_wrapper').hasClass("hide")){
            $('#info_menu_wrapper').removeClass('hide');
        }else{
            $('#info_menu_wrapper').addClass('hide');
        }
        if ($('.logo_studio').hasClass("switch-min")){
            $('.logo_studio').removeClass('switch-min');
        }else{
            $('.logo_studio').addClass('switch-min');
        }
        if ($('.meet_icon').hasClass("hide")){
            setTimeout(function() { $('body').removeClass().addClass('white'); }, 600);
            $('.meet_icon').removeClass('hide');
        }else{
            $('.meet_icon').addClass('hide');
            $('body').removeClass().addClass('dark');
        }
    }
    $('.slider-switch').on('click', function(){
        elementHide();
    });
    $('.slide img').on('click', function(){
        console.log( $(this).parents('.slide').hasClass("current"));
        if ($('.logo_studio').hasClass("switch-min") && $(this).parents('.slide').hasClass("current")){
            elementHide();
        }
    });
    $('.slide h2').on('click', function(){
        if ($('.logo_studio').hasClass("switch-min") && $(this).parent('.slide').hasClass("current")){
            elementHide();
        }
    });




    $('#overlay .info button').on('click', function(){
        $('#header').removeClass('overlay_face');
    });

});

$( window ).resize(function() {
    $('#lightgallery .box').each(function(){
        $(this).height($('#lightgallery .box').first().width());
    });
    if ($( window).width() <= 900) {
        if ($('#info_content_wrapper').hasClass("show")) {
            $('.mobile_navigation').addClass('show');
            $('#info_menu_wrapper').addClass('mobile_tell');
        }
        if ($('#slideshow').hasClass("show-content")) {
            $('#mobile_menu').addClass('hide');
        }
    }
    if ($( window).width() > 900) {
        if ($('#info_menu_wrapper').hasClass("mobile_tell")) {
            $('.navigations').css('display','block');
            $('#info_menu_wrapper').addClass('show').removeClass('mobile_tell');
            $('.close_menu').addClass('show');
            $('.mobile_navigation').removeClass('show');
        }
    }

    // if ($( window).width() > 900) {
    //     $('body').removeClass().addClass('dark');
    // }
    telNumber();
    hoverMenu();
    hoverMeet();
    sizeImg();
    galleryAlign();
});

(function() {

	var overlay = document.getElementById( 'overlay' ),
		overlayClose = overlay.querySelector( 'button' ),
		header = document.getElementById( 'header' )
		switchBtnn = header.querySelector( 'button.slider-switch' ),
		toggleBtnn = function() {
			if( slideshow.isFullscreen ) {
				classie.add( switchBtnn, 'view-maxi' );
			}
			else {
				classie.remove( switchBtnn, 'view-maxi' );
			}
		},
		toggleCtrls = function() {
			if( !slideshow.isContent ) {
				classie.add( header, 'hide' );
			}
		},
		toggleCompleteCtrls = function() {
			if( !slideshow.isContent ) {
				classie.remove( header, 'hide' );
			}
		},
		slideshow = new DragSlideshow( document.getElementById( 'slideshow' ), {
			// toggle between fullscreen and minimized slideshow
			onToggle : toggleBtnn,
			// toggle the main image and the content view
			onToggleContent : toggleCtrls,
			// toggle the main image and the content view (triggered after the animation ends)
			onToggleContentComplete : toggleCompleteCtrls
		}),
		toggleSlideshow = function() {
			slideshow.toggle();
			toggleBtnn();
		},
		closeOverlay = function() {
			classie.add( overlay, 'hide' );
		};

	// toggle between fullscreen and small slideshow
	switchBtnn.addEventListener( 'click', toggleSlideshow );
	// close overlay
	overlayClose.addEventListener( 'click', closeOverlay );

}());