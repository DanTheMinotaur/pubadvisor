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
    <section class="register">
        <h1>Registration</h1>
        <?php echo validation_errors(); ?>
        <?php echo form_open('admin/register') ?>
        <div class="form-group">
            <label for="nameRegister">Name</label>
            <input type="text" class="form-control" id="nameRegister" name="name" placeholder="Paul Hayes">
        </div>
        <div class="form-group">
            <label for="usernameRegister">Username</label>
            <input type="text" class="form-control" id="usernameRegister" name="username" placeholder="MrMack234">
        </div>
        <div class="form-group">
            <label for="emailResister">Email</label>
            <input type="email" class="form-control" id="emailResister" name="email" placeholder="example@example.com">
        </div>
        <div class="form-group">
            <label for="passwordResister">Password</label>
            <input type="password" class="form-control" id="passwordResister"  name="password" placeholder="Password">
        </div>

        <!--<input type="submit" name="submit" class="btn-primary" value="Submit">-->
        <button type="submit" name="submit" class="btn btn-primary">Register</button>
        </form>
    </section>

</main>
<?php $this->load->view('includes/footer'); ?>
