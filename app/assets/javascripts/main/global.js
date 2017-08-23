(function() {
    // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
    if (!String.prototype.trim) {
        (function() {
            // Make sure we trim BOM and NBSP
            var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
            String.prototype.trim = function() {
                return this.replace(rtrim, '');
            };
        })();
    }

    [].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
        // in case the input is already filled..
        if( inputEl.value.trim() !== '' ) {
            classie.add( inputEl.parentNode, 'input--filled' );
        }

        // events:
        inputEl.addEventListener( 'focus', onInputFocus );
        inputEl.addEventListener( 'blur', onInputBlur );
    } );

    function onInputFocus( ev ) {
        classie.add( ev.target.parentNode, 'input--filled' );
    }

    function onInputBlur( ev ) {
        if( ev.target.value.trim() === '' ) {
            classie.remove( ev.target.parentNode, 'input--filled' );
        }
    }
})();
function ModernForm() {
    var modernInputElement = $('.input__field--hoshi');

    function recheckAllInput() {
        modernInputElement.each(function() {
            if ($(this).val() !== '') {
                $(this).parent().find('label').addClass('input--filled');
            }
        });
    }

    modernInputElement.on('click', function() {
        $(this).parent().find('label').addClass('input--filled');
    });
    modernInputElement.on('blur', function() {
        if ($(this).val() === '') {
            $(this).parent().find('label').removeClass('input--filled');
        } else {
            recheckAllInput();
        }
    });
}

$(window).on('load', function (){
    // setTimeout(function(){
    //     $('body').trigger('click');
    //      console.log('click')
    // }, 1000);
    //
    // $('.input--hoshi input').change(function() {
    //     $(this).each(function () {
    //         if ($(this).val() != '') {
    //             $(this).parent().addClass('input--filled')
    //             $('.register_wrapper').click();
    //         }
    //     })
    // });


    ModernForm();

});


