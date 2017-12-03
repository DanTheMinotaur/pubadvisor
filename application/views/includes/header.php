<!doctype html>
<html lang="en">
<head>
  <title>Pub Advisor</title>
  <?php
  //checking if page is main page and if yes applying loader script and styling
  /*
  if($_SERVER['REQUEST_URI'] === '/' && !isset($_SESSION['loaded']))
  {
    $_SESSION['loaded'] = true;
    echo '<script src="js/pace.min.js"></script>
    <link rel="stylesheet" href="css/loader.css">
    <script>
    Pace.on("hide", function(){
      var logo = document.getElementsByClassName("pacelogo");
      logo[0].className += " out";
    });
    </script>';
  }
  */
  ?>-->
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS and Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.css">
  <link rel="stylesheet" href="<?php echo base_url(); ?>css/font-awesome.min.css">
  <!-- MAIN STYLING -->
  <link rel="stylesheet" href="<?php echo base_url(); ?>css/style.css">
  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
  <!-- LOAD ANGULAR -->
  <script src="<?php echo base_url(); ?>js/angular.min.js"></script>
  <script src="<?php echo base_url(); ?>js/angular-animate.min.js"></script>
  <script src="<?php echo base_url(); ?>js/search.js"></script>
</head>