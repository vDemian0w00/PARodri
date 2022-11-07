drop database if exists `parodri`;

CREATE DATABASE  IF NOT EXISTS `parodri` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parodri`;

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsu` int NOT NULL AUTO_INCREMENT,
  `nombreUsu` varchar(45) NOT NULL,
  `apellidosUsu` varchar(45) NOT NULL,
  `correoUsu` varchar(45) NOT NULL,
  `contraseñaUsu` varchar(45) NOT NULL,
  `imgurlUsu` longtext NOT NULL,
  `rolUsu` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE `actividades` (
  `idAct` int NOT NULL AUTO_INCREMENT,
  `nombreAct` varchar(45) NOT NULL,
  `tipoAct` varchar(45) NOT NULL,
  `estadoAct` boolean NOT NULL,
  `idUsu` int NOT NULL,
  PRIMARY KEY (`idAct`),
  KEY `idUsu_idx` (`idUsu`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;