<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 02/12/2017
 * Time: 15:10
 */

class Admin extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->helper(array('form', 'url'));
    }

    function index() {
        print("Hello");
        $this->load->view('admin');
    }

    function login() {

        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if(!$this->form_validation->run()) {
            $this->load->view('login');
        } else {
            print('login sent.');

            $this->load->model('admin_model');
        }
    }

    function register() {
        //$this->load->view('register');

        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');

        // Loads register view
        if(!$this->form_validation->run()) {
            $this->load->view('register');
        } else {
            print('validated');
            //$this->load->view('login');

            $this->load->model('admin_model');

            $user_data = array(
                'name' => $this->input->post('name'),
                'username' => strtolower($this->input->post('username')),
                'password' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                'email' => strtolower($this->input->post('email'))
            );

            if($this->admin_model->checkUserEmailExists($user_data['email'])) {
                print('Email already Exists');
                $this->load->view('register');
            } elseif ($this->admin_model->checkUsernameExists($user_data['username'])) {
                print('Username Already Exists');
                $this->load->view('register');
            } else {
                if($this->admin_model->registerUser($user_data)) {
                    print('User Craeted');
                    $this->load->view('login');
                } else {
                    print('Could not create user');
                    $this->load->view('register');
                }
            }
        }
    }
}