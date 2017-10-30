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


}