-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2017 a las 03:00:17
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

-
-- Volcado de datos para la tabla `actions`
--

INSERT INTO `actions` (`id`, `name`, `parent_id`, `always_allowed`, `alias`, `is_hidden`) VALUES

    (300, 'delete_event', 143, 0, 'Delete Event', 0),
    (301, 'add_event_type', 143, 0, 'Add Event Type', 0),
    (302, 'delete_event_type', 143, 0, 'Delete Event Type', 0),
    (303, 'view_event', 143, 0, 'View Event', 0);

-- --------------------------------------------------------
-- --------------------------------------------------------

    -- Estructura de tabla para la tabla `event_type`
    --
    -- PERMITTED VALUES FOR COLUMN 'periodic' ARE:
    -- N : NON PERIODIC (DEFAULT)
    -- W: WEEKLY
    -- M: MONTHLY
    -- A: ANUAL

    CREATE TABLE `event_type` (
      `id` int(10) UNSIGNED NOT NULL,
      `name` varchar(50) DEFAULT NULL,
      `status` tinyint(1) NOT NULL DEFAULT 1,
      `company` tinyint(1) NOT NULL DEFAULT 0,
      `periodic` char(1) NOT NULL DEFAULT 'N',
      `repeat`  int(10) NULL,
		  `weekends` tinyint(1) NOT NULL DEFAULT 1
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    --
    -- Volcado de datos para la tabla `event_type`
    --


		INSERT INTO `event_type` (  `id` ,  `name` ,  `status` ,  `company` ,  `repeat`, `periodic`)
        VALUES 
		(0,'Evento Casual', 1, 0, 0 ,'N'),
		(1,'Evento Fiscal', 1, 1, 0 ,'M'),
		(2,'Evento de la Empresa', 1, 1, 5, 'A'),
		(3,'Evento Nacional', 1, 0, 0, 'A');

  -- 'Evento Casual' ends up with an id of 4 when the AUTOINCREMENT is applied!

--

--

--
-- Estructura Stand-in para la vista `v_calendario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_calendario` (
`id` int(11) unsigned
,`name` varchar(255)
,`due_date` date
,`TASK` varchar(7)
);

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- --------------------------------------------------------

--
-- Estructura para la vista `v_calendario`
--
DROP TABLE IF EXISTS `v_calendario`;
-- --------------------------------------------------------
-- ESTRUCTURA NUEVA DE LA VISTA
-- Estructura para la vista `v_calendario` cambios en el select de appointments
--
-- --------------------------------------------------------
-- ESTRUCTURA NUEVA DE LA VISTA
-- Estructura para la vista `v_calendario` cambios en el select,  appointments y holidays ya no se incluyen
--

DROP VIEW IF EXISTS `v_calendario`;

CREATE ALGORITHM=UNDEFINED DEFINER=
`root`@`localhost` SQL SECURITY DEFINER VIEW `v_calendario`  AS 
 select 
 `t`.`id` AS `id`,
 `t`.`name` AS `name`,
 `t`.`due_date` AS `due_date`,
 'TASK' AS `TASK` 

 from `tasks` `t` union
        
       select `ap`.`id` AS `id`,
       `ap`.`title` AS `'CITA '||ap.title`,cast(`ap`.`date_time` as date) AS `DATE(ap.date_time)`,
       'CITA' AS `CITA` 
       from `appointments` `ap` 
       where (`ap`.`date_time` >= sysdate()) ;
-- --------------------------------------------------------
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
--
-- AUTO_INCREMENT de la tabla `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
--
--
-- AUTO_INCREMENT de la tabla `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
--
-- Restricciones para tablas volcadas
--

-- ALTER TABLE `holidays` ADD UNIQUE `type_index` (`type`);
ALTER TABLE `holidays` ADD UNIQUE `comp_fk_index` (`company`);

ALTER TABLE `holidays`
ADD CONSTRAINT `event_type_fk` FOREIGN KEY (`type`) REFERENCES `event_type` (`id`),
ADD CONSTRAINT `company_fk` FOREIGN KEY (`company`) REFERENCES `empresas` (`id`);

