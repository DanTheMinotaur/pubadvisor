//dublin cordinates
var dublin = {lat: 53.3499612, lng: -6.2637037}; var drunkenFish = {lat: 53.3492226, lng: -6.2442272};
//map style
var style = [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]}];
//map object
var map; var resizedFlag=true; var markers = [];

// function init map
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: dublin,
      styles: style
    });

    //main pointer marker
    var marker = new google.maps.Marker({
      position: dublin,
      map: map,
      title: 'My position',
      draggable: true,
      icon: 'images/icon.png'
    });
    marker.addListener('dragend', function(){
        markers[0].setMap(null);
    });
    //ADD MARKER TO THE MAP FUNCTION
    addMarker(drunkenFish, map, "Drunken Fekin Fish", 'images/rnd_map_icon.png');
    function addMarker(_position, _map, _title, _icon){
        let temp = 
        new google.maps.Marker({
            position: _position,
            map: _map,
            title: _title,
            icon: _icon
        });
        markers.push(temp);
    }

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

//this function fixing issue of map on bootstrap modal by triggering map resize whenever modal is loaded
$('#mapModal').on('shown.bs.modal', function () {
    google.maps.event.trigger(map, "resize");
    //first resize flag is true only when map is loading first time to correct centre position.
    if(resizedFlag)
    {
        map.setCenter(dublin);
        resizedFlag = false;
    }
    
});