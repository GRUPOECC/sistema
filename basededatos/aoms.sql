-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2017 a las 06:51:19
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aoms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actions`
--

CREATE TABLE `actions` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `always_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `alias` varchar(255) NOT NULL,
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actions`
--

INSERT INTO `actions` (`id`, `name`, `parent_id`, `always_allowed`, `alias`, `is_hidden`) VALUES
(1, 'login', 0, 0, 'Authentication', 0),
(2, 'login', 1, 1, 'Login', 0),
(3, 'logout', 1, 1, 'Logout', 0),
(4, 'cases', 0, 0, 'Casos', 0),
(5, 'add', 4, 0, 'Add', 0),
(6, 'edit', 4, 0, 'Edit', 0),
(7, 'view_case', 4, 0, 'View Case', 0),
(8, 'fees', 4, 0, 'Fees', 0),
(9, 'archived', 4, 0, 'Archived', 0),
(10, 'starred_cases', 4, 0, 'Starred Cases', 0),
(11, 'archived_cases', 4, 0, 'Archived Cases', 0),
(12, 'view_archived_case', 4, 0, 'View Archived Case', 0),
(13, 'restore', 4, 0, 'Restore', 0),
(14, 'reports', 0, 0, 'Reports', 0),
(15, 'message', 0, 0, 'Message', 0),
(16, 'to_do_list', 0, 0, 'To Do List', 0),
(17, 'add', 16, 0, 'Add', 0),
(18, 'edit', 16, 0, 'Edit', 0),
(19, 'view_to_do', 16, 0, 'View', 0),
(20, 'delete', 16, 0, 'Delete', 0),
(21, 'contacts', 0, 0, 'Contactos', 0),
(22, 'add', 21, 0, 'Agregar', 0),
(23, 'edit', 21, 0, 'Editar', 0),
(24, 'delete', 21, 0, 'Borrar', 0),
(25, 'appointments', 0, 0, 'Citas', 0),
(26, 'add', 25, 0, 'Add', 0),
(27, 'edit', 25, 0, 'Edit', 0),
(28, 'delete', 25, 0, 'Delete', 0),
(29, 'view_appointment', 25, 0, 'View', 0),
(30, 'custom_fields', 0, 0, 'Custom Fields', 0),
(31, 'delete', 30, 0, 'Delete', 0),
(32, 'clients', 0, 0, 'Clients', 0),
(33, 'add', 32, 0, 'Add', 0),
(34, 'edit', 32, 0, 'Edit', 0),
(35, 'delete', 32, 0, 'Delete', 0),
(36, 'view_client', 32, 0, 'View', 0),
(37, 'employees', 0, 0, 'Employees', 0),
(38, 'add', 37, 0, 'Add', 0),
(39, 'edit', 37, 0, 'Edit', 0),
(40, 'delete', 37, 0, 'Delete', 0),
(41, 'view', 37, 0, 'View', 0),
(42, 'user_role', 0, 0, 'User Role', 0),
(43, 'add', 42, 0, 'Add', 0),
(44, 'edit', 42, 0, 'Edit', 0),
(45, 'delete', 42, 0, 'Delete', 0),
(46, 'departments', 0, 0, 'Departments', 0),
(47, 'add', 46, 0, 'Add', 0),
(48, 'edit', 46, 0, 'Edit', 0),
(49, 'delete', 46, 0, 'Delete', 0),
(50, 'permissions', 0, 0, 'Permissions', 0),
(51, 'location', 0, 0, 'Location', 0),
(52, 'add', 51, 0, 'Add', 0),
(53, 'edit', 51, 0, 'Edit', 0),
(54, 'delete', 51, 0, 'Delete', 0),
(55, 'case_category', 0, 0, 'Case Category', 0),
(56, 'add', 55, 0, 'Add', 0),
(57, 'edit', 55, 0, 'Edit', 0),
(58, 'delete', 57, 0, 'Delete', 0),
(59, 'court_category', 4, 0, 'Court Category', 0),
(60, 'add', 59, 0, 'Add', 0),
(61, 'edit', 59, 0, 'Edit', 0),
(62, 'delete', 59, 0, 'Delete', 0),
(63, 'act', 0, 0, 'Act', 0),
(64, 'add', 63, 0, 'Add', 0),
(65, 'edit', 63, 0, 'Edit', 0),
(66, 'delete', 63, 0, 'Delete', 0),
(67, 'court', 0, 0, 'Court', 0),
(68, 'add', 67, 0, 'Add', 0),
(69, 'edit', 67, 0, 'Edit', 0),
(70, 'delete', 67, 0, 'Delete', 0),
(71, 'case_stage', 0, 0, 'Case Stages', 0),
(72, 'add', 71, 0, 'Add', 0),
(73, 'edit', 71, 0, 'Edit', 0),
(74, 'delete', 71, 0, 'Delte', 0),
(75, 'payment_mode', 0, 0, 'Payment Modes', 0),
(76, 'add', 75, 0, 'Add', 0),
(77, 'edit', 75, 0, 'Edit', 0),
(78, 'delete', 75, 0, 'Delete', 0),
(79, 'settings', 0, 0, 'Settings', 0),
(80, 'notification', 0, 0, 'Notification', 0),
(81, 'languages', 0, 0, 'Languages', 0),
(82, 'edit', 81, 0, 'Edit', 0),
(83, 'delete', 81, 0, 'Delete', 0),
(84, 'dates', 4, 0, 'Hearing Date', 0),
(85, 'get_court_categories', 4, 1, 'get_court_categories', 1),
(86, 'get_courts', 4, 1, 'get_courts', 1),
(87, 'get_case_by_client', 4, 1, '', 1),
(88, 'get_case_by_court', 4, 1, '', 1),
(89, 'get_case_by_location', 4, 1, '', 1),
(90, 'get_case_by_case_stage_id', 4, 1, '', 1),
(91, 'get_case_by_case_filing_date', 4, 1, '', 1),
(92, 'get_case_by_case_hearing_date', 4, 1, '', 1),
(93, 'get_case_by_client_starred', 4, 1, '', 1),
(94, 'get_case_by_court_starred', 4, 1, '', 1),
(95, 'get_case_by_location_starred', 4, 1, '', 1),
(96, 'get_case_by_case_stage_id_starred', 4, 1, '', 1),
(97, 'get_case_by_case_filing_date_starred', 4, 1, '', 1),
(98, 'get_case_by_case_hearing_date_starred', 4, 1, '', 1),
(99, 'get_archive_case_by_client', 4, 1, '', 1),
(100, 'get_archive_case_by_court', 4, 1, '', 1),
(101, 'get_archive_case_by_location', 4, 1, '', 1),
(102, 'get_archive_case_by_case_stage_id', 4, 1, '', 1),
(103, 'get_archive_case_by_case_filing_date', 4, 1, '', 1),
(104, 'get_archive_case_by_case_hearing_date', 4, 1, '', 1),
(105, 'view_all', 4, 0, 'Case Alert', 0),
(106, 'view_all', 25, 0, 'Appointment Alert', 0),
(107, 'view_all', 16, 0, 'To Do Alert', 0),
(108, 'invoice', 0, 0, 'Invoice', 0),
(109, 'mail', 108, 0, 'Mail', 0),
(110, 'pdf', 108, 0, 'Pdf', 0),
(111, 'send', 15, 0, 'Send Message', 0),
(112, 'tasks', 0, 0, 'Tasks', 0),
(113, 'add', 112, 0, 'Add', 0),
(114, 'edit', 112, 0, 'Edit', 0),
(115, 'view', 112, 0, 'View', 0),
(116, 'delete', 112, 0, 'Delete', 0),
(117, 'comments', 112, 0, 'Comments', 0),
(118, 'documents', 0, 0, 'Documents', 0),
(119, 'add', 118, 0, 'Add', 0),
(120, 'edit', 118, 0, 'Edit', 0),
(121, 'delete', 118, 0, 'Delete', 0),
(122, 'manage', 118, 0, 'Manage', 0),
(123, 'bank_details', 37, 0, 'Bank Details', 0),
(124, 'add_bank_details', 37, 0, 'Add Bank Details', 0),
(125, 'delete_bank_details', 37, 0, 'Delete Bank Details', 0),
(126, 'documents', 37, 0, 'Documents', 0),
(127, 'delete_document', 37, 0, 'Delete Documents', 0),
(128, 'download', 118, 1, 'Download', 1),
(129, 'attendance', 0, 0, 'Attendance', 0),
(130, 'leave_notification', 129, 0, 'Leave Notification', 0),
(131, 'update_leave', 129, 0, 'Pending /Approve Leave', 0),
(132, 'delete_leave', 129, 0, 'Delete Leave', 0),
(133, 'mark_in', 129, 0, 'Mark In', 0),
(134, 'mark_out', 129, 0, 'Mark Out', 0),
(135, 'my_attendance', 129, 0, 'My Attendance', 0),
(136, 'my_leaves', 129, 0, 'My Leaves', 0),
(137, 'apply_leave', 129, 0, 'Apply Leave', 0),
(138, 'delete_my_leave', 129, 0, 'Delete My Leave', 0),
(139, 'leave_types', 0, 0, 'Leave Types', 0),
(140, 'add', 139, 0, 'Add', 0),
(141, 'edit', 139, 0, 'Edit', 0),
(142, 'delete', 139, 0, 'Delete', 0),
(143, 'holidays', 0, 0, 'Holidays', 0),
(144, 'add', 143, 0, 'Add', 0),
(145, 'delete', 143, 0, 'Delete', 0),
(146, 'notice', 0, 0, 'Notice', 0),
(147, 'add', 146, 0, 'Add', 0),
(148, 'edit', 146, 0, 'Edit', 0),
(149, 'Delete', 146, 0, 'Delete', 0),
(150, 'view', 146, 0, 'View', 0),
(151, 'switch_language', 81, 1, 'Change Language', 1),
(152, 'my_tasks', 112, 0, 'My Tasks', 0),
(153, 'delete_document', 118, 0, 'My Delete DOcument', 0),
(154, 'get_degi', 37, 1, 'Get Employees Degination By Ajax', 1),
(155, 'view', 21, 0, 'Consultar', 0),
(156, 'notes', 4, 0, 'Notes', 0),
(157, 'tax', 0, 0, 'Tax', 0),
(158, 'add', 157, 0, 'Add', 0),
(159, 'edit', 157, 0, 'Edit', 0),
(160, 'delete', 157, 0, 'Delete', 0),
(161, 'case_study', 0, 0, 'Case Study', 0),
(162, 'add', 161, 0, 'Add', 0),
(163, 'edit', 161, 0, 'Edit', 0),
(164, 'delete', 161, 0, 'Delete', 0),
(165, 'view', 161, 0, 'View', 0),
(166, 'delete_fees', 4, 0, 'Delete Fees', 0),
(167, 'view_receipt', 4, 0, 'View Receipt', 0),
(168, 'print_receipt', 4, 1, 'Print Receipt', 1),
(169, 'delete_receipt', 4, 0, 'Delete Receipt', 0),
(170, 'dates_detail', 4, 0, 'View Case Extended Date Details', 0),
(171, 'delete_history', 4, 0, 'Delete Case Extended Dates', 0),
(172, 'attachments', 161, 0, 'Attachments', 0),
(173, 'export', 21, 0, 'Exportar', 0),
(174, 'import', 21, 0, 'Importar', 0),
(175, 'add_category', 21, 0, 'Agregar Categoria', 0),
(176, 'dept', 0, 0, 'dept', 0),
(177, 'dept_category', 0, 0, 'dept_category', 0),
(178, 'add', 176, 0, 'Add', 0),
(179, 'edit', 176, 0, 'Edit', 0),
(180, 'delete', 176, 0, 'Delete', 0),
(181, 'add', 177, 0, 'Add', 0),
(182, 'edit', 177, 0, 'Edit', 0),
(183, 'delete', 177, 0, 'Delete', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acts`
--

CREATE TABLE `acts` (
  `id` int(9) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acts`
--

INSERT INTO `acts` (`id`, `title`, `description`) VALUES
(1, 'LEY ADMINISTRACION', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` int(9) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `contact_id` int(9) UNSIGNED NOT NULL,
  `motive` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `notes` text NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `title`, `contact_id`, `motive`, `date_time`, `notes`, `is_view`) VALUES
