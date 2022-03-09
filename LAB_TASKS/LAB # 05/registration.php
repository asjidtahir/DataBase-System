<?php

$username = "root";
$password = "";
try {
$conn = new PDO("mysql:host=localhost;dbname=19p0085_asjidtahir", $username, $password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully";
// echo 'HI';
echo '<pre>';
//print_r($_POST);
//var_dump($_POST);

} 

catch(PDOException $e) {
echo "Connection failed: " . $e->getMessage();
}




$park_code      = $_GET['PARK_CODE'];
$park_name      = $_GET['PARK_NAME'];
$park_city      = $_GET['PARK_CITY'];
$park_country   = $_GET['PARK_COUNTRY'];


    // $conn->query("insert into THEMEPARK 
    // (PARK_CODE,PARK_NAME,PARK_CITY,PARK_COUNTRY) values 
    // ('$park_code','$park_name','$park_city','$park_country')" )  ;
    $query_1=$conn->prepare("Insert into THEMEPARK values (?,?,?,?)");
    $query_1->execute([$park_code,$park_name,$park_city,$park_country]);    



echo '<br>';
echo 'Your form has been submitted successfully';
echo '<a href="./reg_form.php">Click here to go back to main page</a>';

?>