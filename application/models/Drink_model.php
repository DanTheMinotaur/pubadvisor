<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 18:36
 */

# Inherit properties and methods from CodeIgniter Models
class Drink_model extends CI_Model {
    # Create DB Conection based on connection settings
    function __construct() {
        # Ingerit parent class constructor, for access to methods and properties for DB
        parent::__construct();
        $this->load->database();
    }

    public function getalldrinks() {

        $this->db->select('name, percentage, country_of_origin');
        $this->db->from('product');
        $this->db->order_by('name');

        $query = $this->db->get();

        if($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }
}