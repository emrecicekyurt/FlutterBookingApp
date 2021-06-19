<?php 

include 'conn.php';
$Store_name= $_POST["Store_name"];


$consult= $connect->query("SELECT *
FROM supplier
NATURAL JOIN supplymatch
NATURAL JOIN store
WHERE supplymatch.Store_id=Store.Store_id and supplier.Supplier_id=supplymatch.Supplier_id and Store_name= '".$Store_name."'");
$result= array();
while($extractdata = $consult->fetch_assoc()){
  	$result[]= $extractdata;
    } 
	echo  json_encode($result);

?>