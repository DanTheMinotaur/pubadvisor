//when document loaded...
$(document).ready(function () {
    //function getting all the data-src value and disposing logos dinamically.
    $.each($('.result .logo'), function () {
        let src = $(this).data('src'); 
        $(this).css('background-image', 'url("'+ src +'")');
    });
});

//listener of focus and blur(out of focus) event, applying styling for border arround the search field.
$('.searchField').focus(function (e) { 
    e.preventDefault();
    $('.searchWrap').addClass('active');
});
//blur
$('.searchField').blur(function (e) { 
    e.preventDefault();
    $('.searchWrap').removeClass('active');
});
//when click on beer listener
$('.beer').click(function (e) { 
    window.location = "/beer";   
});
//when click on pub listener
$('.pub').click(function (e) { 
    window.location = "/pub";   
});