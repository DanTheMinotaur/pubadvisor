<?php

/**
 * Class Admin
 * Date: 30/10/2017
 * @author Daniel Devine
 * Controller for Public Rest API, uses HTTP GET Requests to return data and returns relevant status codes.
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

    /*
     * Search Model
     */

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
     *
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

    /*
     * Gets Pub By ID returns the data
     */
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
}