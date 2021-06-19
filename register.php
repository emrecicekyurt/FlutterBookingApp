<?php

if($_POST){
$db = mysqli_connect("localhost", "root", "", "final");
$Mail= $_POST["Mail"];
$Password= $_POST["Password"];
$Name= $_POST["Name"];
$Gender= $_POST["Gender"];
$Phone= $_POST["Phone"];
$Age= $_POST["Age"];


$sql ="SELECT * FROM client WHERE Mail = '".$Mail."' and Password = '".$Password."' and Name= '".$Name."' and Gender= '".$Gender."'and Phone= '".$Phone."'and Age= '".$Age."'";
$result= mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count==1){
	echo json_encode("Error");
}else{

	$insert = "INSERT INTO client(Mail, Password, Name, Gender, Phone, Age)VALUES('".$Mail."','".$Password."','".$Name."','".$Gender."','".$Phone."','".$Age."' )";
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