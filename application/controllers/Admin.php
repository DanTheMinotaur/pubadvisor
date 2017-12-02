<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 02/11/2017
 * Time: 18:03
 */

class Admin extends CI_Controller {
    function __construct() {
        parent::__construct();
        // Load CI Library and Helper Classes
        $this->load->library('form_validation');
        $this->load->helper(array('form', 'url'));
    }


    public function index() {

    }
}