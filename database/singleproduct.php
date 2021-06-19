<?php 

include 'conn.php';
$Color= $_POST["Color"];
$Size= $_POST["Size"];
$Prod_name= $_POST["Prod_name"];
$Price= $_POST["Price"];
$consult= $connect->query("SELECT * FROM product NATURAL JOIN store WHERE Color= '".$Color."' and Size= '".$Size."' and Prod_name= '".$Prod_name."'and Price= '".$Price."'");
$result= array();
while($extractdata = $consult->fetch_assoc()){
  	$result[]= $extractdata;
    } 
	echo  json_encode($result);

?>