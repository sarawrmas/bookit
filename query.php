<?php
ini_set("display_errors", 1);
ini_set("display_startup_errors", "1");
error_reporting(E_ALL);

require_once 'login.php';
$conn = new mysqli($db_hostname, $db_username, $db_password, $db_database);

if ($conn->connect_error)
  die($conn->connect_error);



if (isset($_POST['submit'])) {
  $str = $_POST['submit'];
  //$sth = $conn->prepare("SELECT * FROM 'search' WHERE Title = '$str'");

  $query = "SELECT * FROM 'search' WHERE Title = '$str'";
  //$sth->setFetchMode(PDO:: FETCH_OBJ);
  //$sth -> execute();
  $result = $conn->query($query);

  if (!$result)
    die("Database access failed: " . $conn->error);

  $rows = $result->num_rows;
  for ($j = 0; $j < $rows; ++$j) {
    $result->data_seek($j);
    $row = $result->fetch_array(MYSQLI_ASSOC);

    echo 'ID: ' . $row['ProductID'] . '<br>';
    echo 'ISBN: ' . $row['ISBN'] . '<br>';
    echo 'Title: ' . $row['Title'] . '<br>';
    echo 'Author: ' . $row['Author'] . '<br>';
    echo 'Genre: ' . $row['Genre'] . '<br>';
    echo 'Price: ' . $row['UnitPrice'] . '<br><br>';
  }
} else {
  echo "No record found";
}


// $result->close();
$conn->close();
?>