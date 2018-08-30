<?php 
	session_start();
	$_SESSION['where_redirect'] = $_SERVER['REQUEST_URI'];
	
	if($_SESSION['key'] == "ok") 
	{
		echo "<div class=\"login_tool_div\">
			  	<form action=\"logout.php\" method=\"post\" class=\"logout_button\">
			  		<input type=\"submit\" value=\"Log out\">
				</form>";

		echo "<div class=\"logged_user\">You are logged like: ".$_SESSION['user']."</div>"; 
	}
	else
	{
		echo "<div class=\"login_tool_div\">
			<form action=\"login.php\" method=\"post\" class=\"login_button\">
				<input type=\"submit\" value=\"Log in\">
				<input type=\"hidden\" name=\"redirectToPage\" value=\"".$_SERVER['REQUEST_URI']."\">
			</form>";
	}
?>
</div>