<?php 

include 'conn.php';
$Store_name= $_POST["Store_name"];


$consult= $connect->query("SELECT *
FROM has
NATURAL JOIN product
NATURAL JOIN store
WHERE has.Store_id=Store.Store_id and product.Prod_id=has.Prod_id and Store_name= '".$Store_name."'");
$result= array();
while($extractdata = $consult->fetch_assoc()){
  	$result[]= $extractdata;
    } 
	echo  json_encode($result);

?>