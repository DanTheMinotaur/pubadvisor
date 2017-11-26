<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 20:47
 */

// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

class Drink extends CI_Controller {
    function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('includes/header.php');
        $this->load->view('includes/top.php');
        $this->load->view('unused/beer.php');
        $this->load->view('includes/footer.php');
    }
}