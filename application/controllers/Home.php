<?php
/**
 * Created by PhpStorm.
 * User: Daniel
 * Date: 01/11/2017
 * Time: 22:16
 */

// Controller for homepage
class Home extends CI_Controller {
    public function index() {
        $this->load->view('home');
        // This is for static files and root directory
        $this->load->helper('url');
    }

    /*
     * Passes value for searching and adds it to the session for navigating to page
     */
    public function setquery()
    {
        $query = $this->input->post("q");
        $this->session->query = $query;
    }
}