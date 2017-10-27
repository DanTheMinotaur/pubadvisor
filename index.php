<!doctype html>
<html lang="en">

<head>
  <title>Pub Advisor</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
</head>

<body>

  <!--TOP SECTION HIDDEN FROM MD-DOWN-->
  <section class="top">
    <div class="container">
      <div class="row">
        <div class="col"></div>
        <div class="col-xl-4 col-lg-5 col-md-6 text-center">
          <img src="images/logo.svg" alt="logo" class="logo">
        </div>
        <div class="col">
          <div class="avatar"></div>
        </div>
      </div>
      <div class="row">
        <div class="col"></div>
        <div class="col-xl-4 col-lg-5 col-md-6 text-center">
          <div class="input-group searchWrap">
            <input type="text" class="form-control searchField" placeholder="Search for...">
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

  <!--SELECTION-->
  <section class="selection">
    <div class="container">
    <div class="row justify-content-end">
        <div class="col-lg-2">
          <h4 class="text-center">Category:</h4>
          <select name="category">
            <option value="all" selected>All</option>
            <option value="pub">Pub</option>
            <option value="pint">Pint</option>
          </select>
        </div>
        <div class="col-lg-3"></div>
        <div class="col-lg-2">
          <h4 class="text-center">Sort by:</h4>
          <select name="sortby">
            <option value="name" selected>Name</option>
            <option value="rating">Rating</option>
            <option value="price">Price</option>
          </select>
        </div>
      </div>
    </div>
  </section>
  <!--RESULTS-->
  <section class="results">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="result beer text-center">
            <div class="logoWrapper"><div class="logo" data-src='images/heineken.svg'></div></div>
            <h1>Heineken</h1>
            <h3>Netherlands</h3>
            <h3>5% vol</h3>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="result pub text-center">
            <div class="logoWrapper"><div class="logo" data-src='images/drunken_fish.png'></div></div>
            <h1>Drunken Fish</h1>
            <h3>Mayor Street IFSC</h3>
            <h3>Dublin 1</h3>
          </div>
        </div>
        <div class="col-lg-4">
        <div class="result beer text-center">
          <div class="logoWrapper"><div class="logo" data-src='images/heineken.svg'></div></div>
          <h1>Heineken</h1>
          <h3>Netherlands</h3>
          <h3>5% vol</h3>
        </div>
        </div>
        <div class="col-lg-4">
        <div class="result beer text-center">
          <div class="logoWrapper"><div class="logo" data-src='images/heineken.svg'></div></div>
          <h1>Heineken</h1>
          <h3>Netherlands</h3>
          <h3>5% vol</h3>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="result pub text-center">
          <div class="logoWrapper"><div class="logo" data-src='images/drunken_fish.png'></div></div>
          <h1>Drunken Fish</h1>
          <h3>Mayor Street IFSC</h3>
          <h3>Dublin 1</h3>
        </div>
      </div>
      <div class="col-lg-4">
      <div class="result beer text-center">
        <div class="logoWrapper"><div class="logo" data-src='images/heineken.svg'></div></div>
        <h1>Heineken</h1>
        <h3>Netherlands</h3>
        <h3>5% vol</h3>
      </div>
      </div>
      </div>
    </div>
  </section>

  <!-- SCRIPTS-->
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>

</html>