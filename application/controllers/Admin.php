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
        print('login');
        $this->load->view('login');
    }

    function register() {
        $this->load->view('register');

        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');

        if(!$this->form_validation->run()) {
            print('need some data dude');
            $this->load->view('register');
        } else {
            print('validated');
            $this->load->view('login');
        }
    }
}