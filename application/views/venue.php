<?php 
//if there is no id parameter go back to main page
if(!isset($_GET['id'])){ header('Location: /'); exit(); } 
?>
<body>
<div class="pacelogo"><img src="images/icon.svg" alt="logo"></div>
  <?php
    $id = $_GET['id'];
    //check if id exists in database otherwise show 404
    if($json = file_get_contents( base_url() . "/api/venueByID?id=$id" ))
      $res = base_url() . "/api/venueByID?id=$id";
    else { header('Location: /404.php'); exit(); }
  ?>
  <script>
  angular
        .module('paVenue', [])
        .controller('venueCtrl', function($scope, $http){
            //This function getting json file of all the objects: pubs and beers for search purposes
            function drink()
            {
                $http({
                    method: 'GET',
                    url: '<?php echo $res ?>',
                  }).then(function successCallback(response) {
                      $scope.venue = response.data;
                    }, function errorCallback(response) {
                      // called asynchronously if an error occurs
                      // or server returns response with an error status.
                      $scope.venue = response.statusText;
                    });
            }
            //run function search on load
            drink();

        });
  </script>
    <!--PUB INFO-->
    <section class="dynamic_page" ng-app="paVenue" ng-controller="venueCtrl">
        <div class="container">


            <?php 
        //echo "<p>" . $_GET['q'] . "</p>";    //this page is getting get parameter q with name according which you gonna create template
        ?>

            <div class="row align-items-center">
                <div class="col-sm-4 col-lg-2">
                    <img class="img-fluid" ng-src="{{venue.info[0].image}}" alt="">
                </div>
                <div class="col-sm-8 col-lg-10">
                    <h1 ng-bind="venue.info[0].name"></h1>
                    <p ng-bind="venue.info[0].address"></p>
                </div>
            </div>
            <div class="col-sm-12">
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Beer</th>
                            <th scope="col">Price</th>
                            <th scope="col">Type</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="i in venue.prices">
                    <td>
                      <a href="/drink?id={{i.id}}">{{i.name}}</a>
                    </td>
                    <td>{{i.price}}</td>
                    <td>{{i.type}}</td>
                  </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </section>

    <!-- MAP MODAL -->
    <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="mapModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- MODAL HEADER TITLE AND CLOSE BUTTON -->
                    <h5 class="modal-title" id="mapModalLabel">
                        <i class="fa fa-map-o" aria-hidden="true"></i> Map</h5>
                    <button type="button" class="close big" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- MODAL BODY -->
                <div class="modal-body container-fluid">
                    <div id="map">
                        <!-- MAP IS FETCHED HERE -->
                    </div>
                </div>
            </div>
        </div>
    </div>