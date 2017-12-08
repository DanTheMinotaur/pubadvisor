<?php

// Include CodeIgniter REST Controller
require(APPPATH.'/libraries/REST_Controller.php');

/**
 * Class Admin_api
 * Date: 20/11/2017
 * @author Daniel Devine
 * Class inherits from the codeigniter REST Server @reference https://github.com/chriskacerguis/codeigniter-restserver
 * Class is based off REST Server each method uses HTTP Methods and returns relevant status code e.g. 200 [Success], 404 [Not Found], 401 [Invalid Data],  50* [Server Issue]
 */
class Admin_api extends REST_Controller {
    /*
     * Contructor Method loads the admin model [db] class
     */
    function __construct() {
        parent::__construct();
        $this->load->model('admin_model');
    }

    /*
     * HTTP POST METHOD For adding new items to Database
     */
    function addDrink_post(){
        $drink_data = array(
            'name' => $this->post('name'),
            'percentage' => $this->post('percentage'),
            'country_of_origin' => $this->post('country'),
            'quantity' => $this->post('quantity'),
            'prodcatid' => $this->post('cat_id'),
            'image' => $this->post('image')
        );

        // Check and make sure that data is not empty
        foreach($drink_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        //$result = $this->admin_model->addDrink($drink_data);

        if($this->admin_model->addDrink($drink_data)) {
            $this->response('drink added.', 200);
        } else {
            $this->response('Data could not be saved, because you\'re an ass.', 501);
        }
    }

    /*
     * Method to add a drink category
     */

    function addDrinkCategory_post() {
        $drink_category_data = array(
            'prodcatname' => $this->post('name'),
            'description' => $this->post('description'),
            'image' => $this->post('image')
        );

        if(!$drink_category_data['prodcatname']) {
            $this->response("You need a name for a category", 400);
        }

        if($this->admin_model->addDrinkCategory($drink_category_data)) {
            $this->response('Category Added', 200);
        } else {
            $this->response('Something went wrong, go fix it.', 501);
        }
    }

    /*
     * Add Venue e.g. Pubs
     */
    function addVenue_post() {
        $venue_data = array(
            'name' => $this->post('name'),
            'address' => $this->post('address'),
            'location' => $this->post('location'),
            'pubcatid' => $this->post('pubcatid'),
            'image' => $this->post('image')
        );

        foreach ($venue_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it...");
            }
        }

        // ADD INSERT
        if($this->admin_model->addVenue($venue_data)){
            $this->response('Venue Added', 200);
        } else {
            $this->response('Something went wrong, go fix it', 501);
        }
    }
    /*
     * Add Venue Category
     */
    function addVenueCategory_post() {
        $category_data = array(
            'pubcatname' => $this->post('name'),
            'image' => $this->post('image')
        );

        if(!$category_data['pubcatname']) {
            $this->response('The Category needs a name atleast, pfhhhh...', 400);
        }


        if($this->admin_model->addVenueCategory($category_data)) {
            $this->response('Venue Category Added', 200);
        } else {
            $this->response('Something went wrong, go fix it', 501);
        }
    }

    /*
     * Adds a product to a pub
     */

    function addInventory_post() {
        $drink_data = array(
            'price' => $this->post('price'),
            'pubid' => $this->post('pubid'),
            'productid' => $this->post('productid')
        );

        foreach($drink_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        if($this->admin_model->addInventory($drink_data)) {
            $this->response('Product added to inventory', 200);
        } else {
            $this->response('Something went wrong, go fix it', 501);
        }
    }

    /*
     * HTTP PUT Methods for editing data in the database
     * Updates a drink already in the database
     */
    function updateDrink_put(){
        $drink_data = array(
            'productid' => $this->put('id'),
            'name' => $this->put('name'),
            'percentage' => $this->put('percentage'),
            'country_of_origin' => $this->put('country'),
            'quantity' => $this->put('quantity'),
            'prodcatid' => $this->put('cat_id'),
            'image' => $this->put('image')
        );

        // Check and make sure that data is not empty
        foreach($drink_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        if($this->admin_model->updateDrink($drink_data['productid'], $drink_data)) {
            $this->response('Drink Updated.', 200);
        } else {
            $this->response('Drink info could not be updated', 501);
        }
    }

    /*
     * Updates Venue, e.g Pub
     */

    function updateVenue_put() {
        $venue_data = array(
            'pubid' => $this->put('id'),
            'name' => $this->put('name'),
            'address' => $this->put('address'),
            'location' => $this->put('location'),
            'pubcatid' => $this->put('pubcatid'),
            'image' => $this->put('image')
        );

        foreach($venue_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        if($this->admin_model->updateVenue($venue_data['pubid'], $venue_data)) {
            $this->response('Venue Updated', 200);
        } else {
            $this->response('Venue info could not be updated', 501);
        }
    }

    /*
     * Add product to a pub
     */
    function updateInventory_put() {
        $inventory_data = array(
            'pubprodid' => $this->put('id'),
            'price' => $this->put('price'),
            'pubid' => $this->put('pubid'),
            'productid' => $this->put('productid')
        );

        foreach($inventory_data as $key => $data) {
            if(!$data) {
                $this->response("You missed $key, enter it... ya prick...", 400);
            }
        }

        if($this->admin_model->updateInventory($inventory_data['pubprodid'], $inventory_data)) {
            $this->response('Inventory Updated', 200);
        } else {
            $this->response('Inventory info could not be updated', 501);
        }
    }

    /*
     * HTTP Detele Methods, all methods take 1 parameter of ID
     * Delete a drink
     */
    function deleteDrink_delete() {
        $id = $this->delete('id');

        if(!$id) {
            $this->response("ID missing.", 404);
        } else {
            if($this->admin_model->deleteDrink($id)) {
                $this->response('Drink Deleted', 200);
            } else {
                $this->response('Unable to Delete from Database', 501);
            }
        }
    }
    /*
     * Delete a product from a pub based on it's id
     *
     * */

    function deleteInventory_delete() {
        $id = $this->delete('id');

        if(!$id) {
            $this->response('ID Missing', 404);
        } else {
            if($this->admin_model->deleteInventory($id)) {
                $this->response('Inventory Item deleted', 200);
            } else {
                $this->response('Unable to delete item from inventory', 501);
            }
        }
    }

    /*
     * Delete a venue based on it's ID
     */

    function deleteVenue_delete() {
        $id = $this->delete('id');

        if(!$id) {
            $this->response('ID Missing', 404);
        } else {
            if($this->admin_model->deleteVenue($id)) {
                $this->response('Venue Deleted', 200);
            } else {
                $this->response('Unable to delete venue.', 501);
            }
        }
    }

    /*
     * Delete a drink category
     */

    function deleteDrinkCategory_delete() {
        $id = $this->delete('id');

        if(!$id) {
            $this->response('ID Missing', 404);
        } else {
            if($this->admin_model->deleteDrinkCategory($id)) {
                $this->response('Category Deleted', 200);
            } else {
                $this->response('Unable to delete category', 501);
            }
        }
    }

    /*
     * Delete a venue category
     */

    function deleteVenueCategory_delete() {
        $id = $this->delete('id');

        if(!$id) {
            $this->response('ID Missing', 404);
        } else {
            if($this->admin_model->deleteVenueCategory($id)) {
                $this->response('Category Deleted', 200);
            } else {
                $this->response('Unable to delete category', 501);
            }
        }
    }
}