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
        $this->load->model('drink_model');
    }

    // Get all drinks API call
    function allDrinks_get() {
        $result = $this->drink_model->getalldrinks();

        if($result) {
            $this->response($result, 200);
        } else {
            $this->response('No Results Found', 404);
        }
    }
}