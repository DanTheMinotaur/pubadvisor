<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 20:43
 */

// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

class Venue extends REST_Controller {
    function __construct() {
        parent::__construct();
    }

    public function index_get() {
        $this->load->model('venue_model');

        $all_venues = $this->venue_model->getallvenues();

        if($all_venues) {
            $this->response($all_venues, 200);
        } else {
            $this->response("No Results Found", 404);
        }
    }
}