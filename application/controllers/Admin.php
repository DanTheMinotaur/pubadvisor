<?php
/**
 * Class Admin
 * Date: 02/12/2017
 * @author Daniel Devine
 * Controller Class for admin panel, handles validation and checking and creation of session data
 */
class Admin extends CI_Controller {
    /*
     * Contructor loads CI helper libaries
     */
    function __construct() {
        parent::__construct();
        $this->load->library(array('form_validation'));
        $this->load->helper(array('form', 'url'));
    }

    /**
     * Admin Panel Controller, checks if user is logged in
     */
    function index() {
        if($this->session->logged_in) {
            $this->load->view('admin');
        } else {
            redirect('admin/login');
        }
    }
    /*
     * Log in function, will check if user is logged in already and redirect to admin controller
     * Validates user data before submission and then checks the encrted password is a match
     * Will then return the users details to the current session allowing them to access the admin panel.
     */
    function login() {
        if($this->session->logged_in) {
            redirect('admin');
        }

        $this->form_validation->set_rules('username', 'Username', 'required|trim');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if(!$this->form_validation->run()) {
            $this->load->view('admin/login');
        } else {
            print('login sent.');

            $this->load->model('admin_model');

            $user = $this->admin_model->verifyLogin(strtolower($this->input->post('username')), $this->input->post('password'));

            // Check if log in details are valid
            if(!$user) {
                $this->session->error_message = 'Invalid Username or Password';
                //print('Invalid Username or Password');
                $this->load->view('admin/login');
            } else {
                $this->session->logged_in = TRUE;
                $this->session->mark_as_temp('logged_in', 1200); // Set logged in for 60 seconds.
                $this->session->name = $user->name;
                $this->session->username = $user->username;
                $this->session->email = $user->email;
                $this->session->profile_image = $user->image;
                $user = NULL; // Destroy User Data
                redirect('admin');
            }
        }
    }

    /*
     * Log out controller
     */

    function logout()
    {
        $this->session->unset_userdata('logged_in');
        redirect('home');
    }
    /*
     * Register Controller will add user data submitted from form and add user to database after it has been validated
     * Once data is validated it will encrypt the users password and store the details in the database
     */

    function register() {
        if($this->session->logged_in) {
            $this->session->message = "You'll need to be logged in Buddy";
            redirect('admin');
        }

        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('username', 'Username', 'required|trim');
        $this->form_validation->set_rules('password', 'Password', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|trim');

        // Loads register view
        if(!$this->form_validation->run()) {
            $this->load->view('admin/register');
        } else {
            $this->load->model('admin_model');

            $user_data = array(
                'name' => $this->input->post('name'),
                'username' => strtolower($this->input->post('username')),
                'password' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                'email' => strtolower($this->input->post('email')),
            );

            $user_data['image'] = $this->imageUploader('admin/', 'profileImage', $user_data['username']);

            if($this->admin_model->checkUserEmailExists($user_data['email'])) {
                $this->session->message = 'Email already Exists';
                print($this->session->message);
                $this->load->view('admin/register');
            } elseif ($this->admin_model->checkUsernameExists($user_data['username'])) {
                $this->session->message = 'Email already Exists';
                print($this->session->message);
                $this->load->view('admin/register');
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

    /*
     * Method will store image in specific place and return the location in string or return NULL if there was no image
     */

    private function imageUploader($location, $upload_data, $file_name){
        // Settings
        $config['upload_path'] = 'images/' . $location;
        $config['allowed_types'] = 'gif|jpg|png|svg|jpeg';
        $config['max_size']     = '3000';
        $config['file_name'] = $file_name;

        $this->load->library('upload', $config);

        if($this->upload->do_upload($upload_data)) {
            $file_data = $this->upload->data();
            return $config['upload_path'] . $file_data['file_name'];
        } else {
            return NULL;
        }
    }
}