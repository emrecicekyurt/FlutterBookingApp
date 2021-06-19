<?php
 $HostName = "localhost";
 

 $DatabaseName = "smm_db";
 

 $HostUser = "root";
 

 $HostPass = ""; 
 

 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 

 $json = file_get_contents('php://input');
 

 $obj = json_decode($json,true);
 

 $email = $obj['client_email'];
 

 $password = $obj['client_password'];
 

 $loginQuery = "select * from clients where email = '$email' and password = '$password' ";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));
 
	if(isset($check)){
		
		 // Successfully Login Message.
		 $onLoginSuccess = 'Login Matched';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($con);
?>