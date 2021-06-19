<?php

if($_POST){
$db = mysqli_connect("localhost", "root", "", "final");
$Client_id= $_POST["Client_id"];
$Product_id= $_POST["Product_id"];
$Store_id= $_POST["Store_id"];
$Reservation_duration= $_POST["Reservation_duration"];
$Total_price= $_POST["Total_price"];



$sql ="SELECT * FROM booking WHERE Client_id = '".$Client_id."' and Product_id = '".$Product_id."' and Store_id= '".$Store_id."' and Reservation_duration= '".$Reservation_duration."'and Total_price= '".$Total_price."'";
$result= mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count==1){
	echo json_encode("Error");
}else{

	$insert = "INSERT INTO booking(Client_id, Product_id, Store_id, Reservation_duration, Total_price)VALUES('".$Client_id."','".$Product_id."','".$Store_id."','".$Reservation_duration."','".$Total_price."')";
	$query= mysqli_query($db, $insert);
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