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
        $this->load->view('admin');
    }

    public function login() {
        $this->load->view('login');
    }

    public function registration() {
        $this->load->helper(array('form', 'url'));
        $this->load->view('registration');


        if($this->input->post('register')) {
            $this->load->library('form_validation');

            $user_data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'email' => $this->input->post('email'),
                'password' => $this->input->post('password'),
            );

            $this->load->model('login_model');

            if($this->login_model->registerUser($user_data)) {
                $this->load->view('admin');
            } else {
                $this->load->view('registration');
            }
        }


    }

}