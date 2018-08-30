<?php
	session_start();
	$where = $_SESSION['where_redirect'];
	$_SESSION = array();
	session_destroy();
	echo "<script> location.href = '".$where."'; </script>";
?>