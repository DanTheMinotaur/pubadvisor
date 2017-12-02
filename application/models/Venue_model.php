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

    function venueByID($id) {
        $this->db->select('pub.name, pub.address, pub.location, pub.image, pubcategories.pubcatname');
        $this->db->from('pub');
        $this->db->join('pubcategories', 'pub.pubcatid = pubcategories.pubcatid', 'inner');
        $this->db->where("pub.pubid = $id");

        $result = $this->db->get();

        if($result->num_rows() > 0) {
            return $result->result_array();
        } else {
            return 'No matches found';
        }
    }
}