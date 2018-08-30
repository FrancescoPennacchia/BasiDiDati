<?php

	$host = "localhost:8889";
	$database = "anhandforhumanityDB";
	
	session_start();
	if($_SESSION['key'] == "ok" AND $_SESSION['type_of_user'] == "staff")
	{
		switch($_SESSION['role'])
		{
			case "tesoriere":
				$user = "Tesoriere";
				$password = "passTesoriere";
			break;
			
			case "personale":
				$user = "Personale";
				$password = "passPersonale";
			break;
			
			case "amministratore":
				$user = "Amministratore";
				$password = "passAmministratore";
			break;
		}
	}
	else
	{
		$user = "Ospite";
		$password = "passOspite";
	}

	$db = mysql_connect($host, $user, $password)
	or die ("impossible connect to DB");

	mysql_select_db($database, $db)
		or die ("impossible connect to $database");
?>