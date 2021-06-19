<?php

if($_POST){
$db = mysqli_connect("localhost", "root", "", "final");
$Client_id= $_POST["Client_id"];




$sql ="SELECT * FROM client WHERE Client_id = '".$Client_id."'";
$result= mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count==false){
	echo json_encode("Error");
}else{

	$remove = "DELETE FROM client WHERE Client_id = '".$Client_id."' ";

	$query= mysqli_query($db, $remove);

	if($query){
		echo json_encode("Success");

	}else{
		echo mysqli_error($db);
	}
}
}else{
	echo "Not posted";
}



?>