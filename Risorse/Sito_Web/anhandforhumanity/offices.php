<!doctype html>
<html>
<head>
<?php include "resources/head.html"; ?>
</head>

<body>

<?php 
	include "resources/menu.html";
	include "resources/DBconnection.php";
	include "resources/query.php";

	if($_POST[Nation_button])
	{
		$dbResult = mysql_query(ESTRACT_OUT_OFFICE_FROM_NATION($_POST[Nation_button]), $db)
			or die ("impossible to execute request query");
						
		if($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
		{
			echo "<center><h1><br><br>Our offices in ".$_POST[Nation_button]."</h1></center>";
			echo "<table border=1 class=\"office_table\">";
			echo "<tr><td><h5>Name</h5></td><td><h5>Nation</h5></td><td><h5>Country</h5></td><td><h5>City</h5></td><td><h5>Address</h5></td><td><h5>Postal Code</h5></td><td><h5>House Number</h5></td><td><h5>Phone Number</h5></td><td><h5>Email</h5></td></tr>";
			echo "<tr><td>".$line['nome']."</td><td>".$line['nazione']."</td><td>".$line['provincia']."</td><td>".$line['citta']."</td><td>".$line['via']."</td><td>".$line['CAP']."</td><td>".$line['nCivico']."</td><td>".$line['telefono']."</td><td><a href= mailto:".$line['email']."\">".$line['email']."</a></td></tr>";
			while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
			{
        		echo "<tr><td>".$line['nome']."</td><td>".$line['nazione']."</td><td>".$line['provincia']."</td><td>".$line['citta']."</td><td>".$line['via']."</td><td>".$line['CAP']."</td><td>".$line['nCivico']."</td><td>".$line['telefono']."</td><td><a href= mailto:".$line['email']."\">".$line['email']."</a></td></tr>";
        		
			}
			echo "</table>";
		}
		else
		{
			echo "<center><h1><br><br>Sorry, there isn't any office here.</h1></center>";
		}
		mysql_free_result($dbResult);
	}
	else
	{
		$dbResult = mysql_query($ESTRACT_OUT_NATIONS, $db)
			or die ("impossible to execute request query");
	
		echo "<form action=\"\" method=\"post\">";
	
		while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
		{
        	echo "<input type=\"submit\"name=\"Nation_button\" id=\"".$line['nazione']."\" value=\"".$line['nazione']."\">";
		}
	
		echo "</form>";
		mysql_free_result($dbResult);	
		
		$dbResult = mysql_query($ESTRACT_OUT_NATIONS_WITH_OFFICES, $db)
			or die ("impossible find nation with offices");
		
		while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
		{
        	echo "<script type=\"text/javascript\">\n";
    		echo "document.getElementById(\"".$line['nazione']."\").style.background='#ff0000';";
	    	echo "</script>";
		}
	}

	
	mysql_close($db);
?>

</body>
</html>