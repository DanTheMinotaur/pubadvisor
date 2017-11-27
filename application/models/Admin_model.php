<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 20/11/2017
 * Time: 22:05
 */

class Admin_model extends CI_Model {
    private $ADMIN_DB;

    function __construct() {
        parent::__construct();
        // Load admin SQL details
        //$admin_db = $this->load->database('admin', TRUE);
        $this->ADMIN_DB = $this->load->database('admin', TRUE);
    }

    function test() {
        //$this->load->database('admin', TRUE);
        if($this->admin_db->get('Product')) {
            return true;
        } else {
            return false;
        }
    }

    // Drinks

    function addDrink($data) {
        //$DB = $this->load->database('admin', TRUE);
        if($this->ADMIN_DB->insert('product', $data)) {
            return true;
        } else {
            return false;
        }
    }

    function addDrinkCategory($data) {
        if($this->ADMIN_DB->insert('productcategories', $data)) {
            return true;
        } else {
            return false;
        }
    }

    function addVenue($data) {
        if($this->ADMIN_DB->insert('pub', $data)) {
            return true;
        } else {
            return false;
        }
    }

    function addVenueCategory($data) {
        if($this->ADMIN_DB->insert('pubcategories', $data)) {
            return true;
        } else {
            return false;
        }
    }

    function addInventory($data) {
        if($this->ADMIN_DB->insert('pubproducts', $data)) {
            return true;
        } else {
            return false;
        }
    }
}