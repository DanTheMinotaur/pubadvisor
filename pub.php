<?php include 'includes/header.php' ?>

<body>

    <?php include 'includes/top.php' ?>

    <!--PUB INFO-->
    <section class="dynamic_page">
        <div class="container">


            <?php 
        //echo "<p>" . $_GET['q'] . "</p>";    //this page is getting get parameter q with name according which you gonna create template
        ?>

            <div class="row align-items-center">
                <div class="col-sm-4 col-lg-2">
                    <img src="/images/drunken_fish.png" alt="logo">
                </div>
                <div class="col-sm-8 col-lg-10">
                    <h1>Drunken Fish</h1>
                    <p>IFSC, Dublin 1</p>
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
                        <tr>
                            <td>
                                <a href="/beer/heineken">Heineken</a>
                            </td>
                            <td>4.95</td>
                            <td>Lager</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="/beer/heineken">Heineken</a>
                            </td>
                            <td>4.95</td>
                            <td>Lager</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="/beer/heineken">Heineken</a>
                            </td>
                            <td>4.95</td>
                            <td>Lager</td>
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

    <?php include 'includes/footer.php' ?>