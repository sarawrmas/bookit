<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book It</title>
  <link rel="stylesheet" href="styles.css">
</head>
<nav>
  <a href="/bookit/home.php">Book It!</a>
  <ul>
    <li><a href="/bookit/shop.php">Shop</a></li>
    <li><a href="/bookit/account.php">Account</a></li>
    <li><a href="/bookit/cart.php" id="cartMenu">🛒</a></li>
    <input type="text" placeholder="Search..">
    <button type="submit"><i class="fa fa-search"></i></button>
  </ul>
</nav>

<body>
  <a href="/bookit/home.php" class="back_to_search">&larr; Back to Search</a>
  <?php
  if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['submit'])) {
    $conn = mysqli_connect('localhost', 'root', 'root', 'bookit') or die('Connection Failed: ' . mysqli_connect_error());
    if (isset($_GET['search'])) {
      $search = $_GET['search'];

      $raw_results = mysqli_query($conn, "SELECT * FROM product WHERE (`Title` LIKE '%" . $search . "%') OR (`Author` LIKE '%" . $search . "%')");

      if (mysqli_num_rows($raw_results) > 0) {
        echo "<div id='shopcontainer'>";
        while ($results = mysqli_fetch_array($raw_results)) {
          echo "
            <div class='shopitem'>
              <h3>" . $results['Title'] . "</h3>
              <p>By " . $results['Author'] . "</p>
              <img src='book.svg'/>
              <p>Genre: " . $results['Genre'] . "</p>
              <p>Price: $" . $results['UnitPrice'] . "</p>
              <button class='addToCart' id=".$results['ProductID'].">Add to Cart</button>
            </div>
          ";
        }
        echo "</div>";
      } else {
        echo "<p class='back_to_search'>No Results</p>";
      }
    }
  }
  ?>
  <script src="js/addtocart.js"></script>
</body>

</html>