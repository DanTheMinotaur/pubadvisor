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
    }


    public function index() {
        // Loads the views/login.php template and sets it to the index of Admin Controller
        //$this->load->view('admin');
    }

    public function login() {
        $this->load->view('login');
    }

    public function registration() {
        $this->load->view('registration');
    }

}