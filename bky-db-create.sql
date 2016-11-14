-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para cony
DROP DATABASE IF EXISTS `cony`;
CREATE DATABASE IF NOT EXISTS `cony` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cony`;


-- Volcando estructura para tabla cony.alumno
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `rut` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `fecha nac` date DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `foto` blob,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.asistencia
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE IF NOT EXISTS `asistencia` (
  `fecha` date NOT NULL,
  `id` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  PRIMARY KEY (`fecha`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de asistencia efectiva a cada clase';

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.clase
DROP TABLE IF EXISTS `clase`;
CREATE TABLE IF NOT EXISTS `clase` (
  `id` int(11) NOT NULL,
  `dia` int(11) NOT NULL COMMENT 'dia de la semana 1-7',
  `hora` time NOT NULL,
  `profesor` int(11) NOT NULL COMMENT 'profesor predeterminado',
  `fecha inicio` date NOT NULL,
  `fecha fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Clase generica con horario definido dentro de la semana. Cada clase genera multiples instancias cada vez que se realiza.';

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.clase-ins
DROP TABLE IF EXISTS `clase-ins`;
CREATE TABLE IF NOT EXISTS `clase-ins` (
  `fecha` date NOT NULL,
  `id` int(11) NOT NULL,
  `profesor` int(11) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`fecha`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.plan
DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `id` int(11) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL COMMENT 'duracion en dias, null indica sin caducidad',
  `clases` int(11) DEFAULT NULL COMMENT 'null indica clases ilimitadas',
  `estado` varchar(10) DEFAULT NULL COMMENT 'ACTIVO, INACTIVO',
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definición de plan en número de clases y tiempo de duración\r\nUn plan no puede eliminarse, si queda obsoleto, ya no se considera y se inactiva';

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.plan-ins
DROP TABLE IF EXISTS `plan-ins`;
CREATE TABLE IF NOT EXISTS `plan-ins` (
  `alumno` int(11) NOT NULL,
  `plan` int(11) NOT NULL,
  `fecha ingreso` date NOT NULL,
  `fecha inicio` date NOT NULL,
  `fecha fin` date NOT NULL,
  PRIMARY KEY (`alumno`,`plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Plan tomado por un alumno. Se asocia a un plan estandar y a un alumno en una fecha';

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla cony.profesor
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `rut` int(8) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `fecha nac` date NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
