<?php

	//session
	session_start();
	
	//connect to database
	$host = "localhost";
	$user = "root";
	$db = "artist.co1";
	$password = "";
	$koneksi_db = mysqli_connect($host, $user, $password, $db);
	if ($koneksi_db){}
		else {
			echo "Coba Lagi";
		}
		
		
	
	//login check function
	function loggedin(){
		if (isset($_SESSION['username'])||isset($_COOKIE['username'])){
			$loggedin = TRUE;
			return $loggedin;
		}
	}

?>