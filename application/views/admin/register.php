<?php $this->load->view('includes/header.php') ?>

    <body>
    <div class="pacelogo"><img src="<?php echo base_url(); ?>images/icon.svg" alt="logo"></div>


    <div class="pacewrap"> <!-- THIS IS CONTAINER FOR LOADER -->
        <?php $this->load->view('includes/top.php') ?>

        
        <section class="login">
        <div class="container">
        <div class="col-md-6 offset-md-3">
        <h1 class="text-center">Admin Registration</h1>
        <?php echo validation_errors(); ?>
        <?php echo form_open_multipart('admin/register') ?>
            <div class="form-group">
                <label for="nameRegister">Name [This should be pretty clear]</label>
                <input type="text" class="form-control" id="nameRegister" name="name" placeholder="Paul Hayes" required>
            </div>
            <div class="form-group">
                <label for="usernameRegister">Username [Greater Than 3 Characters and no spaces]</label>
                <input type="text" class="form-control" id="usernameRegister" name="username" placeholder="MrMack234" required pattern="^\S{3,20}$">
            </div>
            <div class="form-group">
                <label for="emailResister">Email [That thing you use to sign up to things]</label>
                <input type="email" class="form-control" id="emailResister" name="email" placeholder="example@example.com" required>
            </div>
            <div class="form-group">
                <label for="passwordResister">Password [7 Characters or more]</label>
                <input type="password" class="form-control" id="passwordResister"  name="password" placeholder="Password" required  pattern="^\S{7,20}$">
            </div>
            <div class="form-group">
                <label for="ProfileImageRegister">Profile Picture</label>
                <input type="file" class="form-control-file" id="ProfileImageRegister" name="profileImage" placeholder="Password">
            </div>
            <!--<input type="submit" name="submit" class="btn-primary" value="Submit">-->
            <button type="submit" name="submit" class="btn btn-primary">Register</button>
        </form>
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