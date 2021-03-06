-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Temps de generació: 10-12-2018 a les 20:31:32
-- Versió del servidor: 5.7.24-0ubuntu0.18.04.1
-- Versió de PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `ScrumControlBD`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Especificaciones`
--

CREATE TABLE `Especificaciones` (
  `ID` int(11) NOT NULL,
  `Num_Tarea` int(11) NOT NULL,
  `Tarea` varchar(50) NOT NULL,
  `Descripcion_Tarea` varchar(200) NOT NULL,
  `Horas` int(11) NOT NULL,
  `Dificultad` varchar(1) NOT NULL,
  `Num_Sprint` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `ID_Dev_Asignado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `Grupos`
--

CREATE TABLE `Grupos` (
  `ID` int(11) NOT NULL,
  `Nombre_Grupo` varchar(50) NOT NULL,
  `ID_Proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `Grupos`
--

INSERT INTO `Grupos` (`ID`, `Nombre_Grupo`, `ID_Proyecto`) VALUES
(1, 'JoNi', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `Proyectos`
--

CREATE TABLE `Proyectos` (
  `ID` int(11) NOT NULL,
  `Nombre_Proyecto` varchar(50) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Numero_Sprint` int(11) DEFAULT NULL,
  `ID_Scrum_Master` int(11) NOT NULL,
  `ID_Product_Owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `Proyectos`
--

INSERT INTO `Proyectos` (`ID`, `Nombre_Proyecto`, `Descripcion`, `Numero_Sprint`, `ID_Scrum_Master`, `ID_Product_Owner`) VALUES
(1, 'Scrum Administrator', 'Aplicacion para gestionar proyectos en scrum', 1, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `Sprint`
--

CREATE TABLE `Sprint` (
  `ID` int(11) NOT NULL,
  `ID_Proyecto` int(11) NOT NULL,
  `Numero_Sprint` int(11) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_entrega` date NOT NULL,
  `Horas_Maximas` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `Sprint`
--

INSERT INTO `Sprint` (`ID`, `ID_Proyecto`, `Numero_Sprint`, `Fecha_Inicio`, `Fecha_entrega`, `Horas_Maximas`, `Estado`) VALUES
(1, 1, 1, '2018-12-03', '2018-12-11', 20, 'Actual'),
(2, 1, 2, '2018-12-12', '2018-12-18', 20, 'Proximamante');

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Pasword` varchar(512) NOT NULL,
  `Permisos` int(11) NOT NULL,
  `ID_Grupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `Usuarios`
--

INSERT INTO `Usuarios` (`ID`, `Nom`, `Pasword`, `Permisos`, `ID_Grupo`) VALUES
(1, 'Jose', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1),
(2, 'Nil', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1),
(3, 'Leandro', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 2, NULL),
(4, 'Enric', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 1, NULL);

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `Especificaciones`
--
ALTER TABLE `Especificaciones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Dev_ID` (`ID_Dev_Asignado`);

--
-- Index de la taula `Grupos`
--
ALTER TABLE `Grupos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Proyecto_ID` (`ID_Proyecto`);

--
-- Index de la taula `Proyectos`
--
ALTER TABLE `Proyectos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Scrum_Master_ID` (`ID_Scrum_Master`),
  ADD KEY `FK_Product_Owner_ID` (`ID_Product_Owner`),
  ADD KEY `FK_Numero_Sprint_ID` (`Numero_Sprint`);

--
-- Index de la taula `Sprint`
--
ALTER TABLE `Sprint`
  ADD PRIMARY KEY (`ID`);

--
-- Index de la taula `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Nom` (`Nom`),
  ADD KEY `FK_Grupo_ID` (`ID_Grupo`);

--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `Especificaciones`
--
ALTER TABLE `Especificaciones`
  ADD CONSTRAINT `FK_Dev_ID` FOREIGN KEY (`ID_Dev_Asignado`) REFERENCES `Usuarios` (`ID`);

--
-- Restriccions per la taula `Grupos`
--
ALTER TABLE `Grupos`
  ADD CONSTRAINT `FK_Proyecto_ID` FOREIGN KEY (`ID_Proyecto`) REFERENCES `Proyectos` (`ID`);

--
-- Restriccions per la taula `Proyectos`
--
ALTER TABLE `Proyectos`
  ADD CONSTRAINT `FK_Numero_Sprint_ID` FOREIGN KEY (`Numero_Sprint`) REFERENCES `Sprint` (`ID`),
  ADD CONSTRAINT `FK_Product_Owner_ID` FOREIGN KEY (`ID_Product_Owner`) REFERENCES `Usuarios` (`ID`),
  ADD CONSTRAINT `FK_Scrum_Master_ID` FOREIGN KEY (`ID_Scrum_Master`) REFERENCES `Usuarios` (`ID`);

--
-- Restriccions per la taula `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `FK_Grupo_ID` FOREIGN KEY (`ID_Grupo`) REFERENCES `Grupos` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
