<?php include 'includes/header.php' ?>
<!-- LOAD ANGULAR -->
<script src="/js/angular.min.js"></script>
<script src="/js/angular-animate.min.js"></script>
<script src="/js/search.js"></script>
</head>

<body ng-app="paSearch" ng-controller="searchCtrl">

  <?php include 'includes/top.php' ?>

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
          <div class="result beer text-center" ng-click="goTo(obj.type | lowercase, obj.name | lowercase)">
            <div class="logoWrapper">
              <div class="logo" ng-attr-style="background-image:url('{{obj.img}}');"></div>
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

  <?php include 'includes/footer.php' ?>