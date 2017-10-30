<?php include 'includes/header.php' ?>

<body>

  <?php include 'includes/top.php' ?>

  <section class="dynamic_page">
    <div class="container text-center">
        <h1>Error 404: We don't have this page, sorry :(</h1>
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