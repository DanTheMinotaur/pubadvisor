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
        // Load CI Library and Helper Classes
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        //$this->form_validation->set_rules('name', 'Name', 'required');
        //$this->form_validation->set_rules('username', 'Username', 'required');
        //$this->form_validation->set_rules('email', 'Email', 'required');
        //$this->form_validation->set_rules('password', 'Password', 'required');



        if($this->form_validation->run() == FALSE) {
            $this->load->view('registration');
        } else {
            $this->load->view('home');
        }

        /*
        if($this->form_validation->run() == FALSE) {
            $this->load->view('registration');
        } else {
            $this->load->view('home');
            /*
            if($this->input->post('register')) {
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

        }*/
    }
}