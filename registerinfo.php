<?php

include 'conn.php';
$Mail= $_POST["Mail"];

$sql ="SELECT * FROM client WHERE Mail = '".$Mail."'";
$result= mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count==1){
	echo json_encode("Error");
}else{

	$query= mysqli_query($db, $result);
	if($query){
		echo json_encode("Success");

	}else{
		echo mysqli_error($db);
	}
}




?>