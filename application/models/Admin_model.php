<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 20/11/2017
 * Time: 22:05
 */

class Admin_model extends CI_Model {
    function __construct() {
        parent::__construct();
        // Load admin SQL details
        $this->load->database('admin', TRUE);
    }

    function test() {
        return 'working';
    }

    // Drinks

    function addDrink($data) {

        if($this->db->insert('Product', $data)) {
            return true;
        } else {
            return false;
        }
    }
}