<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 02/11/2017
 * Time: 20:13
 * Notes
 * http://php.net/manual/en/faq.passwords.php
 * https://www.phpclasses.org/blog/package/10087/post/1-secure-login-and-registration-system.html#what
 * http://www.kodingmadesimple.com/2014/08/how-to-create-login-form-codeigniter-mysql-twitter-bootstrap.html
 * This will retrieve the admin users details once they have been verified by the controller.
 */
class Login_model extends CI_Model {
    function __construct() {
        parent::__construct();
        $this->load->database();
    }

    // Returns all user data of the admin user.
    function getAdminUserDetails($email, $password) {
        $sql = "SELECT * FROM admin_users WHERE email = '$email' AND password = '$password'";
        $admin_user_data = $this->db->query($sql);
        return $admin_user_data->result_array();
    }
}