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

    function updateDrink($id, $data) {
        if($this->ADMIN_DB->where('productid', $id)){
            if($this->ADMIN_DB->update('product', $data)){
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    function updateVenue($id, $data) {
        if($this->ADMIN_DB->where('pubid', $id)){
            if($this->ADMIN_DB->update('pub', $data)){
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    function updateInventory($id, $data) {
        if($this->ADMIN_DB->where('pubprodid', $id)){
            if($this->ADMIN_DB->update('pubproducts', $data)){
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /*
     * Helper function for deleting records from DB
     * */

    private function deleteRecord($id, $column_id_name, $table_name) {
        if($this->ADMIN_DB->where($column_id_name, (int)$id)) {
            if($this->ADMIN_DB->delete($table_name)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    function deleteDrink($id){
        return $this->deleteRecord($id, 'productid', 'product');
    }

    function deleteInventory($id) {
        return $this->deleteRecord($id, 'pubprodid', 'pubproducts');
    }

    function deleteVenue($id) {
        return $this->deleteRecord($id, 'pubid', 'pub');
    }

    function deleteDrinkCategory($id) {
        return $this->deleteRecord($id, 'productid', 'product');
    }

    function deleteVenueCategory($id) {
        return $this->deleteRecord($id, 'pubcatid', 'pubcategories');
    }
}