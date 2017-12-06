<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 29/11/2017
 * Time: 21:19
 */
$this->load->view('includes/header');
$this->load->view('includes/top');
?>
<main class="container">
    <section class="login col-md-8" style="float: none;margin: 0 auto;">
        <h1>Log In</h1>
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

    </section>
</main>
<?php $this->load->view('includes/footer'); ?>