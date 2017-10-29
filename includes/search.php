<?php
//setting response to json
header('Content-Type: application/json');

//I'm creating array here and populating with another arrays but you probably will populate it by some object created from class but anyway i think the better solution is to sort them in AngularJS! so you returing whole thing! not specified stuff
$arr = array();
array_push($arr, array("name"=>"Heineken", "type"=>"Beer", "origin"=>"Holland", "img" => "images/heineken.svg"));
array_push($arr, array("name"=>"Drunken Fish", "type"=>"Pub", "origin"=>"Korea", "img" => "images/drunken_fish.png"));
array_push($arr, array("name"=>"Heineken", "type"=>"Beer", "origin"=>"Holland", "img" => "images/heineken.svg"));
array_push($arr, array("name"=>"Drunken Fish", "type"=>"Pub", "origin"=>"Korea", "img" => "images/drunken_fish.png"));
array_push($arr, array("name"=>"Heineken", "type"=>"Beer", "origin"=>"Holland", "img" => "images/heineken.svg"));
array_push($arr, array("name"=>"Drunken Fish", "type"=>"Pub", "origin"=>"Korea", "img" => "images/drunken_fish.png"));

//get check
if( isset($_GET['query']) && $_GET['query'] === "gimme")
{
    echo json_encode($arr);
}

?>