<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 19:14
 */
// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

class Api extends REST_Controller {
    function __construct() {
        parent::__construct();
    }

    /*
     * Drink API calls
     *
     * */

    // Get all drinks API call
    // FYI CodeIgnitor recognises requests based on the end of the method, eg. _get, _post
    function allDrinks_get() {
        // check out is it better to load the models in constructor or the methods???
        $this->load->model('drink_model');
        // Gets drink model defined in models folder which then gets results from DB
        $result = $this->drink_model->allDrinks();

        // Checks if we have the result and returns the http status 200 if not a 404
        if($result) {
            $this->response($result, 200);
        } else {
            $this->response('No Results Found', 404);
        }
    }

    function search_get() {
        // check out is it better to load the models in constructor or the methods???
        $this->load->model('search_model');
        // Gets drink model defined in models folder which then gets results from DB
        $result = $this->search_model->search();

        // Checks if we have the result and returns the http status 200 if not a 404
        if($result) {
            $this->response($result, 200);
        } else {
            $this->response('No Results Found', 404);
        }
    }

    function drinkByID_get() {
        $drink_id = $this->get('id');
        $this->load->model('drink_model');
        if(!$drink_id) {
            $this->response('No ID specified.', 400);
        } else {
            $result = $this->drink_model->getDrinkByID($drink_id);
            if($result) {
                $this->response($result, 200);
            } else {
                $this->response("Invalid ID", 400);
            }
        }
    }

    /*
     * Venue API calls
     * */

    // Get all venues API call, works the same as allDrinks_get
    function allVenues_get() {
        $this->load->model('venue_model');

        $all_venues = $this->venue_model->allVenues();

        if($all_venues) {
            $this->response($all_venues, 200);
        } else {
            $this->response("No Results Found", 404);
        }
    }

    function venueByID_get() {
        $venue_id = $this->get('id');
        $this->load->model('venue_model');

        if(!$venue_id) {
            $this->response('No ID Specified', 400);
        } else {
            $result = $this->venue_model->venueByID($venue_id);
            if($result) {
                $this->response($result, 200);
            } else {
                $this->response("Invalid ID", 400);
            }
        }
    }

    /*
     * Administration API -- TODO move this to own APi
     *
     * */

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