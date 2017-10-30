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
        // No Point in loading each model when API is called
        //$this->load->model('drink_model');
        //$this->load->model('venue_model');
    }

    // Get all drinks API call
    // FYI CodeIgnitor recognises requests based on the end of the method, eg. _get, _post
    function allDrinks_get() {
        // check out is it better to load the models in constructor or the methods???
        $this->load->model('drink_model');
        // Gets drink model defined in models folder which then gets results from DB
        $result = $this->drink_model->getalldrinks();

        // Checks if we have the result and returns the http status 200 if not a 404
        if($result) {
            $this->response($result, 200);
        } else {
            $this->response('No Results Found', 404);
        }
    }

    // Get all venues API call, works the same as allDrinks_get
    function allVenues_get() {
        $this->load->model('venue_model');

        $all_venues = $this->venue_model->getallvenues();

        if($all_venues) {
            $this->response($all_venues, 200);
        } else {
            $this->response("No Results Found", 404);
        }
    }
}