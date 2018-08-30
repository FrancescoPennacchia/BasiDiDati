<?php
        session_start();
        if($_SESSION['key'] != "ok") 
             header("location: login.php");
?>

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
	include "resources/logintool.php";
	
	if($_SESSION['type_of_user'] == "civil")
	{
		$dbResult = mysql_query(ESTRACT_BANK_TRANSACTIONS($_SESSION['cod'], $SESSION['type_of_user']), $db)
			or die ("impossible to execute request query");
			
		if($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
		{
			echo "<center><h1>These are your donations</h1></center>";
			echo "<table border=1 class=\"bank_transactions_table\">";
			echo "<tr><td><h5>Description</h5></td><td><h5>Day</h5></td><td><h5>Time</h5></td><td><h5>Amount</h5></tr>";
			echo "<tr><td>".$line['descrizione']."</td><td>".$line['giorno']."</td><td>".$line['momento']."</td><td>".$line['importo']."</td></tr>";
			while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
        		echo "<tr><td>".$line['descrizione']."</td><td>".$line['giorno']."</td><td>".$line['momento']."</td><td>".$line['importo']."</td></tr>";
			echo "</table>";
		}
		else
		{
			echo "<center><h1>You don't have any bank transaction</h1></center>";
		}
	}
	else if($_SESSION['type_of_user'] == "staff")
	{
		echo "<center><form action=\"\" method=\"post\">
			      <input type=\"submit\" name=\"transactions\" value=\"my transactions\">
			      <input type=\"submit\" name=\"transfers\" value=\"my transfers\">			      
		      </form></center>";
		      
		if($_POST['transactions'])
		{
		$dbResult = mysql_query(ESTRACT_BANK_TRANSACTIONS($_SESSION['cod'], $SESSION['type_of_user']), $db)
			or die ("impossible to execute request query");
			
		if($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
		{
			echo "<center><h1>These are your transactions</h1></center>";
			echo "<table border=1 class=\"bank_transactions_table\">";
			echo "<tr><td><h5>Description</h5></td><td><h5>Day</h5></td><td><h5>Time</h5></td><td><h5>Amount</h5></tr>";
			echo "<tr><td>".$line['descrizione']."</td><td>".$line['giorno']."</td><td>".$line['momento']."</td><td>".$line['importo']."</td></tr>";
			while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
        		echo "<tr><td>".$line['descrizione']."</td><td>".$line['giorno']."</td><td>".$line['momento']."</td><td>".$line['importo']."</td></tr>";
			echo "</table>";
		}
		else
		{
			echo "<center><h1>You don't have any bank transaction</h1></center>";
		}
			
		}
		
		if($_POST['transfers'])
		{
			$dbResult = mysql_query(ESTRACT_TRANSFERS($_SESSION['cod']), $db)
			or die ("impossible to execute request query");
			
			if($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))
			{
				echo "<center><h1>These are your transfers</h1></center>";
				echo "<center><table border=1 class=\"transfers_table\">";
				echo "<tr><td><h5>Office</h5></td><td><h5>Start Date</h5></td><td><h5>End Date</h5></td></tr>";
				echo "<tr><td>".$line['nome']."</td><td>".$line['dataInizio']."</td><td>".$line['dataFine']."</td></tr>";
				while($line = mysql_fetch_array($dbResult,MYSQL_ASSOC))	
					echo "<tr><td>".$line['nome']."</td><td>".$line['dataInizio']."</td><td>".$line['dataFine']."</td></tr>";
			echo "</table></center>";
		}
		else
		{
			echo "<center><h1>You have never been in transfer</h1></center>";
		}
		}
	}



	mysql_close($db);
?>

</body>
</html>