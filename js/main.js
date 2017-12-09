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
      icon: '/images/icon.png'
    });
    marker.addListener('dragend', function(){
        swal("Cheers!", "", "success");
    });
    //ADD MARKER TO THE MAP FUNCTION
    addMarker(drunkenFish, map, "Drunken Fekin Fish", '/images/rnd_map_icon.png');
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

$('.searchBtn, #mobile-btn').click(function () { 
    if(window.location.pathname != "/")
    {
        $.ajax({
            type: "post",
            url: "/home/setquery",
            data: {q: $('.searchField').val()},
            success: function () {
                window.location.href = "/";
            }
        });
    }
});

$('.dropdown-item').click(function (e) { 
    e.preventDefault();
    window.location.href = $(this).attr('href');
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
//changing forms on admin panels
function btnAction(action)
{
    function swap(el)
    {
        if(!el.hasClass('active'))
        {
            $('.formz').removeClass('active');
            el.addClass('active');
        }
    }
    switch (action) {
        case 'addPro':
            swap($('#addDrink'));
            break;
        case 'addVenue':
            swap($('#addVenue'));
            break;
        case 'venues':
            swap($('#venues'));
            venuesLoad();
            break;
        case 'products':
            swap($('#products'));
            productsLoad();
            break;
        case 'inventory':
            swap($('#inventory'));
            break;
    }
}

//ADD DRINK
$('#addDrinkBtn').click(function () { 
    $.ajax({
        type: "post",
        url: "/admin_api/addDrink",
        data: $('#addDrink form').serialize(),
        success: function (response) {
            if(response == 'drink added.')
            {
                swal("", response, "success");
                $('#addDrink form').trigger("reset");
            }      
            else
                swal("", response, "error");
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
});

//ADD VENUE
$('#addVenueBtn').click(function () { 
    $.ajax({
        type: "post",
        url: "/admin_api/addVenue",
        data: $('#addVenue form').serialize(),
        success: function (response) {
            if(response == 'Venue Added')
            {
                swal("", response, "success");
                $('#addVenue form').trigger("reset");
            }      
            else
                swal("", response, "error");
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
});

//VENUES-----------------------------------------------------------------------

//VENUES LOAD
function venuesLoad()
{
    var table = $('.venue-results');
    $.ajax({
        type: "get",
        url: "/api/allVenues",
        success: function (data) {
            table.empty();
            $.each(data, function () {
                var id = this.id;
                var name = this.name;
                table.append(
                    '<tr><td class="id">' + id + '</td><td>' + name + '</td>' + 
                    //buttons
                    '<td><button class="venue-edit" data-toggle="modal" data-target="#venuesModal"><i class="fa fa-pencil" aria-hidden="true"></i></button></td><td><button class="venue-delete"><i class="fa fa-trash" aria-hidden="true"></i></button></td></tr>'
                );
            });
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
}

//VENUE EDIT ACTION
$('#venues').on('click', '.venue-edit', function() { 
    var id = $(this).parent().siblings('.id').text(); 
    $.ajax({
        type: "get",
        url: "api/venueByID?id=" + id,
        success: function (data) {
            $('#modal-venue').trigger("reset");
            $('#modal-venue input[name=name]').val(data.info[0].name);
            $('#modal-venue input[name=address]').val(data.info[0].address);
            $('#modal-venue input[name=location]').val(data.info[0].location); //pubcatname
            var temp = $('#modal-venue select[name=pubcatid]');
            switch (data.info[0].pubcatname) {
                case 'CRAFT PUB':
                    temp.val(1);
                    break;
                case 'PUBLIC HOUSE':
                    temp.val(2);
                    break;
                case 'NIGHTCLUB':
                    temp.val(3);
                    break;
            }
            $('#modal-venue input[name=image]').val(data.info[0].image);
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
});

//VENUE TRASH DELETE ACTION

$('#venues').on('click', '.venue-delete', function() { 
    var id = $(this).parent().siblings('.id').text(); 
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this data!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
            $.ajax({
                type: "DELETE",
                url: "/admin_api/deleteVenue",
                data: {id: id},
                success: function () {
                    venuesLoad();
                    swal("Venue was deleted from database", {
                        icon: "success",
                  });
                },
                error: function() {
                    swal("Ooopps...", "Something went wrong", "error");
                }
            });            
        } 
      });
});

//SAVE VENUE ACTION
$('.save-venue').click(function () { 
    $.ajax({
        type: "PUT",
        url: "/admin_api/updateVenue",
        data: $('#modal-venue').serialize(),
        success: function (response) {
            swal("Venue has been updated.", {
                icon: "success",
          });
          venuesLoad();
          $('#venuesModal').modal('hide');
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });           
});

//PRODUCTS -----------------------------------------------------------------------

//PRODUCTS LOAD
function productsLoad()
{
    var table = $('.product-results');
    $.ajax({
        type: "get",
        url: "/api/allDrinks",
        success: function (data) {
            table.empty();
            $.each(data, function () {
                var id = this.id;
                var name = this.name;
                table.append(
                    '<tr><td class="id">' + id + '</td><td>' + name + '</td>' + 
                    //buttons
                    '<td><button class="product-edit" data-toggle="modal" data-target="#productsModal"><i class="fa fa-pencil" aria-hidden="true"></i></button></td><td><button class="product-delete"><i class="fa fa-trash" aria-hidden="true"></i></button></td></tr>'
                );
            });
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
}

//PRODUCTS EDIT ACTION
$('#products').on('click', '.product-edit', function() { 
    var id = $(this).parent().siblings('.id').text(); 
    $.ajax({
        type: "get",
        url: "api/drinkByID?id=" + id,
        success: function (data) {
            $('#modal-product').trigger("reset");
            $('#modal-product input[name=name]').val(data.info[0].name);
            $('#modal-product input[name=percentage]').val(data.info[0].percentage);
            $('#modal-product input[name=country]').val(data.info[0].country_of_origin); 
            $('#modal-product input[name=quantity]').val(data.info[0].quantity); 
            var temp = $('#modal-product select[name=type]');
            switch (data.info[0].type) {
                case 'Craft Beer':
                    temp.val(1);
                    break;
                case 'Beer':
                    temp.val(2);
                    break;
                case 'Spirit':
                    temp.val(3);
                    break;
                case 'Cocktail':
                    temp.val(4);
                    break;
            }
            $('#modal-product input[name=image]').val(data.info[0].image);
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });
});

//PRODUCT TRASH DELETE ACTION

$('#products').on('click', '.product-delete', function() { 
    var id = $(this).parent().siblings('.id').text(); 
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this data!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
            $.ajax({
                type: "DELETE",
                url: "/admin_api/deleteDrink",
                data: {id: id},
                success: function () {
                    venuesLoad();
                    swal("Product was deleted from database", {
                        icon: "success",
                  });
                },
                error: function() {
                    swal("Ooopps...", "Something went wrong", "error");
                }
            });            
        } 
      });
});

//SAVE PRODUCT ACTION
$('.save-product').click(function () { 
    $.ajax({
        type: "PUT",
        url: "/admin_api/updateDrink",
        data: $('#modal-product').serialize(),
        success: function (response) {
            swal("Product has been updated.", {
                icon: "success",
          });
          venuesLoad();
          $('#productsModal').modal('hide');
        },
        error: function() {
            swal("Ooopps...", "Something went wrong", "error");
        }
    });           
});