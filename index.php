<!doctype html>
<html lang="en">

<head>
  <title>Pub Advisor</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS and Font Awesome -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- MAIN STYLING -->
  <link rel="stylesheet" href="css/style.css">
  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]--
  <!-- LOAD ANGULAR -->
  <script src="js/angular.min.js"></script>
  <script src="js/angular-animate.min.js"></script>
  <script src="js/search.js"></script>
</head>

<body ng-app="paSearch" ng-controller="searchCtrl">

  <!--TOP SECTION HIDDEN FROM MD-DOWN-->
  <section class="top">
    <div class="container">
      <div class="row align-items-center">
        <div class="col">
        <!--MENU ICONS-->
          <div class="icons">
            <!-- LOCATION ICON -->
            <div class="locationIcon" data-toggle="modal" data-target="#mapModal">
              <svg enable-background="new 0 0 491.582 491.582" version="1.1" viewBox="0 0 491.582 491.582" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
                <g fill="#fff">
                  <path d="m245.79 0c-91.992 0-166.83 74.841-166.83 166.83 0 36.967 21.764 93.187 68.493 176.93 31.887 57.138 63.627 105.4 64.966 107.43l22.941 34.773c2.313 3.507 6.232 5.617 10.434 5.617s8.121-2.11 10.434-5.617l22.94-34.771c1.326-2.01 32.835-49.855 64.967-107.44 46.729-83.735 68.493-139.96 68.493-176.93 0-91.992-74.842-166.83-166.83-166.83zm76.511 331.58c-31.685 56.775-62.696 103.87-64.003 105.85l-12.508 18.959-12.504-18.954c-1.314-1.995-32.563-49.511-64.007-105.85-43.345-77.676-65.323-133.1-65.323-164.74 0-78.207 63.626-141.83 141.83-141.83s141.83 63.626 141.83 141.83c0 31.643-21.978 87.069-65.323 164.74z"
                  />
                  <path d="m245.79 73.291c-51.005 0-92.5 41.496-92.5 92.5s41.495 92.5 92.5 92.5 92.5-41.496 92.5-92.5-41.495-92.5-92.5-92.5zm0 160c-37.22 0-67.5-30.28-67.5-67.5s30.28-67.5 67.5-67.5c37.221 0 67.5 30.28 67.5 67.5s-30.279 67.5-67.5 67.5z"
                  />
                </g>
              </svg>
            </div>
            <!-- END OF LOCATION ICON -->
          </div>
        </div>
        <!-- LOGO -->
        <div class="col-xl-4 col-lg-5 col-md-6">
          <img src="images/logo.svg" alt="logo" class="logo">
        </div>
        <!-- SUPPLIER AVATAR PLUS SMALL MENU -->
        <div class="col">
          <div class="avatar"></div>
        </div>
      </div>

      <!-- SEARCH FIELD-->
      <div class="row">
        <div class="col"></div>
        <div class="col-xl-4 col-lg-5 col-md-6">
          <div class="input-group searchWrap">
            <input type="text" ng-model="searchBar" ng-keyup="search()" class="form-control searchField" placeholder="Search for...">
            <span class="input-group-btn">
              <button class="btn searchBtn" type="button">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </span>
          </div>
        </div>
        <div class="col"></div>
      </div>
    </div>
  </section>
  <!--END OF TOP SECTION-->

  <!-- MOBILE NAVBAR -->

  <!-- END OF MOBILE NAVBAR -->

  <!--SELECTION CATEGORY, SORT BY-->
  <section class="selection">
    <div class="container">
      <div class="row justify-content-end">
        <div class="col-lg-2">
          <h4 class="text-center">Category:</h4>
          <select name="category" ng-model="searchType">
            <option value="All" selected>All</option>
            <option value="Pub">Pub</option>
            <option value="Beer">Beer</option>
          </select>
        </div>
        <div class="col-lg-3"></div>
        <div class="col-lg-2">
          <h4 class="text-center">Sort by:</h4>
          <select name="sortby">
            <option value="name" selected>Name</option>
            <option value="rating">Rating</option>
            <option value="price">Price</option>
          </select>
        </div>
      </div>
    </div>
  </section>

  <!--SEARCH RESULTS-->
  <section class="results">
    <div class="container">
      <div class="row">
      <!--SINGLE SEARCH RESULT -->
        <div class="col-lg-4 cardAnimation" ng-repeat="obj in results | filter: {'type' : searchType=='All' ? '' : searchType} | filter: searchBar">
          <div class="result beer text-center">
            <div class="logoWrapper">
              <div class="logo" ng-attr-style="background-image:url('{{obj.img}}');" ></div>
            </div>
            <h1>{{obj.name}}</h1>
            <h3>{{obj.origin}}</h3>
            <h3>{{obj.type}}</h3>
          </div>
        </div>
        <!--END OF SINGLE SEARCH RESULT -->
      </div>
    </div>
  </section>

  <!-- MAP MODAL -->
  <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="mapModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <!-- MODAL HEADER TITLE AND CLOSE BUTTON -->
          <h5 class="modal-title" id="mapModalLabel"><i class="fa fa-map-o" aria-hidden="true"></i> Map</h5>
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

  <!-- SCRIPTS-->
  <script src="js/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/velocity.min.js"></script>
  <script src="js/velocity.ui.min.js"></script>
  <script src="js/main.js"></script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhGP2z79jQ72iZ9EyfGElEO66f1D1U6RI&callback=initMap"></script>
</body>

</html>