CREATE TABLE `alumno` (
	`rut` INT(11) NOT NULL,
	`nombre` VARCHAR(80) NOT NULL,
	`fecha nac` DATE NULL DEFAULT NULL,
	`observaciones` VARCHAR(500) NULL DEFAULT NULL,
	`foto` BLOB NULL,
	`telefono` INT(11) NULL DEFAULT NULL,
	`correo` VARCHAR(80) NULL DEFAULT NULL,
	PRIMARY KEY (`rut`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `asistencia` (
	`fecha` DATE NOT NULL,
	`id` INT(11) NOT NULL,
	`alumno` INT(11) NOT NULL,
	PRIMARY KEY (`fecha`, `id`)
)
COMMENT='Tabla de asistencia efectiva a cada clase'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `clase` (
	`id` INT(11) NOT NULL,
	`dia` INT(11) NOT NULL COMMENT 'dia de la semana 1-7',
	`hora` TIME NOT NULL,
	`profesor` INT(11) NOT NULL COMMENT 'profesor predeterminado',
	`fecha inicio` DATE NOT NULL,
	`fecha fin` DATE NULL DEFAULT NULL
)
COMMENT='Clase generica con horario definido dentro de la semana. Cada clase genera multiples instancias cada vez que se realiza.'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `clase-ins` (
	`fecha` DATE NOT NULL,
	`id` INT(11) NOT NULL,
	`profesor` INT(11) NOT NULL,
	`observaciones` VARCHAR(500) NOT NULL,
	PRIMARY KEY (`fecha`, `id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `plan` (
	`id` INT(11) NULL DEFAULT NULL,
	`Nombre` VARCHAR(50) NULL DEFAULT NULL,
	`duracion` INT(11) NULL DEFAULT NULL COMMENT 'duracion en dias, null indica sin caducidad',
	`clases` INT(11) NULL DEFAULT NULL COMMENT 'null indica clases ilimitadas',
	`estado` VARCHAR(10) NULL DEFAULT NULL COMMENT 'ACTIVO, INACTIVO',
	`valor` INT(11) NULL DEFAULT NULL
)
COMMENT='Definición de plan en número de clases y tiempo de duración\r\nUn plan no puede eliminarse, si queda obsoleto, ya no se considera y se inactiva'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `plan-ins` (
	`alumno` INT(11) NOT NULL,
	`plan` INT(11) NOT NULL,
	`fecha ingreso` DATE NOT NULL,
	`fecha inicio` DATE NOT NULL,
	`fecha fin` DATE NOT NULL,
	PRIMARY KEY (`alumno`, `plan`)
)
COMMENT='Plan tomado por un alumno. Se asocia a un plan estandar y a un alumno en una fecha'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `profesor` (
	`rut` INT(8) NOT NULL,
	`nombre` VARCHAR(60) NOT NULL,
	`fecha nac` DATE NOT NULL,
	`observaciones` VARCHAR(500) NULL DEFAULT NULL,
	`telefono` INT(11) NULL DEFAULT NULL,
	`correo` VARCHAR(80) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
