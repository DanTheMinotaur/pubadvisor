<?php include 'includes/header.php' ?>
</head>

<body ng-app="paSearch" ng-controller="searchCtrl">

  <?php include 'includes/top.php' ?>

  <!--BEER INFO-->
  <section class="results">
    <div class="container">

      <section class="pub">
        <?php 
        //echo "<p>" . $_GET['q'] . "</p>";    //this page is getting get parameter q with name according which you gonna create template
        ?>

        <div class="row align-items-center">
          <div class="col-sm-2">
            <img src="/images/heineken.svg" alt="logo" width="200">
          </div>
          <div class="col-sm-10">
            <h1>Heineken</h1>
            <p>5% alc</p>
            <p>Lager</p>
            <p>Netherlands</p>
          </div>
        </div>
        <div class="col-sm-12">
          <table class="table table-dark table-striped">
            <thead>
              <tr>
                <th scope="col">Price</th>
                <th scope="col">Venue</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>4.95</td>
                <td>
                  <a href="/pub/drunken-fish">Drunken Fish</a>
                </td>
              </tr>
              <tr>
                <td>4.95</td>
                <td>
                  <a href="/pub/drunken-fish">Drunken Fish</a>
                </td>
              </tr>
              <tr>
                <td>4.95</td>
                <td>
                  <a href="/pub/drunken-fish">Drunken Fish</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
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