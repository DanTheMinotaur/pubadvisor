<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <title>Login and Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<?php
    if(isset($_SESSION['message'])) {
        //echo '<div class="message">' . $_SESSION['message'] . '</div>';
        //unset($_SESSION['message']);
        echo "Hello";
    }
?>
<div class="container">
    <?php echo form_open('admin/login') ?>
        <div class="form-group">
            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username">
        </div>
        <div class="form-group">
            <input type="password" name="password" id="password1" tabindex="2" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <input type="submit" name="submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                </div>
            </div>
        </div>
    </form>

</div>
</body>

</html>