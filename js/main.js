//dublin cordinates
var dublin = {lat: 53.3499612, lng: -6.2637037};
//map object
var map; var resizedFlag=true;
//when document loaded...
$(document).ready(function () {
    //function getting all the data-src value and disposing logos dinamically.
    $.each($('.result .logo'), function () {
        let src = $(this).data('src'); 
        $(this).css('background-image', 'url("'+ src +'")');
    });
    initMap();
});
// function init map
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: dublin
    });
    var marker = new google.maps.Marker({
      position: dublin,
      map: map
    });
}  

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
//this function fixing issue of map on bootstrap modal by triggering map resize whenever modal is loaded
$('#myModal').on('shown.bs.modal', function () {
    google.maps.event.trigger(map, "resize");
    //first resize flag is true only when map is loading first time to correct centre position.
    if(resizedFlag)
    {
        map.setCenter(dublin);
        resizedFlag = false;
    }
    
});