(1, 'Muestras Monalisa', 3, 'Mostrario 2do Semestre', '2017-07-30 09:00:00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archived_cases`
--

CREATE TABLE `archived_cases` (
  `id` int(9) UNSIGNED NOT NULL,
  `case_id` int(9) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `close_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `archived_cases`
--

INSERT INTO `archived_cases` (`id`, `case_id`, `notes`, `close_date`) VALUES
(1, 2, 'LISTO', '2017-08-02'),
(2, 2, 'listo', '2017-08-01'),
(3, 3, 'dd', '2017-08-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mark_in` timestamp NULL DEFAULT NULL,
  `mark_out` timestamp NULL DEFAULT NULL,
  `mark_in_notes` text NOT NULL,
  `mark_out_notes` text NOT NULL,
  `mark_in_ip` varchar(32) NOT NULL,
  `mark_out_ip` varchar(32) NOT NULL,
  `current_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ifsc` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canned_messages`
--

CREATE TABLE `canned_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `canned_messages`
--

INSERT INTO `canned_messages` (`id`, `deletable`, `type`, `name`, `subject`, `content`) VALUES
(1, 1, 'order', 'Forgot Password Message', 'Password Reset Link at {site_name}!', '<p>Dear {customer_name},</p><p>If you forget your password, on the login page, click the Following link and you can change your account password</p><p>Username - {username}</p><p>{reset_link}</p><p>Thanks,<br>{site_name}</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cases`
--

CREATE TABLE `cases` (
  `id` int(9) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `case_no` varchar(255) NOT NULL,
  `client_id` int(9) UNSIGNED NOT NULL,
  `location_id` int(9) UNSIGNED NOT NULL,
  `court_id` int(9) UNSIGNED NOT NULL,
  `court_category_id` int(9) UNSIGNED NOT NULL,
  `case_category_id` text NOT NULL,
  `case_stage_id` int(10) UNSIGNED NOT NULL,
  `act_id` text NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `hearing_date` date NOT NULL,
  `o_lawyer` varchar(32) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `is_starred` int(11) NOT NULL DEFAULT '0',
  `is_archived` int(11) NOT NULL DEFAULT '0',
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cases`
--

INSERT INTO `cases` (`id`, `title`, `case_no`, `client_id`, `location_id`, `court_id`, `court_category_id`, `case_category_id`, `case_stage_id`, `act_id`, `description`, `start_date`, `hearing_date`, `o_lawyer`, `fees`, `is_starred`, `is_archived`, `notes`) VALUES
(1, 'REPOSICION CAJA CHICA FEBRERO 2017', '1', 2, 1, 2, 1, '["3"]', 1, '["1"]', '', '2017-07-31', '2017-08-01', '', '0.00', 1, 0, '<p>PRUEBA NOTA 1</p>'),
(2, 'FACTURA 123456 PROVEEDOR', '2', 2, 1, 3, 2, '["7"]', 1, '["1"]', '', '2017-07-31', '2017-07-12', '', '0.00', 0, 1, ''),
(3, 'prueba ticket 1', '3', 2, 1, 2, 1, '["3"]', 1, '["1"]', '', '2017-08-01', '2017-08-01', '1', '0.00', 0, 1, ''),
(4, 'prueba ticket 2', '4', 2, 1, 2, 1, '["3"]', 3, '["1"]', '', '2017-08-08', '2017-08-10', '1', '0.00', 0, 0, ''),
(5, 'ticket titulo', '123456', 2, 1, 2, 1, '["2","3","4","6"]', 1, '["1"]', 'desc', '2017-08-01', '2017-08-31', 'apposite abogado', '0.00', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `case_categories`
--

CREATE TABLE `case_categories` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `case_categories`
--

INSERT INTO `case_categories` (`id`, `name`, `parent_id`) VALUES
(1, '2017', 0),
(2, '2017-01', 1),
(3, '2017-02', 1),
(4, 'RECEPCION DE DOCUMENTOS', 0),
(5, 'FACTURAS', 4),
(6, 'FACTURAS SERVICIOS', 5),
(7, 'FACTURAS MERCANCIA', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `case_stages`
--

CREATE TABLE `case_stages` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `case_stages`
--

INSERT INTO `case_stages` (`id`, `name`) VALUES
(1, 'Apertura Ticket'),
(2, 'Ticket Recibido por Departamento Correspondiente'),
(3, 'Ticket No Tiene Solución'),
(4, 'Cierre Ticket');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `case_study`
--

CREATE TABLE `case_study` (
  `id` int(9) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `case_categories` text NOT NULL,
  `notes` text NOT NULL,
  `result` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone1` varchar(15) NOT NULL,
  `phone2` varchar(15) NOT NULL,
  `phone3` varchar(15) NOT NULL,
  `phone4` varchar(15) NOT NULL,
  `category` text NOT NULL,
  `company` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `contact`, `email`, `address`, `phone1`, `phone2`, `phone3`, `phone4`, `category`, `company`, `department`) VALUES
(6, '  ACOSTA', '', '0', '', '0244-447-99-42', '0', '0414-477-77-54', '0', 'LEGAL', 'CASO MARACAY', 'LEGALES'),
(7, '  ', '', '0', '', '0212-762-04-02', '0', '0212-762-04-03', '0', 'OTROS', 'KING GRAFIT', 'OTROS'),
(8, '   ', '', '0', '', '0212-331-27-08', '0212-331-16-87', '0', '0', 'IMPORTACIONES', 'MARTINEZ COOL', 'TRANSPORTE'),
(9, '  MORA ', '', '0', '', '0212-232-52-34', '0414-120-42-42', '0416-930-89-01', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(10, '  MARTINEZ', '', '0', '', '0212-415-54-44', '0416-633-12-91', '0', '0', 'PROVEEDOR', 'PROCLIMA (2020)', 'FUMIGACION'),
(11, 'ABEL  MARTINEZ', '', '0', '', '0414-543-66-01', ' ', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(12, 'ADAN  GUEVARA', '', '0', '', '0212-345-00-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(13, 'AIDA  FERRER', '', '0', '', '0212-693-27-61', '0', '0414-326-14-27', '0212-362-19-97', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(14, ' DRA. ALASKA MOSCATO', '0212-953-52-22', '', '', '0212-953-52-22', '0', '0414-114-82-54', '0', 'ABOGADOS', 'ESCRITORIO JURIDICO', 'LEGALES'),
(16, 'ALBA  TORRES', '', '0', '', '0212-409-01-12', '0', '0212-409-02-06', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(17, 'ALBERTO MARTIN''S', '', '0', '', '0212-383-30-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(18, 'ALBERTO CILBEIRA', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(19, 'ALBERTO ', '', '0', '', '0414-934-76-80', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL'),
(20, 'ALEJANDRO PLANAS', '', '0', '', '0412-932-18-40', '0', '0', '0', 'PROVEEDOR', 'FUGUET & ASOCIADOS', 'ESCRITORIO JURIDICO'),
(21, 'ALEJANDRO DANESI', '', '0', '', '0212-381-06-46', '0', '0212-381-18-58', '0212-381-07-80', 'PROVEEDOR', 'VIMAR DE VZLA', 'MATERIALES ELECTRICOS'),
(22, 'ALEJANDRO DANESI', '', '0', '', '0414-318-90-80', '0', '0212-381-18-58', '0212-381-07-80', 'FAMILIARES SOCIOS', '0', '0'),
(23, 'ALEMNA MOGOLLON', '', '0', '', '0416-417-52-20', '0', '0', '0', 'CONDOMINIO', '0', '0'),
(24, 'ALEMNA  MOGOLLON', '', '0', '', '0212-242-79-41', '0', '0', '0', 'CONDOMINIO', 'CONDOMINIO EDIFICIO CUARZO', 'CONSERJERIA'),
(25, 'ALESSANDRO  CIARAVELLA', '', '0', '', '0212-243-71-91', '0412-335-37-18', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION'),
(26, 'ALEX ', '', '0', '', '0416-715-49-86', '0', '0212-671-14-30', '0', 'PROVEEDOR', 'PARTICULAR', 'MANTENIMIENTO FILTRO'),
(27, 'ALEX YEPEZ', '', '0', '', '0212-241-96-09', '0', '0416-623-31-61', '0416-819-95-07', 'OTROS', 'PARTICULAR', 'OTROS'),
(28, 'ALEXANDER SANABRIA', '', '0', '', '0412-559-70-61', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(29, 'ALFONSO ROSSI', '', '0', '', '0212-552-61-98', '0', '0212-551-28-71', '0212-562-63-00', 'CALZADOS', 'CALZADOS ROSSI', 'CALZADOS'),
(30, 'ALI  FERRER', '', '0', '', '0212-753-99-72', '0', '0416-622-30-90', '0412-320-57-21', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(31, 'AMADA YANEZ', '', '0', '', '0416-819-51-99', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(32, 'AMELIA  DE CIARAVELLA', '', '0', '', '0212-242-47-14', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS'),
(33, 'AMERICO ', '', '0', '', '0212-871-21-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(34, 'ANA MEDINA', '', '0', '', '0212-615-82-09', '0416-905-28-44', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(35, 'ANA SANCHEZ', '', '0', '', '0212-208-39-63', '0', '0414-186-02-07', '0', 'PROVEEDOR', 'CRUZ SALUD', 'MEDICOS Y MEDICINAS'),
(36, 'ANA ROTONDO', '', '0', '', '0212-234-13-75', '0', '0414-032-95-61', '0', 'PROVEEDOR', 'DISEÑOS ARES BAG, C.A.', 'CARTERAS'),
(37, 'ANA VIEIRA', '', '0', '', '0212-234-45-12', '0', '0212-237-75-29', '0', 'PROVEEDOR', 'IMPRESO MULTIPRINT', 'PUBLICIDAD'),
(38, 'ANA DUARTE', '', '0', '', '0212-204-72-34', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'LEGALES'),
(39, 'ANA ', '', '0', '', '0295-264-15-94', '0295-264-12-89', '0', '0', 'PROVEEDOR', 'MRW (PORLAMAR)', 'SERVICIOS DE MENSAJERIA'),
(40, 'ANA VIEIRA', '', '0', '', '0212-234-45-12', '0', '0', '0', 'PROVEEDOR', 'MULTI PRINT', 'ETIQUETAS'),
(41, 'ANA DE FERRER', '', '0', '', '0414-214-28-83', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(42, 'ANA OCANDO', '', '0', '', '0412-205-21-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(43, 'ANA MARIA ', '', '0', '', '0416-715-54-63', '          ', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(44, 'ANAKARI ', '', '0', '', '0414-105-04-94', '0', '0', '0', 'OTROS', 'PARTICULAR', 'NO'),
(45, 'ANGEL BARRERA', '', '0', '', '0416-711-46-70', '0414-322-85-66', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'CENTRAL TELEFONICA'),
(47, 'ANGEL  GUEVARA', '', '0', '', '0416-256-00-84', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(48, 'ANGEL  ERAZO', '', '0', '', '0414-637-83-06', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(49, 'ANGELA  SANCHEZ', '', '0', '', '0416-715-21-48', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(50, 'ANGELINA MEZZACAPO', '', '0', '', '0416-623-78-15', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(51, 'ANTHONY BRICEÑO', '', '0', '', '0412-382-94-77', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(52, 'ANTHONY MILLAN', '', '0', '', '0412-596-97-46', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(53, 'ANTHONY MILLAN', '', '0', '', '0412-596-97-46', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(54, 'ANTHONY FIGUEROA', '', '0', '', '0212-361-16-20', '0', '0412-712-79-13', '0', 'EMPLEADOS', 'GRUPO FERRADINI, C.A.', 'ADMINISTRACION'),
(55, 'ANTONIO LEON', '', '0', '', '0414-122-91-59', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(56, 'ANTONIO LEON', '', '0', '', '0414-122-91-59', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(57, 'ANTONIO ', '', '0', '', '0212-471-00-85', '0', '0212-471-24-24', '0212-471-30-82', 'PROVEEDORES', 'GRAFIPLAST', 'BOLSAS DE CALZADOS'),
(58, 'ANTONIO TIMBI', '', '0', '', '0212-992-40-11', '0212-992-49-21', '0212-992-40-21', '0', 'PROVEEDORES', 'GRAPHIPLAST', 'BOLSAS DE CALZADOS'),
(59, 'ANTONIO ', '', '0', '', '0416-640-59-88', '0', '0', '0', 'OTROS', 'GRUPO TEMESIS', 'OTROS'),
(60, 'ANTONIO GONZALEZ', '', '0', '', '0414-180-96-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'ELECTRICIDAD'),
(61, 'ANTONIO GONZALEZ', '', '0', '', '0414-180-96-67', '0', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'ELECTRICIDAD'),
(62, 'APARICIO ', '', '0', '', '0212-561-67-46', '0', '0412-713-60-29', '0', 'PROVEEDORES', 'CORPORACION TRIVEN', 'FLEJES'),
(63, 'AQUILES ARANGULO', '', '0', '', '0416-701-01-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(64, 'ARELIS ', '', '0', '', '0294-989-72-22', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(65, 'ARGENIDA QUINTERO', '', '0', '', '0426-100-00-51', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(66, 'ARGENIS ', '', '0', '', '0412-543-07-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(67, 'ARISTIDES  RIVERO', '', '0', '', '0212-206-56-38', '0', '0', '0', 'PROVEEDOR', 'SODEXHO PASS DE VENEZUELA', 'OFICINA'),
(68, 'ARMANDO FERNANDEZ', '', '0', '', '0212-243-70-93', '0212-241-44-16', '0212-241-42-42', '0212-241-56-25', 'OTROS', 'PARTICULAR', 'REPUESTOS'),
(69, 'ARMANDO MARQUEZ', '', '0', '', '0212-551-66-94', '0', '0416-411-32-65', '0', 'ENTE PUBLICO', 'PREFECTURA CANDELARIA', 'OFICINA'),
(70, 'ARNETA ', '', '0', '', '0212-872-59-45', '0', '0', '0', 'OTROS', 'SUPRIDORES PALERMO', 'OTROS'),
(71, 'ARVELO MARIN', '', '0', '', '0212-239-66-10', '0', '0412-209-32-47', '0412-615-55-51', 'ENTES PUBLICOS', 'I.N.C.E.', 'APRENDICES'),
(72, 'ARVELO MARIN', '', '0', '', '0412-717-30-16', '0', '0', '0', 'ENTE PUBLICO', 'I.N.C.E.', 'OFICINA'),
(73, 'ARVELO MARIN', '', '0', '', '0212-239-87-73', '0412-615-55-57', '0', '0', 'ENTES PUBLICOS', 'I.N.C.E.', 'OFICINA'),
(74, 'ASCARY ', '', '0', '', '0212-782-33-65', '0', '0212-782-55-07', '0', 'PROVEEDOR', 'LOGISTICA SISTEMAS', 'COMPUTACION'),
(75, 'ASDRUBAL  CASTILLO', '', '0', '', '0212-762-82-81', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(76, 'BACHET ', '', '0', '', '0416-802-30-49', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(77, 'BEATRIZ ', '', '0', '', '0212-561-94-11', '0', '0', '0', 'PROVEEDOR', 'CARBONERA DEL CARIBE', 'OTROS'),
(78, 'BEATRIZ ', '', '0', '', '0212-243-10-95', '0', '0', '0', 'PROVEEDORES', 'M.D.S.', 'IMPRENTA'),
(79, 'BEATRIZ ', '', '0', '', '0212-243-10-95', '0212-243-05-86', '0424-217-62-70', '0', 'PROVEEDOR', 'M.D.S.', 'PUBLICIDAD'),
(80, 'BELEN MORGADO', '', '0', '', '0212-573-08-88', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(81, 'BENANCIO MILLAN', '', '0', '', '0212-243-08-73', '0414-304-85-17', '0212-243-24-74', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(82, 'BENANCIO MILLAN', '', '0', '', '0', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OFICINA'),
(83, 'BERNARDO ', '', '0', '', '0212-363-34-91', '0', '0416-204-16-04', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(84, 'BERTHA MAMA DE BENANCIO', '', '0', '', '0416-833-83-66', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(85, 'BETSI  CASTRO', '', '0', '', '0414-934-75-26', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(86, 'BILL DAY', '', '0', '', '0414-305-87-62', '0', '0', '0', 'PROVEEDORES', 'BILL DAY', 'FOTOGRAFO'),
(87, 'BOADA ', '', '0', '', '0212-561-49-66', '0416-729-39-09', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(88, 'BRIGIDA SAGGIOMO', '', '0', '', '0414-264-27-68', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS'),
(89, 'BRIGIDA SAGGIOMO', '', '0', '', '0414-264-27-68', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS'),
(90, 'BRUNO ', '', '0', '', '0', '0039-0226225634', '0039-0924882227', '0039-0924922154', 'PROVEEDOR', 'SPLENDORPLAST', 'PIELES Y FORROS'),
(91, 'CAMILO  PAZ', '', '0', '', '0416-828-89-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(92, 'CARLA DANESI', '', '0', '', '0212-241-47-27', '0', '0', '0', 'PROVEEDOR', 'WHITE CASTLE, C.A.', 'OBSEQUIOS '),
(93, 'CARLOS BORRERO', '', '0', '', '0416-806-49-34', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(94, 'CARLOS ', '', '0', '', '0212-237-38-35', '0', '0', '0', 'PROVEEDOR', 'H.C IMPRESIONES', 'IMPRENTA'),
(95, 'CARLOS ', '', '0', '', '0212-782-33-65', '0', '0', '0', 'PROVEEDORES', 'LOGICA', 'INFORMATICA'),
(96, 'CARLOS CARDENAS', '', '0', '', '0424-109-38-01', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(97, 'CARLOS GIL', '', '0', '', '0426-914-20-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(98, 'CARLOS KIOSKO', '', '0', '', '0424-127-17-31', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(99, 'CARLOS OBELMEJIAS', '', '0', '', '0414-282-48-65', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'RESCARVEN', 'MEDICOS Y MEDICINAS'),
(100, 'CARLOS ', '', '0', '', '0212-953-05-79', '0', '0212-953-46-90', '0212-951-29-28', 'OTROS', 'SEG TOTAL', 'OTROS'),
(101, 'CARLOS  LEON', '', '0', '', '0212-543-28-55', '0', '0424-131-73-75', '0414-321-61-35', 'ENTES PRIVADOS', 'FETRA CALZADO', 'SINDICATOS'),
(102, 'CARLOS  VARGAS', '', '0', '', '0212-578-13-57', '0', '0412-233-036', '0', 'PROVEEDORES', 'IMPRESORAS FORMACO', 'PAPELERIA'),
(103, 'CARLOS  VARGAS', '', '0', '', '0212-285-18-06', '0', '0212-284-77-77', '0', 'PROVEEDORES', 'IMPRESORAS FORMACO', 'PAPELERIA'),
(104, 'CARLOS  ARCHE', '', '0', '', '0212-782-33-65', '0416-429-63-57', '0', '0', 'PROVEEDOR', 'LOGICA SISTEMAS ', 'SISTEMAS'),
(105, 'CARLOS  SEQUERA', '', '0', '', '0416-708-09-75', '0', '0', '0', 'PROVEEDORES', 'OFICINA MECANICA SEQUERA', 'REP.MAQUINARIAS'),
(106, 'CARLOS  ', '', '0', '', '0416-408-02-70', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(107, 'CARLOS   AVELIS', '', '0', '', '0414-255-30-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(108, 'CARLOS ANDRES ', '', '0', '', '0212-782-33-65', '0', '0', '0', 'PROVEEDOR', 'LOGICA', 'COMPUTACION'),
(109, 'CARMELO CAMMARANO', '', '0', '', '0414-129-29-92', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION'),
(110, 'CARMELO CAMMARANO', '', '0', '', '0212-242-62-48', '0', '0414-129-29-92', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(111, 'CARMEN RODRIGUEZ', '', '0', '', '0212-893-16-74', '0426-808-57-57', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(112, 'CARMEN MARTINEZ', '', '0', '', '0426-811-94-31', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(113, 'CARMEN  MARTINEZ', '', '0', '', '0416-810-20-97', '0', '0', '0', 'PROVEEDORES', 'DISEÑOS KM21', 'BATAS'),
(114, 'CARMEN  BERMUDEZ', '', '0', '', '0416-399-51-06', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(115, 'CARMEN  MOLINA', '', '0', '', '0212-285-23-31', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(116, 'CARO EVELYN ', '', '0', '', '0212-257-28-90', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(117, 'CAROLINA ', '', '0', '', '0412-380-83-40', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(118, 'CAROLINA  FLORES', '', '0', '', '0412-583-00-75', '0', '0412-800-18-23', '0412-336-19-28', 'OTROS', 'PARTICULAR', 'OTROS'),
(119, 'CASTOR FRAGOZA', '', '0', '', '0416-830-11-66', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(120, 'CELSO SANCHEZ', '', '0', '', '0212-368-85-69', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(121, 'CESAR APONTE', '', '0', '', '0412-823-37-94', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(122, 'CESAR ', '', '0', '', '0212-341-95-71', '0', '0414-323-50-10', '0416-305-14-69', 'OTROS', 'PARTICULAR', 'OTROS'),
(123, 'CESAR ', '', '0', '', '0212-341-95-71', '0414-323-50-10', '0416-305-14-69', '0414-238-24-68', 'OTROS', 'PARTICULAR', 'OTROS'),
(124, 'CHACHO ', '', '0', '', '0212-238-52-72', '0416-639-68-47', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'TRANSPORTE'),
(125, 'CHANO ', '', '0', '', '0416-290-30-23', '0', ' ', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(126, 'CHAPITA ', '', '0', '', '0414-182-46-96', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(127, 'CHAVERO RAFAEL', '', '0', '', '0416-622-27-88', '0', '0212-241-57-60', '0212-241-98-56', 'MEDICOS Y MEDICINAS', 'PARTICULAR', 'CARDIOLOGIA'),
(128, 'CHICOTE ', '', '0', '', '0416-896-98-05', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(129, 'CHICOTE ', '', '0', '', '0416-896-98-05', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(130, 'CHINA EVELISA', '', '0', '', '0416-615-45-68', '0', '0', '0', 'ENTE PUBLICO', 'MINISTERIO DEL AMBIENTE', 'OFICIN'),
(131, 'CHISTINA CHIQUILLO', '', '0', '', '0212-640-63-06', '0426-914-14-55', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(132, 'CHITO VILLEGAS', '', '0', '', '0294-514-59-03', '0424-842-28-39', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(133, 'CHON ', '', '0', '', '0414-790-27-10', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(134, 'CHON MILLAN', '', '0', '', '0414-790-27-10', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(135, 'CHONGOLO ', '', '0', '', '0295-414-64-78', '0', '0416-597-62-57', '0412-596-93-17', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(136, 'CIRA  SALAZAR', '', '0', '', '0295-415-55-98', '0', '0295-261-96-75', '0295-261-96-78', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(137, 'CIRO VALENTE', '', '0', '', '0212-871-37-30', '0', '0', '0', 'PROVEEDOR', 'HORMAS CIMA', 'HORMAS'),
(138, 'CIRO PERNIA', '', '0', '', '0414-029-88-14', '0', '0414-211-10-26', '0276-762-01-47', 'OTROS', 'PARTICULAR', 'OTROS'),
(139, 'CLARA TRESPALACIOS', '', '0', '', '0416-821-57-71', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(141, 'COLINA ', '', '0', '', '0416-543-66-01', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TALLER'),
(142, 'COROMOTO HIDALGO', '', '0', '', '0212-953-73-96', '0', '0212-952-11-61', '0', 'EMPRESAS', 'GRUPO FERRADINI (CHACAITO)', 'TIENDAS'),
(143, 'COROMOTO  HIDALGO', '', '0', '', '0212-258-18-21', '0', '0416-720-56-21', '0', 'EMPLEADOS', 'GRUPO FERRADINI, C.A.', 'TIENDAS'),
(144, 'CRISTIAN BELLANCA', '', '0', '', '0414-232-01-87', '0', '0212-241-61-15', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA BELLANCA', 'OTROS'),
(145, 'CRISTINA  CHIQUILLO', '', '0', '', '0416-011-65-21', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(146, 'CRISTINA  CARDENAS', '', '0', '', '0416-613-01-60', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'RRHH'),
(147, 'CRUZ MARCANO', '', '0', '', '0295-414-71-62', '0416-292-31-06', '0416-896-88-82', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(148, 'CRUZ (MARICUCHA) MARCANO', '', '0', '', '0416-896-88-82', '0', '0', '0', 'LEGALES', 'PARTICULAR', 'LEGALES'),
(149, 'DAMARI ', '', '0', '', '0424-179-46-81', '0', '0212-915-02-95', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(150, 'DAMASO FONSECA', '', '0', '', '0212-782-08-78', '0', '0', '0', 'ENTES PUBLICOS', 'OCEI', 'GESTOR'),
(151, 'DAMELIS ', '', '0', '', '0416-609-65-89', '0', '0', '0', 'ENTES PUBLICOS', 'ALCALDIA SUCRE', 'OFICINA'),
(152, 'DAMELIS OCHOA', '', '0', '', '0412-596-50-79', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(153, 'DANIEL ', '', '0', '', '0414-027-09-44', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(154, 'DANTE  CANTIERI', '', '0', '', '0212-731-31-46', '0', '0212-238-58-57', '0212-574-14-22', 'PROVEEDOR', 'CORRETAJE CANTIERI', 'POLIZAS'),
(155, 'DAVID ', '', '0', '', '0212-263-25-28', '0', '0', '0', 'OTROS', 'DISPLAY', 'OTROS'),
(156, 'DAVID ', '', '0', '', '0212-241-09-12', '0212-241-26-92', '0', '0', 'PROVEEDOR', 'MASTER CAUCHO', 'VEHICULOS'),
(157, 'DAVID BAUTE ', '', '0', '', '0212-834-31-99', '0', '0412-800-95-92', '0', 'OTROS', 'PARTICULAR', 'HERRERIA'),
(158, 'DAYARI ', '', '0', '', '0212-762-04-02', '0', '0212-762-04-03', '0', 'OTROS', 'ALFOMBRAS KING GRAPHIS', 'OTROS'),
(159, 'DELFIN NUÑEZ', '', '0', '', '0212-861-88-08', '0', '0414-249-22-36', '0424-152-94-90', 'SINDICATOS', 'SINDICATO', 'OFICINA'),
(160, 'DIANA ', '', '0', '', '0212-953-75-13', '0', '0', '0', 'PROVEEDOR', 'AIR MUNDO, C.A.', 'AGENCIA DE VIAJES'),
(161, 'DIANA ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA'),
(162, 'DILIA ', '', '0', '', '0212-029-43-31', '0', '0212-029-90-03', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(163, 'DIMAS ESCOBAR', '', '0', '', '0212-415-46-40', '0', '0414-245-04-43', '0414-184-71-72', 'OTROS', 'PARTICULAR', 'OTROS'),
(164, 'DOMENICO  ', '', '0', '', '0412-361-33-62', '0', '0', '0', 'CALZADOS', 'FIANDACA', 'CALZADOS'),
(165, 'DONATO ', '', '0', '', '0212-241-68-71', '0', '0', '0', 'PROVEEDOR', 'TALLER DONATO', 'REPARACIONES VEHICULOS'),
(166, 'DONATTO ', '', '0', '', '0212-241-68-71', '0', '0212-243-59-89', '0', 'PROVEEDOR', 'TALLER DONATTO', 'REPARACION DE VEHICULOS'),
(167, 'DORIS ', '', '0', '', '0212-271-57-46', '0', '0', '0', 'PROVEEDOR', 'PANADERIA PANDORO', 'PANADERIA'),
(168, 'DORIS ', '', '0', '', '0273-569-73-78', '0', '0414-569-73-78', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(169, 'DORLIS MENDOZA', '', '0', '', '0424-223-03-36', '0', '0212-816-63-72', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(170, 'DOUGLAS ', '', '0', '', '0414-025-76-51', '0', '0', '0', 'CLIENTES', 'MOTO TAXI', 'MOTO TAXI'),
(171, 'DOUGLAS ROMERO', '', '0', '', '0412-363-62-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(172, 'DOUGLAS ROMERO', '', '0', '', '0412-363-62-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(173, 'EDGAR VELASQUEZ', '', '0', '', '0414-187-16-69', '0', '0', '0', 'SINDICATOS', 'SINDICATOS DEL CALZADO', 'OTROS'),
(174, 'EDGAR  CUADRA', '', '0', '', '0414-319-34-70', '0', '0', '0', 'PROVEEDOR', 'COUTENYE', 'PEGAMENTO'),
(175, 'EDGAR  VELASQUEZ', '', '0', '', '0414-187-16-69', '0', '0414-312-08-09', '0412-724-04-08', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'SINDICATOS'),
(176, 'EDITH LOPEZ', '', '0', '', '0412-906-53-21', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'SISTEMAS'),
(177, 'EDUAR MILLAN', '', '0', '', '0412-726-67-91', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(178, 'EDUARDO CASUES', '', '0', '', '0412-233-01-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(179, 'EDWAR SANCHEZ', '', '0', '', '0424-135-82-50', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'SERVICIOS DE MENSAJERIA'),
(180, 'EDWAR ', '', '0', '', '0424-118-17-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SERVICIO DE MOTOTAXI'),
(181, 'EDWARD MILLAN', '', '0', '', '0414-239-24-89', '0412-726-67-91', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(182, 'EFRAIN PEROZO', '', '0', '', '0414-326-15-04', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS'),
(183, 'EFRAIN PERAZO', '', '0', '', '0414-326-15-04', '0', '0412-54-28-03', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'SINDICATOS'),
(184, 'EILYN MARTINEZ', '', '0', '', '0414-329-34-68', '0', '0412-731-49-56', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(185, 'EILYN ', '', '0', '', '0424-225-75-79', '0', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD'),
(186, 'EL CHIVI ', '', '0', '', '0212-297-73-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(187, 'ELBA  PALACIOS', '', '0', '', '0212-633-47-38', '0', '0212-633-41-45', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(188, 'ELENA DAMASO', '', '0', '', '0212-504-01-88', '0', '0416-705-29-91', '0', 'PROVEEDOR', 'CAVEGUIAS', 'PUBLICIDAD'),
(189, 'ELEXI ARCILA', '', 'EVENTOS@FESTEJOSVENEZUELA.COM.VE', '', '0212-238-70-74', '0212-239-11-40', '0', '0', 'PROVEEDOR', 'FESTEJOS DE VENEZUELA', 'FESTEJOS'),
(190, 'ELIAS LOREN', '', '0', '', '0273-533-27-48', '0', '0', '0', 'CLIENTES', 'ZAPATOS BARINAS', 'VENTAS'),
(191, 'ELIECER SANCHEZ', '', '0', '', '0424-225-75-97', '0', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD'),
(192, 'ELIEZER SANCHEZ', '', '0', '', '0212-693-66-27', '0', '0424-225-75-97', '0', 'PROVEEDOR', 'VIPESA', 'CONTABLE'),
(193, 'ELIO GOMEZ', '', '0', '', '0416-428-03-54', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'OTROS'),
(194, 'ELIO  QUARENTE', '', '0', '', '0416-622-23-830', '0', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A.', 'VENTAS'),
(195, 'ELISA TORRE', '', '0', '', '0414-307-52-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(196, 'ELSA MILLAN', '', '0', '', '0412-953-79-39', '0412-351-01-26', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(197, 'EMIGDIO TERAN', '', '0', '', '0212-322-24-48', '0', '0414-242-55-09', '0', 'OTROS', 'CORPOELEC', 'OFICINA'),
(198, 'ENDER SANCHEZ', '', '0', '', '0212-244-35-96', '0424-221-48-06', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(199, 'ENRIQUE MARCANO', '', '0', '', '0414-245-53-81', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(200, 'ENRRIQUE PLANCHARD', '', '0', '', '0412-562-46-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(201, 'ENRRIQUE  SEGUERA', '', '0', '', '0416-708-09-75', '0', '0', '0', 'PROVEEDORES', 'EMEPI', 'OTROS'),
(202, 'ERAZO ', '', '0', '', '0414-637-83-06', '0', '0', '0', 'OTROS', 'PARTICULAR', 'PAR'),
(203, 'ERIKA MAIGUA', '', '0', '', '0426-215-09-22', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(204, 'ESPERANZA ', '', '0', '', '0212-243-23-45', '0', '0', '0', 'CONDOMINIO', 'EDIFICIO DAOUD', 'CONSERJERIA'),
(205, 'ESPERANZA FARFAN', '', '0', '', '0212-672-13-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(206, 'EUCLIDES  ESTABA', '', '0', '', '0295-291-36-81', '0', '0416-326-81-67', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(207, 'EVANGELINA BERNOTTI', '', '0', '', '0212-257-96-65', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(208, 'FABIO  MENICUCHI', '', '0', '', '0412-319-17-32', '0', '0', '0', 'OTROS', 'PARTICULAR', 'DISEÑOS'),
(209, 'FANNY ', '', '0', '', '0414-758-17-92', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA'),
(210, 'FAUSTO ', '', '0', '', '0212-234-92-98', '0', '0', '0', 'PROVEEDORES', 'CLAVIFER', 'CLAVOS Y TACHUELAS'),
(211, 'FELICIA INFANTE', '', '0', '', '0212-361-98-14', '0', '0414-288-05-00', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(212, 'FELIPE ESPOSO MELIANNE', '', '0', '', '0412-716-82-20', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA MOSCATO', 'OTROS'),
(213, 'FELIX EDUARDO', '', '0', '', '0286-717-43-58', '0', '0412-700-62-48', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(214, 'FERNANDO ', '', '0', '', '0212-235-82-10', '0', '0', '0', 'PROVEEDOR', 'HORMAS CAMER', 'HORMAS'),
(215, 'FERNANDO ', '', '0', '', '0412-912-28-02', '0', '0212-232-09-61', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(216, 'FINA ', '', '0', '', '0212-730-74-80', '0212-731-25-26', '0', '0', 'PROVEEDOR', 'TALLE DOFI', 'MECANICA Y LATONERIA'),
(217, 'FIORELLA ', '', '0', '', '0039-038-169-08', '0039-038-691-48', '0', '0', 'PROVEEDOR', 'FINA', 'CALZADOS'),
(218, 'FLANKLIN  AGUIAR', '', '0', '', '0416-725-09-29', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(219, 'FLOR TORRES', '', '0', '', '0414-333-11-41', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA', 'VENTAS'),
(220, 'FRANCA CHULDA', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(221, 'FRANCA  CONSENTINO', '', '0', '', '0212-993-75-16', '0', '0212-991-78-79', '0414-277-59-30', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(222, 'FRANCIA PATIÑO', '', '0', '', '0212-242-24-05', '0416-400-26-86', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(223, 'FRANCIA  PATIÑO', '', '0', '', '0416-400-26-86', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO'),
(224, 'FRANCIA DE DE GALLO', '', '0', '', '0212-241-62-61', '0', '0414-121-43-13', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(225, 'FRANCIS DIAZ', '', '0', '', '0212-241-27-95', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA LOS JARDINES', 'OFICINA'),
(226, 'FRANCISCA ', '', '0', '', '0426-606-41-83', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO'),
(227, 'FRANCISCO ', '', '0', '', '0212-237-02-08', '0', '0212-235-82-14', '0', 'PROVEEDOR', 'COMPUPLACE', 'EQUIPOS'),
(228, 'FRANCISCO GUEVARA', '', '0', '', '0414-155-39-63', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(229, 'FRANCISCO NAVARRO', '', '0', '', '0416-420-74-05', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(230, 'FRANCISCO GUEVARA', '', '0', '', '0414-155-39-63', '0', '0', '0', 'SINDICATOS', 'SINDICATO DE CALZADO', 'SINDICATOS'),
(231, 'FRANCO VALERI', '', '0', '', '0414-247-18-32', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(232, 'FRANCO ', '', '0', '', '0414-250-89-85', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(233, 'FRANKLIN MARQUEZ', '', '0', '', '0414-123-73-99', '0', '0', '0', 'PROVEEDOR', 'CORPORACION M.P.S., C.A.', 'IMPORTACIONES'),
(234, 'FRANKLIN  FERNANDEZ', '', '0', '', '0414-258-13-82', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'OFICINA'),
(235, 'FREDDY PRATO', '', '0', '', '0416-914-38-24', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO'),
(237, 'FUGUET ', '', '0', '', '0212-234-76-77', '0', '0212-234-80-79', '0', 'PROVEEDOR', 'FUGUET ALBA & ASOCIADOS', 'SERV.LEGALES'),
(238, 'GABRIEL ALVAREZ', '', '0', '', '0212-263-64-29', '0', '0212-262-19-40', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(239, 'GABRIEL  SANCHEZ', '', '0', '', '0414-120-21-56', '0', '0', '0', 'PROVEEDOR', 'CONSTRUCTORA FAGAS', 'CONSTRUCCION'),
(240, 'GABRIEL  ', '', '0', '', '0412-371-62-10', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS LIMPIEZA'),
(241, 'GADEA ', '', '0', '', '0426-889-52-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(242, 'GENERAL ', '', '0', '', '0212-242-18-11', '0', '0', '0', 'PROVEEDOR', 'MAKRO', 'ARTICULOS EN GENERAL'),
(243, 'GENIDELE GONZALEZ', '', '0', '', '0212-503-15-38', '0', '0212-503-15-32', '0212-503-16-32', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA'),
(244, 'GENILEYDI GONZALEZ', '', '0', '', '0212-503-15-07', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA'),
(245, 'GERARDO LUCAS', '', '0', '', '0212-242-91-36', '0', '0', '0', 'PROVEEDOR', 'LUCAS CONSULTORES', '0'),
(246, 'GERENTE ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA'),
(247, 'GERMAN ', '', '0', '', '0416-300-58-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(248, 'GERMAN PAREDES', '', '0', '', '0212-945-21-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(249, 'GERMAN SANTIAGO', '', '0', '', '0212-241-35-89', '0416-208-79-58', '0', '0', 'OTROS ', 'PARTICULAR', 'OTROS'),
(250, 'GERSON ', '', '0', '', '0212-503-10-63', '0', '0', '0', 'BANCOS', 'BANCO  MERCANTIL', 'OFICINA'),
(251, 'GINEIDA ', '', '0', '', '0416-895-30-77', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(252, 'GIOCONDA ', '', '0', '', '0212-243-85-54', '0', '0', '0', 'PROVEEDOR', 'TENERIA BISONTE', 'PIELES Y FORROS'),
(253, 'GIOMAR RAMIREZ', '', '0', '', '0212-200-94-52', '0', '0', '0', 'OTROS', 'MOVISTAR', 'OFICINA'),
(254, 'GIOMAR RAMIREZ', '', '0', '', '0212-200-11-11', '0', '0', '0', 'COMUNICACIONES', 'MOVISTAR', 'SERVICIOS DE MENSAJERIA'),
(255, 'GIOVANNY  SALAZAR', '', '0', '', '0212-503-36-78', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA'),
(256, 'GLADIS JARDIN', '', '0', '', '0212-552-83-09', '0', '0212-571-19-57', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(257, 'GLADIS JARDIN', '', '0', '', '0212-552-83-09', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(258, 'GLESIA ', '', '0', '', '0426-405-16-63', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(259, 'GLORIA LA CRUZ', '', '0', '', '0414-245-7836', '0', '0416-607-72-27', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(260, 'GLORIA BECERRA', '', '0', '', '0416-607-72-27', '0', '0', '0', 'CONTRATADOS', 'VIPESA', 'CONTABLE'),
(261, 'GODOFREDO LEON', '', '0', '', '0412-795-99-41', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(262, 'GONZALO ', '', '0', '', '0416-701-73-52', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(263, 'GRACIELA(HER.JULIO) ', '', '0', '', '0414-104-42-40', '0', '0416-406-90-97', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(264, 'GRANDA ', '', '0', '', '0212-286-48-81', '0414-318-78-05', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(265, 'GRISELDA ', '', '0', '', '0212-564-26-70', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(266, 'GUILLERMINA ', '', '0', '', '0414-410-55-60', '0', '0', '0', 'LEGAL', 'PARTICULAR', 'LEGALES'),
(267, 'GUILLERMO MILLAN', '', '0', '', '0212-259-10-42', '0', '0416-995-80-11', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(268, 'GUILLERMO ALCALA', '', '0', '', '0416-620-68-08', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(269, 'GUILLERMO ALCALA', '', '0', '', '0416-620-68-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TRAMITES LABORALES'),
(270, 'GUSTAVO ', '', '0', '', '0414-274-61-20', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TALLER'),
(271, 'GUSTAVO BONILLA', '', '0', '', '0416-904-27-73', '0', '0', '0', 'PROVEEDOR', 'PASTEUR', 'OFICINA'),
(272, 'HANY ', '', '0', '', '0414-319-02-91', '0', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL TRABAJO', 'OTROS'),
(273, 'HAYDEE RODRIGUEZ', '', '0', '', '0212-515-71-18', '0', '0414-013-73-92', '0426-913-93-16', 'OTROS', 'PARTICULAR', 'OTROS'),
(274, 'HECTOR ACOSTA', '', '0', '', '0412-958-12-97', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(275, 'HECTOR ', '', '0', '', '0412-239-06-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(276, 'HENRY PEÑALVER', '', '0', '', '0212-234-77-31', '0212-762-13-59', '0212-762-4351', '0416-701-58-08', 'PROVEEDOR', 'CAJAS FUERTES SB', 'OFICINA'),
(277, 'HENRY FERRER', '', '0', '', '0212-365-06-86', '0', '0212-362-77-41', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(278, 'HENRY PERDOMO', '', '0', '', '0414-250-94-37', '0', '0416-', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(279, 'HENRY MARCANO', '', '0', '', '0414-330-62-73', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(280, 'HENRY PEÑALVER', '', '0', '', '0212-234-77-31', '0416-701-58-08', '0', '0', 'OTROS', 'PARTICULAR ', 'OTROS'),
(281, 'HERNAN CABALLERO', '', '0', '', '0212-885-16-08', '0426-908-90-82', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(282, 'HERRY FERRER', '', '0', '', '0212-365-06-86', '0', '0212-362-77-41', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(283, 'HETERINA MONTAÑO', '', '0', '', '0426-431-49-30', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(284, 'HUMBERTO ', '', '0', '', '0412-992-30-43', '0', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'SIFONES DE CERVEZA'),
(285, 'IDA VALENTINA', '', '0', '', '0212-975-09-20', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(286, 'IGNACIO MOTA', '', '0', '', '0212-239-93-57', '0', '0212-235-62-69', '0414-307-31-70', 'PROVEEDORES', 'TENERIA VRB C.A', 'PIELES'),
(287, 'IMELDA ESCORCHE', '', '0', '', '0212-368-90-71', '0416-708-24-24', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(288, 'INGRID ARRIETA', '', '0', '', '0212-243-29-76', '0426-717-00-36', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(289, 'IRENE ANTELIZ', '', '0', '', '0212-671-38-48', '0426-220-67-31', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(290, 'IRMA OSES', '', '0', '', '0414-243-01-35', '0', '0212-363-30-36', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(291, 'ISABEL Y/O NELSON RODRIGUEZ ', '', '0', '', '0212-501-38-27', '0', '0212-501-35-08', '0212-501-32-85', 'BANCOS', 'BANCO DE VENEZUELA', 'FIDEICOMISO'),
(292, 'ISMAEL PADRON', '', '0', '', '0424-214-83-88', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(293, 'ISRAEL  CAMACHO', '', '0', '', '0414-537-80-18', '0', '0412-912-81-48', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(294, 'IVAN MORALES', '', '0', '', '0416-729-86-41', '0', '0426-910-05-36', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(295, 'IVAN MORALES', '', '0', '', '0426-910-05-36', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(296, 'IVAN  GARMENDIA', '', '0', '', '0212-985-70-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(297, 'IVANNA GONZALEZ', '', '0', '', '0414-203-26-79', '0', '0212-515-45-43', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(298, 'JACKSON MATA', '', '0', '', '0412-720-21-99', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(299, 'JACOBO ', '', '0', '', '0414-252-18-58', '0', '0', '0', 'CALZADOS', 'SEBAGO', 'CALZADOS'),
(300, 'JAIME RODRIGUEZ', '', '0', '', '0295-262-97-55', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(301, 'JAIRO CARREÑO', '', '0', '', '0414-189-95-85', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TRAUMATOLOGO'),
(302, 'JANETH SALAZAR', '', '0', '', '0', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(303, 'JASURI LINDO', '', '0', '', '0424-153-87-63', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SALUD Y SEGURIDAD LABORAL'),
(304, 'JEAN FRANCO', '', '0', '', '0414-234-06-98', '0', '0412-234-06-98', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(305, 'JEAN CARLOS', '', '0', '', '0414-025-26-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(306, 'JEAN FRANCO', '', '0', '', '0412-204-58-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(307, 'JELITZA VEGA', '', '0', '', '0424-494-51-00', '0', '0', '0', 'ENTES PUBLICOS', 'NOTARIA DE BARUTA', 'OFICINA'),
(308, 'JENNIOR MENDEZ', '', 'jennior_1@hotmail.com', '', '0212-600-82-04', '0', '0412-814-26-39', '0414-014-21-90', 'OTROS', 'PARTICULAR', 'OTROS'),
(309, 'JENNY PERDOMO', '', '0', '', '0414-250-94-37', '0', '0416-610-39-24', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(310, 'JEPE  ', '', '0', '', '0416-623-31-61', '0426-513-25-93', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(311, 'JESSICA MILLAN', '', '0', '', '0412-200-50-43', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(312, 'JESSICA  VASQUEZ', '', '0', '', '0212-620-60-78', '0424-195-80-75', '0', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES'),
(313, 'JESUS CANALES', '', '0', '', '0212-241-09-13', '0', '0212-241-67-07', '0212-241-27-95', 'BANCOS', 'BANCO BANESCO LA URBINA', 'OFICINA'),
(314, 'JESUS ESCOBAR', '', '0', '', '0212-266-76-71', '0212-266-93-76', '0', '0', 'PROVEEDOR', 'BARCODE', 'SISTEMAS'),
(315, 'JESUS GUEVARA', '', '0', '', '0212-315-73-18', '0412-736-86-26', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(316, 'JESUS DIAZ', '', '0', '', '0412-204-30-06', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(317, 'JESUS RODRIGUEZ', '', '0', '', '0212-341-83-79', '0', '0', '0', 'PROVEEDORES', 'FABRICA DE BOLSAS', 'COMPRAS'),
(318, 'JESUS MILLAN', '', '0', '', '0416-853-87-62', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(319, 'JESUS FERRER', '', '0', '', '0212-816-12-24', '0', '0412-935-85-79', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(320, 'JESUS ESPINOZA', '', '0', '', '0412-711-15-12', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(321, 'JESUS ALONZO', '', '0', '', '0212-471-38-68', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL'),
(322, 'JHOAN MORA ', '', '0', '', '0212-267-77-59', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(323, 'JHON ', '', '0', '', '0212-241-27-24', '0', '0212-241-96-36', '0', 'PROVEEDORES', 'CREACIONES AUREL', 'CALZADOS'),
(324, 'JHON ', '', '0', '', '0212-241-27-24', '0', '0412-952-96-79', '0', 'PROVEEDORES ', 'CREACIONES AUREL', 'CINTURONES'),
(325, 'JHON SUR', '', '0', '', '0212-571-00-02', '0', '0414-181-10-48', '0', 'OTROS', 'PARTICULAR', 'ACUPUNTURA'),
(326, 'JHON MAIRI', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(327, 'JHON  MUÑOZ', '', '0', '', '0414-123-79-42', '0', ' ', '0', 'AG.VIAJES', 'AEROPOSTAL', 'GERENCIA'),
(328, 'JHON  AUREL', '', '0', '', '0412-952-96-79', '0', '0416-701-58-08', '0', 'PROVEEDORES', 'CREACIONES AUREL, C.A.', 'CINTURONES'),
(329, 'JHONNY VAAMONDE', '', '0', '', '0414-195-89-45', '0', '0', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'VIGILANCIA'),
(330, 'JHONNY ', '', '0', '', '0212-241-96-36', '0', '0212-241-27-24', '0', 'PROVEEDOR', 'CREACIONES AUREL, C.A.', 'COMPRAS'),
(331, 'JHONNY ', '', '0', '', '0212-242-57-21', '0', '0', '0', 'PROVEEDOR', 'LIBRERÍA 44', 'UTILES DE OFICINA'),
(332, 'JOAN  CAMPOBASO', '', '0', '', '0212-243-71-96', '0', '0412-243-08-60', '0414-243-08-60', 'PROVEEDORES', 'SOLUCIONES INFORMATICAS SOIN, C.A.', 'INFORMATICA'),
(333, 'JOEL O EDUARDO ', '', '0', '', '0414-531-53-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'COPIADORA'),
(334, 'JOHANA ', '', '0', '', '0212-284-70-45', '0', '0', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIAS DE VIAJES'),
(335, 'JOHANA ', '', '0', '', '0212-861-88-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(336, 'JONNY MONTENEGRO', '', '0', '', '0212-542-44-53', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(337, 'JONNY REPUESA', '', '0', '', '0416-729-27-33', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(338, 'JORGE MUSCO', '', '0', '', '0212-243-08-51', '0', '0212-241-21-07', '0414-129-00-70', 'OTROS', 'PARTICULAR', 'OTROS'),
(339, 'JORGE ORTEGANO', '', '0', '', '0424-197-19-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(340, 'JORGE LUIS ORTEGANO', '', '0', '', '0212-762-82-81', '0212-361-83-74', '0212-762-90-64', '0414-838-63-28', 'OTROS', 'PARTICULAR', 'OTROS'),
(341, 'JORGEL GESENA', '', '0', '', '0212-272-31-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(342, 'JORGUE SALAS', '', '0', '', '0412-927-97-84', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(343, 'JOSE CASTRO', '', '0', '', '0416-907-91-84', '0416-831-22-53', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(344, 'JOSE RIVERO', '', '0', '', '0212-341-82-49', '0414-338-65-65', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(345, 'JOSE VASQUEZ', '', '0', '', '0416-246-24-52', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(346, 'JOSE ARRIECHI', '', '0', '', '0212-251-03-56', '0412-567-30-05', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(347, 'JOSE RODRIGUEZ', '', '0', '', '0212-239-76-42', '0', '0414-320-03-53', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(348, 'JOSE BOLIVAR', '', '0', '', '0414-121-22-79', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(349, 'JOSE RODRIGUEZ', '', '0', '', '0414-320-03-53', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(350, 'JOSE VILLEGAS', '', '0', '', '0212-256-58-64', '0', '0414-271-72-21', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(351, 'JOSE MENDOZA', '', '0', '', '0412-219-38-65', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(352, 'JOSE MAVARES', '', '0', '', '0414-255-07-64', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(353, 'JOSE ', '', '0', '', '0414-267-46-59', '0', '0', '0', 'OTROS', 'PARTICULAR', 'VEHICULOS'),
(354, 'JOSE  VALOIS', '', '0', '', '0412-567-30-05', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(355, 'JOSE ANGEL ', '', '0', '', '0212-883-96-91', '0', '0412-984-96-90', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(356, 'JOSE ANTONIO ', '', '0', '', '0412-611-08-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'COPIADORA'),
(357, 'JOSE ANTONIO ', '', '0', '', '0212-309-05-65', '0414-309-36-94', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(358, 'JOSE ARIEL MONTES', '', '0', '', '0241-835-99-80', '0', '0', '0', 'PROVEEDORES', 'INDUSTRIAS IMAR', 'MAQUINARIA Y TROQUELES'),
(359, 'JOSE GREGORIO LOPEZ', '', '0', '', '0414-258-64-10', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(360, 'JOSE MANUEL ANGULO', '', '0', '', '0212-621-61-12', '0414-135-87-05', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(361, 'JOSE MANUEL SOMOZA', '', '0', '', '0251-255-26-20', '0', '0416-816-73-89', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(362, 'JOSEFINA  CAMMARANO', '', '0', '', '0212-693-66-27', '0', '0424-225-75-98', '0', 'PROVEEDOR', 'VIPESA', 'CONTABLE'),
(363, 'JOSUA NAVARRO', '', '0', '', '0414-344-10-19', '0', '0', '0', 'LEGAL', 'CASO MARACAY', 'LEGALES'),
(364, 'JUAN ARVELAY', '', '0', '', '0416-305-86-79', '0', '0', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'OTROS'),
(365, 'JUAN MANUEL', '', '0', '', '0212-324-53-33', '0', '0414-264-03-82', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'CARPINTERIA'),
(366, 'JUAN CALDERON', '', '0', '', '0212-532-25-78', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(367, 'JUAN OSUNA', '', '0', '', '0212-368-13-63', '0416-393-23-00', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(368, 'JUAN MERCADO', '', '0', '', '0416-824-85-56', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(369, 'JUAN PEREIRA', '', '0', '', '0416-618-68-52', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(370, 'JUAN MUÑOZ', '', '0', '', '0212-428-71-32', '0424-182-13-20', '0', '0', 'PROVEEDOR', 'ECOMAN PUBLICIDAD', 'OTROS'),
(371, 'JUAN ', '', '0', '', '0416-725-34-66', '0', '0', '0', 'PROVEEDOR', 'IMPRESOS CANAIMA', 'IMPRENTA'),
(372, 'JUAN RAMIREZ', '', '0', '', '0212-204-72-39', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'COTIZACION'),
(373, 'JUAN  ', '', '0', '', '0424-193-74-77', '0414-178-57-53', '0', '0', 'CLIENTE', 'MARDAG', 'VENTAS'),
(374, 'JUAN OJEDA', '', '0', '', '0212-271-91-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(375, 'JUAN ', '', '0', '', '0414-257-93-50', '0', '0212-564-72-58', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(376, 'JUAN DIAZ', '', '0', '', '0416-633-80-78', '0', '0416-620-84-76', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(377, 'JUAN CARLOS', '', '0', '', '0212-762-82-81', '0412-362-86-87', '0', '0', 'OTROS', 'PROSEGUROS', 'OFICINA'),
(378, 'JUAN  ARVELAY', '', '0', '', '0212-361-85-34', '0', '0416-305-86-79', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'VIGILANCIA'),
(379, 'JUAN  MILLAN', '', '0', '', '0212-409-60-08', '0', '0212-409-61-10', '0295-291-39-30', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(380, 'JUAN  ', '', '0', '', '0416-615-26-48', '0', '0', '0', 'PROVEEDORES', 'IMPRESOS CANAIMA', 'IMPRENTA'),
(381, 'JUAN  MARCANO', '', '0', '', '0414-257-93-50', '0', '0212-564-72-58', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(382, 'JUAN  CARLOS', '', '0', '', '0212-762-82-81', '0', '0212-762-90-64', '0412-362-86-87', 'OTROS', 'PARTICULAR', 'OTROS'),
(383, 'JUAN CARLOS ', '', '0', '', '0212-257-90-75', '0416-186-90-82', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(384, 'JUAN JOSE GARCIA', '', '0', '', '0212-428-87-14', '0424-222-84-93', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(385, 'JUDITH ', '', '0', '', '0212-212-85-78', '0', '0212-212-85-77', '0', 'PROVEEDORES', 'IMPRESORA FORMACO', 'FORMAS CONTINUAS'),
(386, 'JUDITH ', '', '0', '', '0212-959-51-01', '0412-244-76-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(387, 'JULIA MEDINA', '', '0', '', '0412-383-76-02', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(388, 'JULIO MENDEZ', '', '0', '', '0414-326-69-89', '0', '0212-238-41-73', '0', 'PROVEEDORES', 'MENDEZ & ASOCIADOS', 'CONTABLE'),
(389, 'JULIO ', '', '0', '', '0416-402-62-65-', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(390, 'JULIO ', '', '0', '', '0212-417-63-73', '0416-917-55-43', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(391, 'JULIO CESAR PERALES', '', '0', '', '0412-720-50-53', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(392, 'KAREN ', '', '0', '', '0424-152-94-90', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(393, 'KARLA BRAVO', '', '0', '', '0212-631-06-07', '0', '0', '0', 'PROVEEDOR', 'MARELIS SERVICE', 'MANTENIMIENTO BOMBAS'),
(394, 'KATINA BERNOTTI', '', '0', '', '0212-901-56-31', '0', '0212-901-56-36', '0416-627-58-74', 'FAMILIARES EMPLEADOS', 'FAMILIA MOSCATO', 'OTROS'),
(395, 'KELLY RODRIGUEZ', '', '0', '', '0424-123-17-32', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(396, 'KENDRY ', '', '0', '', '0295-259-08-91', '0', '0416-291-06-95', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(397, 'LAURA CARRILLO', '', '0', '', '0416-623-20-91', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(398, 'LEIDY COLMENARES', '', '0', '', '0212-620-64-04', '0', '0', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES'),
(399, 'LENID BELISARIO', '', '0', '', '0414-311-51-71', '0', '0414-597-84-43', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(400, 'LENIN BELISARIO', '', '0', '', '0414-597-84-43', '0', '0424-311-51-71', '0', 'OTROS', 'PARTICULAR', 'OFTAMOLOGIA'),
(401, 'LEON ARDI', '', '0', '', '0242-365-00-91', '0412-747-07-09', '0242-364-70-84', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(402, 'LEON DILIA', '', '0', '', '0242-304-70-84', '0416-842-04-99', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(403, 'LEONARDO ', '', '0', '', '0416-216-93-58', '0', '0', '0', 'OTROS', 'PARTICULAR', 'CENTRAL TELEFONICA'),
(404, 'LEONARDO MARTINS', '', '0', '', '0416-716-34-00', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(405, 'LEONCIO ', '', '0', '', '0416-831-84-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(406, 'LEONCIO ', '', '0', '', '0416-831-84-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(407, 'LEYDA GARCIA', '', '0', '', '0212-342-86-06', '0426-806-17-23', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(408, 'LIBERATTA  MEZZACAPO', '', '0', '', '0416-623-78-15', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(409, 'LIC. RUTH/DORIS ', '', '0', '', '0212-571-49-77', '0', '0212-571-41-02', '0', 'PROVEEDOR', 'CAVECAL', 'OFICINA'),
(410, 'LIDIA ', '', '0', '', '0212-830-47-52', '0', '0', '0', 'ENTES PUBLICOS', 'P.T.J.  (GUARENAS)', 'OFICINA'),
(411, 'LIDIA ', '', '0', '', '0212-830-47-52', '0', '0', '0', 'ENTES PUBLICOS', 'P.T.J. (GUARENAS)', 'OFICINA'),
(412, 'LILIANA ', '', '0', '', '0412-081-81-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(413, 'LILIBETH ', '', '0', '', '0414-799-61-09', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA'),
(414, 'LIMAR MENDEZ', '', '0', '', '0212-238-41-73', '0212-238-11-51', '0414-326-69-89', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(415, 'LISETH TENIA', '', '0', '', '0212-693-22-31', '0212-275-37-46', '0414-248-84-21', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(416, 'LOREDANA  DE CIARAVELLA ', '', '0', '', '0212-243-00-85', '0', '0412-929-53-75', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS'),
(417, 'LORENZO MIREYA', '', '0', '', '0251-254-87-93', '0', '0251-254-68-66', '0416-656-26-35', 'CLIENTES', 'INVERSIONES MIRLOR', 'VENTAS'),
(418, 'LUCERO MUÑOZ', '', '0', '', '0275-881-07-22', '0414-758-17-89', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA'),
(419, 'LUCIA ESCULPI', '', '0', '', '0212-241-32-07', '0212-242-56-73', '0', '0', 'PROVEEDOR', 'CORPORACION CAPI', 'UTILES ESCOLARES'),
(420, 'LUCIANO ', '', '0', '', '0416-290-30-23', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA'),
(421, 'LUCIO CAMMARANO', '', '0', '', '0414-126-24-35', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'SOCIOS'),
(422, 'LUIS ROMERO', '', '0', '', '0', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(423, 'LUIS FIGUEROA', '', '0', '', '0212-361-64-67', '0416-416-62-48', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(424, 'LUIS JIMENEZ', '', '0', '', '0412-589-96-31', '0', '0416-538-38-99', '0', 'PROVEEDOR', 'GLOBAL', 'SISTEMA'),
(425, 'LUIS ', '', '0', '', '0212-241-73-95', '0', '0', '0', 'MENSAJERIA', 'M.R.W.', 'MENSAJERIA'),
(426, 'LUIS TAPIA', '', '0', '', '0212-631-08-43', '0414-275-02-26', '0', '0', 'PROVEEDOR', 'MARELIS SERVICE', 'MANTENIMIENTO BOMBAS'),
(427, 'LUIS ', '', '0', '', '0212-241-73-33', '0', '0414-929-77-25', '0', 'CONDOMINIO', 'PARTICULAR', 'CONSERJERIA'),
(428, 'LUIS RONDON', '', '0', '', '0414-108-43-95', '0212-462-83-65', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(429, 'LUIS GRANDA', '', '0', '', '0212-286-48-81', '0414-318-78-05', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(430, 'LUIS ', '', '0', '', '0212-256-46-28', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(431, 'LUIS ORTEGANO', '', '0', '', '0424-197-19-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(432, 'LUIS ALBERTO', '', '0', '', '0412-210-66-84', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(433, 'LUIS PADRINO', '', '0', '', '0412-958-52-68', '0239-611-51-61', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(434, 'LUIS LOPEZ', '', '0', '', '0414-186-74-55', '0', '0', '0', 'PROVEEDOR', 'PRINT L.B.', 'PUBLICIDAD'),
(435, 'LUIS ', '', '0', '', '0426-913-10-88', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'CHOFER'),
(436, 'LUIS ', '', '0', '', '0212-237-49-71', '0', '0', '0', 'PROVEEDOR', 'X-TRAPINT', 'IMPRENTA'),
(437, 'LUIS  GUEVARA', '', '0', '', '0212-516-23-93', '0414-256-00-84', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(438, 'LUIS  BETANCOURT', '', '0', '', '0212-345-39-25', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(439, 'LUIS  GALLO', '', '0', '', '0212-888-62-95', '0212-577-080', '0414-115-26-34', '0', 'OTROS', 'PARTICULAR', 'OTROS');
INSERT INTO `contacts` (`id`, `name`, `contact`, `email`, `address`, `phone1`, `phone2`, `phone3`, `phone4`, `category`, `company`, `department`) VALUES
(440, 'LUIS  GARCIA', '', '0', '', '0416-806-93-94', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(442, 'LUIS  ', '', '0', '', '0426-931-43-11', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE (2011)', 'TRANSPORTE'),
(443, 'LUIS (CHINO)  LOPEZ', '', '0', '', '0212-541-09-10', '0', '0424-105-35-57', '0', 'PROVEEDORES', 'PRINT LB', 'PUBLICIDAD'),
(444, 'LUISA ESCOBAR', '', '0', '', '0414-301-18-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(445, 'LUISITA ', '', '0', '', '0212-243-08-73', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(446, 'LUPE ', '', '0', '', '0416-408-45-56', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(447, 'LUZ MARINA ', '', '0', '', '0', '0', '0', '0', 'ENTES PUBLICOS', 'SETRA', 'OFICINA'),
(448, 'MADELIN PADRON', '', '0', '', '0212-214-83-88', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(449, 'MADELYN PADRON', '', '0', '', '0212-214-83-88', '0412-013-10-14', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION'),
(450, 'MAGALY CAMMARAN', '', '0', '', '0212-883-67-24', '0412-553-10-55', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(451, 'MAGALY DE GARCIA', '', '0', '', '0416-838-47-29', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(452, 'MAGDA ', '', '0', '', '0212-325-11-93', '0416-812-30-42', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(453, 'MAICOL ', '', '0', '', '0424-208-94-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(454, 'MAIGUA HELAINE', '', '0', '', '0414-107-63-62', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(455, 'MALDONADO ', '', '0', '', '0212-975-09-20', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(456, 'MANDY  ', '', '0', '', '0414-160-63-87', '0', '0', '0', 'PROVEEDOR', 'VENCANAL', 'ARTICULOS EN GENERAL'),
(457, 'MANUEL DOS SANTOS', '', '0', '', '0412-623-49-29', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(458, 'MARGARITA  GUASAMACURO', '', '0', '', '0212-251-74-52', '0416-214-36-68', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(459, 'MARGARITA  LOPEZ', '', '0', '', '0414-819-50-20', '0', '0', '0', 'MEDICOS Y MEDICINAS', '0', 'TRAUMATOLOGO'),
(460, 'MARIA ', '', '0', '', '0276-771-09-86', '0', '0212-771-27-30', '0', 'OTROS', 'CONSULTORIO & ASOCIADOS', 'OTROS'),
(461, 'MARIA GONZALEZ', '', '0', '', '0416-428-38-94', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR C.A', 'ADMINISTRACION'),
(462, 'MARIA GONZALEZ', '', '0', '', '0416-820-04-99', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(463, 'MARIA QUINTERO', '', '0', '', '0212-363-59-58', '0426-715-17-75', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(464, 'MARIA ROJO', '', '0', '', '0416-429-30-12', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(465, 'MARIA ROJAS', '', '0', '', '0212-915-29-35', '0426-414-57-11', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(466, 'MARIA VASQUEZ', '', '0', '', '0414-321-76-59', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(467, 'MARIA ROJAS', '', '0', '', '0416-406-29-64', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(468, 'MARIA EUGENIA', '', '0', '', '0212-661-50-67', '0412-362-15-66', '0416-401-89-03', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(469, 'MARIA CABRALES', '', '0', '', '0412-329-53-79', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(470, 'MARIA BOSCAN', '', '0', '', '0212-241-88-44', '0', '0', '0', 'PROVEEDOR', 'VEPACOR', '0'),
(471, 'MARIA ANGELICA ', '', '0', '', '0416-213-78-16', '0', '0', '0', 'ENTES PUBLICOS', 'I.N.C.E.', 'OFICINA'),
(472, 'MARIA ELENA CENTENO', '', '0', '', '0414-240-85-96', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(473, 'MARIA ROSA ', '', '0', '', '0212-235-12-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(474, 'MARIANA PEÑA', '', '0', '', '0416-352-50-07', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(475, 'MARIANA VILLARROEL', '', '0', '', '0212-232-79-93', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(476, 'MARIANA ', '', '0', '', '0281-281-01-97', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(477, 'MARIBEL OPORTE', '', '0', '', '0212-793-23-84', '0212-794-19-21', '0', '0', 'PROVEEDOR', 'CARGO MASTER', 'IMPORTACIONES'),
(478, 'MARIBEL CALLES', '', '0', '', '0212-408-48-57', '0212-408-48-58', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL AMBIENTE', 'OFICINA'),
(479, 'MARIELA VERA', '', '0', '', '0212-882-67-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(480, 'MARINA MARTINEZ', '', '0', '', '0212-276-23-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(481, 'MARINELLI  PASSARELLI', '', '0', '', '0212-576-71-93', '0212-578-09-54', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(482, 'MARIO CENTENO', '', '0', '', '0212-267-02-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(483, 'MARIO DELL', '', 'DELCORSOCA@HOTMAIL.COM', '', '0212-941-19-71', '0212-945-84-97', '0416-622-29-38', '0412-622-29-38', 'PROVEEDOR', 'PASTELERIA EL CORSO', 'PANADERIA Y PASTELERIA'),
(484, 'MARIO  PEREZ', '', '0', '', '0414-431-44-25', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(485, 'MARISOL VALDERRAMA', '', '0', '', '0212-244-32-38', '0414-100-92-63', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(486, 'MARISOL FERNANDEZ', '', '0', '', '0212-959-09-31', '0', '0212-959-10-10', '0', 'EMPRESAS', 'GRUPO FERRADINI (TAMANACO)', 'TIENDAS'),
(487, 'MARISOL PULIDO', '', '0', '', '0414-263-19-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SEGURO SOCIAL'),
(488, 'MARITZA MILLAN', '', '0', '', '0265-631-88-06', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(489, 'MARITZA MENDOZA', '', '0', '', '0416-817-25-84', '0', '0', '0', 'OTROS', 'PARTICULAR', 'I.N.C.E.'),
(490, 'MARLENE ', '', '0', '', '0212-205-06-65', '0', '0212-205-05-37', '0212-620-05-05', 'PROVEEDOR', 'AEROCAV, C.A.', 'TRANSPORTE'),
(491, 'MARLENE ', '', '0', '', '0212-870-38-34', '0', '0212-870-2403', '0', 'PROVEEDORES', 'CONSORCIO TECNISUELA', 'SUELAS'),
(492, 'MARLENE ', '', '0', '', '0212-243-84-10', '0416-408-48-41', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(493, 'MARTA MORANTE', '', '0', '', '0416-837-23-04', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION'),
(494, 'MARTA OROZCO', '', '0', '', '0416-620-28-30', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(495, 'MARTHA MORANTHE', '', '0', '', '0416-837-23-04', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION'),
(496, 'MARTHA LUGAT', '', '0', '', '0212-234-76-77', '0212-234-80-39', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(497, 'MARY ISEA', '', '0', '', '0212-412-15-06', '0', '0414-127-03-76', '0', 'OTROS', 'PARTICULAR', 'LEGALES'),
(498, 'MARYS MEDINA', '', '0', '', '0212-841-80-30', '0412-386-00-10', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(499, 'MAURO ', '', '0', '', '0414-154-60-00', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'TRANSPORTE'),
(500, 'MAYERLIN ', '', '0', '', '0412-632-75-47', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(501, 'MAYERLING ', '', '0', '', '0412-565-04-70', '0', '0', '0', 'ENTE PUBLICO', 'ALCALDIA ????', 'OFICINA'),
(502, 'MAYERLING ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA'),
(503, 'MEDINA ', '', '0', '', '0212-361-35-07', '0416-353-80-04', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(504, 'MELCHORA VELASQUEZ', '', '0', '', '0212-614-35-83', '0424-115-50-93', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR C.A', 'ADMINISTRACION'),
(505, 'MELIANNE MOSCATO', '', '0', '', '0212-242-89-16', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA MOSCATO', 'OTROS'),
(506, 'MEYERLIN PEREIRA', '', '0', '', '0212-525-68-62', '0212-525-68-63', '0', '0', 'OTROS', 'SCOTT SEGURIDAD', 'OTROS'),
(507, 'MICHEL PARTIDAS', '', '0', '', '0412-369-13-87', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(508, 'MIGDALIA ', '', '0', '', '0416-241-04-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(509, 'MIGUEL ', '', '0', '', '0212-693-94-89', '0', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'ASCENSORES'),
(510, 'MIGUEL  MURILLO', '', '0', '', '0212-264-41-24', '0', '0212-264-56-55', '0212-264-75-30', 'OTROS', 'INVERSUR', 'OTROS'),
(511, 'MIGUEL ANGEL VASQUEZ', '', '0', '', '0416-695-23-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(512, 'MIGUELINA RODRIGUEZ', '', '0', '', '0281-265-95-.89', '0414-542-97-63', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (PLAZA MAYOR)', 'TIENDAS'),
(513, 'MIGUELINA RODRIGUEZ', '', '0', '', '0281-282-27-30', '0', '0281-282-16-70', '0', 'EMPRESAS', 'GRUPO FERRADINI (PLAZA MAYOR)', 'TIENDAS'),
(514, 'MILAGROS ', '', '0', '', '0416-195-00-41', 'P', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(515, 'MILENY ', '', '0', '', '0412-200-50-68', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(516, 'MILEYA ', '', '0', '', '0212-690-14-53', '0', '0', '0', 'PROVEEDOR', 'ADMINISTRADORA NAPOLITANO', 'ARRENDAMIENTOS'),
(517, 'MILTON  FERRARI', '', '0', '', '0416-433-90-27', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(518, 'MILVAR CAMPOS', '', '0', '', '0424-173-73-64', '0412-829-43-51', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL'),
(519, 'MIREYA ', '', '0', '', '0212-656-26-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(520, 'MIREYA ORTEGA', '', '0', '', '0414-245-51-09', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(521, 'MIRIAN ', '', '0', '', '0414-803-70-37', '0', '0', '0', 'OTROS', 'EMISORA  UNION RADIO', 'OTROS'),
(522, 'MIRIAN CHIARELLI', '', '0', '', '0212-256-51-18', '0414-304-85-27', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(523, 'MIRTHA PAEZ', '', '0', '', '0212-235-52-27', '0212-238-70-74', '0414-133-01-69', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(524, 'MOISES  BENCID', '', '0', '', '0212-241-16-86', '0', '0212-241-09-49', '0', 'OTROS', 'DISTRIBUIDORA.VEGERANO', 'OTROS'),
(525, 'MOLINA ', '', '0', '', '0212-234-12-12', '0212-238-00-58', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(526, 'MORELLA MARQUINA', '', '0', '', '0414-807-56-22', '0', '0', '0', 'CLIENTE', 'MORELA´S C.A', 'VENTAS'),
(527, 'MORELLA MARQUINA', '', '0', '', '0414-807-56-22', '0', '0', '0', 'CLIENTE', 'MORELA''S', 'VENTAS'),
(528, 'MORELLA  SERRANO', '', '0', '', '0426-907-96-87', '0424-159-04-75', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBREROS'),
(529, 'NADESKA SALAZAR', '', '0', '', '0212-620-64-45', '0', '0212-205-60-00', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES'),
(530, 'NANCY HEREDIA', '', '0', '', '0212-242-29-53', '0414-207-31-11', '0', '0', 'FAMILIARES  EMPLEADOS', 'FAMILIA EGLEE HEREDIA', 'OTROS'),
(531, 'NARDI PAOLO', '', '0', '', '0212-241-33-61', '0212-241-54-09', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(532, 'NATHACHA ', '', '0', '', '0212-243-71-21', '0', '0', '0', 'FAMILIARES DE SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS'),
(533, 'NEIRO DURAN', '', '0', '', '0416-239-63-61', '0', '0', '0', 'ENTES PUBLICOS', 'INST.NACIONAL ESTADISTICA', 'ESTADISTICAS'),
(534, 'NEIRO DURAN', '', '0', '', '0416-239-63-61', '0', '0', '0', 'ENTES PUBLICOS', 'INSTITUTO NACIONAL DE ESTADISTICAS', 'OTROS'),
(535, 'NELLY  MONCADA', '', '0', '', '0212-632-08-07', '0', '0414-713-08-61', '0', 'BANCOS', 'BANCO DEL TESORO AG. VICTORIA PLAZA', 'OFICINA'),
(536, 'NELSON LUGO', '', '0', '', '0212-265-46-78', '0212-614-86-39', '0', '0', 'OTROS', 'LA MIL', 'OTROS'),
(537, 'NELSON ', '', '0', '', '0212-265-46-78', '0', '0', '0', 'PROVEEDOR', 'LAMINADOS LAMIL', 'LAMINADO'),
(538, 'NELSON PEREZ', '', '0', '', '0212-661-42-15', '0414-328-76-58', '0', '0', 'PROVEEDOR', 'SERCLIMATIC', 'SERVICIOS DE AIRE ACC.'),
(539, 'NELSON PEREZ', '', '0', '', '0212-661-42-15', '0', '0414-328-76-58', '0', 'PROVEEDOR', 'SERCLIMATIC, C.A.', 'MANTENIMIENTO AIRE ACC'),
(540, 'NEO ', '', '0', '', '0212-662-58-48', '0412-598-66-54', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(541, 'NERIO VALARINO', '', '0', '', '0416-622-27-88', '0', '0212-241-57-60', '0212-241-98-56', 'MEDICOS Y MEDICINAS', 'PARTICULAR', 'INTERNISTA'),
(542, 'NESTOR ', '', '0', '', '0212-899-02-66', '0', '0414-288-71-66', '0', 'PROVEEDORES', 'INDUSTRIAS ROPRI', 'CONTRAFUERTES Y CARTON'),
(543, 'NESTOR NARVAEZ', '', '0', '', '0412-363-02-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(544, 'NESTOR GALINDO', '', '0', '', '0212-344-14-26', '0412-728-04-50', '0212-344-83-96', '0', 'OTROS', 'PARTICULAR', 'SETRA'),
(545, 'NIKO ', '', '0', '', '0414-311-34-33', '0', '0', '0', 'CALZADOS', 'CALZADOS CERERE', 'CALZADOS'),
(546, 'NILDA SILVA', '', '0', '', '0212-580-22-67', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(547, 'NOHELIA ', '', '0', '', '0412-451-95-48', '0412-375-98-70', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (CHACAITO)', 'TIENDAS'),
(548, 'NORELIS ', '', '0', '', '0212-322-70-23', '0', '0212-321-34-72', '0', 'PROVEEDORES', 'ALFATHEC', 'BOTAS'),
(549, 'NORENA DELGADO', '', '0', '', '0414-134-90-48', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(550, 'NURIS ESCOBAR', '', '0', '', '0414-280-83-44', '0', '0212-325-11-93', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(552, 'OLIVER NAVAS', '', '0', '', '0416-927-86-78', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(553, 'OLIVER(HIJO DRA. SAIDA) ', '', '0', '', '0414-108-44-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(554, 'OLIVIO PAEZ', '', '0', '', '0212-942-14-21', '0212-835-56-77', '0414-920-69-05', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(555, 'OLMELIS ', '', '0', '', '0414-989-68-40', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(556, 'OMAIRA CAMARAN', '', '0', '', '0212-428-87-14', '0424-268-90-67', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(557, 'OMAR CLEMENTE', '', '0', '', '0212-816-03-80', '0424-280-78-52', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(558, 'ORLANDO MAGDALENO', '', '0', '', '0212-661-36-39', '0212-661-18-68', '0212-241-00-12', '0212-242-33-08', 'OTROS', 'PARTICULAR', 'OTROS'),
(559, 'ORLANDO MAGDALENA', '', '0', '', '0414-282-24-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(560, 'OSCAR NIÑO', '', '0', '', '0212-984-45-04', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(561, 'OSCAR PEREZ', '', '0', '', '0416-608-07-64', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(562, 'OSWALDO YANEZ', '', '0', '', '0212-915-60-95', '0416-201-28-36', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(563, 'PABLO ANZOLA', '', '0', '', '0212-290-03-15', '0212-290-00-81', '0412-902-33-88', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(564, 'PAOLO RIGIO', '', '0', '', '0', '0212-503-15-38', '0212-503-18- 30', '0416-609-44-39', 'OTROS', 'BANCO MERCANTIL', 'OFICINA'),
(565, 'PASCUALE ROGATO', '', '0', '', '0212-870-27-58', '0', '0212-871-21-17', '0', 'PROVEEDOR', 'CALZADOS EL TERAMANO', 'CALZADOS'),
(566, 'PAULINO CONTRERA', '', '0', '', '0212-241-62-60', '0212-243-51-79', '0414-205-26-96', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(567, 'PAULINO COLMENARES', '', '0', '', '0212-243-51-79', '0414-205-26-96', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(568, 'PAULO PUCCHI', '', '0', '', '0414-023-07-76', '0212-325-49-69', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(569, 'PEDRO TORREALBA', '', '0', '', '0412-724-82-29', '0', '0', '0', 'EMPLEADOS ', 'GRUPO  FERRADINI, C,A,', 'OFICINA'),
(570, 'PEDRO MORET', '', '0', '', '0414-379-42-19', '0', '0', '0', 'ENTES PUBLICOS', 'INSAPSEL', 'OTROS'),
(571, 'PEDRO MORET', '', '0', '', '0414-379-42-19', '0', '0', '0', 'OTROS', 'INSTITUTO FARMACEUTICO', 'FARMACIA'),
(572, 'PEDRO UZCATEGUI', '', '0', '', '0414-460-54-48', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(573, 'PEDRO CASTRO', '', '0', '', '0212-265-91-89', '0416-707-84-51', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(574, 'PEDRO MORET', '', '0', '', '0212-693-66-27', '0414-379-42-19', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(575, 'PEDRO CASTRO', '', '0', '', '0414-921-98-23', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(576, 'PEDRO ', '', '0', '', '0424-411-19-55', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(577, 'PEDRO QUINTERO', '', '0', '', '0414-289-15-57', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS'),
(578, 'PEDRO QUINTERO', '', '0', '', '0412-714-44-94', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS'),
(579, 'PETER ', '', '0', '', '0416-904-72-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(580, 'PIETRO CIARAVELLA', '', '0', '', '0212-242-47-14', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C,A,', 'OTROS'),
(581, 'PIETRO ', '', '0', '', '0212-872-50-91', '0', '0212-872-35-33', '0', 'PROVEEDOR', 'HORMAS ZIMA', 'HORMAS'),
(582, 'PINO ', '', '0', '', '0212-263-22-79', '0212-263-83-03', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRICOS  ', 'ELECTRICIDAD'),
(583, 'PIÑATE ', '', '0', '', '0414-301-18-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(584, 'PITER ', '', '0', '', '0416-904-72-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(585, 'RAFAEL SATURNO', '', '0', '', '0212-237-90-95', '0212-235-19-77', '0', '0', 'PROVEEDOR', 'REPRESENTACIONES SATURNO', 'PIELES Y FORROS'),
(586, 'RAIMUNDO MOSCATO', '', '0', '', '0212-263-92-71', '0', '0212-267-52-12', '0', 'CALZADOS', 'DIST.ZIG ZAG (SAMBIL)', 'CALZADOS'),
(587, 'RAIMUNDO MOSCATO', '', '0', '', '0212-300-87-53', '0', '0212-300-87-54', '0', 'CALZADOS', 'DIST.ZIG ZAG (TOLON)', 'CALZADOS'),
(588, 'RAIMUNDO MOSCATO', '', '0', '', '0241-839-05-05', '0', '0424-839-05-04', '0', 'CALZADOS', 'DIST.ZIG ZAG (VALENCIA)', 'CALZADOS'),
(589, 'RAIMUNDO MOSCATO', '', '0', '', '0212-267-52-12', '0212-267-92-71', '0', '0', 'OTROS', 'ZIG ZAG SHOES', 'OTROS'),
(590, 'RAIMUNDO MOSCATO', '', '0', '', '0241-839-05-05', '0', '0', '0', 'CALZADOS', 'ZIG-ZAG (VALENCIA)', 'CALZADOS'),
(591, 'RAIMUNDO MOSCATO', '', '0', '', '0416-627-18-13', '0416-817-57-39', '0', '0', 'OTROS', 'ZIGZAG SHOES', 'OTROS'),
(592, 'RAMON COLMENARES', '', '0', '', '0414-814-69-63', '0416-817-57-39', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS'),
(593, 'RAMON OCHOA', '', '0', '', '0416-6-33-28-64', '0', '0', '0', 'PROVEEDOR', 'TECNISERVICIOS', 'REPARACION FOTOCOPIADORAS'),
(594, 'RAMON  OCHOA', '', '0', '', '0212-239-15-02', '0212-234-08-62', '0', '0', 'PROVEEDOR', 'TECNISERVICIOS', 'REPARACION FOTOCOPIADORAS'),
(595, 'RAMON  OCHOA', '', '0', '', '0212-239-15-02', '0', '0212-234-08-62', '0416-633-28-64', 'PROVEEDOR', 'TECNISERVICIOS (CANON) ', 'SERV.COPIADORA'),
(596, 'RANDY ', '', '0', '', '0424-202-58-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(597, 'RAUL FLORES', '', '0', '', '0416-926-46-58', '0', '0', '0', 'PROVEEDOR', 'AUROMETAL', 'ADORNOS'),
(598, 'RAUL ', '', '0', '', '0424-176-64-59', '0414-126-72-51', '0', '0', 'PROVEEDOR', 'AURO-METAL STYLE, C.A.', 'ADORNOS'),
(599, 'RAUL ', '', '0', '', '0212-234-12-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(600, 'REBECA Y/O JOSE ', '', '0', '', '0212-344-15-21', '0', '0212-344-35-48', '0', 'PROVEEDOR', 'CUEROS RECUTEX', 'PIELES'),
(601, 'REINA ', '', '0', '', '0212-285-99-09', '0416-406-63-63', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(602, 'REINALDO DORADO', '', '0', '', '0416-620-29-92', '0', '0', '0', 'PROVEEDOR', 'CONSUMIBLES', 'OTROS'),
(603, 'REINALDO DAES', '', '0', '', '0212-472-10-57', '0212-472-08-51', '0', '0', 'OTROS', 'PARTICULAR', 'REPUESTOS'),
(604, 'REINALDO HERNANDEZ', '', '0', '', '0212-431-10-82', '0212-432-62-84', '0414-157-56-00', '0', 'OTROS', 'PARTICULAR', 'SISTEMAS'),
(605, 'RENZO LENZI', '', '0', '', '0414-245-26-41', '0416-609-27-69', '0', '0', 'PROVEEDOR', 'LEATHER TRADE', 'PIELES'),
(606, 'RICARDA PARRA', '', '0', '', '0414-328-76-58', '0', '0', '0', 'PROVEEDORES', 'SERCLIMATIC, C.A.', 'SERV.AIRE ACONDICIONADO'),
(607, 'RICARDO  ', '', '0', '', '0416-286-04-88', '0', '0', '0', 'PROVEEDOR', 'ARPITEX', 'TELAS Y FORROS'),
(608, 'RICARDO ', '', '0', '', '0414-286-04-88', '0', '0', '0', 'PROVEEDOR', 'ARPITEX, C.A.', 'PIELES'),
(609, 'RICARDO HERRERA', '', '0', '', '0416-412-29-85', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(610, 'RICARDO CABALLERO', '', '0', '', '0212-339-74-36', '0414-911-37-11', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(611, 'RICARDO REQUENA', '', '0', '', '0412-607-94-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'LEGALES'),
(612, 'RICARDO ', '', '0', '', '0414-299-29-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(613, 'RICHARD QUERO', '', '0', '', '0212-334-68-38', '0', '0414-238-57-66', '0', 'PROVEEDOR', 'INVERSIONES COPIRY, C.A.', 'COPIADORA'),
(614, 'RICHARD QUERO', '', '0', '', '0212-242-92-92', '0212-334-68-33', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(615, 'ROBERT MONTIEL', '', '0', '', '0212-344-07-36', '0416-712-84-00', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(616, 'ROBERT  FEO', '', '0', '', '0212-870-66-72', '0', '0212-870-30-50', '0', 'OTROS', 'MERCOSAN ', 'OFICINA'),
(617, 'ROBERT ARMANDO JIMENEZ', '', '0', '', '0212-472-30-81', '0414-338-53-81', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(618, 'ROBERTO RIGIO', '', '0', '', '0412-235-03-39', '0', '0', '0', 'PROVEEDOR', 'ADMINISTRADORA NAPOLITANA', 'ARRENDAMIENTOS'),
(619, 'ROBERTO RIGGIO', '', '0', '', '0212-693-68-56', '0', '0212-693-96-30', '0', 'PROVEEDOR', 'ADMINISTRADORA NAPOLITANO, C.A.', 'ARRENDAMIENTO'),
(620, 'ROBERTO ESPINA', '', '0', '', '0412-206-79-19', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(621, 'RODRIGO MENA', '', '0', '', '0212-543-28-55', '0424-131-73-75', '0', '0', 'SINDICATOS', 'FETRACALZADO', 'OFICINA'),
(622, 'RODRIGO MENA', '', '0', '', '0424-131-73-75', '0', '0', '0', 'SINDICATOS', 'FETRACALZADO', 'OTROS'),
(623, 'ROGATO ', '', '0', '', '0212-871-21-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(624, 'ROMELIA ', '', '0', '', '0212-915-68-98', '0416-409-11-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(625, 'RONALD PARADA', '', '0', '', '0212-905-90-38', '0', '0', '0', 'OTROS', 'FONDO DE VALORES', 'OFICINA'),
(626, 'RONALD HIJO DE SR. PIETRO', '', '0', '', '0212-872-50-91', '0', '0212-872-35-33', '0', 'PROVEEDOR', 'HORMAS ZIMA', 'HORMAS'),
(627, 'ROSA MARIA  ', '', '0', '', '0212-949-02-17', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA'),
(628, 'ROSALBA ', '', '0', '', '0414-389-36-91', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(629, 'ROSANGELA CAMMARANO', '', '0', '', '0212-243-98-61', '0424-231-79-82', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'RECURSOS HUMANOS'),
(630, 'ROSARIO ', '', '0', '', '0416-414-36-11', '0', '0', '0', 'OTROS', 'SERVI', 'OTROS'),
(631, 'ROSMARY MARQUEZ', '', '0', '', '0424-140-67-80', '0', '0', '0', 'PROVEEDOR', 'CORPORACION ADUANERA M.P.S., C.A.', 'IMPORTACIONES'),
(632, 'RUBEN LEON', '', '0', '', '0414-398-57-51', '0', '0', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'CONDOMINIO'),
(633, 'RUBEN ', '', '0', '', '0416-400-98-08', '0414-244-56-44', '0', '0', 'OTROS', 'PARTICULAR ', 'OTROS'),
(634, 'RUBEN O ESMERALDA ', '', '0', '', '0212-241-05-65', '0', '0', '0', 'PROVEEDOR', 'MRW', 'SERVICIOS DE MENSAJERIA'),
(635, 'RUBINO ', '', '0', '', '0212-241-22-63', '0', '0', '0', 'PROVEEDORES', 'CLARIVOX', 'ART.ELECTRICIDAD'),
(636, 'SAIDA ', '', '0', '', '0414-892-61-47', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(637, 'SALVATORE MOSCATO', '', '0', '', '0412-242-80-71', '0212-242-96-89', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION'),
(638, 'SALVATORE LA CORTE', '', '0', '', '0212-826-94-15', '0212-861-21-54', '0', '0', 'CONTRATADO', 'CREACIONES BEN-HUR, C.A', 'CARPINTERIA'),
(639, 'SALVATORE CAMMARANO', '', '0', '', '0414-323-80-51', '0', '0', '0', 'SOCIOS ', 'CREACIONES BEN-HUR, C.A', 'TIENDAS'),
(640, 'SALVATORE MOSCATO', '', '0', '', '0039-3334256607', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'LINEA DE ITALIA'),
(641, 'SAMANTA ', '', '0', '', '0416-432-67-16', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(642, 'SANDRA FLORES', '', '0', '', '0212-705-21-96', '0', '0', '0', 'BANCOS', 'BANCO CITI BANK', 'OFICINA'),
(643, 'SANDRA MAIGUA', '', '0', '', '0414-254-93-21', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(644, 'SERGIO ACOSTA', '', '0', '', '0424-175-78-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(645, 'SERGIO ', '', '0', '', '0212-953-05-79', '0212-953-46-90', '0212-951-29-28', '0', 'OTROS', 'SEGTOTAL', 'OTROS'),
(646, 'SERVITO HERNANDEZ', '', '0', '', '0424-125-48-31', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(647, 'SILVANA MARTINISI', '', '0', '', '0416-622-11-28', '0', '0', '0', 'PROVEEDOR', 'INSUMOS  INTERSUELA', 'SUELAS Y TACONES'),
(648, 'SILVANA MARTINISI', '', '0', '', '0412-242-50-34', '0', '0', '0', 'PROVEEDOR', 'INSUMOS INTERSUELA', 'SUELAS Y TACONES'),
(649, 'SILVERIO MILLAN', '', '0', '', '0295-416-39-44', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(650, 'SIMON LOPEZ', '', '0', '', '0416-815-02-12', '0212-271-76-17', '0212-256-08-27', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(651, 'SOBEIRA ', '', '0', '', '0212-286-29-02', '0212-284-77-77', '0212-285-18-06', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIA DE VIAJES'),
(652, 'SOBEIRA ', '', '0', '', '0212-285-18-06', '0', '0', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIAS DE VIAJES'),
(653, 'SOLANGE PINERO', '', '0', '', '0212-901-07-07', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(654, 'SOLEDAD ', '', '0', '', '0212-709-20-04', '0212-709-20-03', '0', '0', 'ENTES PUBLICOS', 'SENIAT ', 'OFICINAS'),
(655, 'SONIA CASTILLO', '', '0', '', '0424-223-83-61', '0', '0', '0', 'EMPLEADA', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION'),
(656, 'SONIA ', '', '0', '', '0212-242-72-38', '0212-242-13-68', '0', '0', 'CONDOMINIOS', 'INDUSTRIAS NAYLAT', 'CONDOMINIO'),
(657, 'SONIA VIVAS', '', '0', '', '0212-241-83-13', '0', '0212-242-13-68', '0', 'OTROS', 'INDUSTRIAS NAYLAT', 'OFICINA'),
(658, 'SR. MONTERO ', '', '0', '', '0212-243-63-22', '0', '0', '0', 'BANCOS', 'BANCO NACIONAL DE CREDITO', 'OFICINA'),
(659, 'SR. VILLEGAS ', '', '0', '', '0212-242-19-17', '0', '0212-242-68-19', '0212-242-37-94', 'PROVEEDOR', 'BUENOS CAUCHOS', 'VEHICULOS'),
(660, 'STEFANI ', '', '0', '', '0212-620-61-80', '0', '0', '0', 'PROVEEDORES', 'DHL', 'IMPORTACIONES'),
(661, 'STEFANO BELLANCA', '', '0', '', '0414-016-26-08', '0', '0', '0', 'EMPLAEDOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION'),
(662, 'STEFANO CIARAVELLA', '', '0', '', '0412-390-60-33', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'VENTAS'),
(663, 'STEFANO BELLANCA', '', '0', '', '0414-016-26-08', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(664, 'STEFANO  BELLANCA', '', '0', '', '0212-242-60-46', '0', '0414-016-26-08', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(665, 'SUHIN  MARCANO', '', '0', '', '0412-887-24-50', '0412-9664243', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (MARACAY)', 'GERENTE'),
(666, 'SUJEY MARTINEZ', '', '0', '', '0212-347-42-20', '0', '0', '0', 'EMPLEADOS', 'FERRADINI', 'TIENDAS'),
(667, 'SUJEY MARTINEZ', '', '0', '', '0212-959-09-31', '0', '0212-959-10-10', '0', 'EMPRESAS', 'GRUPO FERRADINI (TAMANACO)', 'TIENDAS'),
(668, 'SUJHIN MARCANO', '', '0', '', '0243-232-05-77', '0', '0', '0', 'EMPRESAS', 'GRUPO FERRADINI (MARACAY)', 'TIENDAS'),
(669, 'SULAY MARTINEZ', '', '0', '', '0212-263-49-01', '0', '0212-263-77-27', '0424-226-71-76', 'EMPRESAS', 'GRUPO FERRADINI (SAMBIL)', 'TIENDAS'),
(670, 'TAPIA ', '', '0', '', '0212-630-31-95', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(671, 'TARCISIO APARICIO', '', '0', '', '0212-561-67-46', '0', '0412-713-60-29', '0', 'PROVEEDOR', 'TRANSIVEN', 'FLEJES'),
(672, 'THAIS CAMPOS', '', '0', '', '0212-762-65-25', '0212-762-60-21', '0', '0', 'OTROS', 'VENEVISION ', 'OFICINA'),
(673, 'TIBALDO ', '', '0', '', '0212-516-19-51', '0416-219-86-55', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A', 'VIGILANCIA'),
(674, 'TIBISAY ', '', '0', '', '0212-905-71-89', '0', '0212-905-71-90', '0414-111-92-70', 'ENTE PUBLICO', 'ALCALDIA DE CHACAO', 'OFICINA'),
(675, 'TONINO ', '', '0', '', '0212-661-82-77', '0', '0', '0', 'PROVEEDORES', 'CALZADOS KIARA', 'CALZADOS'),
(676, 'TOÑITO ', '', '0', '', '0412-014-17-00', '0212-418-21-64', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(677, 'TULIO ', '', '0', '', '0416-917-55-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(678, 'ULISSE CIARAVELLA', '', '0', '', '0412-267-38-53', '0212-243-00-85', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION'),
(679, 'VALBUENA ', '', '0', '', '0412-604-13-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(680, 'VALENTIN ', '', '0', '', '0426-615-80-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(681, 'VALENTINA ', '', '0', '', '0295-772-87-31', '0424-839-80-10', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(682, 'VANESA ', '', '0', '', '0212-400-76-03', '0212-400-76-14', '0212-200-87-76', '0212-400-76-13', 'OTROS', 'PARQUE CANAIMA', 'OTROS'),
(683, 'VANNESA ', '', '0', '', '0212-200-20-70', '0212-200-21-19', '0412-593-39-29', '0', 'TE LEFONIA', 'MOVISTAR', 'OFICINA'),
(684, 'VARGAS ', '', '0', '', '0414-205-17-98', '0', '0', '0', 'PROVEEDOR', 'ASCENSORES VERTICAL', 'MANTENIMIENTO ASCENSORES'),
(685, 'VICENTE MARTINISI', '', '0', '', '0212-242-13-11', '0', '0212-242-12-11', '0212-242-17-11', 'PROVEEDOR', 'INSUMOS  INTERSUELA', 'SUELAS'),
(686, 'VICKY ROSO', '', '0', '', '0414-215-11-82', '0', '0', '0', 'AGENCIA DE VIAJES ', 'LINEA AEREA DE VENEZUELA', 'OFICINA'),
(687, 'VICTOR ', '', '0', '', '0416-638-84-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'ARMARIOS'),
(688, 'VICTOR RAMIREZ', '', '0', '', '0275-415-29-15', '0416-676-97-20', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(689, 'VIGILANTE ARVELAY', '', '0', '', '0212-361-85-34', '0', '0', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'VIGILANCIA'),
(690, 'VILLANI ', '', '0', '', '0416-635-25-68', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS'),
(691, 'VITA TRIOLO', '', '0', '', '0414-126-24-36', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CAMMARANO', 'OTROS'),
(692, 'WALKAN ', '', '0', '', '0212-372-98-12', '0212-372-99-85', '0212-372-90-29', '0416-717-42-44', 'OTROS', 'PARTICULAR', 'OTROS'),
(693, 'WALTER PULIDO', '', '0', '', '0414-366-55-60', '0412-722-52-76', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(694, 'WASKAR ERASO', '', '0', '', '0414-463-21-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(695, 'WILLIAN PALERMO', '', '0', '', '0212-543-28-55', '0', '0', '0', 'SINDICATOS', 'FETRA CALZADOS', 'OFICINA'),
(696, 'WILLIAN DAY', '', '0', '', '0', '0212-239-93-80', '0212-952-12-13', '0', 'PROVEEDOR', 'PARTICULAR', 'FOTOGRAFIA'),
(697, 'WILLIAN ALTUVE', '', '0', '', '0212-205-56-00', '0426-519-22-01', '0', '0', 'PROVEEDOR', 'SUPERCABLE', 'OFICINA'),
(698, 'WILLSON ', '', '0', '', '0412-721-18-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(699, 'WILLSON ', '', '0', '', '0212-238-82-03', '0212-237-01-27', '0212-235-05-36', '0', 'OTROS', 'PARTICULAR', 'TALLER'),
(700, 'WILTON ', '', '0', '', '0212-238-82-03', '0212-237-10-27', '0212-235-05-36', '0212-237-10-27', 'OTROS', 'PARTICULAR', 'TALLER'),
(701, 'WUICHO ', '', '0', '', '0414-252-40-79', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(702, 'YAJAIRA FAJARDO', '', '0', '', '0212-883-96-91', '0412-900-67-57', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(703, 'YAMILET HERNANDEZ', '', '0', '', '0414-018-73-06', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(704, 'YAZURI LINDO', '', '0', '', '0412-273-76-79', '0424-233-38-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(705, 'YENIFER ', '', '0', '', '0212-987-97-59', '0', '0', '0', 'PROVEEDOR', 'OMEGA PUBLICIDAD', 'OTROS'),
(706, 'YENNY ', '', '0', '', '0212-243-95-56', '0', '0212-240-11-11', '0800-377-66-83', 'PROVEEDORES', 'EPSON', 'EQUIPOS Y CONSUMIBLES'),
(707, 'YENNY,MARISOL ', '', '0', '', '0212-408-20-61', '0212-408-20-58', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL AMBIENTE', 'OFICINA'),
(708, 'YERSON HIJO DE GRISELDA', '', '0', '', '0412-960-17-21', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(709, 'YESICA MILLAN', '', '0', '', '0212-991-01-79', '0212-991-12-36', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(710, 'YESSICA MILLAN', '', '0', '', '0212-600-82-36', '0212-991-01-79', '0412-569-39-99', '0412-205-00-79', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS'),
(711, 'YEYO ', '', '0', '', '0212-816-77-23', '0414-273-95-06', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(712, 'YOLANDA ', '', '0', '', '0414-274-40-25', '0', '0', '0', 'ENTES PUBLICOS', 'SEGURO SOCIAL', 'OFICINA'),
(713, 'YOLANDA ', '', '0', '', '0414-274-40-25', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'SEGURO SOCIAL ', 'OFICINA'),
(714, 'YONNY ', '', '0', '', '0414-195-89-45', '0', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A', 'VIGILANCIA'),
(715, 'YUGLIS LUGO', '', '0', '', '0414-022-80-61', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(716, 'YULY ', '', '0', '', '0212-234-03-54', '0', '0212-234-20-92', '0', 'OTROS', 'INVERTEX', 'OTROS'),
(717, 'YURAIMA GARCIA', '', '0', '', '0212-625-25-30', '0426-415-61-67', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(718, 'ZAIDA MORGADO', '', '0', '', '0414-904-39-30', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(719, 'ZULEIMA ANTELIZ', '', '0', '', '0212-891-53-49', '0426-205-51-21', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION'),
(720, ' ', '', '0', '', '0414-425-30-00', '0', '0', '0', 'CALZADOS', '1,2,3 KIDS C.A', 'CALZADOS'),
(721, ' ', '', '0', '', '0212-267-44-17', '0', '0212-263-44-17', '0', 'OTROS', 'ABX LOGISTICS', 'OTROS'),
(722, ' ASERCA LINEA AEREA', '0212-953-30-04', '0', '', '0212-953-30-04', '0', '0', '0', 'PROVEEDOR', 'ASERCA LINEA AEREA', 'AGENCIA DE VIAJES'),
(723, ' ', '', '0', '', '0212-626-76-60', '0', '0212-606-71-85', '0212-606-71-92', 'OTROS', 'ACOSTA', 'OTROS'),
(724, ' ', '', '0', '', '0212-264-53-67', '0', '0', '0', 'OTROS', 'ADMINISTRADORA SAMBIL', 'DPTO.SEGURIDAD'),
(725, ' ', '', '0', '', '0212-267-12-01', '0', '0', '0', 'OTROS', 'ADMINISTRADORA SAMBIL', 'OTROS'),
(726, ' ', '', '0', '', '0212-573-08-88', '0', '0', '0', 'OTROS', 'ADMINISTRADORA YURUARIZ SUR', 'OFICINA'),
(727, ' ', '', '0', '', '0212-265-01-97', '0', '0', '0', 'PROVEEDOR', 'ADRIATICA DE SEGUROS', 'ASEGURADORA'),
(728, ' ', '', '0', '', '0212-266-21-97', '0', '0212-266-11-87', '0', 'OTROS', 'AERO EXPRESOS EJECUTIVOS', 'OTROS'),
(729, ' ', '', '0', '', '0212-303-52-04', '0', '0212-303-52-09', '0', 'AG.VIAJES', 'AEROPOSTAL', 'CONTROLADORES DE VUELO'),
(730, ' ', '', '0', '', '0212-303-52-16', '0', '0212-303-52-04', '0', 'AG.VIAJES', 'AEROPOSTAL', 'TRAFICO DE VUELOS'),
(731, ' ', '', '0', '', '0800-284-66-37', '0', '0', '0', 'AG.VIAJES', 'AEROPOSTAL (TORRE POLAR)', 'RESERVA DE VUELOS'),
(732, ' ', '', '0', '', '0212-331-92-47', '0', '0', '0', 'PROVEEDOR', 'AGENTES ADUANALES', 'IMPORTACION'),
(733, ' ', '', '0', '', '0212-331-17-17', '0', '0212-331-93-95', '0', 'PROVEEDOR', 'AGENTES ADUANALES KEN WILL', 'IMPORTACION'),
(734, ' ', '', '0', '', '0212-331-30-39', '0', '0212-331-52-08', '0', 'OTROS', 'AIR FRANCE', 'AREA CARGA'),
(735, ' ', '', '0', '', '0239-248-58-86', '0', '0', '0', 'ENTE PUBLICO', 'ALCALDIA DE CHARALLAVE', 'OFICINA'),
(736, ' ', '', '0', '', '0212-360-03-00', '0', '0212-360-02-11', '0', 'ENTE PUBLICO', 'ALCALDIA DE PLAZA', 'OFICINA'),
(737, ' ', '', '0', '', '0283-235-33-43', '0', '0', '0', 'CLIENTE', 'ALMACEN LA SULTANA', 'VENTAS'),
(738, ' ', '', '0', '', '0285-632-08-50', '0', '0285-632-47-02', '0', 'CLIENTE', 'ALMACEN SANTA MARIA, C.A.', 'VENTAS'),
(739, ' ', '', '0', '', '0212-751-96-19', '0', '0', '0', 'OTROS', 'ALPATHEC', 'OTROS'),
(740, ' ', '', '0', '', '0212-239-74-61', '0', '0', '0', 'PROVEEDOR', 'ALPES ', 'PAPELERIA'),
(741, ' ', '', '0', '', '0261-740-07-71', '0', '0', '0', 'CLIENTE', 'ALTAMIRA CALZADO', 'VENTAS'),
(742, ' ', '', '0', '', '0261-793-99-19', '0', '0261-792-07-95', '0', 'CLIENTE', 'ALTAMIRA COSTA VERDE', 'VENTAS'),
(743, ' ', '', '0', '', '0261-792-15-29', '0', '0', '0', 'CLIENTE', 'ALTAMIRA LAGO MALL, C.A.', 'VENTAS'),
(744, ' ', '', '0', '', '0276-356-27-11', '0', '0', '0', 'CLIENTES', 'ANTARTIDA SUPER STORE, C.A.', 'VENTAS'),
(745, ' ', '', '0', '', '0241-834-76-21', '0', '0', '0', 'CLIENTE', 'ANTHONY''S', 'VENTAS'),
(746, ' ', '', '0', '', '0212-492-11-89', '0', '0212-428-53-85', '0', 'PROVEEDOR', 'ARPITEX', 'COMPRAS'),
(748, ' ', '', '0', '', '0212-239-17-03', '0', '0416-618-38-86', '0', 'CONDOMINIO', 'ASCENSORES ASCELECTRA', 'MANTENIMIENTO'),
(749, ' ', '', '0', '', '0212-638-61-89', '0', '0', '0', 'PROVEEDOR', 'ASCENSORES VERTICAL', 'MANTENIMIENTO'),
(750, ' ', '', '0', '', '0212-267-06-45', '0', '0212-266-59-31', '0212-265-23-35', 'OTROS', 'ASCESORIOS LEAL', 'VEHICULOS'),
(751, ' ', '', '0', '', '0212-870-70-08', '0', '0212-870-73-85', '0', 'PROVEEDOR', 'AURO-METAL STYLE, C.A.', 'ADORNOS'),
(752, ' ', '', '0', '', '0494-331-90-03', '0', '0', '0', 'OTROS', 'AUTO CAMIONES REAL', 'OTROS'),
(753, ' ', '', '0', '', '0212-266-76-71', '0', '0212-266-93-76', '0', 'PROVEEDORES', 'B.M.S.', 'IMPRENTA'),
(754, ' ', '', '0', '', '0241-822-77-48', '0', '0', '0', 'CLIENTE', 'BABY IVORY', 'VENTAS'),
(755, ' ', '', '0', '', '0212-234-58-53', '0', '0212-239-44-31', '0', 'MEDICINA', 'BADAN', 'OFICINA'),
(756, ' ', '', '0', '', '0212-501-97-32', '0', '0212-501-97-61', '0', 'BANCOS', 'BANCO BANESCO', 'OFICINA'),
(757, ' ', '', '0', '', '0212-242-77-11', '0', '0', '0', 'BANCOS', 'BANCO BANESCO AV.PPAL LA URBINA', 'OFICINA'),
(758, ' ', '', '0', '', '0212-256-76-73', '0', '0', '0', 'BANCOS', 'BANCO BANESCO PETARE', 'OFICINA'),
(759, ' ', '', '0', '', '0212-241-55-59', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA LA URBINA', 'OFICINA'),
(760, ' ', '', '0', '', '0212-242-73-82', '0', '0', '0', 'BANCOS', 'BANCO FONDO COMUN LA URBINA', 'OFICINA'),
(761, ' ', '', '0', '', '0212-503-11-11', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL AV. PRINCIPAL', 'OFICINA'),
(762, ' ', '', '0', '', '0212-241-44-87', '0', '0', '0', 'BANCOS', 'BANCO PROVINCIAL LA URBINA', 'OFICINA'),
(763, ' ', '', '0', '', '0212-263-31-81', '0', '0', '0', 'BANCOS', 'BANCORO', 'OFICINA'),
(764, ' ', '', '0', '', '0212-331-21-02', '0', '0212-331-44-96', '0', 'BANCOS', 'BANCORO LA GUAIRA', 'OFICINA'),
(765, ' ', '', '0', '', '0212-241-41-25', '0', '0', '0', 'PROVEEDORES', 'BATERIAS P.B. (NAYLAT)', 'VEHICULOS'),
(766, ' ', '', '0', '', '0212-267-16-46', '0', '0212-266-59-67', '0', 'OTROS', 'BERKERMAN', 'MANICURE'),
(767, ' ', '', '0', '', '0241-858-49-73', '0', '0', '0', 'CLIENTE', 'BOSS SHOES', 'VENTAS'),
(768, ' ', '', '0', '', '0212-901-87-29', '0', '0212-901-87-31', '0212-901-87-65', 'BANCOS', 'CADIVI BANESCO', 'OFICINA'),
(769, ' ', '', '0', '', '0258-433-59-11', '0', '0212-433-59-59', '0', 'PROVEEDORES', 'CALZADO ABATE', 'CALZADOS'),
(770, ' ', '', '0', '', '0291-641-28-08', '0', '0', '0', 'CLIENTE', 'CALZADOS ALEN', 'VENTAS'),
(771, ' ', '', '0', '', '0291-641-28-08', '0', '0', '0', 'CALZADOS', 'CALZADOS ALEX', 'CALZADOS'),
(772, ' ', '', '0', '', '0212-322-7023', '0', '0212-321-34-72', '0', 'PROVEEDORES', 'CALZADOS ALFA', 'BOTAS DE SEGURIDAD'),
(773, ' ', '', '0', '', '0261-740-07-71', '0', '0', '0', 'CLIENTES', 'CALZADOS ALTAMIRA', 'VENTA'),
(774, ' ', '', '0', '', '0271-225-91-17', '0', '0271-221-00-85', '0', 'CLIENTE', 'CALZADOS BONA, S.R.L.', 'VENTAS'),
(775, ' ', '', '0', '', '0241-857-28-03', '0', '0', '0', 'CLIENTE', 'CALZADOS BON-PAS', 'VENTAS'),
(776, ' ', '', '0', '', '0212-242-53-34', '0', '0212-241-88-03', '0212-241-33-61', 'PROVEEDOR', 'CALZADOS CERERE', 'CALZADOS'),
(777, ' ', '', '0', '', '0273-533-57-70', '0', '0', '0', 'CLIENTE', 'CALZADOS DANY', 'VENTAS'),
(778, ' ', '', '0', '', '0212-433-95-21', '0', '0212-433-57-37', '0212-433-96-85', 'PROVEEDOR', 'CALZADOS DORIA (CHICO)', 'CALZADOS'),
(779, ' ', '', '0', '', '0212-251-66-31', '0', '0212-251-06-17', '0', 'PROVEEDOR', 'CALZADOS JUNIOR', 'CALZADOS'),
(781, ' ', '', '0', '', '0243-245-27-97', '0', '0', '0', 'CLIENTE', 'CALZADOS LA FRANCIA', 'VENTAS'),
(782, ' ', '', '0', '', '0286-961-17-57', '0', '0286-961-27-66', '0286-962-16-98', 'CLIENTE', 'CALZADOS MARIANGEL. C.A.', 'VENTAS'),
(783, ' ', '', '0', '', '0251-231-82-95', '0', '0', '0', 'CLIENTE', 'CALZADOS MINERVA', 'VENTAS'),
(784, ' ', '', '0', '', '0283-235-43-92', '0', '0286-962-16-98', '0', 'CLIENTE', 'CALZADOS PANORAMA', 'VENTAS'),
(785, ' ', '', '0', '', '0243-711-41-61', '0', '0', '0', 'CLIENTE', 'CALZADOS PAURIT', 'VENTAS'),
(786, ' ', '', '0', '', '0212-433-18-23', '0', '0212-433-74-59', '0212-433-30-29', 'CALZADOS', 'CALZADOS RIVAL', 'CALZADOS'),
(787, ' ', '', '0', '', '022-242-76-72', '0', '0', '0', 'CALZADOS', 'CALZADOS ROSY', 'CALZADOS'),
(788, ' ', '', '0', '', '0212-761-18-80', '0', '0212-761-28-90', '0212-762-41-20', 'PROVEEDOR', 'CALZADOS RUGER FONSECA ', 'CALZADOS'),
(789, ' 0', '00551691246093', '0', '', '00551691246093', '0', '0', '0', 'PROVEEDOR', 'CALZADOS SOLLU BRASIL', 'CALZADOS'),
(790, ' ', '', '0', '', '0243-233-09-75', '0', '0', '0', 'CLIENTE', 'CALZADOS Y DEPORTES MAVIDOL', 'VENTAS'),
(791, ' ', '', '0', '', '0212-241-42-29', '0', '0', '0', 'PROVEEDOR', 'CANON LA URBINA', 'EQUIPOS'),
(792, ' ', '', '0', '', '0416-996-81-92', '0', '0', '0', 'OTROS', 'CARMEN ACEVEDO', 'OTROS'),
(793, ' ', '', '0', '', '0416-419-54-48', '0', '0', '0', 'OTROS', 'CARMEN JIMENEZ', 'OTROS'),
(794, ' ', '', '0', '', '0212-291-22-64', '0', '0', '0', 'PROVEEDOR', 'CARTON DE MORICHE', 'CAJAS'),
(795, ' ', '', '0', '', '0212-631 -11-47', '0', '0', '0', 'PROVEEDORES', 'CARTONES LUWAS', 'OTROS'),
(796, ' ', '', '0', '', '0212-285-70-90', '0', '0', '0', 'OTROS', 'CASA HOGAR SAN JOSE', 'OTROS'),
(797, ' ', '', '0', '', '0274-252-45-85', '0', '0', '0', 'CLIENTE', 'CASA VALERO', 'CLIENTES'),
(799, ' ', '', '0', '', '0212-633-09-19', '0', '0212-632-61-98', '0', 'PROVEEDORES', 'CENTRO AUTOMOTRIZ VOLGAN', 'VEHICULOS'),
(800, ' ', '', '0', '', '0212-241-21-93', '0', '0212-241-57-60', '0', 'MEDICINA', 'CENTRO CLINICO LA URBINA', 'OFICINA'),
(801, ' ', '', '0', '', '0212-949-62-58', '0', '0', '0', 'MEDICINA', 'CENTRO MEDICO LA TRINIDAD', 'OFICINA'),
(802, ' ', '', '0', '', '0212-276-10-01', '0', '0212-276-16-46', '0', 'MEDICINA', 'CLINICA AVILA', 'OFICINA'),
(803, ' ', '', '0', '', '0212-405-20-59', '0', '0212-405-21-12', '0212-405-21-11', 'MEDICINA', 'CLINICA LOIRA', 'CAFETIN'),
(804, ' ', '', '0', '', '0241-866-16-65', '0', '0', '0', 'PROVEEDORES', 'COMERCIALIZADORA HISPANA', 'PIELES Y OTROS '),
(805, ' ', '', '0', '', '0212-235-82-14', '0', '0212-237-02-08', '0', 'PROVEEDORES', 'COMPU PLACE', 'INFORMATICA'),
(806, ' CONAVI', '0212-991-38-71', '0', 'LAS MERCEDES CARACAS\r\n', '0212-991-38-71', '0', '0212-991-32-11', '0212-991-83-09', 'ENTE PUBLICO VIVIENDA', 'CONAVI', 'OFICINA'),
(807, ' ', '', '0', '', '0243-233-32-46', '0', '0', '0', 'PROVEEDORES', 'CONDOMINIO (CENTRO COMERCIAL LAS AMERICAS)', 'CONDOMINIO'),
(808, ' ', '', '0', '', '0243-232-19-44', '0', '0243-233-32-46', '0', 'PROVEEDORES', 'CONDOMINIO CC LAS AMERICAS', 'ADMINISTRACION'),
(809, ' ', '', '0', '', '0212-241-76-97', '0', '0', '0', 'CONDOMINIO', 'CONDOMINIO EDIFICIO CUARZO', 'ESTACIONAMIENTO'),
(810, ' ', '', '0', '', '0243-217-33-69', '0243-233-32-46', '0', '0', 'CONDOMINIOS', 'CONDOMINIO SERVIAMERICA', 'OFICINA'),
(811, ' ', '', '0', '', '0212-709-00-11', '0', '0', '0', 'AGENCIA DE VIAJES', 'CONFERRI', 'OFICINA'),
(812, ' ', '', '0', '', '0212-706-00-09', '0', '0', '0', 'PROVEEDOR', 'CONFERRY', 'VIAJES'),
(813, ' ', '', '0', '', '0500-266-84-27', '0', '0', '0', 'AGENCIA DE VIAJES', 'CONVIASA', 'OFICINA'),
(814, ' ', '', '0', '', '0212-372-80-33', '0', '0', '0', 'PROVEEDOR', 'COOUTENYE', 'PEGAMENTO'),
(815, ' ', '', '0', '', '0212-234-64-22', '0', '0212-238-25-82', '0212-239-78-71', 'PROVEEDOR', 'CORPODATA', 'INFORMATICA'),
(816, ' ', '', '0', '', '0212-241-32-02', '0', '0212-242-56-73', '0', 'PROVEEDORES', 'CORPORACION CAPI', 'UTILES ESCOLARES'),
(817, ' ', '', '0', '', '0212-561-67-46', '0', '0', '0', 'PROVEEDOR', 'CORPORACION TRIVEN', 'FLEJES'),
(818, ' ', '', '0', '', '0212-372-80-33', '0', '0212-372-82-22', '0800-276-62-00', 'PROVEEDOR', 'COUTTENYE', 'PEGAMENTO'),
(819, ' ', '', '0', '', '0212-631-01-51', '0212-537-57-61', '0', '0', 'PROVEEDOR', 'CREACIONES TU CORREA', 'CINTURONES'),
(820, ' ', '', '0', '', '0212-344-15-21', '0', '0212-344-35-48', '0', 'PROVEEDORES', 'CUEROS RECUTEX', 'PIELES'),
(821, ' ', '', '0', '', '0212-620-60-00', '0', '080-022-553-45', '0', 'PROVEEDOR', 'D.H.L', 'IMPORTACIONES'),
(822, ' ', '', '0', '', '0212-344-43-20', '0', '0212-344-09-22', '0', '0', 'DECOCAR', 'TRANSPORTE'),
(823, ' ', '', '0', '', '0800-225-53-45', '0', '0', '0', 'PROVEEDOR', 'DHL ', 'OFICINA PRINCIPAL'),
(824, ' DICOPESA', '0212-232-94-23', '0', '', '0212-232-94-23', '0', '0', '0', 'PROVEEDOR', 'DICOPESA', '0'),
(825, ' ', '', '0', '', '0212-574-14-22', '0', '0212-241-15-91', '0', 'PROVEEDOR', 'DISEÑOS LILIMET', 'UNIFORMES'),
(826, ' ', '', '0', '', '0212-241-15-91', '0', '0', '0', 'PROVEEDORE', 'DISEÑOS LILIMEY', 'UNIFORMES'),
(827, ' ', '', '0', '', '0212-801-22-50', '0', '0212-870-29-97', '0', 'PROVEEDOR', 'DIST. LEATHER AIR', 'CALZADOS'),
(828, ' ', '', '0', '', '0212-561-43-35', '0', '0212-561-29-72', '0', 'PROVEEDOR', 'DISTRIBUIBORA COHEN', 'PIELES Y FORROS'),
(829, ' ', '', '0', '', '0212-262-10-13', '0', '0212-266-98-52', '0', 'OTROS', 'DISTRIBUIDORA ANA ARENA', 'OTROS'),
(830, ' ', '', '0', '', '0212-266-76-71', '0', '0212-266-93-76', '0', 'PROVEEDOR', 'DISTRIBUIDORA DMS', 'PUBLICIDAD'),
(831, ' EDITORIAL GIRASOL', '0212-945-95-55', '0', '', '0212-945-95-55', '0', '0212-945-60-46', '0212-945-97-66', 'PROVEEDOR', 'DISTRIBUIDORA NUBECITAS', 'LIBROS PAPELERIA'),
(832, ' ', '', '0', '', '0212-870-30-65', '0', '0', '0', 'PROVEEDOR', 'DISTRIBUIDORA OSOROMA', 'EQUIPOS DE PROTECCION'),
(833, ' AUTOMECANICA DOFI', '0212-730-74-80', '0', 'LA FLORIDA CARACAS', '0212-730-74-80', '0', '0', '0', 'PROVEEDOR', 'DOFI', 'TALLER MECANICO'),
(834, ' ', '', '0', '', '0212-40-14-700', '0', '0', '0', 'PROVEEDOR', 'DOMESA', 'SERV.MENSAJERIA'),
(835, ' ', '', '0', '', '0212-242-15-22', '0', '0', '0', 'RESTAURANT', 'DOMINOS PIZZA (LA URBINA)', 'SERV.COMIDAS'),
(836, ' ', '', '0', '', '0212-256-36-11', '0', '0', '0', 'PROVEEDOR', 'DUNCAN (LOS CORTIJOS)', 'REPUESTOS DE VEHICULOS'),
(837, ' EDITORIAL PANAPO', '0212-462-13-41 ', '0', 'AV JOSE ANGEL LAMAS CENTRO INDUSTRIAL  PALO GRANDE  EDF 1 PISO 6 CARACAS', '0212-462-13-41 ', '0212-46286-27', '0212-461-37-73', '0', 'PROVEEDOR', 'EDITORIAL PANAPO', 'UTILES ESCOLARES'),
(838, ' ', '', '0', '', '0212-419-38-96', '0', '0412-219-38-65', '0', 'CONDOMINIO', 'ELECTRO STALFRE', 'MATERIALES ELECTRICOS'),
(839, ' ', '', '0', '', '0212-662-91-15', '0', '0212-662-59-59', '0', 'OTROS', 'ELECTRONICAS NAVOS', 'OTROS'),
(840, ' ', '', '0', '', '0269-246-46-51', '0', '0276-343-48-38', '0', 'CLIENTES', 'EMOZIONI', 'VENTAS'),
(841, ' ', '', '0', '', '0269-246-46-51', '0', '0269-24689-51', '0', 'CLIENTES', 'EMOZIONI', 'VENTAS'),
(842, ' ', '', '0', '', '0212-232-54-20', '0', '0', '0', 'PROVEEDOR', 'EPA (LOS CORTIJOS)', 'OTROS'),
(843, ' ', '', '0', '', '0212-632-61-77', '0', '0212-632-83-58', '0212-632-54-30', 'OTROS', 'EQUI HOTEL', 'OTROS'),
(844, ' ', '', '0', '', '0276-344-53-09', '0', '0', '0', 'CLIENTES', 'EXIT TIENDAS MONANINA', 'VENTAS'),
(845, ' ', '', '0', '', '0212-284-38-78', '0', '0', '0', 'OTROS', 'EXSELCIOR GAMA', 'OTROS'),
(846, ' ', '', '0', '', '0212-285-33-17', '0', '0', '0', 'OTROS', 'EXSELCIOR GAMA (PALOS GRANDES)', 'OTROS'),
(847, ' YEIMI BARBOZA', '0212-794-27-73', 'SERVICIOSEXTINYEY2011@GMAIL.COM', 'CARACAS', '0212-794-27-73', '0', '0212-793-48-46', '0', 'PROVEEDOR', 'EXTINYEY', 'EXTINTORES'),
(848, ' ', '', '0', '', '0212-693-68-56', '0', '0212-693-96-30', '0', 'PROVEEDORES', 'FABRICAS DE TACONES F.C.A', 'COMPRAS'),
(850, ' ', '', '0', '', '0212-217-63-23', '0', '0212-543-28-55', '0', 'ENTES PRIVADOS', 'FEDERACION DE CALZADO', 'SINDICATOS'),
(851, ' ', '', '0', '', '0212-205-33-33', '0', '0', '0', 'IMPORTACIONES', 'FEDEX', 'SERV.MENSAJERIA'),
(852, ' ', '', '0', '', '0212-241-56-15', '0', '0212-242-30-27', '0', 'PROVEEDOR', 'FERRETERIA DIFREMAR', 'FERRETERIA'),
(853, ' ', '', '0', '', '0212-753-46-78', '0', '0', '0', 'PROVEEDOR', 'FERRETOTAL', 'FERRETERIA'),
(854, ' ', '', '0', '', '0212-761-63-79', '0', '0212-761-84-01', '0', 'AGENCIA DE VIAJES', 'FERRY NAVIARCA MUNDO TURISTICO CRI', 'OFICINA'),
(855, ' ', '', '0', '', '0212-239-11-40', '0', '0212-235-52-27', '0', 'PROVEEDOR', 'FESTEJOS DE VENEZUELA', 'FESTEJOS'),
(856, ' ', '', '0', '', '0212-731-36-17', '0', '0', '0', 'PROVEEDOR', 'FESTEJOS PLANZ', 'FESTEJOS'),
(857, ' ', '', '0', '', '0212-284-02-56', '0', '0', '0', 'PROVEEDOR', 'FLORISTERIA (LOS PALOS GRANDES)', 'ARREGLOS FLORALES'),
(858, ' ', '', '0', '', '0212-242-73-82', '0', '0', '0', 'BANCOS', 'FONDO COMUN', 'OFICINA'),
(859, ' ', '', '0', '', '0212-241-47-20', '0', '0212-241-57-44', '0', 'OTROS', 'FRADIMECA', 'OTROS'),
(860, ' ', '', '0', '', '0212-256-17-23', '0', '0212-256-11-22', '0', 'OTROS', 'FUGAMAZ', 'OTROS'),
(861, ' ', '', '0', '', '0239-225-13-63', '0', '0', '0', 'OTROS', 'FUNERARIA 3000 OCUMARE DEL TUY', 'OTROS'),
(862, ' ', '', '0', '', '0212-991-99-46', '0', '0', '0', 'REVISTA', 'GESTIMARCAS', 'PUBLICIDAD'),
(863, ' ', '', '0', '', '0212-242-07-78', '0', '0', '0', 'LEGALES', 'GESTORIA LA ROCCA', 'LEGALES'),
(864, ' ', '', '0', '', '0212-237-13-75', '0', '0212-238-08-48', '0212-238-55-26', 'PROVEEDOR', 'GOMELAST', 'LIJAS, CINTAS'),
(865, ' ', '', '0', '', '0285-632-66-56', '0', '0', '0', 'CLIENTES', 'GRAN MODA', 'VENTAS'),
(866, ' ', '', '0', '', '0212-303-15-28', '0', '0', '0', 'OTROS', 'GUAIRA INTERNACIONAL', 'OTROS'),
(867, ' ', '', '0', '', '0212-406-30-00', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL CARACAS', 'GUARDERIAS'),
(868, ' ', '', '0', '', '0269-240-51-17', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL DE INDIBENIA', 'GUARDERIAS'),
(869, ' ', '', '0', '', '0269-240-51-17', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL FALCON', 'GUARDERIAS'),
(870, ' ', '', '0', '', '0248-521-01-01', '0', '0248-521-01-69', '0', 'OTROS', 'GUARDERIA NACIONAL PTO.AYACUCHO', 'GUARDERIAS'),
(871, ' ', '', '0', '', '0212-264-06-36', '0', '0212-264-13-93', '0212-267-50-12', 'OTROS', 'HABITACASA', 'OFICINA'),
(872, ' ', '', '0', '', '0', '0', '0800-768-225-36', '0', 'ENTES PUBLICOS', 'HIDROCAPITAL', 'ATENCION AL CLIENTE'),
(873, ' ', '', '0', '', '0212-573-69-11', '0', '0212-573-65-55', '0', 'MEDICINA', 'HOSPITAL ORTOPEDICO INFANTIL', 'OFICINA'),
(874, ' MARIN', '', '0', '', '0416-211-17-10', '0', '0', '0', 'ENTES PUBLICOS', 'I.N.C.E.', 'OTROS'),
(875, 'SRA. MIREYA', '0251-254-87-93', '0', 'BARQUISIMETO', '0251-254-87-93', '0', '0', '0', 'CLIENTES', 'ILMERLETTO DEL ESTE', 'VENTAS');
INSERT INTO `contacts` (`id`, `name`, `contact`, `email`, `address`, `phone1`, `phone2`, `phone3`, `phone4`, `category`, `company`, `department`) VALUES
(876, ' ', '', '0', '', '0212-481-63-05', '0', '0', '0', 'PROVEEDOR', 'IMPORTADORA AMERICANA', 'PANETONE'),
(877, ' ', '', '0', '', '0212-631-10-45', '0', '0', '0', 'PROVEEDOR', 'IMPRESOS CANAIMA', 'TALONARIOS'),
(878, ' ', '', '0', '', '0212-871-63-57', '0', '0212-871-67-68', '0212-872-30-09', 'PROVEEDOREES', 'INDUSTRIAS RUANSA DE VENEZUELA', 'FORROS Y TELAS'),
(879, ' ', '', '0', '', '0212-872-30-09', '0', '0212-871-63-', '0', 'PROVEEDORES', 'INDUSTRIAS RUANSA DE VENEZUELA', 'FORROS Y TELAS'),
(880, ' ', '', '0', '', '0212-562-44-01', '0', '0414-241-51-92', '0414-210-02-36', 'OTROS', 'INDUSTRIAS UNION GRAFICA', 'OTROS'),
(881, ' ', '', '0', '', '0241-832-04-27', '0', '0414-402-11-26', '0', 'OTROS', 'INGENIERIA HENFOR', 'OTROS'),
(882, ' ', '', '0', '', '0276-343-78-41', '0', '0', '0', 'CLIENTES', 'INVERSIONES ADAN Y EVA', 'VENTAS'),
(883, ' ', '', '0', '', '0292-337-02-70', '0', '0', '0', 'CLIENTES', 'INVERSIONES CASA DELIA', 'VENTAS'),
(884, ' ', '', '0', '', '0212-951-02-20', '0', '0', '0', 'PROVEEDORES', 'INVERSIONES CELEBRE AQUI ', 'PUBLICIDAD'),
(885, ' ', '', '0', '', '0241-841-17-36', '0', '0', '0', 'CLIENTES', 'INVERSIONES FACOMAR(VALENCIA)', 'VENTAS'),
(886, ' ', '', '0', '', '0212-761-18-91', '0', '0212-761-34-25', '0', 'PROVEEDORES', 'INVERSIONES LEATHER ', 'DISTRIBUIDORA DE CALZADOS'),
(887, ' ', '', '0', '', '0241-823-50-01', '0', '0', '0', 'CLIENTES', 'INVERSIONES TERRA', 'VENTAS'),
(888, ' ', '', '0', '', '0241-822-06-27', '0', '0', '0', 'CLIENTES', 'INVERSIONES. F.M.R. DE VENEZUELA', 'VENTAS'),
(889, ' ', '', '0', '', '0241-822-25-75', '0', '0241-824-01-24', '0', 'CLIENTES', 'IVORY C.A', 'VENTAS'),
(890, ' ', '', '0', '', '0', '0', '0', '0', 'CLIENTES', 'IVORY VALENCIA', 'VENTAS'),
(891, ' ', '', '0', '', '0212-391-12-92', '0212-391-15-58', '0212-391-16-38', '0', 'PROVEEDOR', 'K´NOLL GOMAS', 'PEGAMENTO'),
(892, ' ', '', '0', '', '0212-391-12-92', '0', '0212-391-16-38', '0212-391-12-48', 'PROVEEDORES', 'K´NOLL GOMAS INDUSTRIALES', 'CONTRAFUERTES'),
(893, ' ', '', '0', '', '0212-331-17-17', '0', '0212-331-93-95', '0', 'PROVEEDOR', 'KEM & WILL C.A', 'IMPORTACIONES'),
(894, ' ', '', '0', '', '0212-872-14-86', '0212-761-18-91', '0', '0', 'PROVEEDOR', 'LEATHER TRADE COMPANY', 'PIELES'),
(895, ' ', '', '0', '', '0212-241-11-11', '0212-241-33-33', '0212-241-44-44', '0', 'PROVEEDOR', 'LEGIS', 'MANUALES LEGALES'),
(896, ' ', '', '0', '', '0212-263-31-44', '0212-264-40-34', '0212-267-56-69', '0212-264-34-10', 'PROVEEDOR', 'LIBRERÍA MUNDO PAPEL', 'UTILES DE OFICINA'),
(897, ' ', '', '0', '', '0212-241-15-91', '0', '0', '0', 'PROVEEDOR', 'LILIMEY DISEÑOS', 'UNIFORMES'),
(898, ' ', '', '0', '', '0501-836-39-65', '0', '0', '0', 'AGENCIA DE VIAJES', 'LINEA VENEZOLANA', 'ATENCION AL CLIENTE'),
(899, ' ', '', '0', '', '0212-232-10-33', '0212-232-11-11', '0212-203-44-33', '0', 'MEDICOS Y MEDICINAS', 'LOCATEL (BOLEITA CENTER)', 'MEDICOS Y MEDICINAS'),
(900, ' ', '', '0', '', '0212-781-71-01', '0', '0', '0', 'PROVEEDOR', 'LOGISTICAS SISTEMAS (CLARET)', 'SISTEMAS'),
(901, ' ', '', '0', '', '0212-237-38-66', '0', '0', '0', 'OTROS', 'LOGIVAY (LOS RUICES)', 'OTROS'),
(902, ' ', '', '0', '', '0212-242-72-69', '0212-242-76-36', '0', '0', 'RESTAURANT', 'LORETO´S', 'RESTAURANT'),
(903, ' ', '', '0', '', '0212-272-20-36', '0416-62 7-32-85', '0', '0', 'PROVEEDOR', 'LUJUANCLA', 'UNIFORMES'),
(904, ' ', '', '0', '', '0212-985-83-94', '0212-985-76-16', '0', '0', 'PROVEEDOR', 'LUNA ROSSA', '0'),
(905, ' ', '', '0', '', '0212-243-50-34', '0212-243-26-08', '0', '0', 'MENSAJERIA', 'MAIL BOXES ETC. (LA URBINA)', 'MENSAJERIA'),
(906, ' ', '', '0', '', '0212-433-25-11', '0', '0', '0', 'PROVEEDOR', 'MANAPLAS', 'PLASTICO'),
(907, ' ', '', '0', '', '0286-600-31-45', '0286-600-31-44', '0', '0', 'CLIENTE', 'MARIANGEL ORINOQUIA', 'VENTAS'),
(908, ' ', '', '0', '', '0286-600-31-45', '0', '0', '0', 'CLIENTE', 'MARIANGEL´S', 'VENTAS'),
(909, ' ', '', '0', '', '0212-241-70-93', '0212-241-93-12', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRICOS SVAT.', 'MATERIALES ELECTRICOS'),
(910, ' ', '', '0', '', '0212-237-02-15', '0', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRONICOS (EL MARQUES)', 'ELECTRICIDAD'),
(911, ' ', '', '0', '', '0212-662-47-40', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'MEDICINA VIAL', 'MEDICOS Y MEDICINAS'),
(912, ' ', '', '0', '', '0241-857-66-09', '0', '0', '0', 'CLIENTE', 'MOMPER, C.A.', 'VENTAS'),
(913, ' ', '', '0', '', '0281-280-30-41', '0', '0', '0', 'CLIENTE', 'MONIC FASHIONS', 'VENTAS'),
(914, ' ', '', '0', '', '0295-291-32-47', '0', '0', '0', 'PROVEEDOR', 'MRW  (LA PENINSULA)', 'SERVICIOS DE MENSAJERIA'),
(915, ' ', '', '0', '', '0212-241-00-12', '0', '0', '0', 'PROVEEDOR', 'MRW (LA URBINA)', 'SERVICIOS DE MENSAJERIA'),
(916, ' ', '', '0', '', '0501-685-87-34', '0501-207-64-49', '0', '0', 'SEGUROS', 'MULTINACIONAL DE SEGUROS', 'ATENCION AL CLIENTE'),
(917, ' ', '', '0', '', '0212-620-33-24', '0212-620-33-22', '0', '0', 'PROVEEDOR', 'MULTINACIONAL DE SEGUROS', 'SEGUROS'),
(918, ' ', '', '0', '', '0212-241-28-22', '0', '0', '0', 'PROVEEDOR', 'MUNDO PIEL (NEVISELA)', 'PIELES'),
(919, ' ', '', '0', '', '0212-753-51-98', '0', '0', '0', 'PROVEEDORES', 'NAPPOS CONSULTORES', 'INFORMATICA'),
(920, ' ', '', '0', '', '0212-243-66-76', '0212-241-44-88', '0212-.241-90-93', '0', 'ENTES PUBLICOS', 'NOTARIA PUBLICA', 'OFICINA'),
(921, ' ', '', '0', '', '0', '0', '0', '0', 'PROVEEDOR', 'NUOVA CEPER DE VENEZUELA', 'CONTRAFUERTES Y CARTONES'),
(922, ' ', '', '0', '', '0212-945-95-55', '0212-945-60-46', '0212-914-02-92', '0', 'PROVEEDOR', 'NUVECITA', 'UTILES ESCOLARES'),
(923, ' ', '', '0', '', '0212-242-46-59', '0', '0', '0', 'PROVEEDOR', 'OFIGRAPA', 'UTILES DE OFICINA'),
(924, ' ', '', '0', '', '0245-571-06-12', '0', '0', '0', 'PROVEEDOR', 'PABILOS AILEN', 'PABILOS'),
(925, ' SR PEDRO', '0212-243-51-43', '0', 'CALLE 7 LA URBINA', '0212-243-51-43', '0', '0', '0', 'PROVEEDOR', 'PANADERIA FINA 13', 'PANADERIA'),
(926, ' ', '', '0', '', '0212-241-45-96', '0', '0', '0', 'PROVEEDOR', 'PANADERIA TULIPAN', 'PANADERIA'),
(927, ' BRACAMONTE', '', '0', '', '0414-239-35-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI'),
(929, ' BERROTERAN', '', '0', '', '0412-391-05-49', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(930, ' LIC. CARRILLO', '', '0', '', '0414-372-81-41', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(931, ' BERNOTTI', '', '0', '', '0212-262-10-13', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS'),
(932, ' GALINDO', '', '0', '', '0412-728-04-50', '0', '0212-344-14-26', '0212-344-83-96', 'OTROS', 'PARTICULAR', 'TRAMITES SETRA'),
(933, ' ', '', '0', '', '0212-243-71-34', '0212-244-31-73', '0', '0', 'PROVEEDOR', 'PERLATRON', 'RECARGA DE TONER'),
(934, ' ', '', '0', '', '0212-753-15-20', '0212-753-96-19', '0212-751-45-91', '0', 'OTROS', 'PLUSCABLE', 'OTROS'),
(935, ' ', '', '0', '', '0212-341-62-61', '0212-341-46-43', '0212-341-29-14', '0212-341-47-13', 'PROVEEDOR', 'POLIURETANOS TEXEL', 'SUELAS'),
(939, ' ', '', '0', '', '0212-662-24-31', '0212-661-46-01', '0212-661-15-40', '0212-661-95-01', 'ASEGURADORA', 'PROSEGURO LOS PROCERES', 'OFICINA'),
(940, ' ', '', '0', '', '0251-231-70-57', '0', '0', '0', 'CLIENTES', 'PUELLA', 'VENTAS'),
(941, ' PELI EXPRESS', '0212-239-49-10', '0', '', '0212-239-49-10', '0212-239-90-58', '0', '0', 'OTROS', 'PULI EXPRESS', 'OTROS'),
(942, ' COMERCIAL CAZORLA', '0241-894-29-86', '0', '', '0241-894-29-86', '0414-471-61-66', '0', '0', 'PROVEEDOR', 'RECUPERADORA CAZORLA, C.A', 'CAJAS'),
(943, ' ', '', '0', '', '0212-286-61-31', '0412-235-03-39', '0', '0', 'OTROS', 'REMISUR', 'OFICINA'),
(944, ' ', '', '0', '', '0212-383-28-81', '0212-372-78-96', '0', '0', 'CLIENTE', 'RENIS VALLERY', 'VENTAS'),
(945, ' ', '', '0', '', '0212-372-73-52', '0414-247-18-32', '0', '0', 'CLIENTES', 'RENY VALERI', 'VENTAS'),
(946, ' ', '', '0', '', '0212-256-44-19', '0', '0', '0', 'OTROS', 'REPARMATIC', 'OTROS'),
(947, ' ', '', '0', '', '0212-241-04-09', '0', '0', '0', 'OTROS', 'REPUESTOS ARENA', 'OTROS'),
(948, ' ', '', '0', '', '0212-241-19-20', '0212-241-44-11', '0', '0', 'PROVEEDOR', 'REPUESTOS EL PARAISO', 'REPUESTOS'),
(949, ' ', '', '0', '', '0212-266-09-31', '0212-263-57-08', '0212-267-06-45', '0212-265-23-35', 'VEHICULOS', 'REPUESTOS LEAL', 'REPUESTOS'),
(950, ' ', '', '0', '', '0281-276-89-34', '0212-271-00-82', '0', '0', 'OTROS', 'REPUESTOS PARA TODO', 'REPUESTOS'),
(951, ' ', '', '0', '', '0212-944-51-90', '0212-942-14-22', '0', '0', 'OTROS', 'RESPUESTOS (BARUTA)', 'REPUESTOS'),
(952, ' ', '', '0', '', '0212-243-11-20', '0', '0', '0', 'RESTAURANT', 'RESTAURANT EL BRASERO DEL MARQUEZ', 'SERVICIO DE COMIDA'),
(953, ' ', '', '0', '', '0212-542-14-31', '0416-414-36-11', '0', '0', 'PROVEEDOR', 'RJ SERIGRAPHIC', 'ETIQUETAS SENCAMER'),
(954, ' ', '', '0', '', '0212-435-28-46', '0416-401-83-27', '0', '0', 'PROVEEDOR', 'SANGAY CHEMICAL', 'GASOLINA '),
(955, ' ', '', '0', '', '0212-242-58-64', '0212-241-42-89', '0', '0', 'ENTES PUBLICOS', 'SANIDAD', 'MEDICOS Y MEDICINAS'),
(956, ' ', '', '0', '', '0800-865-26-36', '0', '0', '0', 'AGENCIA DE VIAJES ', 'SANTA BARBARA', 'OFICINA'),
(957, ' ', '', '0', '', '0212-235-30-33', '0', '0', '0', 'PROVEEDOR', 'SANTILLANA', 'UTILES ESCOLARES'),
(958, ' ', '', '0', '', '0212-630-31-95', '0', '0', '0', '0', 'SATELITAL', 'TALLER'),
(959, ' ', '', '0', '', '0212-264-69-63', '0212-266-62-42', '0212-715-95-74', '0414-183-00-73', 'PROVEEDOR', 'SATELITE CREATIVO PUBLICIDAD', 'PUBLICIDAD'),
(960, ' ', '', '0', '', '0212-870-30-65', '0212-871-36-07', '0212-870-30-91', '0', 'OTROS', 'SCOTT REPRESENTACIONES', 'OTROS'),
(961, ' ', '', '0', '', '0212-631-01-33', '0212-631-04-24', '0', '0', 'OTROS', 'SEGURITEX', 'OTROS'),
(962, ' ', '', '0', '', '0212-276-20-00', '0212-503-25-25', '0', '0', 'SEGUROS', 'SEGURO MERCANTIL', 'OFICINA'),
(963, ' ', '', '0', '', '0212-952-03-05', '0', '0', '0', 'SEGUROS', 'SEGURO OCCIDENTAL', 'OFICINA'),
(964, ' ', '', '0', '', '0212-901-07-04', '0212-901-09-52', '0212-901-03-91', '0', 'ENTES PUBLICOS', 'SEGURO SOCIAL ', 'OFICINA'),
(965, ' ', '', '0', '', '0212-703-20-11', '0212-703-20-05', '0212-703-20-06', '0', 'ENTES PUBLICOS', 'SENCAMER', 'PERMISO DISTRIBUCION DE CALZADOS'),
(966, ' ', '', '0', '', '0241-871-61-56', '0212-817-84-19', '0', '0', 'ENTES PUBLICOS', 'SENIAT', 'OFICINA'),
(967, ' ', '', '0', '', '0212-794-01-25', '0212-794-08-62', '0212-794-01-25', '0', 'ENTES PUBLICOS', 'SENIAT ', 'DEPARTAMENTO LEGAL'),
(968, ' ', '', '0', '', '0212-207-25-11', '0212-207-27-45', '0', '0', 'ENTES PUBLICOS', 'SENIAT (LOS RUICES)', 'OFICINA'),
(969, ' NELSON PEREZ', '0212-661-70-28', 'SERCLIMATIC@HOTMAIL.COM', 'SANTA MONICA CARACAS', '0212-661-70-28', '0', '0', '0', 'PROVEEDOR', 'SERCLIMATIC', 'SERVICIO AIRE ACONDICIONADO'),
(970, ' ', '', '0', '', '0212-239-45-46', '0212-239-87-32', '0212-239-29-59', '0', 'PROVEEDOR', 'SERVICIOS  CANAL CORP', 'ARTICULOS EN GENERAL'),
(973, ' ', '', '0', '', '0241-823-84-15', '0', '0', '0', 'CLIENTES', 'SHOES BOUTIQUE', 'VENTAS'),
(974, ' ', '', '0', '', '0212-234-05-79', '0212-234-05-51', '0212-235-36-66', '0', 'OTROS', 'SILENCIADORES DAYTANA', 'VEHICULOS'),
(975, ' ', '', '0', '', '0212-623-50-20', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OFICINA'),
(976, ' 0', '0212-241-15-10', '0', 'LA URBINA, CALLE 11', '0212-241-15-10', '0', '0', '0', 'PROVEEDOR', 'SOBICA ELECTRONIC', 'ARTICULOS DE ELECTRICIDAD'),
(977, ' ', '', '0', '', '0501-763-39-46', '0212-206-56-44', '0', '0', 'PROVEEDOR', 'SODHEXHO PASS', 'CESTA TICKET'),
(978, ' ', '', '0', '', '0212-243-71-96', '0424-243-08-60', '0', '0', 'PROVEEDOR', 'SOIN', 'EQUIPOS DE COMPUTACION'),
(979, ' ', '', '0', '', '0212-241-15-10', '0', '0', '0', 'PROVEEDOR', 'SOVICA', 'SISTEMAS DE SEGURIDAD'),
(980, ' ', '', '0', '', '0212-241-46-37', '0212-242-46-27', '0212-243-57-95', '0', 'PROVEEDOR', 'SUBWAY (LA URBINA)', 'SERVICIO DE COMIDA'),
(981, ' ', '', '0', '', '0241-832-02-67', '0', '0', '0', 'OTROS', 'SUPLI SEGURIDAD', 'OTROS'),
(982, ' ', '', '0', '', '0212-234-59-42', '0', '0', '0', 'PROVEEDOR', 'TACHIFICIO SANGIORGIO', 'TACONES Y PLATAFORMAS'),
(983, ' ', '', '0', '', '0212-838-55-35', '0212-871-21-04', '0', '0', 'PROVEEDOR', 'TACONES BALTAC-ZIMA', 'TACONES'),
(984, ' ALFREDO FRENESTE', '0212-256-98-89', '0', 'BUENA VISTA PETARE', '0212-256-98-89', '0212-256-67-50', '0212-256-97-86', '0', 'PROVEEDOR', 'TALLER FRENESTE', 'REPARACION VEHICULOS'),
(985, ' ', '', '0', '', '0416-701-01-62', '0', '0', '0', 'OTROS', 'TAXI', 'ALQUILERES'),
(986, ' ', '', '0', '', '0212-870-38-34', '0212-870-24-03', '0', '0', 'PROVEEDOR', 'TECNISUELA', 'SUELAS'),
(987, ' ', '', '0', '', '0212-237-10-27', '0416-819-52-89', '0', '0', 'PROVEEDOR', 'TECNO AUTOMOTRIZ (MONTECRISTO)', 'VEHICULOS'),
(988, ' ', '', '0', '', '0246-415-79-52', '0', '0', '0', 'PROVEEDOR', 'TENERIA SAN JUAN ', 'PIELES Y FORROS'),
(989, ' ', '', '0', '', '0246-415-79-52', '0', '0', '0', 'PROVEEDOR', 'TENERIA SAN JUAN DE LOS  MORROS', 'PIELES Y FORROS'),
(990, ' ', '', '0', '', '0281-282-16-27', '0', '0', '0', 'PROVEEDOR', 'TERRANOVA CALZATURE', 'CALZADOS'),
(991, ' ', '', '0', '', '0243-615-03-83', '0243-615-03-88', '0', '0', 'PROVEEDOR', 'TODO EN CAJAS', 'CAJAS PARA CALZADOS'),
(992, ' ', '', '0', '', '0249-331-24-21', '0', '0', '0', 'CLIENTES', 'TOLLY SHOES', 'VENTAS'),
(993, ' ', '', '0', '', '0212-258-18-63', '0', '0', '0', 'ENTES PUBLICOS', 'TRANSITO SUCRE', 'OFICINA'),
(994, ' ', '', '0', '', '0212-577-41-30', '0416-917-90-12', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'TRANSPORTE'),
(995, ' ', '', '0', '', '0212-331-36-22', '0', '0', '0', 'IMPORTACIONES', 'TRANSPORTE MULTIMODAL', 'OFICINA LA GUAIRA'),
(996, ' ', '', '0', '', '0212-975-09-20', '0212-975-05-28', '0', '0', 'PROVEEDOR', 'TRANSPORTE MULTIMODAL', 'TRANSPORTE'),
(997, ' ', '', '0', '', '0212-331-27-22', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE MULTIMODAL (LA GUAIRA)', 'IMPORTACIONES'),
(998, ' ', '', '0', '', '0212-461-65-66', '0212-461-34-66', '0', '0', 'PROVEEDOR', 'TRANSVALVER (SODEXHO PASS)', 'PEDIDOS,DESPACHO'),
(999, ' ', '', '0', '', '0285-632-62-56', '0212-632-43-67', '0', '0', 'CLIENTES', 'TRAVERTINO SHOES', 'VENTAS'),
(1000, ' ', '', '0', '', '0212-383-10-92', '0', '0', '0', 'PROVEEDOR', 'TRENZAS CARRIZAL', 'TRENZAS'),
(1001, ' ', '', '0', '', '0212-596-16-34', '0', '0', '0', 'PROVEEDOR', 'ULTIMAS NOTICIAS', 'DPTO.ATENCION AL CLIENTE'),
(1002, ' ', '', '0', '', '0212-596-18-67', '0', '0', '0', 'PROVEEDOR', 'ULTIMAS NOTICIAS', 'DPTO.ATENCION DE AVISO'),
(1004, ' ', '', '0', '', '0212-838-55-35', '0', '0', '0', 'PROVEEDOR', 'VALTAK', 'TACONES'),
(1005, ' ', '', '0', '', '0212-871-32-61', '0', '0', '0', 'PROVEEDOR', 'VENECAL', 'ARTICULOS EN GENERAL'),
(1006, ' ', '', '0', '', '0212-381-07-80', '0212-381-06-46', '0212-381-18-58', '0', 'PROVEEDOR', 'VIMAR DE VENEZUELA', 'ARTICULOS ELECTRICOS'),
(1007, ' ', '', '0', '', '0212-693-66-27', '0212-214-23-80', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD'),
(1008, ' ', '', '0', '', '0212-471-24-34', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL'),
(1009, ' ', '', '0', '', '0212-633-09-19', '0212-632-94-93', '0', '0', 'OTROS', 'VOLGAN', 'OTROS'),
(1010, ' ', '', '0', '', '0800-937-69-00', '0212-237-53-52', '0212-232-39-24', '0', 'PROVEEDOR', 'XEROX', 'EQUIPOS DE COMPUTACION'),
(1011, ' ', '', '0', '', '0261-752-14-89', '0261-752-39-65', '0', '0', 'CLIENTES', 'ZAPATERIA ALTAMIRA', 'VENTAS'),
(1012, ' ', '', '0', '', '0269-246-46-51', '0', '0', '0', 'CLIENTES', 'ZAPATERIA LA POPULAR', 'VENTAS'),
(1013, ' ', '', '0', '', '0255-621-14-08', '0', '0', '0', 'CLIENTES', 'ZAPATERIA MARACAIBO', 'VENTAS'),
(1014, ' ', '', '0', '', '0241-821-10-81', '0', '0', '0', 'CLIENTES', 'ZAPATERIA MINERVA', 'VENTAS'),
(1015, ' ', '', '0', '', '0416-623-17-32', '0', '0', '0', 'CLIENTES', 'ZAPATERIA NADIA', 'VENTAS'),
(1016, ' ', '', '0', '', '0241-871-61-56', '0241-871-84-91', '0241-753-63-91', '0', 'PROVEEDOR', 'ZERMAC', 'SUELAS Y PLANTILLAS'),
(1017, ' ', '', '0', '', '0212-471-63-73', '0', '0212-471-04-45', '0', 'OTROS', 'ZINFOCAL', 'OTROS'),
(1018, ' ', '', '0', '', '0212-901-07-99', '0212-901-07-23', '0', '0', 'SEGUROS', 'ZURITH SEGUROS', 'OFICINA'),
(1019, ' ', '', '0', '', '0', '0', '0', '0', '0', '0', '0'),
(1020, 'EGLEE HEREDIA', '04141234567', 'EGDOL', '', '04141234567', '', '', '', 'EMPLEADOS', 'BENHUR', ''),
(1023, 'prueba 1', '123456', 'scammarano@gmail.com', '', '123456', '', '', '', '10', '', ''),
(1024, 'prueba2', '123', 'scammarano@gmail.com', '', '123', '', '', '', '11', '', ''),
(1025, 'prueba3', '123', 'scammarano@gmail.com', 's', '123', '', '', '', '"11"', '', ''),
(1026, 'prueba4', '123', 'scammarano@gmail.com', '', '123', '', '', '', '["8","10","11"]', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact_categories`
--

CREATE TABLE `contact_categories` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contact_categories`
--

INSERT INTO `contact_categories` (`id`, `name`, `parent_id`) VALUES
(8, 'PROVEEDORES', 0),
(9, 'PROVEEDORES NACIONALES', 8),
(10, 'PROVEEDORES EXTRANJEROS', 8),
(11, 'CLIENTES', 0),
(12, 'CLIENTES NACIONALES', 11),
(13, 'CLIENTES EXTRANJEROS', 11),
(14, 'EMPLEADOS', 0),
(15, 'SOCIOS', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courts`
--

CREATE TABLE `courts` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(9) UNSIGNED NOT NULL,
  `court_category_id` int(9) UNSIGNED NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `courts`
--

INSERT INTO `courts` (`id`, `name`, `location_id`, `court_category_id`, `description`) VALUES
(2, 'ADMINISTRACION/CAJA CHICA', 1, 1, ''),
(3, 'ADMINISTRACION/DOCUMENTOS', 1, 2, ''),
(4, 'ADMINISTRACION/CAJA CHICA', 0, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `court_categories`
--

CREATE TABLE `court_categories` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `court_categories`
--

INSERT INTO `court_categories` (`id`, `name`) VALUES
(1, 'Caja chica'),
(2, 'Notificación de Documentos Recibidos Administracion'),
(3, 'Sistemas'),
(4, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` int(10) NOT NULL,
  `form` int(10) NOT NULL,
  `values` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `days`
--

CREATE TABLE `days` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `working_day` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `days`
--

INSERT INTO `days` (`id`, `name`, `working_day`) VALUES
(1, 'Sunday', 0),
(2, 'Monday', 0),
(3, 'Tuesday', 0),
(4, 'Wednusday', 0),
(5, 'Thursday', 0),
(6, 'Friday', 0),
(7, 'Saturday', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`) VALUES
(1, 'Administración', ''),
(2, 'Recursos Humanos', ''),
(3, 'Sistemas y Progamación', ''),
(4, 'Logística', ''),
(5, 'Comercial', ''),
(6, 'Producción', ''),
(7, 'Directiva', ''),
(8, 'Gerencia Mantenimiento y Servicios Generales', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depts`
--

CREATE TABLE `depts` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(9) UNSIGNED NOT NULL,
  `dept_category_id` int(9) UNSIGNED NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `depts`
--

INSERT INTO `depts` (`id`, `name`, `location_id`, `dept_category_id`, `description`) VALUES
(3, 'Factura Proveedor', 0, 1, ''),
(5, 'Recepción Documentos', 0, 1, ''),
(6, 'Factura Beneficio Guardería', 0, 2, ''),
(7, 'Duda o Reclamo en Nómina', 0, 2, ''),
(8, 'Caja Chica', 0, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dept_categories`
--

CREATE TABLE `dept_categories` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dept_categories`
--

INSERT INTO `dept_categories` (`id`, `name`) VALUES
(1, 'Administración'),
(2, 'Recursos Humanos'),
(3, 'Sistemas'),
(4, 'Mantenimiento'),
(5, 'Comercial'),
(6, 'Logística'),
(7, 'Producción'),
(9, 'Soporte Técnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_case` tinyint(1) NOT NULL DEFAULT '0',
  `case_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documents`
--

INSERT INTO `documents` (`id`, `title`, `is_case`, `case_id`) VALUES
(1, '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extended_case`
--

CREATE TABLE `extended_case` (
  `id` int(9) UNSIGNED NOT NULL,
  `case_id` int(9) UNSIGNED NOT NULL,
  `next_date` date NOT NULL,
  `last_date` date NOT NULL,
  `note` text NOT NULL,
  `document` text NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0',
  `is_view_client` int(10) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fees`
--

CREATE TABLE `fees` (
  `id` int(9) UNSIGNED NOT NULL,
  `case_id` int(9) UNSIGNED NOT NULL,
  `payment_mode_id` int(9) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holidays`
--

CREATE TABLE `holidays` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `flag` text NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`id`, `name`, `flag`, `file`) VALUES
(1, 'french', 'french-flag4.jpeg', 'admin_lang.php'),
(3, 'spanish', '', 'admin_lang_es.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leaves`
--

CREATE TABLE `leaves` (
  `id` int(9) UNSIGNED NOT NULL,
  `user_id` int(9) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `leave_type_id` int(9) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `leaves` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE `locations` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`id`, `name`) VALUES
(1, '01-LA URBINA'),
(2, '02-CHACAITO'),
(3, '03-CCCT'),
(4, '04-PLAZA MAYOR'),
(5, '05-SAMBIL'),
(6, '06-MARACAY'),
(7, '07-BARQUISIMETO'),
(8, '08-AVIADORES'),
(9, '09-CERRO VERDE'),
(10, '10-SAMBIL II');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loc_categories`
--

CREATE TABLE `loc_categories` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) UNSIGNED NOT NULL,
  `cod_interno` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `loc_categories`
--

INSERT INTO `loc_categories` (`id`, `name`, `parent_id`, `cod_interno`) VALUES
(0, 'GRUPO ECC', 999999999, '000'),
(1, 'CREACIONES BEN-HUR C.A.', 0, '001'),
(2, 'GRUPO FERRADINI C.A.', 0, '020'),
(11, '01-LA URBINA', 2, '020-001'),
(12, '02-CHACAITO', 2, '020-002'),
(13, '03-CCCT', 2, '020-003'),
(14, '04-PLAZA MAYOR', 2, '020-004'),
(15, '05-SAMBIL', 2, '020-005'),
(16, '06-MARACAY', 2, '020-006'),
(17, '07-BARQUISIMETO', 2, '020-007'),
(18, '08-AVIADORES', 2, '020-008'),
(19, '09-CERRO VERDE', 2, '020-009'),
(20, '10-SAMBIL II', 2, '020-010'),
(21, 'MODAS BH C.A.', 0, '098'),
(22, 'GRUPO SHAKE C.A.', 0, '021'),
(23, 'INVERSIONES ACALUROSA C.A.', 0, '099');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id` int(9) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `from_id` int(9) UNSIGNED NOT NULL,
  `to_id` int(9) UNSIGNED NOT NULL,
  `is_view_from` int(9) NOT NULL DEFAULT '0',
  `is_view_to` int(9) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id`, `message`, `from_id`, `to_id`, `is_view_from`, `is_view_to`, `date_time`) VALUES
(1, '<p>prueba envio mensaje de administrador a martha</p>', 1, 3, 0, 1, '2017-07-31 18:59:08'),
(2, '<p>prueba de envio mensaje de admin a martha</p>', 1, 3, 0, 1, '2017-07-31 19:00:28'),
(3, '<p>{eoif{oiwehoi{foihbf</p>', 1, 6, 0, 1, '2017-08-12 16:15:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `months`
--

CREATE TABLE `months` (
  `id` int(2) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'Octomber'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notice`
--

CREATE TABLE `notice` (
  `id` int(9) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notice`
--

INSERT INTO `notice` (`id`, `title`, `description`, `date_time`) VALUES
(1, 'Prueba de Noticia', 'Noticia de prueba', '2017-07-30 06:06:00'),
(2, 'noticia marianella', '', '2017-07-30 06:54:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(9) UNSIGNED NOT NULL,
  `case_alert` int(10) NOT NULL,
  `to_do_alert` int(10) NOT NULL,
  `appointment_alert` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `case_alert`, `to_do_alert`, `appointment_alert`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipt`
--

CREATE TABLE `receipt` (
  `id` int(9) UNSIGNED NOT NULL,
  `fees_id` int(9) UNSIGNED NOT NULL,
  `case_id` int(9) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_case_study_attachments`
--

CREATE TABLE `rel_case_study_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_study_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_department_designation`
--

CREATE TABLE `rel_department_designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rel_department_designation`
--

INSERT INTO `rel_department_designation` (`id`, `department_id`, `designation`) VALUES
(18, 2, 'Gerente de Recursos Humanos'),
(19, 2, 'Jefe de Recursos Humanos'),
(20, 2, 'Analista de Recursos Humanos'),
(21, 1, 'Analista Administrativo'),
(22, 1, 'Analista Contable'),
(23, 1, 'Recepcionista'),
(24, 1, 'Jefe de Administración'),
(25, 1, 'Gerente de Administración'),
(26, 3, 'Gerente de Sistemas'),
(27, 3, 'Jefe de Soporte Técnico'),
(28, 3, 'Jefe de Programación'),
(29, 3, 'Programador'),
(30, 3, 'Técnico'),
(39, 5, 'Gerente Comercial'),
(40, 5, 'Gerente de Tienda'),
(41, 5, 'Sub-Gerente de Tienda'),
(42, 5, 'Gerente de Operaciones'),
(43, 5, 'Asesor en Ventas'),
(44, 5, 'Vendedor Comercial'),
(45, 5, 'Jefe de Marca'),
(46, 5, 'Especialista en Publicidad'),
(47, 6, 'Gerente de Producción'),
(48, 6, 'Jefe de Producción'),
(49, 6, 'Jefe de Modelaje'),
(51, 7, 'Jefe DOFAT'),
(52, 8, 'Jefe de Mantenimiento'),
(53, 4, 'Jefe de Almacén'),
(54, 4, 'Gerente de Logística'),
(55, 4, 'Jefe de Logística'),
(56, 4, 'Almacenista'),
(57, 4, 'Chofer'),
(58, 4, 'Jefe de Compras'),
(59, 4, 'Analista de Compras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_document_files`
--

CREATE TABLE `rel_document_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `document_id` int(9) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rel_document_files`
--

INSERT INTO `rel_document_files` (`id`, `user_id`, `title`, `document_id`, `file_name`) VALUES
(1, 3, 'Cedula', 0, 'IMG_4751.JPG'),
(2, 3, 'Foto', 0, '472.JPG'),
(3, 0, '', 1, 'screenshot.1.jpg'),
(4, 0, '', 1, ''),
(5, 0, 'IM1', 1, 'screenshot.1.jpg'),
(6, 0, '', 1, 'screenshot.2.jpg'),
(7, 0, '', 1, 'screenshot.1.jpg'),
(8, 0, '', 1, 'ZKBioSecurity_3-0_Manual_de_Usuario.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_fees_tax`
--

CREATE TABLE `rel_fees_tax` (
  `tax_id` int(9) UNSIGNED NOT NULL,
  `fees_id` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_form_custom_fields`
--

CREATE TABLE `rel_form_custom_fields` (
  `custom_field_id` int(9) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `table_id` int(9) UNSIGNED NOT NULL,
  `form` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_role_action`
--

CREATE TABLE `rel_role_action` (
  `id` int(9) UNSIGNED NOT NULL,
  `role_id` int(9) UNSIGNED NOT NULL,
  `action_id` int(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rel_role_action`
--

INSERT INTO `rel_role_action` (`id`, `role_id`, `action_id`) VALUES
(1, 3, 1),
(2, 3, 4),
(3, 3, 5),
(4, 3, 6),
(5, 3, 7),
(6, 3, 8),
(7, 3, 9),
(8, 3, 10),
(9, 3, 11),
(10, 3, 12),
(11, 3, 13),
(12, 3, 15),
(13, 3, 84),
(14, 3, 105),
(15, 3, 156),
(16, 3, 166),
(17, 3, 167),
(18, 3, 169),
(19, 3, 170),
(20, 3, 171),
(21, 3, 16),
(22, 3, 17),
(23, 3, 18),
(24, 3, 19),
(25, 3, 20),
(26, 3, 107),
(27, 3, 21),
(28, 3, 22),
(29, 3, 155),
(30, 3, 25),
(31, 3, 26),
(32, 3, 27),
(33, 3, 28),
(34, 3, 29),
(35, 3, 106),
(36, 3, 80),
(37, 3, 112),
(38, 3, 113),
(39, 3, 114),
(40, 3, 115),
(41, 3, 116),
(42, 3, 117),
(43, 3, 152),
(44, 3, 146),
(45, 3, 147),
(46, 3, 148),
(47, 3, 149),
(48, 3, 150),
(49, 4, 1),
(50, 4, 4),
(51, 4, 5),
(52, 4, 6),
(53, 4, 7),
(54, 4, 8),
(55, 4, 9),
(56, 4, 10),
(57, 4, 11),
(58, 4, 12),
(59, 4, 13),
(60, 4, 15),
(61, 4, 84),
(62, 4, 105),
(63, 4, 156),
(64, 4, 166),
(65, 4, 167),
(66, 4, 169),
(67, 4, 170),
(68, 4, 171),
(69, 4, 14),
(70, 4, 16),
(71, 4, 17),
(72, 4, 18),
(73, 4, 19),
(74, 4, 20),
(75, 4, 107),
(76, 4, 21),
(77, 4, 22),
(78, 4, 23),
(79, 4, 24),
(80, 4, 155),
(81, 4, 173),
(82, 4, 174),
(83, 4, 175),
(84, 4, 25),
(85, 4, 26),
(86, 4, 27),
(87, 4, 28),
(88, 4, 29),
(89, 4, 106),
(90, 4, 30),
(91, 4, 31),
(92, 4, 32),
(93, 4, 33),
(94, 4, 34),
(95, 4, 35),
(96, 4, 36),
(97, 4, 37),
(98, 4, 38),
(99, 4, 39),
(100, 4, 40),
(101, 4, 41),
(102, 4, 123),
(103, 4, 124),
(104, 4, 125),
(105, 4, 126),
(106, 4, 127),
(107, 4, 42),
(108, 4, 43),
(109, 4, 44),
(110, 4, 45),
(111, 4, 46),
(112, 4, 47),
(113, 4, 48),
(114, 4, 49),
(115, 4, 50),
(116, 4, 51),
(117, 4, 52),
(118, 4, 53),
(119, 4, 54),
(120, 4, 55),
(121, 4, 56),
(122, 4, 57),
(123, 4, 59),
(124, 4, 60),
(125, 4, 61),
(126, 4, 62),
(127, 4, 63),
(128, 4, 64),
(129, 4, 65),
(130, 4, 66),
(131, 4, 67),
(132, 4, 68),
(133, 4, 69),
(134, 4, 70),
(135, 4, 71),
(136, 4, 72),
(137, 4, 73),
(138, 4, 74),
(139, 4, 75),
(140, 4, 76),
(141, 4, 77),
(142, 4, 78),
(143, 4, 79),
(144, 4, 80),
(145, 4, 81),
(146, 4, 82),
(147, 4, 83),
(148, 4, 108),
(149, 4, 109),
(150, 4, 110),
(151, 4, 112),
(152, 4, 113),
(153, 4, 114),
(154, 4, 115),
(155, 4, 116),
(156, 4, 117),
(157, 4, 152),
(158, 4, 118),
(159, 4, 119),
(160, 4, 120),
(161, 4, 121),
(162, 4, 122),
(163, 4, 153),
(164, 4, 129),
(165, 4, 130),
(166, 4, 131),
(167, 4, 132),
(168, 4, 133),
(169, 4, 134),
(170, 4, 135),
(171, 4, 136),
(172, 4, 137),
(173, 4, 138),
(174, 4, 139),
(175, 4, 140),
(176, 4, 141),
(177, 4, 142),
(178, 4, 143),
(179, 4, 144),
(180, 4, 145),
(181, 4, 146),
(182, 4, 147),
(183, 4, 148),
(184, 4, 149),
(185, 4, 150),
(186, 4, 157),
(187, 4, 158),
(188, 4, 159),
(189, 4, 160),
(190, 4, 161),
(191, 4, 162),
(192, 4, 163),
(193, 4, 164),
(194, 4, 165),
(195, 4, 172),
(196, 4, 176),
(197, 4, 178),
(198, 4, 179),
(199, 4, 180),
(200, 4, 177),
(201, 4, 181),
(202, 4, 182),
(203, 4, 183),
(204, 5, 1),
(205, 5, 21),
(206, 5, 22),
(207, 5, 23),
(208, 5, 24),
(209, 5, 155),
(210, 5, 173),
(211, 5, 174),
(212, 5, 175);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `header_setting` tinyint(1) NOT NULL DEFAULT '0',
  `address` text NOT NULL,
  `contact` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_format` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `mark_out_time` time NOT NULL,
  `invoice_no` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `name`, `image`, `header_setting`, `address`, `contact`, `email`, `employee_id`, `date_format`, `timezone`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `mark_out_time`, `invoice_no`) VALUES
(1, 'AOMS', 'GECC.png', 1, 'Caracas', '+58(212)242.62.11', 'soporte@gecc.com.ve', 0, 'm/d/y', 'America/Caracas', 'smtp.gmail.com', 'scammarano@gmail.com', '13308720sc', '465', '00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `due_date` date NOT NULL,
  `progress` varchar(255) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `case_id`, `priority`, `due_date`, `progress`, `created_by`) VALUES
(1, 'tarea marianella hacia martha', '', 0, 1, '2017-07-31', '0', 4),
(2, 'tarea creada por salvat asignada a marinella low', '', 1, 1, '2017-08-03', '0', 6),
(3, 'tarea creada por salvat asignada a martha low ticket 1 - nombre', '<p>tarea creada por salvat asignada a martha low ticket 1 - desc</p>', 1, 3, '2017-08-03', '0', 6),
(4, 'prueba2', '<p>prueba 2, high asignado a martha por salvatore</p>', 5, 2, '2017-07-01', '0', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_assigned`
--

CREATE TABLE `task_assigned` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `task_assigned`
--

INSERT INTO `task_assigned` (`user_id`, `task_id`) VALUES
(3, 1),
(3, 4),
(4, 4),
(3, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `comment_by` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax`
--

CREATE TABLE `tax` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `to_do_list`
--

CREATE TABLE `to_do_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `to_do_list`
--

INSERT INTO `to_do_list` (`id`, `title`, `description`, `date`, `is_view`) VALUES
(1, 'cosas q hacer marianella', 'prueba', '2017-07-30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `user_role` int(10) NOT NULL,
  `user_type` int(10) NOT NULL,
  `token` varchar(255) NOT NULL,
  `client_case_alert` int(10) NOT NULL DEFAULT '1',
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation_id` int(10) UNSIGNED NOT NULL,
  `joining_date` date NOT NULL,
  `joining_salary` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `employee_id`, `name`, `image`, `username`, `password`, `gender`, `dob`, `email`, `contact`, `address`, `user_role`, `user_type`, `token`, `client_case_alert`, `department_id`, `designation_id`, `joining_date`, `joining_salary`, `status`) VALUES
(1, 0, 'Administrador', '', 'admin', '07b9ef4762aaa5fc88a20c3e27a67c0d6045a018', '', '0000-00-00', 'scammarano@gmail.com', '', '', 1, 0, '', 1, 0, 0, '0000-00-00', '', 1),
(2, 0, 'Il Merletto', '', 'ilmerletto@dmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2017-07-30', 'ilmerletto@dmail.com', '02517131111', '', 2, 0, '', 1, 0, 0, '0000-00-00', '', 1),
(3, 0, 'Martha Morante', '', 'martha.morante@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-08-11', 'martha.morante@benhur.com.ve', '02122426211', '', 3, 0, '', 1, 1, 0, '1985-07-08', '', 1),
(4, 0, 'Marianella Borges', '', 'marianella.borges@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-07-02', 'marianella.borges@ferradini.com.ve', '02517131111', '', 4, 0, '', 1, 5, 13, '0000-00-00', '', 1),
(5, 0, 'Marisol Valderrama', '', 'marisol.valderrama@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-07-03', 'marisol.valderrama@benhur.com.ve', '04143332222', '', 5, 0, '', 1, 1, 0, '2017-06-25', '', 1),
(6, 0, 'Salvatore Cammarano', '', 'salvatore.cammarano@ferradini.com.ve', '9199059a80dcdcb06097784f63c22d70383104ad', 'Male', '1978-12-06', 'salvatore.cammarano@ferradini.com.ve', '04143238051', '', 4, 0, '', 1, 1, 7, '0000-00-00', '', 1),
(7, 0, 'Edith Lopez', '', 'edilopsa25@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Female', '2017-03-25', 'edilopsa25@gmail.com', '04129065321', '', 1, 0, '', 1, 3, 0, '0000-00-00', '', 1),
(8, 0, 'Eglee Heredia', '', 'eglee.heredia@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '1968-01-16', 'eglee.heredia@benhur.com.ve', '04242705713', '', 5, 0, '', 1, 1, 0, '0000-00-00', '', 1),
(9, 0, 'Rony Gomez', '', 'rony.gomez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2017-07-14', 'rony.gomez@ferradini.com.ve', '04143332222', '', 3, 0, '', 1, 1, 0, '0000-00-00', '', 1),
(10, 0, 'Cesar Aponte', '', 'cesar.aponte@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '1977-07-30', 'cesar.aponte@benhur.com.ve', '04128233794', '', 5, 0, '', 1, 1, 22, '0000-00-00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `id` int(9) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Admin Have All Rights'),
(2, 'Clients', 'Clients Have Default Permission'),
(3, 'Usuario Restringido', 'Usuario Restringido'),
(4, 'Usuario igual q Admin', 'Usuario Con Privilegios'),
(5, 'Recepcion', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `acts`
--
ALTER TABLE `acts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `archived_cases`
--
ALTER TABLE `archived_cases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canned_messages`
--
ALTER TABLE `canned_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `case_categories`
--
ALTER TABLE `case_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `case_stages`
--
ALTER TABLE `case_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `case_study`
--
ALTER TABLE `case_study`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contact_categories`
--
ALTER TABLE `contact_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `court_categories`
--
ALTER TABLE `court_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `depts`
--
ALTER TABLE `depts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dept_categories`
--
ALTER TABLE `dept_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `extended_case`
--
ALTER TABLE `extended_case`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loc_categories`
--
ALTER TABLE `loc_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_case_study_attachments`
--
ALTER TABLE `rel_case_study_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_department_designation`
--
ALTER TABLE `rel_department_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_document_files`
--
ALTER TABLE `rel_document_files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_form_custom_fields`
--
ALTER TABLE `rel_form_custom_fields`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indices de la tabla `rel_role_action`
--
ALTER TABLE `rel_role_action`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `to_do_list`
--
ALTER TABLE `to_do_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT de la tabla `acts`
--
ALTER TABLE `acts`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `archived_cases`
--
ALTER TABLE `archived_cases`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `canned_messages`
--
ALTER TABLE `canned_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `case_categories`
--
ALTER TABLE `case_categories`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `case_stages`
--
ALTER TABLE `case_stages`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `case_study`
--
ALTER TABLE `case_study`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1027;
--
-- AUTO_INCREMENT de la tabla `contact_categories`
--
ALTER TABLE `contact_categories`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `courts`
--
ALTER TABLE `courts`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `court_categories`
--
ALTER TABLE `court_categories`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `days`
--
ALTER TABLE `days`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `depts`
--
ALTER TABLE `depts`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `dept_categories`
--
ALTER TABLE `dept_categories`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `extended_case`
--
ALTER TABLE `extended_case`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `loc_categories`
--
ALTER TABLE `loc_categories`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `months`
--
ALTER TABLE `months`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_case_study_attachments`
--
ALTER TABLE `rel_case_study_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_department_designation`
--
ALTER TABLE `rel_department_designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `rel_document_files`
--
ALTER TABLE `rel_document_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `rel_form_custom_fields`
--
ALTER TABLE `rel_form_custom_fields`
  MODIFY `custom_field_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_role_action`
--
ALTER TABLE `rel_role_action`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `to_do_list`
--
ALTER TABLE `to_do_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
