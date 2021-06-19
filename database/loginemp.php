<?php 
if ($_POST){
include 'conn.php';

$Mail= $_POST["Mail"];
$Password= $_POST["Password"];

$consult= $connect->query("SELECT * FROM salesperson WHERE Mail = '".$Mail."' and Password= '".$Password."'");
$result= array();
while($extractdata = $consult->fetch_assoc()){
  	$result[]= $extractdata;
    } 
	echo  json_encode($result);
}else{
	echo "no data posted found";
}
?>