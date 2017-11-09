<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 18:36
 */

# Inherit properties and methods from CodeIgniter Models
class Drink_model extends CI_Model {
    # Create DB Connection based on connection settings
    function __construct() {
        # Inherit parent class constructor, for access to methods and properties for DB
        parent::__construct();
        $this->load->database();
    }

    public function getAllDrinks() {
        // Query Database
        $this->db->select('name, percentage, country_of_origin');
        $this->db->from('product');
        $this->db->order_by('name');

        $query = $this->db->get();

        // Return query results to function call
        if($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }
    
    public function getDrinkByID($id) {
        $this->db->select('product.productid, product.name, product.country_of_origin, product.percentage, categories.name AS type');
        $this->db->from('product');
        $this->db->join('productcategories', 'product.prodcatid = productcategories.prodcatid', 'inner');
        $this->db->join('categories', 'categories.catid = productcategories.catid', 'inner');
        $this->db->where("product.productid = $id");

        $results = $this->db->get();

        if($results->num_rows() > 0) {
            return $results->result_array();
        } else {
            return 'No matches found';
        }
    }
}