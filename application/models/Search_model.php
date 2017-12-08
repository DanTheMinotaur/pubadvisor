<?php
# Inherit properties and methods from CodeIgniter Models
class Search_model extends CI_Model {
    # Create DB Connection based on connection settings
    function __construct() {
        # Inherit parent class constructor, for access to methods and properties for DB
        parent::__construct();
        $this->load->database();
    }

    public function search() {
        // QUERY DRINKS
        $this->db->select("p.productid as id, p.name, concat(c.prodcatname, ', ', p.country_of_origin) as info1, (select min(price) FROM pubproducts WHERE productid = p.productid) as info2, 'drink' as type, p.image");
        $this->db->from("product p, productcategories c");
        $this->db->where("p.prodcatid = c.prodcatid");
        $query1 = $this->db->get_compiled_select();
        // QUERY VENUES
        $this->db->select("pubid, name, address, (select round(avg(price), 2) FROM pubproducts WHERE pubid = pub.pubid), 'venue', image"); 
        $this->db->from("pub");
        $query2 = $this->db->get_compiled_select(); 
        //JOIN TOGETHER
        $query = $this->db->query($query1." UNION ".$query2." ORDER BY name");  
        

        // Return query results to function call
        if($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }

}