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
?>

<form action="" method="POST" class="search_job_form">
	<center>Key Word: <input type="text" name="keyWord" value=""/> 
	<?php
		$dbResult = mysql_query($ESTRACT_OUT_NATIONS, $db)
			or die ("impossible to execute request query");
							
         echo "<select name=\"nations\" size=\"1\">"; 
         echo "<option></option>";
         
		 while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
		 	echo "<option>".$line['nazione']."</option>";
		 	
		 echo "</select>";
	?>
	Start Date: <input type="date" name="startDate" value=""/>
	End Date: <input type="date" name="endDate" value=""/>
 	<input type="submit" name="Search" value="Search"></center>
</form>
	
<?php

	if($_POST['Search'])
	{
		$query = FIND_NATION($_POST['keyWord'], $_POST['nations'], $_POST['startDate'], $_POST['endDate']);
		
		$dbResult = mysql_query($query, $db)
			or die ("impossible to execute request query");
			
		if($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
		{
		
			echo "<table border=1 class=\"jobs_table\">";
			echo "<tr><td><h5>Description</h5></td><td><h5>Start Date</h5></td><td><h5>End Date</h5></td><td><h5>Nation</h5></td><td><h5>Country</h5></td><td><h5>City</h5></td><td><h5>Postal Code</h5></td><td><h5>Address</h5></td><td><h5>House Number</h5></td></tr>";
			echo "<tr><td>".$line['descrizione']."</td><td>".$line['dataInizio']."</td><td>".$line['dataFine']."</td><td>".$line['nazione']."</td><td>".$line['provincia']."</td><td>".$line['citta']."</td><td>".$line['CAP']."</td><td>".$line['via']."</td><td>".$line['nCivico']."</td></tr>";
		
			while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
				echo "<tr><td>".$line['descrizione']."</td><td>".$line['dataInizio']."</td><td>".$line['dataFine']."</td><td>".$line['nazione']."</td><td>".$line['provincia']."</td><td>".$line['citta']."</td><td>".$line['CAP']."</td><td>".$line['via']."</td><td>".$line['nCivico']."</td></tr>";
			
			echo "</table>";
		}
		else
			echo "<center><h1><br><br>No Jobs Found!</h1></center>";
	}



	mysql_close($db);
?>
</body>
</html>