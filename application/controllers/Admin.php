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
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
    }

    function index() {
        if($this->session->logged_in) {
            $this->load->view('admin');
            print($this->session->logged_in);
            print($this->session->name);
        } else {
            redirect('admin/login');
        }

    }

    function login() {

        if($this->session->logged_in) {
            redirect('admin');
        }

        $this->form_validation->set_rules('username', 'Username', 'required|trim');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if(!$this->form_validation->run()) {
            $this->load->view('login');
        } else {
            print('login sent.');

            $this->load->model('admin_model');

            $user = $this->admin_model->verifyLogin(strtolower($this->input->post('username')), $this->input->post('password'));

            // Check if log in details are valid
            if(!$user) {
                print('Invalid Username or Password');
                $this->load->view('login');
            } else {
                $this->session->logged_in = TRUE;
                $this->session->mark_as_temp('logged_in', 60); // Set logged in for 60 seconds.
                $this->session->name = $user->name;
                $this->session->username = $user->username;
                $this->session->email = $user->email;
                $user = NULL; // Destroy User Data
                redirect('admin');
            }
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
                    redirect('admin/login');
                } else {
                    print('Could not create user');
                    $this->load->view('register');
                }
            }
        }
    }
}