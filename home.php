<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <title>Book It</title>
</head>
<nav>
  <a href="/bookit/home.php">Book It!</a>
  <ul>
    <li><a href="/bookit/shop.php">Shop</a></li>
    <li><a href="/bookit/account.php">Account</a></li>
    <li><a href="/bookit/cart.php">🛒</a></li>
    <input type="text" placeholder="Search.." name="submit">
    <button type="submit"><i class="fa fa-search"></i></button>
  </ul>
</nav>

<body>
  <form method="GET" action="search.php">
    <h2>Search</h2>
    <input type="text" placeholder="Search.." name="search">
    <input type="submit" name="submit">
  </form>
  <br />

</body>

</html>
