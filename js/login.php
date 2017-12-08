<?php $this->load->view('includes/header.php') ?>

    <body>
    <div class="pacelogo"><img src="<?php echo base_url(); ?>images/icon.svg" alt="logo"></div>


    <div class="pacewrap"> <!-- THIS IS CONTAINER FOR LOADER -->
        <?php $this->load->view('includes/top.php') ?>

        
        <section class="login">
        <div class="container">
        <div class="col-md-4 offset-md-4">
        <h1 class="text-center">Admin log in</h1>
        <?php echo validation_errors(); ?>
        <?php echo form_open('admin/login') ?>
            <div class="form-group">
                <label for="usernameLogIn">Username</label>
                <input type="text" name="username" id="usernameLogIn" class="form-control" placeholder="MyCheeseGrater12" required pattern="^\S{3,20}$">
            </div>
            <div class="form-group">
                <label for="passwordLogIn">Password</label>
                <input type="password" name="password" id="passwordLogIn" class="form-control" placeholder="Password1234" required>
            </div>
            <div class="form-group">
                <div class="col-sm-6" style="float: none;margin: 0 auto;">
                    <input type="submit" name="submit" id="login-submit" class="form-control btn btn-primary" value="Log In">
                </div>
            </div>
        </form>
        <p class="text-center">Still don't have an account? <a href="/admin/register">Register now</a></p>
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
    </div>
    <?php $this->load->view('includes/footer.php') ?>