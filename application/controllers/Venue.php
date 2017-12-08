<?php
/**
 * Class Admin
 * Date: 30/10/2017
 * @author Daniel Devine
 * Controller Class for Venue Page, loads views.
 */
class Venue extends CI_Controller {
    function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('includes/header.php');
        $this->load->view('includes/top.php');
        $this->load->view('venue.php');
        $this->load->view('includes/footer.php');
    }
}