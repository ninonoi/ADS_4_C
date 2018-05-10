<?php

include 'konekdi_db_artist.php';
$mysqli = new mysqli("localhost", "root", "", "artist.co1");
if (loggedin())
{
	header("Location: userarea.php");
	exit();
}
	if ($_POST['login'])
	{
		//ambil data
		$username = $_POST['username'];
		$password = $_POST['password'];
		$remember = $_POST['rememberme'];
		
		
		if ($username&&$password){
			$query = "SELECT * FROM user WHERE username='$username'";
			if ($result = $mysqli->query($query)) {

				/* fetch associative array */
				while ($row = $result->fetch_assoc()) {
					$db_password = $row['password'];
					if ($password == $db_password)
						$loginok = TRUE;
					else
						$loginok = FALSE;

					if ($loginok == TRUE){
						if ($remember=="on")
							setcookie("username",$username, time()+7200);
						else if ($remember=="")
							$_SESSION['username']==$username;

						header("Location: userarea.php");
						exit();

					}
					else 
						die("incorect Username /pass");
				}

				$result->free();
			}

			

		}
		else {
			die("please enter a username and password combination");
		}
	}
?>