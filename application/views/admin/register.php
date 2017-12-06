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
    <section class="register col-md-8" style="float: none;margin: 0 auto;">
        <h1>Registration</h1>
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
    </section>
</main>
<?php $this->load->view('includes/footer'); ?>
