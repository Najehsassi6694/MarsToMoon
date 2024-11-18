<?php
if (!function_exists("mysql_connect"))
	die("Le support MySql n'est pas disponible.");
 
$con = mysqli_connect("localhost", "root", "root","mars_db");
	if (mysqli_connect_errno())
	  {
	 	 echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }
 
mysqli_select_db($con,"mars_db") or die('Base de donnée - mysql_select_db: ' . mysqli_error());
 if (isset($_POST['name'])) {

	$name = $_POST['name'];
	$mobile = $_POST['mobile'];
	$adresse = $_POST['adresse'];
	$Email = $_POST['contactEmail'];
	
	$Rocket = $_POST['Rocket'];
	$Destination = $_POST['Destination'];
	$categorie = $_POST['categorie'];
	$etat = $_POST['etat'];
	  

   $req="INSERT INTO client (nom_client ,adresse_client ,email,num_tel_client ) VALUES ('$name','$adresse','$Email','$mobile')";   
	$res=mysqli_query($con,$req);

if (mysqli_query($con,$req)) {
    $last_id = mysqli_insert_id($con);
    echo "New record created successfully. Last inserted ID is: " . $last_id;
} else {
    echo "Error: " . $req . "<br>" . mysqli_error($con);
}

// insertion to user_details table
$requete = "INSERT INTO reservation (Rocket,Destination, categorie, etat, id_client) VALUES ('$Rocket','$Destination','$categorie','$etat','$last_id')";


$res=mysqli_query($con,$requete);
 


mysqli_close($con);
}
?>
