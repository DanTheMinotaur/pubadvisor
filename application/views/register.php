<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 29/11/2017
 * Time: 21:19
 */
    include 'includes/header.php';
?>
<h1>Registration</h1>
<?php echo validation_errors(); ?>

<?php echo form_open('login/register') ?>

<!--<form method="post" action="<?php// echo base_url() ?>admin/register">-->
    <div class="form-group">
        <input type="text" class="form-control" name="name" placeholder="Name">
        <input type="email" class="form-control" name="email" placeholder="Email">
        <input type="text" class="form-control" name="username" placeholder="Username">
        <input type="password" class="form-control" name="password" placeholder="Password">
    </div>
    <div class="form-group">
        <input type="submit" name="submit" class="btn-primary" value="Submit"/>
    </div>
</form>
<?php
include 'includes/footer.php';
?>
