<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 30/10/2017
 * Time: 19:42
 */
// Class for getting information on Venues
class Venue_model extends CI_Model {
    # Create DB Connection based on connection settings
    function __construct() {
        # Inherit parent class constructor, for access to methods and properties for DB
        parent::__construct();
        $this->load->database();
    }

    /*
     * Returns all venues as an associative array
     */
    function allVenues() {
        $this->db->select('pubid AS id, name, address, location, image');
        $this->db->from('pub');

        $query = $this->db->get();

        if($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }

    /*
    * Returns venue by id
    */
    function venueByID($id) {
        $this->db->select('pub.name, pub.address, pub.location, pub.image, pubcategories.pubcatname');
        $this->db->from('pub');
        $this->db->join('pubcategories', 'pub.pubcatid = pubcategories.pubcatid', 'inner');
        $this->db->where("pub.pubid = $id");

        $temp = $this->db->get();

        if($temp->num_rows() > 0) {
            $this->db->select("pp.pubprodid as invid, p.productid as id, p.name, pp.price, pc.prodcatname as type");
            $this->db->from("product p, pubproducts pp, productcategories pc");
            $this->db->where("p.prodcatid = pc.prodcatid and p.productid = pp.productid and pp.pubid = $id");
            $this->db->order_by('p.name');
            $prices = $this->db->get();
            $results = array('info' => $temp->result_array(), 'prices' => $prices->result_array());
            return $results;
        } else {
            return false;
        }
    }
}