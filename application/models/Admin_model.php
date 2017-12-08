<?php
/**
 * Class Admin_model
 * Date: 20/11/2017
 * @author Daniel Devine
 * Model Class for logging in and registering new users
 * Model also contains the methods for CRUD functionality
 */

class Admin_model extends CI_Model {
    private $ADMIN_DB;

    /*
     * Loads the admin database profile
     */
    function __construct() {
        parent::__construct();
        // Load admin SQL details
        $this->ADMIN_DB = $this->load->database('admin', TRUE);
    }

    /*
     * Function to register user
     */
    function registerUser($user_data) {
        if($this->ADMIN_DB->insert('admin_users', $user_data)) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * Returns True if the username exists in the DB
     */
    function checkUsernameExists($username) {
        $this->ADMIN_DB->select('username');
        $this->ADMIN_DB->from('admin_users');
        $this->ADMIN_DB->where('username', $username);

        $user = $this->ADMIN_DB->get();

        if($user->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /*
     * Returns True if the users email exists in the DB
     */
    function checkUserEmailExists($email) {
        $this->ADMIN_DB->select('email');
        $this->ADMIN_DB->from('admin_users');
        $this->ADMIN_DB->where('email', $email);
        $user = $this->ADMIN_DB->get();

        if($user->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /*
     * Checks if the login details are valid
     * returns: userdata if valid, False if invalid
     */
    function verifyLogin($username, $password) {
        if($this->checkUsernameExists($username)) {
            $this->ADMIN_DB->select('*');
            $this->ADMIN_DB->from('admin_users');
            $this->ADMIN_DB->where('username', $username);

            $query = $this->ADMIN_DB->get();

            $user_data = $query->row();

            if(password_verify($password, $user_data->password)){
                return $user_data;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

    /*
     * Database Model for CREATE
     */
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

    /*
     * Database Model for UPDATE
     */
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
     * Database Model for DELETE
     */


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