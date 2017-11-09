<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 17:35
 */
// Test controller for checking if simple actions are working.
class Test extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function index() {
        echo "Index";
    }

    public function hello() {
        echo "Hello World";
    }

    // Need to enable PDO Driver in php.ini https://stackoverflow.com/questions/39609511/how-to-connect-to-postgresql-in-codeigniter-3
    // remove before production
    public function dbcheck() {
            echo "DB Connection Estabished";

            $query = $this->db->get('product');

            echo print_r($query->result_array());
    }

    public function phpdetails() {
        echo phpInfo();
    }
}