<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 20/11/2017
 * Time: 22:01
 */

// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

class Admin_api extends REST_Controller {
    function __construct() {
        parent::__construct();
    }

    function test_get() {
        $this->load->model('admin_model');
        $result = $this->admin_model->test();
        $this->response($result, 200);
    }

    function addDrink_post(){
        $this->load->model('admin_model');

        $drink_data = array(
            'name' => $this->post('name'),
            'percentage' => $this->post('percentage'),
            'country_of_origin' => $this->post('country')
        );

        foreach($drink_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        $result = $this->admin_model->addDrink($drink_data);

        if($result) {
            $this->response('drink added.', 200);
        } else {
            $this->response('Data could not be saved, because you\' an ass.', 501);
        }

    }
}