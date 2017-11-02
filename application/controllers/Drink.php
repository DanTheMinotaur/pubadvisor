<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 20:47
 */

// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

class Drink extends REST_Controller {
    function __construct() {
        parent::__construct();
    }

    // Get all drinks API call
    // FYI CodeIgnitor recognises requests based on the end of the method, eg. _get, _post
    function index_get() {
        // check out is it better to load the models in constructor or the methods???
        $this->load->model('drink_model');
        // Gets drink model defined in models folder which then gets results from DB
        $result = $this->drink_model->getAllDrinks();

        // Checks if we have the result and returns the http status 200 if not a 404
        if($result) {
            $this->response($result, 200);
        } else {
            $this->response('No Results Found', 404);
        }
    }

    function drinkByName_get() {

        $drink_name = $this->get('name');

        if(!$drink_name) {
            $this->response('No Drink Specified, why would you do that?', 400);
        } else {
            //$drink_details =
        }
        // CONTINUE HERE -- Had to stop because think DB needs more info such as
        // URL Slug for drinks, probably implement this in admin panel so drink name automatically gets slugged
        // Image location
        // Need to figure out how angualr handles the images.
    }
}