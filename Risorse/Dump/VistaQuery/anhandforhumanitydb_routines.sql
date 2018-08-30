-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: anhandforhumanitydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `query_10`
--

DROP TABLE IF EXISTS `query_10`;
/*!50001 DROP VIEW IF EXISTS `query_10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_10` AS SELECT 
 1 AS `nazione`,
 1 AS `NumeroPersonalePerNazione`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_6`
--

DROP TABLE IF EXISTS `query_6`;
/*!50001 DROP VIEW IF EXISTS `query_6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_6` AS SELECT 
 1 AS `importo`,
 1 AS `NomeCollaboratore`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_7`
--

DROP TABLE IF EXISTS `query_7`;
/*!50001 DROP VIEW IF EXISTS `query_7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_7` AS SELECT 
 1 AS `nazione`,
 1 AS `NumeroDiCollaboratori`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_4`
--

DROP TABLE IF EXISTS `query_4`;
/*!50001 DROP VIEW IF EXISTS `query_4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_4` AS SELECT 
 1 AS `TotaleVersato`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_5`
--

DROP TABLE IF EXISTS `query_5`;
/*!50001 DROP VIEW IF EXISTS `query_5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_5` AS SELECT 
 1 AS `nome`,
 1 AS `Trasferimenti`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_2`
--

DROP TABLE IF EXISTS `query_2`;
/*!50001 DROP VIEW IF EXISTS `query_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_2` AS SELECT 
 1 AS `descrizione`,
 1 AS `giorno`,
 1 AS `momento`,
 1 AS `importo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_3`
--

DROP TABLE IF EXISTS `query_3`;
/*!50001 DROP VIEW IF EXISTS `query_3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_3` AS SELECT 
 1 AS `Numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_1`
--

DROP TABLE IF EXISTS `query_1`;
/*!50001 DROP VIEW IF EXISTS `query_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_1` AS SELECT 
 1 AS `descrizione`,
 1 AS `giorno`,
 1 AS `momento`,
 1 AS `importo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_8`
--

DROP TABLE IF EXISTS `query_8`;
/*!50001 DROP VIEW IF EXISTS `query_8`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_8` AS SELECT 
 1 AS `DataInizio`,
 1 AS `DataFine`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_9`
--

DROP TABLE IF EXISTS `query_9`;
/*!50001 DROP VIEW IF EXISTS `query_9`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_9` AS SELECT 
 1 AS `NomeSede`,
 1 AS `Durata`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `query_10`
--

/*!50001 DROP VIEW IF EXISTS `query_10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_10` AS select `n`.`nazione` AS `nazione`,count(`p`.`cod`) AS `NumeroPersonalePerNazione` from (`nazioni` `n` join `personale` `p` on((`n`.`id` = `p`.`idNazione`))) group by `n`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_6`
--

/*!50001 DROP VIEW IF EXISTS `query_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_6` AS select sum(`mb`.`importo`) AS `importo`,`p`.`nome` AS `NomeCollaboratore` from ((`movimentibancari` `mb` join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `personale` `p` on((`c`.`cod` = `p`.`cod`))) where ((`mb`.`importo` < 0) and (`mb`.`giorno` > '2016-01-01') and (`mb`.`giorno` < '2018-12-31')) group by `c`.`cod` union select sum(`mb`.`importo`) AS `importo`,`pa`.`nome` AS `NomeCollaboratore` from ((`movimentibancari` `mb` join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `partner` `pa` on((`c`.`cod` = `pa`.`cod`))) where ((`mb`.`importo` < 0) and (`mb`.`giorno` > '2016-01-01') and (`mb`.`giorno` < '2018-12-31')) group by `c`.`cod` union select sum(`mb`.`importo`) AS `importo`,`de`.`ragioneSociale` AS `NomeCollaboratore` from ((`movimentibancari` `mb` join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `ditteesterne` `de` on((`c`.`cod` = `de`.`cod`))) where ((`mb`.`importo` < 0) and (`mb`.`giorno` > '2016-01-01') and (`mb`.`giorno` < '2018-12-31')) group by `c`.`cod` union select sum(`mb`.`importo`) AS `importo`,`p`.`nome` AS `NomeCollaboratore` from ((`movimentibancari` `mb` join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `civili` `p` on((`c`.`cod` = `p`.`cod`))) where ((`mb`.`importo` < 0) and (`mb`.`giorno` > '2016-01-01') and (`mb`.`giorno` < '2018-12-31')) group by `c`.`cod` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_7`
--

/*!50001 DROP VIEW IF EXISTS `query_7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_7` AS select `n`.`nazione` AS `nazione`,count(`co`.`cod`) AS `NumeroDiCollaboratori` from (((`nazioni` `n` join `mansioni` `m` on((`n`.`id` = `m`.`id`))) join `collabora` `c` on((`m`.`id` = `c`.`idMansione`))) join `collaboratori` `co` on((`c`.`codCollaboratore` = `co`.`cod`))) group by `n`.`nazione` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_4`
--

/*!50001 DROP VIEW IF EXISTS `query_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_4` AS select sum(`mb`.`importo`) AS `TotaleVersato` from (`movimentibancari` `mb` join `personale` `p` on((`p`.`cod` = `mb`.`codCollaboratore`))) where ((`mb`.`importo` < 0) and (`p`.`nome` = 'Tonio') and (`p`.`cognome` = 'Cartonio') and (`mb`.`giorno` > '2016-01-01') and (`mb`.`giorno` < '2017-12-31')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_5`
--

/*!50001 DROP VIEW IF EXISTS `query_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_5` AS select `s`.`nome` AS `nome`,sum(`mb`.`importo`) AS `Trasferimenti` from (((`movimentibancari` `mb` join `personale` `p` on((`mb`.`codTesoriere` = `p`.`cod`))) join `impiegato` `i` on((`p`.`cod` = `i`.`codPersonale`))) join `sedi` `s` on((`i`.`idSede` = `s`.`id`))) where (`mb`.`importo` < 0) group by `s`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_2`
--

/*!50001 DROP VIEW IF EXISTS `query_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_2` AS (select `m`.`descrizione` AS `descrizione`,`m`.`giorno` AS `giorno`,`m`.`momento` AS `momento`,`m`.`importo` AS `importo` from (`movimentibancari` `m` join `personale` `p` on((`m`.`codTesoriere` = `p`.`cod`))) where ((`p`.`nome` = 'Tonio') and (`p`.`cognome` = 'Cartonio'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_3`
--

/*!50001 DROP VIEW IF EXISTS `query_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_3` AS select count(distinct `pe`.`cod`) AS `Numero` from (((`personale` `pe` join `movimentibancari` `mb` on((`pe`.`cod` = `mb`.`codTesoriere`))) join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `partner` `p` on((`c`.`cod` = `p`.`cod`))) where ((`p`.`nome` = 'WWF') and (`mb`.`importo` < 0)) union select count(distinct `pe`.`cod`) AS `Numero` from (((`personale` `pe` join `movimentibancari` `mb` on((`pe`.`cod` = `mb`.`codTesoriere`))) join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `ditteesterne` `p` on((`c`.`cod` = `p`.`cod`))) where ((`p`.`ragioneSociale` = 'WWF') and (`mb`.`importo` < 0)) union select count(distinct `pe`.`cod`) AS `Numero` from (((`personale` `pe` join `movimentibancari` `mb` on((`pe`.`cod` = `mb`.`codTesoriere`))) join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `personale` `p` on((`c`.`cod` = `p`.`cod`))) where ((`p`.`nome` = 'WWF') and (`mb`.`importo` < 0)) union select count(distinct `pe`.`cod`) AS `Numero` from (((`personale` `pe` join `movimentibancari` `mb` on((`pe`.`cod` = `mb`.`codTesoriere`))) join `collaboratori` `c` on((`mb`.`codCollaboratore` = `c`.`cod`))) join `civili` `p` on((`c`.`cod` = `p`.`cod`))) where ((`p`.`nome` = 'WWF') and (`mb`.`importo` < 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_1`
--

/*!50001 DROP VIEW IF EXISTS `query_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_1` AS select `m`.`descrizione` AS `descrizione`,`m`.`giorno` AS `giorno`,`m`.`momento` AS `momento`,`m`.`importo` AS `importo` from ((`movimentibancari` `m` join `collaboratori` `c` on((`m`.`codCollaboratore` = `c`.`cod`))) join `partner` `p` on((`c`.`cod` = `p`.`cod`))) where (`p`.`nome` = 'unicef') union select `m`.`descrizione` AS `descrizione`,`m`.`giorno` AS `giorno`,`m`.`momento` AS `momento`,`m`.`importo` AS `importo` from ((`movimentibancari` `m` join `collaboratori` `c` on((`m`.`codCollaboratore` = `c`.`cod`))) join `ditteesterne` `p` on((`c`.`cod` = `p`.`cod`))) where (`p`.`ragioneSociale` = 'unicef') union select `m`.`descrizione` AS `descrizione`,`m`.`giorno` AS `giorno`,`m`.`momento` AS `momento`,`m`.`importo` AS `importo` from ((`movimentibancari` `m` join `collaboratori` `c` on((`m`.`codCollaboratore` = `c`.`cod`))) join `personale` `p` on((`c`.`cod` = `p`.`cod`))) where (`p`.`nome` = 'unicef') union select `m`.`descrizione` AS `descrizione`,`m`.`giorno` AS `giorno`,`m`.`momento` AS `momento`,`m`.`importo` AS `importo` from ((`movimentibancari` `m` join `collaboratori` `c` on((`m`.`codCollaboratore` = `c`.`cod`))) join `civili` `p` on((`c`.`cod` = `p`.`cod`))) where (`p`.`nome` = 'unicef') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_8`
--

/*!50001 DROP VIEW IF EXISTS `query_8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_8` AS select `i`.`dataInizio` AS `DataInizio`,`i`.`dataFine` AS `DataFine` from (`personale` `p` join `impiegato` `i` on((`p`.`cod` = `i`.`codPersonale`))) where ((`p`.`nome` = 'Pippo') and (`p`.`cognome` = 'Laurenti') and (`i`.`trasferta` = 1)) order by `i`.`dataInizio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_9`
--

/*!50001 DROP VIEW IF EXISTS `query_9`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_9` AS select `s`.`nome` AS `NomeSede`,max((to_days(`i`.`dataFine`) - to_days(`i`.`dataInizio`))) AS `Durata` from (`sedi` `s` join `impiegato` `i` on((`s`.`id` = `i`.`idSede`))) where (`i`.`trasferta` = 1) group by `s`.`id` order by max((to_days(`i`.`dataFine`) - to_days(`i`.`dataInizio`))) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-30 11:27:59
