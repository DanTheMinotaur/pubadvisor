<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 02/11/2017
 * Time: 18:03
 */

require(APPPATH.'/libraries/REST_Controller.php');

class Admin extends REST_Controller {
    function __construct() {
        parent::__construct();
        //$this->load->models('login_model');
    }


    public function index() {
        // Loads the views/login.php template and sets it to the index of Admin Controller
        $this->load->view('admin');
    }

    public function login_post() {
        // Loads the views/login.php template
        $this->load->view('login');
        $email = $this->input->post("username");
        $password = $this->input->post("password");

        // Checks if either email or pwd are empty
        if(!$email || !$password) {
            $this->response("Enter a valid username and password", 400);
        } else {
            // Loads the Login Model e.g. DB access
            $this->load->model('login_model');
            // Returns the accounts details as JSON string with status code 200
            // TODO Hashing
            $this->response($this->login_model->getAdminUserDetails($email, $password), 200);
        }
    }
}