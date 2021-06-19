<?php 
if ($_POST){

$db = mysqli_connect("localhost", "root", "", "final");
$Prod_id= $_POST["Prod_id"];
	$forcheck = "SET FOREIGN_KEY_CHECKS=0";
	$remove = "DELETE FROM product WHERE Prod_id='".$Prod_id."'";
	$query2 = mysqli_query($db, $forcheck);
	$query= mysqli_query($db, $remove);
	if($query && $query2){
		echo json_encode("Success");

	}else{
		echo mysqli_error($db);
	}


}else{
	echo "no data posted found";
}
?>