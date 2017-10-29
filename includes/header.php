<?php 
session_start(); //starting session just to try to emulate that admin is logged
$_SESSION['logged'] = true; //not logget type false
?>

<!doctype html>
<html lang="en">

<head>
    <title>Pub Advisor</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS and Font Awesome -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <!-- MAIN STYLING -->
    <link rel="stylesheet" href="/css/style.css">
    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]--