<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 02/12/2017
 * Time: 14:35
 */

class Login extends CI_Controller {
    function __construct() {
        parent::__construct();
        // Load CI Library and Helper Classes
        $this->load->library('form_validation');
        $this->load->helper(array('form', 'url'));
    }

    function index() {
        $this->load->view('register');
    }

    function register() {
        print("Register");
    }
}