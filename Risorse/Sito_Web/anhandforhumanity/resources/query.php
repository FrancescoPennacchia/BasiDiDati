<?
    $ESTRACT_OUT_NATIONS = "SELECT nazione FROM Nazioni ORDER BY nazione ASC";
    
    function ESTRACT_OUT_OFFICE_FROM_NATION($COUNTRY)
	{    	 
    	return "SELECT * FROM Sedi JOIN Nazioni ON (Sedi.idNazione = Nazioni.id) WHERE Nazioni.nazione = '".$COUNTRY."'";
	}
	
	$ESTRACT_OUT_NATIONS_WITH_OFFICES = "SELECT DISTINCT nazione FROM Nazioni JOIN Sedi ON (Nazioni.id = Sedi.idNazione)";
	
	//questa funzione crea una query in base ai campi di ricerca specificati. (utilizzata nella pagina "jobs")
	function FIND_NATION($KEYWORD, $NATION, $STARTDATE, $ENDDATE)
	{
		$QUERY = "SELECT * FROM Mansioni JOIN Nazioni ON (Mansioni.idNazione = Nazioni.id) WHERE ";

		if(empty($KEYWORD) && empty($NATION) && empty($STARTDATE) && empty($ENDDATE))
			$QUERY = $QUERY."1";
		else
		{
			if(!empty($KEYWORD))
				$QUERY = $QUERY."Descrizione LIKE \"%".$KEYWORD."%\"";
		
			if(!empty($KEYWORD) && !empty($NATION))
				$QUERY = $QUERY." AND Nazione = \"".$NATION."\"";
			else 
				if(!empty($NATION))
					$QUERY = $QUERY."Nazione = \"".$NATION."\"";
			
			if((!empty($KEYWORD) || !empty($NATION)) && !empty($STARTDATE))
				$QUERY = $QUERY." AND dataInizio = \"".$STARTDATE."\"";
			else
				if(!empty($STARTDATE))
					$QUERY = $QUERY."dataInizio = \"".$STARTDATE."\"";
			
			if((!empty($KEYWORD) || !empty($NATION) || !empty($ENDDATE)) && !empty($ENDDATE))
				$QUERY = $QUERY." AND dataFine = \"".$ENDDATE."\"";
			else
				if(!empty($ENDDATE))
					$QUERY = $QUERY."dataFine = \"".$ENDDATE."\"";
		}
		
		return $QUERY;
	}
	
	function DONATE_MONEY($amount, $db)
	{
		if($amount > 0)
		{
			session_start();
	        if($_SESSION['key'] == "ok")
	        {
    			$QUERY = "INSERT INTO MovimentiBancari(descrizione, importo, codCollaboratore) VALUES ('donation', ".$amount.", '".$_SESSION['cod']."')";

    			if(mysql_query($QUERY, $db))
					return 1;
				else
					return 0;
    		}
    		else
	    	{
	    		$QUERY = "INSERT INTO MovimentiBancari(descrizione, importo) VALUES ('anonymous donation', ".$amount.")";

	    		if(mysql_query($QUERY, $db))
					return 1;
				else
					return 0;
    		}
    	}
    	else
    	{
    		return -1;
    	}
	}

	function ESTRACT_BANK_TRANSACTIONS($someone, $role)
	{
		$QUERY = "SELECT * FROM MovimentiBancari WHERE codCollaboratore = '".$someone."'";
		
		if($role == "tesoriere")
			$QUERY = $QUERY."AND codTesoriere = '".$someone."'";
			
		$QUERY = $QUERY."ORDER BY giorno DESC, momento DESC";
		
		return $QUERY;
	}
	
	function ESTRACT_TRANSFERS($someone)
	{
		return "SELECT s.nome, i.dataInizio, i.dataFine FROM Impiegato AS i JOIN Sedi AS s ON (i.idSede = s.id) WHERE i.trasferta = 1 AND i.codPersonale = '".$someone."'";
	}
?>