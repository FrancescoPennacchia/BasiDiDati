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
?>

<center>
<div class="donation_form">
	<form action="" method="post">
	<label>Amount:&nbsp</label><input type="text" name="amount">
	<input type="submit" name="donate" value="Donate">
	</form>
</div>
</center>

<?php

	if($_POST['donate'])
	{
		$result = DONATE_MONEY($_POST['amount'], $db);

		if($result == -1)
			echo "<center><h1>This is not funny!</h1></center>";
		else if($result == 1)
			echo "<center><h1>Thank you for Your Support!</h1></center>";
		else if($result == 0)
			echo "<center><h1>Sorry, impossible to donate now! :,(</h1></center>";
	}
	
	
	mysql_close($db);
?>
</body>
</html>