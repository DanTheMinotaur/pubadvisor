<?php $this->load->view('includes/header.php') ?>

<body ng-app="paSearch" ng-controller="searchCtrl">
	<div class="pacelogo">
		<img src="<?php echo base_url(); ?>images/icon.svg" alt="logo">
	</div>


	<div class="pacewrap">
		<!-- THIS IS CONTAINER FOR LOADER -->
		<?php $this->load->view('includes/top.php') ?>

		<!--SELECTION CATEGORY, SORT BY-->
		<section class="selection">
			<div class="container">
				<h1 class="text-center">Welcome
					<?php echo $_SESSION['name'] ?>!</h1>
				<div class="row adminForm">
					<div class="col-md-2 offset-md-2">
						<button onclick="btnAction('addPro')" class="btn btn-success">Add Product</button>
						<button onclick="btnAction('addVenue')" class="btn btn-success">Add Venue</button>
						<button onclick="btnAction('deletePro')" class="btn btn-danger">Delete Product</button>
						<button onclick="btnAction('deleteVenue')" class="btn btn-danger">Delete Venue</button>
					</div>
					<!-- ADD DRINK FORM -->
					<div class="col-md-4 formz active" id="addDrink">
                        <form>
						<h2>Add Product</h2>
						<div class="form-group">
							<label>Product name:</label>
							<input type="text" name="name" class="form-control" placeholder="Eg. Heineken" >
						</div>
						<div class="form-group">
							<label>Product percentage:</label>
							<input type="number" step="0.1" name="percentage" class="form-control" placeholder="Eg. 5.5" >
						</div>
						<div class="form-group">
							<label>Country of origin:</label>
							<input type="text" name="country" class="form-control" placeholder="Eg. Russia" >
						</div>
						<div class="form-group">
							<label>Amount[Pint, Glass, Shot etc.]:</label>
							<input type="number" name="quantity" class="form-control" placeholder="Eg. 500" >
						</div>
						<div class="form-group">
							<label>Product category:</label>
							<select class="form-control" name="cat_id">
								<option value="1">Craft Beer</option>
								<option value="2">Beer</option>
								<option value="3">Spirit</option>
								<option value="4">Cocktail</option>
							</select>
						</div>
						<div class="form-group">
							<label>Product image path:</label>
							<input type="text" name="image" class="form-control" placeholder="Eg. /images/xyz.png" >
                        </div>
                        <input id="addDrinkBtn" type="submit" class="btn btn-success" value="Submit">
                        </form>
					</div>
                    <!--ADD VENUE FORM -->
					<div class="col-md-4 formz" id="addVenue">
                        <form>
						<h2>Add Venue</h2>
						<div class="form-group">
							<label>Venue name:</label>
							<input type="text" name="name" class="form-control" placeholder="Eg. Drunken Fish" >
						</div>
						<div class="form-group">
							<label>Venue address:</label>
							<input type="text" name="address" class="form-control" placeholder="Eg. Parnell Street" >
						</div>
						<div class="form-group">
							<label>Venue location:</label>
							<input type="text" name="location" class="form-control" placeholder="Eg. 17.2125,14.52647" >
						</div>
						<div class="form-group">
							<label>Venue category:</label>
							<select class="form-control" name="pubcatid">
								<option value="1">Craft Pub</option>
								<option value="2">Public House</option>
								<option value="3">Nightclub</option>
							</select>
						</div>
						<div class="form-group">
							<label>Venue logo path:</label>
							<input type="text" name="image" class="form-control" placeholder="Eg. /images/xyz.png" >
                        </div>
                        <input id="addVenueBtn" type="submit" class="btn btn-success" value="Submit">
                        </form>
					</div>
					<!--ADD VENUE FORM -->
					<div class="col-md-4 formz" id="deletePro">
						<h2>Delete Product</h2>
						<div class="form-group">
							<label>Product name:</label>
							<input type="text" name="name" class="form-control" placeholder="Eg. Heineken" >
						</div>
						<div class="form-group">
							<label>Product percentage:</label>
							<input type="number" step="0.1" name="percentage" class="form-control" placeholder="Eg. 5.5" >
						</div>
						<div class="form-group">
							<label>Country of origin:</label>
							<input type="text" name="country" class="form-control" placeholder="Eg. Russia" >
						</div>
						<div class="form-group">
							<label>Country of origin:</label>
							<input type="number" name="quantity" class="form-control" placeholder="Eg. 500" >
						</div>
						<div class="form-group">
							<label>Product category:</label>
							<select class="form-control" name="quantity">
								<option value="1">Craft Beer</option>
								<option value="2">Beer</option>
								<option value="3">Spirit</option>
								<option value="4">Cocktail</option>
							</select>
						</div>
						<div class="form-group">
							<label>Product image path:</label>
							<input type="text" name="image" class="form-control" placeholder="Eg. /images/xyz.png" >
						</div>
					</div>
					<!--ADD VENUE FORM -->
					<div class="col-md-4 formz" id="deleteVenue">
						<h2>Delete Venue</h2>
						<div class="form-group">
							<label>Product name:</label>
							<input type="text" name="name" class="form-control" placeholder="Eg. Heineken" >
						</div>
						<div class="form-group">
							<label>Product percentage:</label>
							<input type="number" step="0.1" name="percentage" class="form-control" placeholder="Eg. 5.5" >
						</div>
						<div class="form-group">
							<label>Country of origin:</label>
							<input type="text" name="country" class="form-control" placeholder="Eg. Russia" >
						</div>
						<div class="form-group">
							<label>Country of origin:</label>
							<input type="number" name="quantity" class="form-control" placeholder="Eg. 500" >
						</div>
						<div class="form-group">
							<label>Product category:</label>
							<select class="form-control" name="quantity">
								<option value="1">Craft Beer</option>
								<option value="2">Beer</option>
								<option value="3">Spirit</option>
								<option value="4">Cocktail</option>
							</select>
						</div>
						<div class="form-group">
							<label>Product image path:</label>
							<input type="text" name="image" class="form-control" placeholder="Eg. /images/xyz.png" >
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- MAP MODAL -->
		<div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="mapModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<!-- MODAL HEADER TITLE AND CLOSE BUTTON -->
						<h5 class="modal-title" id="mapModalLabel">
							<i class="fa fa-map-o" aria-hidden="true"></i> Map</h5>
						<button type="button" class="close big" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- MODAL BODY -->
					<div class="modal-body container-fluid">
						<div id="map">
							<!-- MAP IS FETCHED HERE -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php $this->load->view('includes/footer.php') ?>
