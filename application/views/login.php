<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <title>Login and Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="container">

    <form id="login-form" method="post" role="form" style="display: block;">
        <div class="form-group">
            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Email" value="">
        </div>
        <div class="form-group">
            <input type="password" name="password" id="password1" tabindex="2" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <input type="button" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                </div>
            </div>
        </div>
    </form>

</div>
</body>

</html>