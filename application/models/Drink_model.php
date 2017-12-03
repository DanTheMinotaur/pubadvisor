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

    public function allDrinks() {
        // Query Database
        $this->db->select('product.productid AS id, product.name, product.percentage, product.country_of_origin, product.quantity, product.image, productcategories.prodcatname AS type');
        $this->db->from('product');
        $this->db->join('productcategories', 'product.prodcatid = productcategories.prodcatid', 'inner');
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
        $this->db->select('product.productid, product.name, product.country_of_origin, product.percentage, productcategories.prodcatname AS type, product.image');
        $this->db->from('product');
        $this->db->join('productcategories', 'product.prodcatid = productcategories.prodcatid', 'inner');
        $this->db->where("product.productid = $id");

        $temp = $this->db->get();

        if($temp->num_rows() > 0) {
            $this->db->select("p.price, v.name, v.pubid as id");
            $this->db->from("pubproducts p, pub v");
            $this->db->where("p.pubid = v.pubid AND p.productid = $id");
            $this->db->order_by('p.price');
            $prices = $this->db->get();
            $results = array('info' => $temp->result_array(), 'prices' => $prices->result_array());
            return $results;
        } else {
            return false;
        }
    }
}