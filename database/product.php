<?php 

include 'conn.php';



$consult= $connect->query("SELECT * FROM product ");
$result= array();
while($extractdata = $consult->fetch_assoc()){
  	$result[]= $extractdata;
    } 
	echo  json_encode($result);

?>