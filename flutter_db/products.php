<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "flutter_test";

$conn = new mysqli($servername, $username, $password, $dbname);

// if($conn->connect_error){
//     die("Connection failed: " . $conn->connect_error);
// }

// $query = "SELECT * FROM products";
// $result = $conn->query($query);

// $response = array();

// if($result->num_rows > 0){
//     while($row = $result->fetch_assoc()){
//         array_push($response, $row);
//     }
// }

//  $conn->close();
// echo json_encode($response);


$sql = $conn->query("select * from products");
$res = array();

while($row = $sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);








?>
