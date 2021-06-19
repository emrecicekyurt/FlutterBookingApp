<?php

if($_POST){
$db = mysqli_connect("localhost", "root", "", "final");
$Person_id= $_POST["Person_id"];
$Prod_id= $_POST["Prod_id"];
$Quantity= $_POST["Quantity"];
$Size= $_POST["Size"];
$Price= $_POST["Price"];
$Color= $_POST["Color"];



$sql ="SELECT * FROM product WHERE Prod_id = '".$Prod_id."'";
$result= mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count==false){
	echo json_encode("Error");
}else{

	$insert = "INSERT INTO updatetable(Prod_id, Person_id)VALUES('".$Prod_id."','".$Person_id."')";
	$insert2 = "UPDATE has SET  Quantity='".$Quantity."'WHERE Prod_id='".$Prod_id."'" ;
	$update = "UPDATE product SET Color='".$Color."', Size='".$Size."', Price = '".$Price."' WHERE Prod_id='".$Prod_id."'";
	$query= mysqli_query($db, $insert);
	$query2=mysqli_query($db, $insert2);
	$query3=mysqli_query($db, $update);
	if($query&& $query2&&$query3){
		echo json_encode("Success");

	}else{
		echo mysqli_error($db);
	}
}
}else{
	echo "Not posted";
}



?>