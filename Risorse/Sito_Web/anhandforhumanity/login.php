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

<center>
<table border=1 class="login_table">
<form action="" method="post">
<tr><td>User</td> <td><input type="text" name="user"></td></tr>
<tr><td>Password</td><td><input type="password" name="pass"></td></tr>
<tr><td><input type="submit" value="Login" name="log-on"></td></tr>
</form>
</table>
</center>
  
<?php
    if($_POST['log-on'])
	{
		$query = "SELECT cod, ruolo FROM Personale WHERE email = \"".$_POST['user']."\" AND pass = \"".$_POST['pass']."\"";
		$dbResult = mysql_query($query, $db)
			or die ("impossible to execute request query");

		$count=mysql_num_rows($dbResult);
		
		if($count==1)
		{
            session_start();
            $_SESSION['key'] = "ok";
			$_SESSION['user'] = $_POST['user'];
            $line = mysql_fetch_array($dbResult, MYSQL_ASSOC);
            $_SESSION['cod'] = $line['cod'];
            $_SESSION['type_of_user'] = "staff";
            $_SESSION['role'] = $line['ruolo'];
		}
		else
		{
			$query = "SELECT cod FROM Civili WHERE email = \"".$_POST['user']."\" AND pass = \"".$_POST['pass']."\"";
			$dbResult = mysql_query($query, $db)
			or die ("impossible to execute request query");

			$count=mysql_num_rows($dbResult);
		
			if($count==1)
			{
            	session_start();
	            $_SESSION['key'] = "ok";
				$_SESSION['user'] = $_POST['user'];
        	    $line = mysql_fetch_array($dbResult, MYSQL_ASSOC);
            	$_SESSION['cod'] = $line['cod'];
	            $_SESSION['type_of_user'] = "civil";
			}
			
		}
		
		mysql_free_result($dbResult);
		mysql_close($db);
		
		if($_SESSION['key'] == "ok")
			echo "<script> location.href = '".$_SESSION['where_redirect']."'; </script>";
		else
			echo "<script> location.href = 'login.php'; </script>";
	}
?>

</body>
</html>