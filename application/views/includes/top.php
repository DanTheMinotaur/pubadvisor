<!--MOBILE NAVBAR-->
<div class="mobile-menu">
<div class="collapse" id="navbarToggleExternalContent">
  <div class="bg-dark p-4">
  <?php 
  if(isset($_SESSION['logged_in']) && $_SESSION['logged_in']===true)
  {
    echo "<a href='/admin'>Admin Dashboard</a>";
    echo "<a href='/admin/logout'>Log Out</a>";
  }
  else 
    echo "<a href='/admin'>Log In</a>";
  ?>
  <form class="form-inline my-2 my-lg-0">
      <input id="mobile-text" class="form-control mr-sm-2" ng-model="searchBar" type="search" placeholder="Search" ng-init="searchBar = '<?php if(isset($_SESSION['query'])) echo $_SESSION['query']?>'">
      <button id="mobile-btn" class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</div>
<nav class="navbar navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <img src="<?php echo base_url(); ?>images/logo.svg" height="40" alt="">
</nav>
</div>

<!--TOP SECTION HIDDEN FROM MD-DOWN-->
<section class="top">
  <div class="container">
    <div class="row align-items-center">
      <div class="col">
        <!--MENU ICONS-->
        <div class="icons">
          <!-- LOCATION ICON -->
          <div class="locationIcon">
            <svg enable-background="new 0 0 491.582 491.582" version="1.1" viewBox="0 0 491.582 491.582" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
              data-toggle="modal" data-target="#mapModal">
              <g fill="#fff">
                <path d="m245.79 0c-91.992 0-166.83 74.841-166.83 166.83 0 36.967 21.764 93.187 68.493 176.93 31.887 57.138 63.627 105.4 64.966 107.43l22.941 34.773c2.313 3.507 6.232 5.617 10.434 5.617s8.121-2.11 10.434-5.617l22.94-34.771c1.326-2.01 32.835-49.855 64.967-107.44 46.729-83.735 68.493-139.96 68.493-176.93 0-91.992-74.842-166.83-166.83-166.83zm76.511 331.58c-31.685 56.775-62.696 103.87-64.003 105.85l-12.508 18.959-12.504-18.954c-1.314-1.995-32.563-49.511-64.007-105.85-43.345-77.676-65.323-133.1-65.323-164.74 0-78.207 63.626-141.83 141.83-141.83s141.83 63.626 141.83 141.83c0 31.643-21.978 87.069-65.323 164.74z"
                />
                <path d="m245.79 73.291c-51.005 0-92.5 41.496-92.5 92.5s41.495 92.5 92.5 92.5 92.5-41.496 92.5-92.5-41.495-92.5-92.5-92.5zm0 160c-37.22 0-67.5-30.28-67.5-67.5s30.28-67.5 67.5-67.5c37.221 0 67.5 30.28 67.5 67.5s-30.279 67.5-67.5 67.5z"
                />
              </g>
            </svg>
          </div>
          <!-- END OF LOCATION ICON -->
        </div>
      </div>
      <!-- LOGO -->

          <div class="col-xl-4 col-lg-5 col-md-6 pa-logo">
              <a href="<?php echo base_url() ?>">
                    <img src="<?php echo base_url(); ?>images/logo.svg" alt="logo" class="logo">
              </a>
          </div>

      <!-- ADMIN AVATAR PLUS SMALL MENU -->
      <?php if(isset($_SESSION['logged_in']) && $_SESSION['logged_in']===true)
        {
          //echo '<div class="col"><div class="avatar" data-image="' . base_url() . $_SESSION['profile_image'] . '"></div></div>';     
          echo "<div class='col'><div class='dropdown'><div class='avatar dropdown-toggle' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' data-img='" . base_url() .$_SESSION['profile_image'] . "'>
          <div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
            <a class='dropdown-item' href='/admin'>Dashboard</a>
            <a class='dropdown-item' href='/admin/logout'>Log Out</a>
          </div>
          </div>       
        </div></div>";
          echo "<script>var el = document.getElementsByClassName('avatar')[0]; var img = el.getAttribute('data-img'); el.style.backgroundImage = 'url(' + img + ')';</script>";
        }else
        {
          echo '<div class="col"><div class="log-in"><a href="/admin">Log In</a></div></div>'; //here will be log in as admin button
        }
        ?>
    </div>

    <!-- SEARCH FIELD-->
    <div class="row">
      <div class="col"></div>
      <div class="col-xl-4 col-lg-5 col-md-6">
        <div class="input-group searchWrap">
          <input type="text" id="searchBar" ng-model="searchBar" class="form-control searchField" placeholder="Search for..." ng-init="searchBar = '<?php if(isset($_SESSION['query'])) echo $_SESSION['query']; $this->session->unset_userdata('query'); ?>'">
          <span class="input-group-btn">
            <button class="btn searchBtn" type="button">
              <i class="fa fa-search" aria-hidden="true"></i>
            </button>
          </span>
        </div>
      </div>
      <div class="col"></div>
    </div>
  </div>
</section>
<!--END OF TOP SECTION-->

<!-- MOBILE NAVBAR -->

<!-- END OF MOBILE NAVBAR -->