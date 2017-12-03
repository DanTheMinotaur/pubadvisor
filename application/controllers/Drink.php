<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 20:47
 */
class Drink extends CI_Controller {
    function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('includes/header.php');
        $this->load->view('includes/top.php');
        $this->load->view('drink.php');
        $this->load->view('includes/footer.php');
    }
}