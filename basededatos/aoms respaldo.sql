/*
Navicat MySQL Data Transfer

Source Server         : webserver
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : aoms

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2017-10-26 22:54:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for --depts
-- ----------------------------
DROP TABLE IF EXISTS `--depts`;
CREATE TABLE `--depts` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location_id` int(9) unsigned NOT NULL,
  `dept_category_id` int(9) unsigned NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of --depts
-- ----------------------------
INSERT INTO `--depts` VALUES ('3', 'Factura Proveedor', '0', '1', '');
INSERT INTO `--depts` VALUES ('5', 'Recepción Documentos', '0', '1', '');
INSERT INTO `--depts` VALUES ('6', 'Factura Beneficio Guardería', '0', '2', '');
INSERT INTO `--depts` VALUES ('7', 'Duda o Reclamo en Nómina', '0', '2', '');
INSERT INTO `--depts` VALUES ('8', 'Caja Chica', '0', '1', '');

-- ----------------------------
-- Table structure for --dept_categories
-- ----------------------------
DROP TABLE IF EXISTS `--dept_categories`;
CREATE TABLE `--dept_categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of --dept_categories
-- ----------------------------
INSERT INTO `--dept_categories` VALUES ('1', 'Administración');
INSERT INTO `--dept_categories` VALUES ('2', 'Recursos Humanos');
INSERT INTO `--dept_categories` VALUES ('3', 'Sistemas');
INSERT INTO `--dept_categories` VALUES ('4', 'Mantenimiento');
INSERT INTO `--dept_categories` VALUES ('5', 'Comercial');
INSERT INTO `--dept_categories` VALUES ('6', 'Logística');
INSERT INTO `--dept_categories` VALUES ('7', 'Producción');
INSERT INTO `--dept_categories` VALUES ('9', 'Soporte Técnico');

-- ----------------------------
-- Table structure for actions
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `always_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `alias` varchar(255) NOT NULL,
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0',
  `is_module` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES ('1', 'login', '0', '1', 'Authentication', '0', '0');
INSERT INTO `actions` VALUES ('2', 'login', '1', '1', 'Login', '0', '0');
INSERT INTO `actions` VALUES ('3', 'logout', '1', '1', 'Logout', '0', '0');
INSERT INTO `actions` VALUES ('4', 'cases', '0', '0', 'Casos', '0', '0');
INSERT INTO `actions` VALUES ('5', 'add', '4', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('6', 'edit', '4', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('7', 'view_case', '4', '0', 'View Case', '0', '0');
INSERT INTO `actions` VALUES ('8', 'fees', '4', '0', 'Fees', '0', '0');
INSERT INTO `actions` VALUES ('9', 'archived', '4', '0', 'Archived', '0', '0');
INSERT INTO `actions` VALUES ('10', 'starred_cases', '4', '0', 'Starred Cases', '0', '0');
INSERT INTO `actions` VALUES ('11', 'archived_cases', '4', '0', 'Archived Cases', '0', '0');
INSERT INTO `actions` VALUES ('12', 'view_archived_case', '4', '0', 'View Archived Case', '0', '0');
INSERT INTO `actions` VALUES ('13', 'restore', '4', '0', 'Restore', '0', '0');
INSERT INTO `actions` VALUES ('14', 'reports', '0', '0', 'Reports', '0', '0');
INSERT INTO `actions` VALUES ('15', 'message', '0', '0', 'Message', '0', '0');
INSERT INTO `actions` VALUES ('16', 'to_do_list', '0', '0', 'To Do List', '0', '0');
INSERT INTO `actions` VALUES ('17', 'add', '16', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('18', 'edit', '16', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('19', 'view_to_do', '16', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('20', 'delete', '16', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('21', 'contacts', '0', '0', 'Contactos', '0', '0');
INSERT INTO `actions` VALUES ('22', 'add', '21', '0', 'Agregar', '0', '0');
INSERT INTO `actions` VALUES ('23', 'edit', '21', '0', 'Editar', '0', '0');
INSERT INTO `actions` VALUES ('24', 'delete', '21', '0', 'Borrar', '0', '0');
INSERT INTO `actions` VALUES ('25', 'appointments', '0', '0', 'Citas', '0', '0');
INSERT INTO `actions` VALUES ('26', 'add', '25', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('27', 'edit', '25', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('28', 'delete', '25', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('29', 'view_appointment', '25', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('30', 'custom_fields', '0', '0', 'Custom Fields', '0', '0');
INSERT INTO `actions` VALUES ('31', 'delete', '30', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('32', 'clients', '0', '0', 'Clients', '0', '0');
INSERT INTO `actions` VALUES ('33', 'add', '32', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('34', 'edit', '32', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('35', 'delete', '32', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('36', 'view_client', '32', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('37', 'employees', '0', '0', 'Employees', '0', '0');
INSERT INTO `actions` VALUES ('38', 'add', '37', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('39', 'edit', '37', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('40', 'delete', '37', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('41', 'view', '37', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('42', 'user_role', '0', '0', 'User Role', '0', '0');
INSERT INTO `actions` VALUES ('43', 'add', '42', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('44', 'edit', '42', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('45', 'delete', '42', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('46', 'departments', '0', '0', 'Departments', '0', '0');
INSERT INTO `actions` VALUES ('47', 'add', '46', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('48', 'edit', '46', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('49', 'delete', '46', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('50', 'permissions', '0', '0', 'Permissions', '0', '0');
INSERT INTO `actions` VALUES ('51', 'location', '0', '0', 'Location', '0', '0');
INSERT INTO `actions` VALUES ('52', 'add', '51', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('53', 'edit', '51', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('54', 'delete', '51', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('55', 'case_category', '0', '0', 'Case Category', '0', '0');
INSERT INTO `actions` VALUES ('56', 'add', '55', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('57', 'edit', '55', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('58', 'delete', '57', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('59', 'court_category', '4', '0', 'Court Category', '0', '0');
INSERT INTO `actions` VALUES ('60', 'add', '59', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('61', 'edit', '59', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('62', 'delete', '59', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('63', 'act', '0', '0', 'Act', '0', '0');
INSERT INTO `actions` VALUES ('64', 'add', '63', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('65', 'edit', '63', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('66', 'delete', '63', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('67', 'court', '0', '0', 'Court', '0', '0');
INSERT INTO `actions` VALUES ('68', 'add', '67', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('69', 'edit', '67', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('70', 'delete', '67', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('71', 'case_stage', '0', '0', 'Case Stages', '0', '0');
INSERT INTO `actions` VALUES ('72', 'add', '71', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('73', 'edit', '71', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('74', 'delete', '71', '0', 'Delte', '0', '0');
INSERT INTO `actions` VALUES ('75', 'payment_mode', '0', '0', 'Payment Modes', '0', '0');
INSERT INTO `actions` VALUES ('76', 'add', '75', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('77', 'edit', '75', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('78', 'delete', '75', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('79', 'settings', '0', '0', 'Settings', '0', '0');
INSERT INTO `actions` VALUES ('80', 'notification', '0', '0', 'Notification', '0', '0');
INSERT INTO `actions` VALUES ('81', 'languages', '0', '0', 'Languages', '0', '0');
INSERT INTO `actions` VALUES ('82', 'edit', '81', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('83', 'delete', '81', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('84', 'dates', '4', '0', 'Hearing Date', '0', '0');
INSERT INTO `actions` VALUES ('85', 'get_court_categories', '4', '1', 'get_court_categories', '1', '0');
INSERT INTO `actions` VALUES ('86', 'get_courts', '4', '1', 'get_courts', '1', '0');
INSERT INTO `actions` VALUES ('87', 'get_case_by_client', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('88', 'get_case_by_court', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('89', 'get_case_by_location', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('90', 'get_case_by_case_stage_id', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('91', 'get_case_by_case_filing_date', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('92', 'get_case_by_case_hearing_date', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('93', 'get_case_by_client_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('94', 'get_case_by_court_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('95', 'get_case_by_location_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('96', 'get_case_by_case_stage_id_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('97', 'get_case_by_case_filing_date_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('98', 'get_case_by_case_hearing_date_starred', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('99', 'get_archive_case_by_client', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('100', 'get_archive_case_by_court', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('101', 'get_archive_case_by_location', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('102', 'get_archive_case_by_case_stage_id', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('103', 'get_archive_case_by_case_filing_date', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('104', 'get_archive_case_by_case_hearing_date', '4', '1', '', '1', '0');
INSERT INTO `actions` VALUES ('105', 'view_all', '4', '0', 'Case Alert', '0', '0');
INSERT INTO `actions` VALUES ('106', 'view_all', '25', '0', 'Appointment Alert', '0', '0');
INSERT INTO `actions` VALUES ('107', 'view_all', '16', '0', 'To Do Alert', '0', '0');
INSERT INTO `actions` VALUES ('108', 'invoice', '0', '0', 'Invoice', '0', '0');
INSERT INTO `actions` VALUES ('109', 'mail', '108', '0', 'Mail', '0', '0');
INSERT INTO `actions` VALUES ('110', 'pdf', '108', '0', 'Pdf', '0', '0');
INSERT INTO `actions` VALUES ('111', 'send', '15', '0', 'Send Message', '0', '0');
INSERT INTO `actions` VALUES ('112', 'tasks', '0', '0', 'Tasks', '0', '0');
INSERT INTO `actions` VALUES ('113', 'add', '112', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('114', 'edit', '112', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('115', 'view', '112', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('116', 'delete', '112', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('117', 'comments', '112', '0', 'Comments', '0', '0');
INSERT INTO `actions` VALUES ('118', 'documents', '0', '0', 'Documents', '0', '0');
INSERT INTO `actions` VALUES ('119', 'add', '118', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('120', 'edit', '118', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('121', 'delete', '118', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('122', 'manage', '118', '0', 'Manage', '0', '0');
INSERT INTO `actions` VALUES ('123', 'bank_details', '37', '0', 'Bank Details', '0', '0');
INSERT INTO `actions` VALUES ('124', 'add_bank_details', '37', '0', 'Add Bank Details', '0', '0');
INSERT INTO `actions` VALUES ('125', 'delete_bank_details', '37', '0', 'Delete Bank Details', '0', '0');
INSERT INTO `actions` VALUES ('126', 'documents', '37', '0', 'Documents', '0', '0');
INSERT INTO `actions` VALUES ('127', 'delete_document', '37', '0', 'Delete Documents', '0', '0');
INSERT INTO `actions` VALUES ('128', 'download', '118', '1', 'Download', '1', '0');
INSERT INTO `actions` VALUES ('129', 'attendance', '0', '0', 'Attendance', '0', '0');
INSERT INTO `actions` VALUES ('130', 'leave_notification', '129', '0', 'Leave Notification', '0', '0');
INSERT INTO `actions` VALUES ('131', 'update_leave', '129', '0', 'Pending /Approve Leave', '0', '0');
INSERT INTO `actions` VALUES ('132', 'delete_leave', '129', '0', 'Delete Leave', '0', '0');
INSERT INTO `actions` VALUES ('133', 'mark_in', '129', '0', 'Mark In', '0', '0');
INSERT INTO `actions` VALUES ('134', 'mark_out', '129', '0', 'Mark Out', '0', '0');
INSERT INTO `actions` VALUES ('135', 'my_attendance', '129', '0', 'My Attendance', '0', '0');
INSERT INTO `actions` VALUES ('136', 'my_leaves', '129', '0', 'My Leaves', '0', '0');
INSERT INTO `actions` VALUES ('137', 'apply_leave', '129', '0', 'Apply Leave', '0', '0');
INSERT INTO `actions` VALUES ('138', 'delete_my_leave', '129', '0', 'Delete My Leave', '0', '0');
INSERT INTO `actions` VALUES ('139', 'leave_types', '0', '0', 'Leave Types', '0', '0');
INSERT INTO `actions` VALUES ('140', 'add', '139', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('141', 'edit', '139', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('142', 'delete', '139', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('143', 'holidays', '0', '0', 'Holidays', '0', '0');
INSERT INTO `actions` VALUES ('144', 'add', '143', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('145', 'delete', '143', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('146', 'notice', '0', '0', 'Notice', '0', '0');
INSERT INTO `actions` VALUES ('147', 'add', '146', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('148', 'edit', '146', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('149', 'Delete', '146', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('150', 'view', '146', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('151', 'switch_language', '81', '1', 'Change Language', '1', '0');
INSERT INTO `actions` VALUES ('152', 'my_tasks', '112', '0', 'My Tasks', '0', '0');
INSERT INTO `actions` VALUES ('153', 'delete_document', '118', '0', 'My Delete DOcument', '0', '0');
INSERT INTO `actions` VALUES ('154', 'get_degi', '37', '1', 'Get Employees Degination By Ajax', '1', '0');
INSERT INTO `actions` VALUES ('155', 'view', '21', '0', 'Consultar', '0', '0');
INSERT INTO `actions` VALUES ('156', 'notes', '4', '0', 'Notes', '0', '0');
INSERT INTO `actions` VALUES ('157', 'tax', '0', '0', 'Tax', '0', '0');
INSERT INTO `actions` VALUES ('158', 'add', '157', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('159', 'edit', '157', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('160', 'delete', '157', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('161', 'case_study', '0', '0', 'Case Study', '0', '0');
INSERT INTO `actions` VALUES ('162', 'add', '161', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('163', 'edit', '161', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('164', 'delete', '161', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('165', 'view', '161', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('166', 'delete_fees', '4', '0', 'Delete Fees', '0', '0');
INSERT INTO `actions` VALUES ('167', 'view_receipt', '4', '0', 'View Receipt', '0', '0');
INSERT INTO `actions` VALUES ('168', 'print_receipt', '4', '1', 'Print Receipt', '1', '0');
INSERT INTO `actions` VALUES ('169', 'delete_receipt', '4', '0', 'Delete Receipt', '0', '0');
INSERT INTO `actions` VALUES ('170', 'dates_detail', '4', '0', 'View Case Extended Date Details', '0', '0');
INSERT INTO `actions` VALUES ('171', 'delete_history', '4', '0', 'Delete Case Extended Dates', '0', '0');
INSERT INTO `actions` VALUES ('172', 'attachments', '161', '0', 'Attachments', '0', '0');
INSERT INTO `actions` VALUES ('173', 'export', '21', '0', 'Exportar', '0', '0');
INSERT INTO `actions` VALUES ('174', 'import', '21', '0', 'Importar', '0', '0');
INSERT INTO `actions` VALUES ('175', 'add_category', '21', '0', 'Agregar Categoria', '0', '0');
INSERT INTO `actions` VALUES ('176', 'dept', '0', '0', 'dept', '0', '0');
INSERT INTO `actions` VALUES ('177', 'dept_category', '0', '0', 'dept_category', '0', '0');
INSERT INTO `actions` VALUES ('178', 'add', '176', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('179', 'edit', '176', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('180', 'delete', '176', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('181', 'add', '177', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('182', 'edit', '177', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('183', 'delete', '177', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('184', 'select', '21', '0', 'Seleccionar', '0', '0');
INSERT INTO `actions` VALUES ('185', 'show_removed', '112', '0', 'Mostrar Eliminados', '0', '0');
INSERT INTO `actions` VALUES ('186', 'open_completed', '112', '0', 'Abrir Culminadas', '0', '0');
INSERT INTO `actions` VALUES ('187', 'commentsOnly', '112', '1', 'commentsOnly', '1', '0');
INSERT INTO `actions` VALUES ('188', 'select', '112', '0', 'Seleccionar', '0', '0');
INSERT INTO `actions` VALUES ('189', 'empresas', '37', '0', 'Ver Empresas donde trabaja', '0', '0');
INSERT INTO `actions` VALUES ('190', 'deletecompany', '37', '0', 'Eliminar Empresa', '0', '0');
INSERT INTO `actions` VALUES ('191', 'addcompany', '37', '0', 'Agregar Empresa a usuario', '0', '0');
INSERT INTO `actions` VALUES ('192', 'editcompany', '37', '0', 'Editar compañia de usuario', '0', '0');
INSERT INTO `actions` VALUES ('193', 'publications', '4', '1', 'Publicaciones en Tickets', '1', '0');
INSERT INTO `actions` VALUES ('194', 'deleteMytask', '112', '0', 'Eliminar Tarea Propia', '0', '0');
INSERT INTO `actions` VALUES ('195', 'cargaempleados', '112', '1', 'Carga de Empleados', '1', '0');
INSERT INTO `actions` VALUES ('196', 'delete', '15', '0', 'Borrar Mensaje', '0', '0');
INSERT INTO `actions` VALUES ('197', 'addcompanyuser', '37', '1', 'addcompanyuser', '1', '0');
INSERT INTO `actions` VALUES ('198', 'addbankuser', '37', '1', 'addbankuser', '1', '0');
INSERT INTO `actions` VALUES ('199', 'get_dept_categories', '4', '1', 'get_dept_categories', '1', '0');
INSERT INTO `actions` VALUES ('200', 'get_depts', '4', '1', 'get_depts', '1', '0');
INSERT INTO `actions` VALUES ('201', 'opciones', '4', '1', 'opciones', '1', '0');
INSERT INTO `actions` VALUES ('202', 'editcompanyuser', '37', '1', 'editcompanyuser', '1', '0');
INSERT INTO `actions` VALUES ('203', 'editbankuser', '37', '1', 'editbankuser', '1', '0');
INSERT INTO `actions` VALUES ('204', 'addcompany2', '37', '1', 'addcompany2', '1', '0');
INSERT INTO `actions` VALUES ('205', 'addbankinterno', '37', '1', 'addbankinterno', '1', '0');
INSERT INTO `actions` VALUES ('206', 'cargos', '37', '1', 'cargos', '1', '0');
INSERT INTO `actions` VALUES ('207', 'companies', '0', '1', 'Companies', '0', '0');
INSERT INTO `actions` VALUES ('208', 'add', '207', '0', 'Agregar Empresa', '0', '0');
INSERT INTO `actions` VALUES ('209', 'edit', '207', '0', 'Editar Empresa', '0', '0');
INSERT INTO `actions` VALUES ('210', 'delete', '207', '0', 'Eliminar Empresa', '0', '0');
INSERT INTO `actions` VALUES ('211', 'view', '207', '0', 'Ver Empresas', '0', '0');
INSERT INTO `actions` VALUES ('212', 'opciones2', '4', '1', 'opciones editar', '1', '0');
INSERT INTO `actions` VALUES ('213', 'deleteFile', '4', '1', 'deleteFile', '1', '0');
INSERT INTO `actions` VALUES ('214', 'add', '219', '0', 'Add', '0', '0');
INSERT INTO `actions` VALUES ('215', 'view', '219', '0', 'View', '0', '0');
INSERT INTO `actions` VALUES ('216', 'edit', '219', '0', 'Edit', '0', '0');
INSERT INTO `actions` VALUES ('217', 'delete', '219', '0', 'Delete', '0', '0');
INSERT INTO `actions` VALUES ('218', 'close', '219', '0', 'Close', '0', '0');
INSERT INTO `actions` VALUES ('219', 'visitors', '0', '0', 'Visitantes', '0', '0');
INSERT INTO `actions` VALUES ('9999', 'TICKET', '0', '0', 'TICKETS', '1', '1');
INSERT INTO `actions` VALUES ('10001', 'deleteField', '55', '1', 'Eliminar Campo', '1', '0');
INSERT INTO `actions` VALUES ('10002', 'addField', '55', '1', 'Agregar Campo', '1', '0');
INSERT INTO `actions` VALUES ('10003', 'aditionalField', '55', '1', 'Agregar Campos Adicionales', '1', '0');
INSERT INTO `actions` VALUES ('10005', 'addaditional', '55', '1', 'Siguiente Paso Agregar Categoria', '1', '0');

-- ----------------------------
-- Table structure for acts
-- ----------------------------
DROP TABLE IF EXISTS `acts`;
CREATE TABLE `acts` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acts
-- ----------------------------

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contact_id` int(9) unsigned NOT NULL,
  `motive` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `notes` text NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointments
-- ----------------------------

-- ----------------------------
-- Table structure for archived_cases
-- ----------------------------
DROP TABLE IF EXISTS `archived_cases`;
CREATE TABLE `archived_cases` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `case_id` int(9) unsigned NOT NULL,
  `notes` text NOT NULL,
  `close_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archived_cases
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `mark_in` timestamp NULL DEFAULT NULL,
  `mark_out` timestamp NULL DEFAULT NULL,
  `mark_in_notes` text NOT NULL,
  `mark_out_notes` text NOT NULL,
  `mark_in_ip` varchar(32) NOT NULL,
  `mark_out_ip` varchar(32) NOT NULL,
  `current_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for bank_details
-- ----------------------------
DROP TABLE IF EXISTS `bank_details`;
CREATE TABLE `bank_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ifsc` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_details
-- ----------------------------
INSERT INTO `bank_details` VALUES ('2', '23', 'fh', 'gdfgdfgd', '34dfd', 'dfgfg', '434', '35453453');

-- ----------------------------
-- Table structure for canned_messages
-- ----------------------------
DROP TABLE IF EXISTS `canned_messages`;
CREATE TABLE `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of canned_messages
-- ----------------------------
INSERT INTO `canned_messages` VALUES ('1', '1', 'order', 'Forgot Password Message', 'Password Reset Link at {site_name}!', '<p>Dear {customer_name},</p><p>If you forget your password, on the login page, click the Following link and you can change your account password</p><p>Username - {username}</p><p>{reset_link}</p><p>Thanks,<br>{site_name}</p>');

-- ----------------------------
-- Table structure for cases
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `case_no` varchar(255) NOT NULL,
  `client_id` int(9) unsigned NOT NULL,
  `location_id` int(9) unsigned NOT NULL,
  `court_id` int(9) unsigned NOT NULL,
  `court_category_id` int(9) unsigned NOT NULL,
  `case_category_id` text NOT NULL,
  `case_stage_id` int(10) unsigned NOT NULL,
  `act_id` text NOT NULL,
  `description` text NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `due_date` varchar(50) DEFAULT NULL,
  `o_lawyer` varchar(32) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `is_starred` int(11) NOT NULL DEFAULT '0',
  `is_archived` int(11) NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `progress` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `empresa_id` varchar(1000) NOT NULL,
  `departamento_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `fechacaja` varchar(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `numfactura` int(11) NOT NULL,
  `sistema` varchar(255) NOT NULL,
  `periodo` varchar(255) NOT NULL,
  `prioridad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('9', 'SUC 03-TAMANACO - 18-10-2017 - Editando1', 'LOGI-0001', '0', '0', '0', '0', '7', '0', 'false', '<p>Probando</p>', '2017-10-18 22:26:33', '2017-10-24', '', '0.00', '0', '0', '', '0', '14', '17', '4', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('10', 'Caja Chica del Mes - Suc: 020-003 - Período: 2017-101', 'ADMN-00010', '0', '0', '0', '0', '1', '0', 'false', '<p>wegfweag</p>', '2017-10-19 09:02:01', '', '', '0.00', '0', '0', '', '0', '6', '17', '1', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('11', 'Factura de Compra Mercancía - Prov: J-00041093-33 - Factura: J-00041093-32', 'ADMN-00011', '0', '0', '0', '0', '2', '0', 'false', '', '2017-10-19 09:18:57', '', '', '0.00', '0', '0', '', '0', '6', '22', '1', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('12', 'Factura de Compra Mercancía - Prov: J-00041093-3 - Factura: campo.2', 'ADMN-00012', '0', '0', '0', '0', '2', '0', 'false', '', '19-10-2017 21:05:54', '', '', '0.00', '0', '0', '', '0', '6', '18', '1', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('13', 'Ticket para notificar Factura/Recibo de Condominio - 2017-10', 'ADMN-00013', '0', '0', '0', '0', '5', '0', 'false', '<p>kjwbecjbejbñjQWD</p>', '19-10-2017 21:34:02', '', '', '0.00', '0', '0', '', '0', '4', '21', '1', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('14', 'Dotación de Uniformes - Suc.: 020-004 - Período: campo.5', 'COME-00014', '0', '0', '0', '0', '3', '0', 'false', '', '19-10-2017 21:54:05', '', '', '0.00', '0', '0', '', '0', '6', '18', '5', '1', '', '', '0', '', '', '1');
INSERT INTO `cases` VALUES ('15', 'Reposición de Insumos - Suc.: 020-008 - Período: campo.3', 'LOGI-00015', '0', '0', '0', '0', '4', '0', 'false', '', '19-10-2017 21:57:22', '', '', '0.00', '0', '0', '', '0', '6', '22', '4', '1', '', '', '0', '', '', '1');

-- ----------------------------
-- Table structure for case_categories
-- ----------------------------
DROP TABLE IF EXISTS `case_categories`;
CREATE TABLE `case_categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) unsigned NOT NULL,
  `title_format` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_categories
-- ----------------------------
INSERT INTO `case_categories` VALUES ('1', 'Caja Chica del Mes', '1', 'category.name - Suc.: empresa.code - Período: campo.1');
INSERT INTO `case_categories` VALUES ('2', 'Factura de Compra Mercancía', '1', 'Factura de Compra Mercancía - Prov: campo.3 - Factura: campo.2');
INSERT INTO `case_categories` VALUES ('3', 'Dotación de Uniformes', '5', 'category.name - Suc.: empresa.code - Período: campo.5');
INSERT INTO `case_categories` VALUES ('4', 'Reposición de Insumos', '4', 'category.name - Suc.: empresa.code - Período: campo.3');
INSERT INTO `case_categories` VALUES ('5', 'Factura/Recibo de Condominio', '1', null);
INSERT INTO `case_categories` VALUES ('6', 'Factura Guardería', '2', null);
INSERT INTO `case_categories` VALUES ('7', 'Prueba titulo dinamico', '4', 'empresa.name - fecha.now - campo.1');

-- ----------------------------
-- Table structure for case_publications
-- ----------------------------
DROP TABLE IF EXISTS `case_publications`;
CREATE TABLE `case_publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(2000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_time` date NOT NULL,
  `case_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_publications
-- ----------------------------

-- ----------------------------
-- Table structure for case_stages
-- ----------------------------
DROP TABLE IF EXISTS `case_stages`;
CREATE TABLE `case_stages` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_stages
-- ----------------------------
INSERT INTO `case_stages` VALUES ('1', 'Apertura Ticket');
INSERT INTO `case_stages` VALUES ('2', 'Ticket Recibido por Departamento Correspondiente');
INSERT INTO `case_stages` VALUES ('3', 'Ticket No Tiene Solución');
INSERT INTO `case_stages` VALUES ('4', 'Cierre Ticket');

-- ----------------------------
-- Table structure for case_study
-- ----------------------------
DROP TABLE IF EXISTS `case_study`;
CREATE TABLE `case_study` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `case_categories` text NOT NULL,
  `notes` text NOT NULL,
  `result` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_study
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
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
  `department` varchar(255) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('6', 'ACOSTA', '', '0', '', '0244-447-99-42', '0', '0414-477-77-54', '0', 'LEGAL', 'CASO MARACAY', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('7', '  ', '', '0', '', '0212-762-04-02', '0', '0212-762-04-03', '0', 'OTROS', 'KING GRAFIT', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('9', 'MORA', '', '0', '', '0212-232-52-34', '0414-120-42-42', '0416-930-89-01', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('12', 'ADAN  GUEVARA', '', '0', '', '0212-345-00-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('13', 'AIDA  FERRER', '', '0', '', '0212-693-27-61', '0', '0414-326-14-27', '0212-362-19-97', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('14', 'DRA. ALASKA MOSCATO', '0212-953-52-22', '', '', '0212-953-52-22', '0', '0414-114-82-54', '0', 'ABOGADOS', 'ESCRITORIO JURIDICO', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('16', 'ALBA  TORRES', '', '0', '', '0212-409-01-12', '0', '0212-409-02-06', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('17', 'ALBERTO MARTIN\'S', '', '0', '', '0212-383-30-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('18', 'ALBERTO CILBEIRA', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('19', 'ALBERTO ', '', '0', '', '0414-934-76-80', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('20', 'ALEJANDRO PLANAS', '', '0', '', '0412-932-18-40', '0', '0', '0', 'PROVEEDOR', 'FUGUET & ASOCIADOS', 'ESCRITORIO JURIDICO', '0');
INSERT INTO `contacts` VALUES ('21', 'ALEJANDRO DANESI', '', '0', '', '0212-381-06-46', '0', '0212-381-18-58', '0212-381-07-80', 'PROVEEDOR', 'VIMAR DE VZLA', 'MATERIALES ELECTRICOS', '0');
INSERT INTO `contacts` VALUES ('23', 'ALEMNA MOGOLLON', '', '0', '', '0416-417-52-20', '0', '0', '0', 'CONDOMINIO', '0', '0', '0');
INSERT INTO `contacts` VALUES ('24', 'ALEMNA  MOGOLLON', '', '0', '', '0212-242-79-41', '0', '0', '0', 'CONDOMINIO', 'CONDOMINIO EDIFICIO CUARZO', 'CONSERJERIA', '0');
INSERT INTO `contacts` VALUES ('25', 'ALESSANDRO  CIARAVELLA', '', '0', '', '0212-243-71-91', '0412-335-37-18', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('26', 'ALEX ', '', '0', '', '0416-715-49-86', '0', '0212-671-14-30', '0', 'PROVEEDOR', 'PARTICULAR', 'MANTENIMIENTO FILTRO', '0');
INSERT INTO `contacts` VALUES ('27', 'ALEX YEPEZ', '', '0', '', '0212-241-96-09', '0', '0416-623-31-61', '0416-819-95-07', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('28', 'ALEXANDER SANABRIA', '', '0', '', '0412-559-70-61', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('29', 'ALFONSO ROSSI', '', '0', '', '0212-552-61-98', '0', '0212-551-28-71', '0212-562-63-00', 'CALZADOS', 'CALZADOS ROSSI', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('30', 'ALI  FERRER', '', '0', '', '0212-753-99-72', '0', '0416-622-30-90', '0412-320-57-21', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('31', 'AMADA YANEZ', '', '0', '', '0416-819-51-99', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('32', 'AMELIA  DE CIARAVELLA', '', '0', '', '0212-242-47-14', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('33', 'AMERICO ', '', '0', '', '0212-871-21-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('34', 'ANA MEDINA', '', '0', '', '0212-615-82-09', '0416-905-28-44', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('36', 'ANA ROTONDO', '', '0', '', '0212-234-13-75', '0', '0414-032-95-61', '0', 'PROVEEDOR', 'DISEÑOS ARES BAG, C.A.', 'CARTERAS', '0');
INSERT INTO `contacts` VALUES ('37', 'ANA VIEIRA', '', '0', '', '0212-234-45-12', '0', '0212-237-75-29', '0', 'PROVEEDOR', 'IMPRESO MULTIPRINT', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('38', 'ANA DUARTE', '', '0', '', '0212-204-72-34', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('39', 'ANA ', '', '0', '', '0295-264-15-94', '0295-264-12-89', '0', '0', 'PROVEEDOR', 'MRW (PORLAMAR)', 'SERVICIOS DE MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('40', 'ANA VIEIRA', '', '0', '', '0212-234-45-12', '0', '0', '0', 'PROVEEDOR', 'MULTI PRINT', 'ETIQUETAS', '0');
INSERT INTO `contacts` VALUES ('41', 'ANA DE FERRER', '', '0', '', '0414-214-28-83', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('42', 'ANA OCANDO', '', '0', '', '0412-205-21-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('45', 'ANGEL BARRERA', '', '0', '', '0416-711-46-70', '0414-322-85-66', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'CENTRAL TELEFONICA', '0');
INSERT INTO `contacts` VALUES ('49', 'ANGELA  SANCHEZ', '', '0', '', '0416-715-21-48', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('50', 'ANGELINA MEZZACAPO', '', '0', '', '0416-623-78-15', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('52', 'ANTHONY MILLAN', '', '0', '', '0412-596-97-46', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('54', 'ANTHONY FIGUEROA', '', '0', '', '0212-361-16-20', '0', '0412-712-79-13', '0', 'EMPLEADOS', 'GRUPO FERRADINI, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('55', 'ANTONIO LEON', '', '0', '', '0414-122-91-59', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('57', 'ANTONIO ', '', '0', '', '0212-471-00-85', '0', '0212-471-24-24', '0212-471-30-82', 'PROVEEDORES', 'GRAFIPLAST', 'BOLSAS DE CALZADOS', '0');
INSERT INTO `contacts` VALUES ('58', 'ANTONIO TIMBI', '', '0', '', '0212-992-40-11', '0212-992-49-21', '0212-992-40-21', '0', 'PROVEEDORES', 'GRAPHIPLAST', 'BOLSAS DE CALZADOS', '0');
INSERT INTO `contacts` VALUES ('59', 'ANTONIO ', '', '0', '', '0416-640-59-88', '0', '0', '0', 'OTROS', 'GRUPO TEMESIS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('60', 'ANTONIO GONZALEZ', '', '0', '', '0414-180-96-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'ELECTRICIDAD', '0');
INSERT INTO `contacts` VALUES ('62', 'APARICIO ', '', '0', '', '0212-561-67-46', '0', '0412-713-60-29', '0', 'PROVEEDORES', 'CORPORACION TRIVEN', 'FLEJES', '0');
INSERT INTO `contacts` VALUES ('63', 'AQUILES ARANGULO', '', '0', '', '0416-701-01-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('64', 'ARELIS ', '', '0', '', '0294-989-72-22', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('65', 'ARGENIDA QUINTERO', '', '0', '', '0426-100-00-51', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('66', 'ARGENIS ', '', '0', '', '0412-543-07-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('67', 'ARISTIDES  RIVERO', '', '0', '', '0212-206-56-38', '0', '0', '0', 'PROVEEDOR', 'SODEXHO PASS DE VENEZUELA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('68', 'ARMANDO FERNANDEZ', '', '0', '', '0212-243-70-93', '0212-241-44-16', '0212-241-42-42', '0212-241-56-25', 'OTROS', 'PARTICULAR', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('69', 'ARMANDO MARQUEZ', '', '0', '', '0212-551-66-94', '0', '0416-411-32-65', '0', 'ENTE PUBLICO', 'PREFECTURA CANDELARIA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('70', 'ARNETA ', '', '0', '', '0212-872-59-45', '0', '0', '0', 'OTROS', 'SUPRIDORES PALERMO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('71', 'ARVELO MARIN', '', '0', '', '0212-239-66-10', '0', '0412-209-32-47', '0412-615-55-51', 'ENTES PUBLICOS', 'I.N.C.E.', 'APRENDICES', '0');
INSERT INTO `contacts` VALUES ('72', 'ARVELO MARIN', '', '0', '', '0412-717-30-16', '0', '0', '0', 'ENTE PUBLICO', 'I.N.C.E.', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('74', 'ASCARY ', '', '0', '', '0212-782-33-65', '0', '0212-782-55-07', '0', 'PROVEEDOR', 'LOGISTICA SISTEMAS', 'COMPUTACION', '0');
INSERT INTO `contacts` VALUES ('75', 'ASDRUBAL  CASTILLO', '', '0', '', '0212-762-82-81', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('76', 'BACHET ', '', '0', '', '0416-802-30-49', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('77', 'BEATRIZ ', '', '0', '', '0212-561-94-11', '0', '0', '0', 'PROVEEDOR', 'CARBONERA DEL CARIBE', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('78', 'BEATRIZ ', '', '0', '', '0212-243-10-95', '0', '0', '0', 'PROVEEDORES', 'M.D.S.', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('79', 'BEATRIZ ', '', '0', '', '0212-243-10-95', '0212-243-05-86', '0424-217-62-70', '0', 'PROVEEDOR', 'M.D.S.', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('80', 'BELEN MORGADO', '', '0', '', '0212-573-08-88', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('82', 'BENANCIO MILLAN', '', '0', '', '0', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('83', 'BERNARDO ', '', '0', '', '0212-363-34-91', '0', '0416-204-16-04', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('84', 'BERTHA MAMA DE BENANCIO', '', '0', '', '0416-833-83-66', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('85', 'BETSI  CASTRO', '', '0', '', '0414-934-75-26', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('86', 'BILL DAY', '', '0', '', '0414-305-87-62', '0', '0', '0', 'PROVEEDORES', 'BILL DAY', 'FOTOGRAFO', '0');
INSERT INTO `contacts` VALUES ('87', 'BOADA ', '', '0', '', '0212-561-49-66', '0416-729-39-09', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('88', 'BRIGIDA SAGGIOMO', '', '0', '', '0414-264-27-68', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('90', 'BRUNO ', '', '0', '', '0', '0039-0226225634', '0039-0924882227', '0039-0924922154', 'PROVEEDOR', 'SPLENDORPLAST', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('91', 'CAMILO  PAZ', '', '0', '', '0416-828-89-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('92', 'CARLA DANESI', '', '0', '', '0212-241-47-27', '0', '0', '0', 'PROVEEDOR', 'WHITE CASTLE, C.A.', 'OBSEQUIOS ', '0');
INSERT INTO `contacts` VALUES ('93', 'CARLOS BORRERO', '', '0', '', '0416-806-49-34', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('94', 'CARLOS ', '', '0', '', '0212-237-38-35', '0', '0', '0', 'PROVEEDOR', 'H.C IMPRESIONES', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('95', 'CARLOS ', '', '0', '', '0212-782-33-65', '0', '0', '0', 'PROVEEDORES', 'LOGICA', 'INFORMATICA', '0');
INSERT INTO `contacts` VALUES ('96', 'CARLOS CARDENAS', '', '0', '', '0424-109-38-01', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('97', 'CARLOS GIL', '', '0', '', '0426-914-20-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('98', 'CARLOS KIOSKO', '', '0', '', '0424-127-17-31', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('99', 'CARLOS OBELMEJIAS', '', '0', '', '0414-282-48-65', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'RESCARVEN', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('101', 'CARLOS  LEON', '', '0', '', '0212-543-28-55', '0', '0424-131-73-75', '0414-321-61-35', 'ENTES PRIVADOS', 'FETRA CALZADO', 'SINDICATOS', '0');
INSERT INTO `contacts` VALUES ('102', 'CARLOS  VARGAS', '', '0', '', '0212-578-13-57', '0', '0412-233-036', '0', 'PROVEEDORES', 'IMPRESORAS FORMACO', 'PAPELERIA', '0');
INSERT INTO `contacts` VALUES ('104', 'CARLOS  ARCHE', '', '0', '', '0212-782-33-65', '0416-429-63-57', '0', '0', 'PROVEEDOR', 'LOGICA SISTEMAS ', 'SISTEMAS', '0');
INSERT INTO `contacts` VALUES ('105', 'CARLOS  SEQUERA', '', '0', '', '0416-708-09-75', '0', '0', '0', 'PROVEEDORES', 'OFICINA MECANICA SEQUERA', 'REP.MAQUINARIAS', '0');
INSERT INTO `contacts` VALUES ('106', 'CARLOS  ', '', '0', '', '0416-408-02-70', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('107', 'CARLOS   AVELIS', '', '0', '', '0414-255-30-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('108', 'CARLOS ANDRES ', '', '0', '', '0212-782-33-65', '0', '0', '0', 'PROVEEDOR', 'LOGICA', 'COMPUTACION', '0');
INSERT INTO `contacts` VALUES ('109', 'CARMELO CAMMARANO', '', '0', '', '0414-129-29-92', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('110', 'CARMELO CAMMARANO', '', '0', '', '0212-242-62-48', '0', '0414-129-29-92', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('111', 'CARMEN RODRIGUEZ', '', '0', '', '0212-893-16-74', '0426-808-57-57', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('112', 'CARMEN MARTINEZ', '', '0', '', '0426-811-94-31', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('113', 'CARMEN  MARTINEZ', '', '0', '', '0416-810-20-97', '0', '0', '0', 'PROVEEDORES', 'DISEÑOS KM21', 'BATAS', '0');
INSERT INTO `contacts` VALUES ('114', 'CARMEN  BERMUDEZ', '', '0', '', '0416-399-51-06', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('115', 'CARMEN  MOLINA', '', '0', '', '0212-285-23-31', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('116', 'CARO EVELYN ', '', '0', '', '0212-257-28-90', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('117', 'CAROLINA ', '', '0', '', '0412-380-83-40', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('118', 'CAROLINA  FLORES', '', '0', '', '0412-583-00-75', '0', '0412-800-18-23', '0412-336-19-28', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('119', 'CASTOR FRAGOZA', '', '0', '', '0416-830-11-66', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('120', 'CELSO SANCHEZ', '', '0', '', '0212-368-85-69', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('121', 'CESAR APONTE', '', '0', '', '0412-823-37-94', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('130', 'CHINA EVELISA', '', '0', '', '0416-615-45-68', '0', '0', '0', 'ENTE PUBLICO', 'MINISTERIO DEL AMBIENTE', 'OFICIN', '0');
INSERT INTO `contacts` VALUES ('131', 'CHISTINA CHIQUILLO', '', '0', '', '0212-640-63-06', '0426-914-14-55', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('136', 'CIRA  SALAZAR', '', '0', '', '0295-415-55-98', '0', '0295-261-96-75', '0295-261-96-78', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('137', 'CIRO VALENTE', '', '0', '', '0212-871-37-30', '0', '0', '0', 'PROVEEDOR', 'HORMAS CIMA', 'HORMAS', '0');
INSERT INTO `contacts` VALUES ('139', 'CLARA TRESPALACIOS', '', '0', '', '0416-821-57-71', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('141', 'COLINA ', '', '0', '', '0416-543-66-01', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TALLER', '0');
INSERT INTO `contacts` VALUES ('142', 'COROMOTO HIDALGO', '0212-953-73-96', 'coromoto.hidalgo@ferradini.com.ve', '', '0212-953-73-96', '0', '0212-952-11-61', '0', '[\"17\",\"51\"]', 'GRUPO FERRADINI, C.A.', '', '0');
INSERT INTO `contacts` VALUES ('143', 'COROMOTO  HIDALGO', '', '0', '', '0212-258-18-21', '0', '0416-720-56-21', '0', 'EMPLEADOS', 'GRUPO FERRADINI, C.A.', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('144', 'CRISTIAN BELLANCA', '', '0', '', '0414-232-01-87', '0', '0212-241-61-15', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA BELLANCA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('145', 'CRISTINA  CHIQUILLO', '', '0', '', '0416-011-65-21', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('146', 'CRISTINA  CARDENAS', '', '0', '', '0416-613-01-60', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'RRHH', '0');
INSERT INTO `contacts` VALUES ('147', 'CRUZ MARCANO', '', '0', '', '0295-414-71-62', '0416-292-31-06', '0416-896-88-82', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('148', 'CRUZ (MARICUCHA) MARCANO', '', '0', '', '0416-896-88-82', '0', '0', '0', 'LEGALES', 'PARTICULAR', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('149', 'DAMARI ', '', '0', '', '0424-179-46-81', '0', '0212-915-02-95', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('150', 'DAMASO FONSECA', '', '0', '', '0212-782-08-78', '0', '0', '0', 'ENTES PUBLICOS', 'OCEI', 'GESTOR', '0');
INSERT INTO `contacts` VALUES ('151', 'DAMELIS ', '', '0', '', '0416-609-65-89', '0', '0', '0', 'ENTES PUBLICOS', 'ALCALDIA SUCRE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('152', 'DAMELIS OCHOA', '', '0', '', '0412-596-50-79', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('154', 'DANTE  CANTIERI', '', '0', '', '0212-731-31-46', '0', '0212-238-58-57', '0212-574-14-22', 'PROVEEDOR', 'CORRETAJE CANTIERI', 'POLIZAS', '0');
INSERT INTO `contacts` VALUES ('155', 'DAVID ', '', '0', '', '0212-263-25-28', '0', '0', '0', 'OTROS', 'DISPLAY', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('156', 'DAVID ', '', '0', '', '0212-241-09-12', '0212-241-26-92', '0', '0', 'PROVEEDOR', 'MASTER CAUCHO', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('157', 'DAVID BAUTE ', '', '0', '', '0212-834-31-99', '0', '0412-800-95-92', '0', 'OTROS', 'PARTICULAR', 'HERRERIA', '0');
INSERT INTO `contacts` VALUES ('158', 'DAYARI ', '', '0', '', '0212-762-04-02', '0', '0212-762-04-03', '0', 'OTROS', 'ALFOMBRAS KING GRAPHIS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('159', 'DELFIN NUÑEZ', '', '0', '', '0212-861-88-08', '0', '0414-249-22-36', '0424-152-94-90', 'SINDICATOS', 'SINDICATO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('160', 'DIANA ', '', '0', '', '0212-953-75-13', '0', '0', '0', 'PROVEEDOR', 'AIR MUNDO, C.A.', 'AGENCIA DE VIAJES', '0');
INSERT INTO `contacts` VALUES ('161', 'DIANA ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('162', 'DILIA ', '', '0', '', '0212-029-43-31', '0', '0212-029-90-03', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('163', 'DIMAS ESCOBAR', '', '0', '', '0212-415-46-40', '0', '0414-245-04-43', '0414-184-71-72', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('164', 'DOMENICO  ', '', '0', '', '0412-361-33-62', '0', '0', '0', 'CALZADOS', 'FIANDACA', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('166', 'DONATTO ', '', '0', '', '0212-241-68-71', '0', '0212-243-59-89', '0', 'PROVEEDOR', 'TALLER DONATTO', 'REPARACION DE VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('167', 'DORIS ', '', '0', '', '0212-271-57-46', '0', '0', '0', 'PROVEEDOR', 'PANADERIA PANDORO', 'PANADERIA', '0');
INSERT INTO `contacts` VALUES ('168', 'DORIS ', '', '0', '', '0273-569-73-78', '0', '0414-569-73-78', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('169', 'DORLIS MENDOZA', '', '0', '', '0424-223-03-36', '0', '0212-816-63-72', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('171', 'DOUGLAS ROMERO', '', '0', '', '0412-363-62-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('172', 'DOUGLAS ROMERO', '', '0', '', '0412-363-62-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('174', 'EDGAR  CUADRA', '0414-319-34-70', '0', '', '0414-319-34-70', '0', '0', '0', '[\"20\"]', 'COUTENYE', '', '0');
INSERT INTO `contacts` VALUES ('175', 'EDGAR  VELASQUEZ', '', '0', '', '0414-187-16-69', '0', '0414-312-08-09', '0412-724-04-08', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'SINDICATOS', '0');
INSERT INTO `contacts` VALUES ('176', 'EDITH LOPEZ', '', '0', '', '0412-906-53-21', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'SISTEMAS', '0');
INSERT INTO `contacts` VALUES ('177', 'EDUAR MILLAN', '', '0', '', '0412-726-67-91', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('178', 'EDUARDO CASUES', '', '0', '', '0412-233-01-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('179', 'EDWAR SANCHEZ', '', '0', '', '0424-135-82-50', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'SERVICIOS DE MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('180', 'EDWAR ', '', '0', '', '0424-118-17-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SERVICIO DE MOTOTAXI', '0');
INSERT INTO `contacts` VALUES ('181', 'EDWARD MILLAN', '', '0', '', '0414-239-24-89', '0412-726-67-91', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('182', 'EFRAIN PEROZO', '', '0', '', '0414-326-15-04', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('183', 'EFRAIN PERAZO', '', '0', '', '0414-326-15-04', '0', '0412-54-28-03', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'SINDICATOS', '0');
INSERT INTO `contacts` VALUES ('184', 'EILYN MARTINEZ', '', '0', '', '0414-329-34-68', '0', '0412-731-49-56', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('185', 'EILYN ', '', '0', '', '0424-225-75-79', '0', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD', '0');
INSERT INTO `contacts` VALUES ('186', 'EL CHIVI ', '', '0', '', '0212-297-73-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('187', 'ELBA  PALACIOS', '', '0', '', '0212-633-47-38', '0', '0212-633-41-45', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('188', 'ELENA DAMASO', '', '0', '', '0212-504-01-88', '0', '0416-705-29-91', '0', 'PROVEEDOR', 'CAVEGUIAS', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('189', 'ELEXI ARCILA', '', 'EVENTOS@FESTEJOSVENEZUELA.COM.VE', '', '0212-238-70-74', '0212-239-11-40', '0', '0', 'PROVEEDOR', 'FESTEJOS DE VENEZUELA', 'FESTEJOS', '0');
INSERT INTO `contacts` VALUES ('190', 'ELIAS LOREN', '', '0', '', '0273-533-27-48', '0', '0', '0', 'CLIENTES', 'ZAPATOS BARINAS', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('191', 'ELIECER SANCHEZ', '', '0', '', '0424-225-75-97', '0', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD', '0');
INSERT INTO `contacts` VALUES ('192', 'ELIEZER SANCHEZ', '', '0', '', '0212-693-66-27', '0', '0424-225-75-97', '0', 'PROVEEDOR', 'VIPESA', 'CONTABLE', '0');
INSERT INTO `contacts` VALUES ('193', 'ELIO GOMEZ', '', '0', '', '0416-428-03-54', '0', '0', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('194', 'ELIO  QUARENTE', '', '0', '', '0416-622-23-830', '0', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('195', 'ELISA TORRE', '', '0', '', '0414-307-52-66', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('196', 'ELSA MILLAN', '', '0', '', '0412-953-79-39', '0412-351-01-26', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('197', 'EMIGDIO TERAN', '', '0', '', '0212-322-24-48', '0', '0414-242-55-09', '0', 'OTROS', 'CORPOELEC', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('198', 'ENDER SANCHEZ', '', '0', '', '0212-244-35-96', '0424-221-48-06', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('199', 'ENRIQUE MARCANO', '', '0', '', '0414-245-53-81', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('200', 'ENRRIQUE PLANCHARD', '', '0', '', '0412-562-46-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('201', 'ENRRIQUE  SEGUERA', '', '0', '', '0416-708-09-75', '0', '0', '0', 'PROVEEDORES', 'EMEPI', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('202', 'ERAZO ', '', '0', '', '0414-637-83-06', '0', '0', '0', 'OTROS', 'PARTICULAR', 'PAR', '0');
INSERT INTO `contacts` VALUES ('203', 'ERIKA MAIGUA', '', '0', '', '0426-215-09-22', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('204', 'ESPERANZA ', '', '0', '', '0212-243-23-45', '0', '0', '0', 'CONDOMINIO', 'EDIFICIO DAOUD', 'CONSERJERIA', '0');
INSERT INTO `contacts` VALUES ('205', 'ESPERANZA FARFAN', '', '0', '', '0212-672-13-24', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('206', 'EUCLIDES  ESTABA', '', '0', '', '0295-291-36-81', '0', '0416-326-81-67', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('207', 'EVANGELINA BERNOTTI', '', '0', '', '0212-257-96-65', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('208', 'FABIO  MENICUCHI', '', '0', '', '0412-319-17-32', '0', '0', '0', 'OTROS', 'PARTICULAR', 'DISEÑOS', '0');
INSERT INTO `contacts` VALUES ('209', 'FANNY ', '', '0', '', '0414-758-17-92', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('210', 'FAUSTO ', '', '0', '', '0212-234-92-98', '0', '0', '0', 'PROVEEDORES', 'CLAVIFER', 'CLAVOS Y TACHUELAS', '0');
INSERT INTO `contacts` VALUES ('211', 'FELICIA INFANTE', '', '0', '', '0212-361-98-14', '0', '0414-288-05-00', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('212', 'FELIPE ESPOSO MELIANNE', '', '0', '', '0412-716-82-20', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA MOSCATO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('213', 'FELIX EDUARDO', '', '0', '', '0286-717-43-58', '0', '0412-700-62-48', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('214', 'FERNANDO ', '', '0', '', '0212-235-82-10', '0', '0', '0', 'PROVEEDOR', 'HORMAS CAMER', 'HORMAS', '0');
INSERT INTO `contacts` VALUES ('215', 'FERNANDO ', '', '0', '', '0412-912-28-02', '0', '0212-232-09-61', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('216', 'FINA ', '', '0', '', '0212-730-74-80', '0212-731-25-26', '0', '0', 'PROVEEDOR', 'TALLE DOFI', 'MECANICA Y LATONERIA', '0');
INSERT INTO `contacts` VALUES ('217', 'FIORELLA ', '', '0', '', '0039-038-169-08', '0039-038-691-48', '0', '0', 'PROVEEDOR', 'FINA', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('218', 'FLANKLIN  AGUIAR', '', '0', '', '0416-725-09-29', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('219', 'FLOR TORRES', '', '0', '', '0414-333-11-41', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('220', 'FRANCA CHULDA', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('221', 'FRANCA  CONSENTINO', '', '0', '', '0212-993-75-16', '0', '0212-991-78-79', '0414-277-59-30', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('222', 'FRANCIA PATIÑO', '', '0', '', '0212-242-24-05', '0416-400-26-86', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('223', 'FRANCIA  PATIÑO', '', '0', '', '0416-400-26-86', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO', '0');
INSERT INTO `contacts` VALUES ('224', 'FRANCIA DE DE GALLO', '', '0', '', '0212-241-62-61', '0', '0414-121-43-13', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('225', 'FRANCIS DIAZ', '', '0', '', '0212-241-27-95', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA LOS JARDINES', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('226', 'FRANCISCA ', '', '0', '', '0426-606-41-83', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO', '0');
INSERT INTO `contacts` VALUES ('227', 'FRANCISCO ', '', '0', '', '0212-237-02-08', '0', '0212-235-82-14', '0', 'PROVEEDOR', 'COMPUPLACE', 'EQUIPOS', '0');
INSERT INTO `contacts` VALUES ('229', 'FRANCISCO NAVARRO', '', '0', '', '0416-420-74-05', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('230', 'FRANCISCO GUEVARA', '', '0', '', '0414-155-39-63', '0', '0', '0', 'SINDICATOS', 'SINDICATO DE CALZADO', 'SINDICATOS', '0');
INSERT INTO `contacts` VALUES ('231', 'FRANCO VALERI', '', '0', '', '0414-247-18-32', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('232', 'FRANCO ', '', '0', '', '0414-250-89-85', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('233', 'FRANKLIN MARQUEZ', '', '0', '', '0414-123-73-99', '0', '0', '0', 'PROVEEDOR', 'CORPORACION M.P.S., C.A.', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('234', 'FRANKLIN  FERNANDEZ', '', '0', '', '0414-258-13-82', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('235', 'FREDDY PRATO', '', '0', '', '0416-914-38-24', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBRERO', '0');
INSERT INTO `contacts` VALUES ('237', 'FUGUET ', '', '0', '', '0212-234-76-77', '0', '0212-234-80-79', '0', 'PROVEEDOR', 'FUGUET ALBA & ASOCIADOS', 'SERV.LEGALES', '0');
INSERT INTO `contacts` VALUES ('238', 'GABRIEL ALVAREZ', '', '0', '', '0212-263-64-29', '0', '0212-262-19-40', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('239', 'GABRIEL  SANCHEZ', '0414-120-21-56', '0', '', '0414-120-21-56', '0412-901-01-02', '0', '0', '[\"17\"]', 'CONSTRUCTORA FAGAS', 'CONSTRUCCION', '0');
INSERT INTO `contacts` VALUES ('240', 'GABRIEL  ', '', '0', '', '0412-371-62-10', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS LIMPIEZA', '0');
INSERT INTO `contacts` VALUES ('241', 'GADEA ', '', '0', '', '0426-889-52-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('242', 'GENERAL ', '', '0', '', '0212-242-18-11', '0', '0', '0', 'PROVEEDOR', 'MAKRO', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('243', 'GENIDELE GONZALEZ', '', '0', '', '0212-503-15-38', '0', '0212-503-15-32', '0212-503-16-32', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('244', 'GENILEYDI GONZALEZ', '', '0', '', '0212-503-15-07', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('245', 'GERARDO LUCAS', '', '0', '', '0212-242-91-36', '0', '0', '0', 'PROVEEDOR', 'LUCAS CONSULTORES', '0', '0');
INSERT INTO `contacts` VALUES ('246', 'GERENTE ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('248', 'GERMAN PAREDES', '', '0', '', '0212-945-21-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('249', 'GERMAN SANTIAGO', '', '0', '', '0212-241-35-89', '0416-208-79-58', '0', '0', 'OTROS ', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('250', 'GERSON ', '', '0', '', '0212-503-10-63', '0', '0', '0', 'BANCOS', 'BANCO  MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('251', 'GINEIDA ', '', '0', '', '0416-895-30-77', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('252', 'GIOCONDA ', '', '0', '', '0212-243-85-54', '0', '0', '0', 'PROVEEDOR', 'TENERIA BISONTE', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('253', 'GIOMAR RAMIREZ', '', '0', '', '0212-200-94-52', '0', '0', '0', 'OTROS', 'MOVISTAR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('255', 'GIOVANNY  SALAZAR', '', '0', '', '0212-503-36-78', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('256', 'GLADIS JARDIN', '', '0', '', '0212-552-83-09', '0', '0212-571-19-57', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('258', 'GLESIA ', '', '0', '', '0426-405-16-63', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('259', 'GLORIA LA CRUZ', '', '0', '', '0414-245-7836', '0', '0416-607-72-27', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('260', 'GLORIA BECERRA', '', '0', '', '0416-607-72-27', '0', '0', '0', 'CONTRATADOS', 'VIPESA', 'CONTABLE', '0');
INSERT INTO `contacts` VALUES ('261', 'GODOFREDO LEON', '', '0', '', '0412-795-99-41', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('262', 'GONZALO ', '', '0', '', '0416-701-73-52', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('263', 'GRACIELA(HER.JULIO) ', '', '0', '', '0414-104-42-40', '0', '0416-406-90-97', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('264', 'GRANDA ', '', '0', '', '0212-286-48-81', '0414-318-78-05', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('265', 'GRISELDA ', '', '0', '', '0212-564-26-70', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('266', 'GUILLERMINA ', '', '0', '', '0414-410-55-60', '0', '0', '0', 'LEGAL', 'PARTICULAR', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('267', 'GUILLERMO MILLAN', '', '0', '', '0212-259-10-42', '0', '0416-995-80-11', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('268', 'GUILLERMO ALCALA', '', '0', '', '0416-620-68-08', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('269', 'GUILLERMO ALCALA', '', '0', '', '0416-620-68-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TRAMITES LABORALES', '0');
INSERT INTO `contacts` VALUES ('270', 'GUSTAVO ', '', '0', '', '0414-274-61-20', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TALLER', '0');
INSERT INTO `contacts` VALUES ('271', 'GUSTAVO BONILLA', '', '0', '', '0416-904-27-73', '0', '0', '0', 'PROVEEDOR', 'PASTEUR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('272', 'HANY ', '', '0', '', '0414-319-02-91', '0', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL TRABAJO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('273', 'HAYDEE RODRIGUEZ', '', '0', '', '0212-515-71-18', '0', '0414-013-73-92', '0426-913-93-16', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('274', 'HECTOR ACOSTA', '', '0', '', '0412-958-12-97', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('275', 'HECTOR ', '', '0', '', '0412-239-06-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('276', 'HENRY PEÑALVER', '', '0', '', '0212-234-77-31', '0212-762-13-59', '0212-762-4351', '0416-701-58-08', 'PROVEEDOR', 'CAJAS FUERTES SB', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('277', 'HENRY FERRER', '', '0', '', '0212-365-06-86', '0', '0212-362-77-41', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('278', 'HENRY PERDOMO', '', '0', '', '0414-250-94-37', '0', '0416-', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('279', 'HENRY MARCANO', '', '0', '', '0414-330-62-73', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('280', 'HENRY PEÑALVER', '', '0', '', '0212-234-77-31', '0416-701-58-08', '0', '0', 'OTROS', 'PARTICULAR ', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('281', 'HERNAN CABALLERO', '', '0', '', '0212-885-16-08', '0426-908-90-82', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('282', 'HERRY FERRER', '', '0', '', '0212-365-06-86', '0', '0212-362-77-41', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('283', 'HETERINA MONTAÑO', '', '0', '', '0426-431-49-30', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('284', 'HUMBERTO ', '', '0', '', '0412-992-30-43', '0', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'SIFONES DE CERVEZA', '0');
INSERT INTO `contacts` VALUES ('285', 'IDA VALENTINA', '', '0', '', '0212-975-09-20', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('286', 'IGNACIO MOTA', '', '0', '', '0212-239-93-57', '0', '0212-235-62-69', '0414-307-31-70', 'PROVEEDORES', 'TENERIA VRB C.A', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('287', 'IMELDA ESCORCHE', '', '0', '', '0212-368-90-71', '0416-708-24-24', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('288', 'INGRID ARRIETA', '', '0', '', '0212-243-29-76', '0426-717-00-36', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('289', 'IRENE ANTELIZ', '', '0', '', '0212-671-38-48', '0426-220-67-31', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('290', 'IRMA OSES', '', '0', '', '0414-243-01-35', '0', '0212-363-30-36', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('291', 'ISABEL Y/O NELSON RODRIGUEZ ', '', '0', '', '0212-501-38-27', '0', '0212-501-35-08', '0212-501-32-85', 'BANCOS', 'BANCO DE VENEZUELA', 'FIDEICOMISO', '0');
INSERT INTO `contacts` VALUES ('292', 'ISMAEL PADRON', '', '0', '', '0424-214-83-88', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('293', 'ISRAEL  CAMACHO', '', '0', '', '0414-537-80-18', '0', '0412-912-81-48', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('294', 'IVAN MORALES', '', '0', '', '0416-729-86-41', '0', '0426-910-05-36', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('296', 'IVAN  GARMENDIA', '', '0', '', '0212-985-70-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('299', 'JACOBO ', '', '0', '', '0414-252-18-58', '0', '0', '0', 'CALZADOS', 'SEBAGO', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('300', 'JAIME RODRIGUEZ', '', '0', '', '0295-262-97-55', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('301', 'JAIRO CARREÑO', '', '0', '', '0414-189-95-85', '0', '0', '0', 'OTROS', 'PARTICULAR', 'TRAUMATOLOGO', '0');
INSERT INTO `contacts` VALUES ('302', 'JANETH SALAZAR', '', '0', '', '0', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('303', 'JASURI LINDO', '', '0', '', '0424-153-87-63', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SALUD Y SEGURIDAD LABORAL', '0');
INSERT INTO `contacts` VALUES ('305', 'JEAN CARLOS', '', '0', '', '0414-025-26-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('306', 'JEAN FRANCO', '', '0', '', '0412-204-58-62', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('307', 'JELITZA VEGA', '', '0', '', '0424-494-51-00', '0', '0', '0', 'ENTES PUBLICOS', 'NOTARIA DE BARUTA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('308', 'JENNIOR MENDEZ', '', 'jennior_1@hotmail.com', '', '0212-600-82-04', '0', '0412-814-26-39', '0414-014-21-90', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('309', 'JENNY PERDOMO', '', '0', '', '0414-250-94-37', '0', '0416-610-39-24', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('310', 'JEPE  ', '', '0', '', '0416-623-31-61', '0426-513-25-93', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('311', 'JESSICA MILLAN', '', '0', '', '0412-200-50-43', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('312', 'JESSICA  VASQUEZ', '', '0', '', '0212-620-60-78', '0424-195-80-75', '0', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('313', 'JESUS CANALES', '', '0', '', '0212-241-09-13', '0', '0212-241-67-07', '0212-241-27-95', 'BANCOS', 'BANCO BANESCO LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('314', 'JESUS ESCOBAR', '', '0', '', '0212-266-76-71', '0212-266-93-76', '0', '0', 'PROVEEDOR', 'BARCODE', 'SISTEMAS', '0');
INSERT INTO `contacts` VALUES ('315', 'JESUS GUEVARA', '', '0', '', '0212-315-73-18', '0412-736-86-26', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('316', 'JESUS DIAZ', '', '0', '', '0412-204-30-06', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('317', 'JESUS RODRIGUEZ', '', '0', '', '0212-341-83-79', '0', '0', '0', 'PROVEEDORES', 'FABRICA DE BOLSAS', 'COMPRAS', '0');
INSERT INTO `contacts` VALUES ('318', 'JESUS MILLAN', '', '0', '', '0416-853-87-62', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('319', 'JESUS FERRER', '', '0', '', '0212-816-12-24', '0', '0412-935-85-79', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('320', 'JESUS ESPINOZA', '', '0', '', '0412-711-15-12', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('321', 'JESUS ALONZO', '', '0', '', '0212-471-38-68', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('322', 'JHOAN MORA ', '', '0', '', '0212-267-77-59', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('325', 'JHON SUR', '', '0', '', '0212-571-00-02', '0', '0414-181-10-48', '0', 'OTROS', 'PARTICULAR', 'ACUPUNTURA', '0');
INSERT INTO `contacts` VALUES ('326', 'JHON MAIRI', '', '0', '', '0', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('327', 'JHON  MUÑOZ', '', '0', '', '0414-123-79-42', '0', ' ', '0', 'AG.VIAJES', 'AEROPOSTAL', 'GERENCIA', '0');
INSERT INTO `contacts` VALUES ('328', 'JHON  AUREL', '', '0', '', '0412-952-96-79', '0', '0416-701-58-08', '0', 'PROVEEDORES', 'CREACIONES AUREL, C.A.', 'CINTURONES', '0');
INSERT INTO `contacts` VALUES ('329', 'JHONNY VAAMONDE', '', '0', '', '0414-195-89-45', '0', '0', '0', 'EMPLEADOS', 'CONDOMINIO EDIFICIO CUARZO', 'VIGILANCIA', '0');
INSERT INTO `contacts` VALUES ('330', 'JHONNY ', '', '0', '', '0212-241-96-36', '0', '0212-241-27-24', '0', 'PROVEEDOR', 'CREACIONES AUREL, C.A.', 'COMPRAS', '0');
INSERT INTO `contacts` VALUES ('331', 'JHONNY ', '', '0', '', '0212-242-57-21', '0', '0', '0', 'PROVEEDOR', 'LIBRERÍA 44', 'UTILES DE OFICINA', '0');
INSERT INTO `contacts` VALUES ('332', 'JOAN  CAMPOBASO', '', '0', '', '0212-243-71-96', '0', '0412-243-08-60', '0414-243-08-60', 'PROVEEDORES', 'SOLUCIONES INFORMATICAS SOIN, C.A.', 'INFORMATICA', '0');
INSERT INTO `contacts` VALUES ('333', 'JOEL O EDUARDO ', '', '0', '', '0414-531-53-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'COPIADORA', '0');
INSERT INTO `contacts` VALUES ('334', 'JOHANA ', '', '0', '', '0212-284-70-45', '0', '0', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIAS DE VIAJES', '0');
INSERT INTO `contacts` VALUES ('335', 'JOHANA ', '', '0', '', '0212-861-88-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('336', 'JONNY MONTENEGRO', '', '0', '', '0212-542-44-53', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('337', 'JONNY REPUESA', '', '0', '', '0416-729-27-33', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('338', 'JORGE MUSCO', '', '0', '', '0212-243-08-51', '0', '0212-241-21-07', '0414-129-00-70', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('339', 'JORGE ORTEGANO', '', '0', '', '0424-197-19-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('340', 'JORGE LUIS ORTEGANO', '', '0', '', '0212-762-82-81', '0212-361-83-74', '0212-762-90-64', '0414-838-63-28', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('341', 'JORGEL GESENA', '', '0', '', '0212-272-31-80', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('342', 'JORGUE SALAS', '', '0', '', '0412-927-97-84', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('343', 'JOSE CASTRO', '', '0', '', '0416-907-91-84', '0416-831-22-53', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('344', 'JOSE RIVERO', '', '0', '', '0212-341-82-49', '0414-338-65-65', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('345', 'JOSE VASQUEZ', '', '0', '', '0416-246-24-52', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('346', 'JOSE ARRIECHI', '', '0', '', '0212-251-03-56', '0412-567-30-05', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('347', 'JOSE RODRIGUEZ', '', '0', '', '0212-239-76-42', '0', '0414-320-03-53', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('348', 'JOSE BOLIVAR', '', '0', '', '0414-121-22-79', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('349', 'JOSE RODRIGUEZ', '', '0', '', '0414-320-03-53', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('350', 'JOSE VILLEGAS', '', '0', '', '0212-256-58-64', '0', '0414-271-72-21', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('351', 'JOSE MENDOZA', '', '0', '', '0412-219-38-65', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('352', 'JOSE MAVARES', '', '0', '', '0414-255-07-64', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('353', 'JOSE ', '', '0', '', '0414-267-46-59', '0', '0', '0', 'OTROS', 'PARTICULAR', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('354', 'JOSE  VALOIS', '', '0', '', '0412-567-30-05', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('355', 'JOSE ANGEL ', '', '0', '', '0212-883-96-91', '0', '0412-984-96-90', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('356', 'JOSE ANTONIO ', '', '0', '', '0412-611-08-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'COPIADORA', '0');
INSERT INTO `contacts` VALUES ('357', 'JOSE ANTONIO ', '', '0', '', '0212-309-05-65', '0414-309-36-94', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('358', 'JOSE ARIEL MONTES', '', '0', '', '0241-835-99-80', '0', '0', '0', 'PROVEEDORES', 'INDUSTRIAS IMAR', 'MAQUINARIA Y TROQUELES', '0');
INSERT INTO `contacts` VALUES ('359', 'JOSE GREGORIO LOPEZ', '', '0', '', '0414-258-64-10', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('360', 'JOSE MANUEL ANGULO', '', '0', '', '0212-621-61-12', '0414-135-87-05', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('361', 'JOSE MANUEL SOMOZA', '', '0', '', '0251-255-26-20', '0', '0416-816-73-89', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('362', 'JOSEFINA  CAMMARANO', '', '0', '', '0212-693-66-27', '0', '0424-225-75-98', '0', 'PROVEEDOR', 'VIPESA', 'CONTABLE', '0');
INSERT INTO `contacts` VALUES ('363', 'JOSUA NAVARRO', '', '0', '', '0414-344-10-19', '0', '0', '0', 'LEGAL', 'CASO MARACAY', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('365', 'JUAN MANUEL', '', '0', '', '0212-324-53-33', '0', '0414-264-03-82', '0', 'CONTRATADOS', 'CREACIONES BEN-HUR, C.A.', 'CARPINTERIA', '0');
INSERT INTO `contacts` VALUES ('366', 'JUAN CALDERON', '', '0', '', '0212-532-25-78', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('367', 'JUAN OSUNA', '', '0', '', '0212-368-13-63', '0416-393-23-00', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('368', 'JUAN MERCADO', '', '0', '', '0416-824-85-56', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('369', 'JUAN PEREIRA', '', '0', '', '0416-618-68-52', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('370', 'JUAN MUÑOZ', '', '0', '', '0212-428-71-32', '0424-182-13-20', '0', '0', 'PROVEEDOR', 'ECOMAN PUBLICIDAD', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('371', 'JUAN ', '', '0', '', '0416-725-34-66', '0', '0', '0', 'PROVEEDOR', 'IMPRESOS CANAIMA', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('372', 'JUAN RAMIREZ', '', '0', '', '0212-204-72-39', '0', '0', '0', 'PROVEEDOR', 'LEGISLACION ECONOMICA', 'COTIZACION', '0');
INSERT INTO `contacts` VALUES ('373', 'JUAN  ', '', '0', '', '0424-193-74-77', '0414-178-57-53', '0', '0', 'CLIENTE', 'MARDAG', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('374', 'JUAN OJEDA', '', '0', '', '0212-271-91-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('375', 'JUAN ', '', '0', '', '0414-257-93-50', '0', '0212-564-72-58', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('376', 'JUAN DIAZ', '', '0', '', '0416-633-80-78', '0', '0416-620-84-76', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('377', 'JUAN CARLOS', '', '0', '', '0212-762-82-81', '0412-362-86-87', '0', '0', 'OTROS', 'PROSEGUROS', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('379', 'JUAN  MILLAN', '', '0', '', '0212-409-60-08', '0', '0212-409-61-10', '0295-291-39-30', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('380', 'JUAN  ', '', '0', '', '0416-615-26-48', '0', '0', '0', 'PROVEEDORES', 'IMPRESOS CANAIMA', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('381', 'JUAN  MARCANO', '', '0', '', '0414-257-93-50', '0', '0212-564-72-58', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('382', 'JUAN  CARLOS', '', '0', '', '0212-762-82-81', '0', '0212-762-90-64', '0412-362-86-87', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('384', 'JUAN JOSE GARCIA', '', '0', '', '0212-428-87-14', '0424-222-84-93', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('385', 'JUDITH ', '', '0', '', '0212-212-85-78', '0', '0212-212-85-77', '0', 'PROVEEDORES', 'IMPRESORA FORMACO', 'FORMAS CONTINUAS', '0');
INSERT INTO `contacts` VALUES ('386', 'JUDITH ', '', '0', '', '0212-959-51-01', '0412-244-76-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('387', 'JULIA MEDINA', '', '0', '', '0412-383-76-02', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('388', 'JULIO MENDEZ', '', '0', '', '0414-326-69-89', '0', '0212-238-41-73', '0', 'PROVEEDORES', 'MENDEZ & ASOCIADOS', 'CONTABLE', '0');
INSERT INTO `contacts` VALUES ('391', 'JULIO CESAR PERALES', '', '0', '', '0412-720-50-53', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('394', 'KATINA BERNOTTI', '', '0', '', '0212-901-56-31', '0', '0212-901-56-36', '0416-627-58-74', 'FAMILIARES EMPLEADOS', 'FAMILIA MOSCATO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('395', 'KELLY RODRIGUEZ', '', '0', '', '0424-123-17-32', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('398', 'LEIDY COLMENARES', '', '0', '', '0212-620-64-04', '0', '0', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('404', 'LEONARDO MARTINS', '', '0', '', '0416-716-34-00', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('407', 'LEYDA GARCIA', '', '0', '', '0212-342-86-06', '0426-806-17-23', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('408', 'LIBERATTA  MEZZACAPO', '', '0', '', '0416-623-78-15', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('409', 'LIC. RUTH/DORIS ', '', '0', '', '0212-571-49-77', '0', '0212-571-41-02', '0', 'PROVEEDOR', 'CAVECAL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('410', 'LIDIA ', '', '0', '', '0212-830-47-52', '0', '0', '0', 'ENTES PUBLICOS', 'P.T.J.  (GUARENAS)', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('416', 'LOREDANA  DE CIARAVELLA ', '', '0', '', '0212-243-00-85', '0', '0412-929-53-75', '0', 'FAMILIARES SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('417', 'LORENZO MIREYA', '', '0', '', '0251-254-87-93', '0', '0251-254-68-66', '0416-656-26-35', 'CLIENTES', 'INVERSIONES MIRLOR', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('418', 'LUCERO MUÑOZ', '', '0', '', '0275-881-07-22', '0414-758-17-89', '0', '0', 'OTROS', 'PARTICULAR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('419', 'LUCIA ESCULPI', '', '0', '', '0212-241-32-07', '0212-242-56-73', '0', '0', 'PROVEEDOR', 'CORPORACION CAPI', 'UTILES ESCOLARES', '0');
INSERT INTO `contacts` VALUES ('421', 'LUCIO CAMMARANO', '', '0', '', '0414-126-24-35', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'SOCIOS', '0');
INSERT INTO `contacts` VALUES ('422', 'LUIS ROMERO', '0', '0', '', '0', '0', '0', '0', '[\"16\"]', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('423', 'LUIS FIGUEROA', '', '0', '', '0212-361-64-67', '0416-416-62-48', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('424', 'LUIS JIMENEZ', '', '0', '', '0412-589-96-31', '0', '0416-538-38-99', '0', 'PROVEEDOR', 'GLOBAL', 'SISTEMA', '0');
INSERT INTO `contacts` VALUES ('425', 'LUIS ', '', '0', '', '0212-241-73-95', '0', '0', '0', 'MENSAJERIA', 'M.R.W.', 'MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('426', 'LUIS TAPIA', '', '0', '', '0212-631-08-43', '0414-275-02-26', '0', '0', 'PROVEEDOR', 'MARELIS SERVICE', 'MANTENIMIENTO BOMBAS', '0');
INSERT INTO `contacts` VALUES ('430', 'LUIS ', '', '0', '', '0212-256-46-28', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('431', 'LUIS ORTEGANO', '', '0', '', '0424-197-19-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('434', 'LUIS LOPEZ', '', '0', '', '0414-186-74-55', '0', '0', '0', 'PROVEEDOR', 'PRINT L.B.', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('435', 'LUIS ', '', '0', '', '0426-913-10-88', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'CHOFER', '0');
INSERT INTO `contacts` VALUES ('436', 'LUIS ', '', '0', '', '0212-237-49-71', '0', '0', '0', 'PROVEEDOR', 'X-TRAPINT', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('437', 'LUIS  GUEVARA', '', '0', '', '0212-516-23-93', '0414-256-00-84', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('443', 'LUIS (CHINO)  LOPEZ', '', '0', '', '0212-541-09-10', '0', '0424-105-35-57', '0', 'PROVEEDORES', 'PRINT LB', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('444', 'LUISA ESCOBAR', '', '0', '', '0414-301-18-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('445', 'LUISITA ', '', '0', '', '0212-243-08-73', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('447', 'LUZ MARINA ', '', '0', '', '0', '0', '0', '0', 'ENTES PUBLICOS', 'SETRA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('448', 'MADELIN PADRON', '', '0', '', '0212-214-83-88', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('450', 'MAGALY CAMMARAN', '', '0', '', '0212-883-67-24', '0412-553-10-55', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('454', 'MAIGUA HELAINE', '', '0', '', '0414-107-63-62', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('456', 'MANDY  ', '', '0', '', '0414-160-63-87', '0', '0', '0', 'PROVEEDOR', 'VENCANAL', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('457', 'MANUEL DOS SANTOS', '', '0', '', '0412-623-49-29', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('458', 'MARGARITA  GUASAMACURO', '', '0', '', '0212-251-74-52', '0416-214-36-68', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('460', 'MARIA ', '', '0', '', '0276-771-09-86', '0', '0212-771-27-30', '0', 'OTROS', 'CONSULTORIO & ASOCIADOS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('461', 'MARIA GONZALEZ', '', '0', '', '0416-428-38-94', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('463', 'MARIA QUINTERO', '', '0', '', '0212-363-59-58', '0426-715-17-75', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('465', 'MARIA ROJAS', '', '0', '', '0212-915-29-35', '0426-414-57-11', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('466', 'MARIA VASQUEZ', '', '0', '', '0414-321-76-59', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('470', 'MARIA BOSCAN', '', '0', '', '0212-241-88-44', '0', '0', '0', 'PROVEEDOR', 'VEPACOR', '0', '0');
INSERT INTO `contacts` VALUES ('471', 'MARIA ANGELICA ', '', '0', '', '0416-213-78-16', '0', '0', '0', 'ENTES PUBLICOS', 'I.N.C.E.', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('473', 'MARIA ROSA ', '', '0', '', '0212-235-12-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('474', 'MARIANA PEÑA', '', '0', '', '0416-352-50-07', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('477', 'MARIBEL OPORTE', '', '0', '', '0212-793-23-84', '0212-794-19-21', '0', '0', 'PROVEEDOR', 'CARGO MASTER', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('478', 'MARIBEL CALLES', '', '0', '', '0212-408-48-57', '0212-408-48-58', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL AMBIENTE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('481', 'MARINELLI  PASSARELLI', '', '0', '', '0212-576-71-93', '0212-578-09-54', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('482', 'MARIO CENTENO', '', '0', '', '0212-267-02-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('483', 'MARIO DELL', '', 'DELCORSOCA@HOTMAIL.COM', '', '0212-941-19-71', '0212-945-84-97', '0416-622-29-38', '0412-622-29-38', 'PROVEEDOR', 'PASTELERIA EL CORSO', 'PANADERIA Y PASTELERIA', '0');
INSERT INTO `contacts` VALUES ('485', 'MARISOL VALDERRAMA', '', '0', '', '0212-244-32-38', '0414-100-92-63', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('486', 'MARISOL FERNANDEZ', '', '0', '', '0212-959-09-31', '0', '0212-959-10-10', '0', 'EMPRESAS', 'GRUPO FERRADINI (TAMANACO)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('487', 'MARISOL PULIDO', '', '0', '', '0414-263-19-11', '0', '0', '0', 'OTROS', 'PARTICULAR', 'SEGURO SOCIAL', '0');
INSERT INTO `contacts` VALUES ('488', 'MARITZA MILLAN', '', '0', '', '0265-631-88-06', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('490', 'MARLENE ', '', '0', '', '0212-205-06-65', '0', '0212-205-05-37', '0212-620-05-05', 'PROVEEDOR', 'AEROCAV, C.A.', 'TRANSPORTE', '0');
INSERT INTO `contacts` VALUES ('491', 'MARLENE ', '', '0', '', '0212-870-38-34', '0', '0212-870-2403', '0', 'PROVEEDORES', 'CONSORCIO TECNISUELA', 'SUELAS', '0');
INSERT INTO `contacts` VALUES ('492', 'MARLENE ', '', '0', '', '0212-243-84-10', '0416-408-48-41', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('493', 'MARTA MORANTE', '', '0', '', '0416-837-23-04', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('494', 'MARTA OROZCO', '', '0', '', '0416-620-28-30', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('495', 'MARTHA MORANTHE', '', '0', '', '0416-837-23-04', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('496', 'MARTHA LUGAT', '', '0', '', '0212-234-76-77', '0212-234-80-39', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('497', 'MARY ISEA', '', '0', '', '0212-412-15-06', '0', '0414-127-03-76', '0', 'OTROS', 'PARTICULAR', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('498', 'MARYS MEDINA', '', '0', '', '0212-841-80-30', '0412-386-00-10', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('499', 'MAURO ', '', '0', '', '0414-154-60-00', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'TRANSPORTE', '0');
INSERT INTO `contacts` VALUES ('500', 'MAYERLIN ', '', '0', '', '0412-632-75-47', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('501', 'MAYERLING ', '', '0', '', '0412-565-04-70', '0', '0', '0', 'ENTE PUBLICO', 'ALCALDIA ????', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('502', 'MAYERLING ', '', '0', '', '0212-242-24-44', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('503', 'MEDINA ', '', '0', '', '0212-361-35-07', '0416-353-80-04', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('504', 'MELCHORA VELASQUEZ', '', '0', '', '0212-614-35-83', '0424-115-50-93', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('505', 'MELIANNE MOSCATO', '', '0', '', '0212-242-89-16', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA MOSCATO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('506', 'MEYERLIN PEREIRA', '', '0', '', '0212-525-68-62', '0212-525-68-63', '0', '0', 'OTROS', 'SCOTT SEGURIDAD', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('507', 'MICHEL PARTIDAS', '', '0', '', '0412-369-13-87', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('508', 'MIGDALIA ', '', '0', '', '0416-241-04-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('509', 'MIGUEL ', '', '0', '', '0212-693-94-89', '0', '0', '0', 'PROVEEDOR', 'PARTICULAR', 'ASCENSORES', '0');
INSERT INTO `contacts` VALUES ('510', 'MIGUEL  MURILLO', '', '0', '', '0212-264-41-24', '0', '0212-264-56-55', '0212-264-75-30', 'OTROS', 'INVERSUR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('511', 'MIGUEL ANGEL VASQUEZ', '', '0', '', '0416-695-23-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('512', 'MIGUELINA RODRIGUEZ', '', '0', '', '0281-265-95-.89', '0414-542-97-63', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (PLAZA MAYOR)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('513', 'MIGUELINA RODRIGUEZ', '', '0', '', '0281-282-27-30', '0', '0281-282-16-70', '0', 'EMPRESAS', 'GRUPO FERRADINI (PLAZA MAYOR)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('514', 'MILAGROS ', '', '0', '', '0416-195-00-41', 'P', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('515', 'MILENY ', '', '0', '', '0412-200-50-68', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('516', 'MILEYA ', '', '0', '', '0212-690-14-53', '0', '0', '0', 'PROVEEDOR', 'ADMINISTRADORA NAPOLITANO', 'ARRENDAMIENTOS', '0');
INSERT INTO `contacts` VALUES ('517', 'MILTON  FERRARI', '', '0', '', '0416-433-90-27', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('518', 'MILVAR CAMPOS', '', '0', '', '0424-173-73-64', '0412-829-43-51', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('519', 'MIREYA ', '', '0', '', '0212-656-26-35', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('520', 'MIREYA ORTEGA', '', '0', '', '0414-245-51-09', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('521', 'MIRIAN ', '', '0', '', '0414-803-70-37', '0', '0', '0', 'OTROS', 'EMISORA  UNION RADIO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('522', 'MIRIAN CHIARELLI', '', '0', '', '0212-256-51-18', '0414-304-85-27', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('523', 'MIRTHA PAEZ', '', '0', '', '0212-235-52-27', '0212-238-70-74', '0414-133-01-69', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('524', 'MOISES  BENCID', '', '0', '', '0212-241-16-86', '0', '0212-241-09-49', '0', 'OTROS', 'DISTRIBUIDORA.VEGERANO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('525', 'MOLINA ', '', '0', '', '0212-234-12-12', '0212-238-00-58', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('526', 'MORELLA MARQUINA', '', '0', '', '0414-807-56-22', '0', '0', '0', 'CLIENTE', 'MORELA´S C.A', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('528', 'MORELLA  SERRANO', '', '0', '', '0426-907-96-87', '0424-159-04-75', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'OBREROS', '0');
INSERT INTO `contacts` VALUES ('529', 'NADESKA SALAZAR', '', '0', '', '0212-620-64-45', '0', '0212-205-60-00', '0', 'PROVEEDOR', 'D.H.L.', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('530', 'NANCY HEREDIA', '', '0', '', '0212-242-29-53', '0414-207-31-11', '0', '0', 'FAMILIARES  EMPLEADOS', 'FAMILIA EGLEE HEREDIA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('531', 'NARDI PAOLO', '', '0', '', '0212-241-33-61', '0212-241-54-09', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('532', 'NATHACHA ', '', '0', '', '0212-243-71-21', '0', '0', '0', 'FAMILIARES DE SOCIOS', 'FAMILIA CIARAVELLA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('533', 'NEIRO DURAN', '', '0', '', '0416-239-63-61', '0', '0', '0', 'ENTES PUBLICOS', 'INST.NACIONAL ESTADISTICA', 'ESTADISTICAS', '0');
INSERT INTO `contacts` VALUES ('535', 'NELLY  MONCADA', '', '0', '', '0212-632-08-07', '0', '0414-713-08-61', '0', 'BANCOS', 'BANCO DEL TESORO AG. VICTORIA PLAZA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('536', 'NELSON LUGO', '', '0', '', '0212-265-46-78', '0212-614-86-39', '0', '0', 'OTROS', 'LA MIL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('537', 'NELSON ', '', '0', '', '0212-265-46-78', '0', '0', '0', 'PROVEEDOR', 'LAMINADOS LAMIL', 'LAMINADO', '0');
INSERT INTO `contacts` VALUES ('539', 'NELSON PEREZ', '', '0', '', '0212-661-42-15', '0', '0414-328-76-58', '0', 'PROVEEDOR', 'SERCLIMATIC, C.A.', 'MANTENIMIENTO AIRE ACC', '0');
INSERT INTO `contacts` VALUES ('541', 'NERIO VALARINO', '', '0', '', '0416-622-27-88', '0', '0212-241-57-60', '0212-241-98-56', 'MEDICOS Y MEDICINAS', 'PARTICULAR', 'INTERNISTA', '0');
INSERT INTO `contacts` VALUES ('542', 'NESTOR ', '', '0', '', '0212-899-02-66', '0', '0414-288-71-66', '0', 'PROVEEDORES', 'INDUSTRIAS ROPRI', 'CONTRAFUERTES Y CARTON', '0');
INSERT INTO `contacts` VALUES ('543', 'NESTOR NARVAEZ', '', '0', '', '0412-363-02-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('544', 'NESTOR GALINDO', '', '0', '', '0212-344-14-26', '0412-728-04-50', '0212-344-83-96', '0', 'OTROS', 'PARTICULAR', 'SETRA', '0');
INSERT INTO `contacts` VALUES ('545', 'NIKO ', '', '0', '', '0414-311-34-33', '0', '0', '0', 'CALZADOS', 'CALZADOS CERERE', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('546', 'NILDA SILVA', '', '0', '', '0212-580-22-67', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('547', 'NOHELIA ', '', '0', '', '0412-451-95-48', '0412-375-98-70', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (CHACAITO)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('548', 'NORELIS ', '', '0', '', '0212-322-70-23', '0', '0212-321-34-72', '0', 'PROVEEDORES', 'ALFATHEC', 'BOTAS', '0');
INSERT INTO `contacts` VALUES ('549', 'NORENA DELGADO', '', '0', '', '0414-134-90-48', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('550', 'NURIS ESCOBAR', '', '0', '', '0414-280-83-44', '0', '0212-325-11-93', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('552', 'OLIVER NAVAS', '', '0', '', '0416-927-86-78', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('553', 'OLIVER(HIJO DRA. SAIDA) ', '', '0', '', '0414-108-44-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('554', 'OLIVIO PAEZ', '', '0', '', '0212-942-14-21', '0212-835-56-77', '0414-920-69-05', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('555', 'OLMELIS ', '', '0', '', '0414-989-68-40', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('556', 'OMAIRA CAMARAN', '', '0', '', '0212-428-87-14', '0424-268-90-67', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('557', 'OMAR CLEMENTE', '', '0', '', '0212-816-03-80', '0424-280-78-52', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('558', 'ORLANDO MAGDALENO', '', '0', '', '0212-661-36-39', '0212-661-18-68', '0212-241-00-12', '0212-242-33-08', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('559', 'ORLANDO MAGDALENA', '', '0', '', '0414-282-24-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('560', 'OSCAR NIÑO', '', '0', '', '0212-984-45-04', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('561', 'OSCAR PEREZ', '', '0', '', '0416-608-07-64', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('562', 'OSWALDO YANEZ', '', '0', '', '0212-915-60-95', '0416-201-28-36', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('563', 'PABLO ANZOLA', '', '0', '', '0212-290-03-15', '0212-290-00-81', '0412-902-33-88', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('564', 'PAOLO RIGIO', '', '0', '', '0', '0212-503-15-38', '0212-503-18- 30', '0416-609-44-39', 'OTROS', 'BANCO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('566', 'PAULINO CONTRERA', '', '0', '', '0212-241-62-60', '0212-243-51-79', '0414-205-26-96', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('567', 'PAULINO COLMENARES', '', '0', '', '0212-243-51-79', '0414-205-26-96', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('568', 'PAULO PUCCHI', '', '0', '', '0414-023-07-76', '0212-325-49-69', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('569', 'PEDRO TORREALBA', '', '0', '', '0412-724-82-29', '0', '0', '0', 'EMPLEADOS ', 'GRUPO  FERRADINI, C,A,', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('570', 'PEDRO MORET', '', '0', '', '0414-379-42-19', '0', '0', '0', 'ENTES PUBLICOS', 'INSAPSEL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('572', 'PEDRO UZCATEGUI', '', '0', '', '0414-460-54-48', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('573', 'PEDRO CASTRO', '', '0', '', '0212-265-91-89', '0416-707-84-51', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('574', 'PEDRO MORET', '', '0', '', '0212-693-66-27', '0414-379-42-19', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('577', 'PEDRO QUINTERO', '', '0', '', '0414-289-15-57', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('580', 'PIETRO CIARAVELLA', '', '0', '', '0212-242-47-14', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C,A,', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('581', 'PIETRO ', '', '0', '', '0212-872-50-91', '0', '0212-872-35-33', '0', 'PROVEEDOR', 'HORMAS ZIMA', 'HORMAS', '0');
INSERT INTO `contacts` VALUES ('582', 'PINO ', '', '0', '', '0212-263-22-79', '0212-263-83-03', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRICOS  ', 'ELECTRICIDAD', '0');
INSERT INTO `contacts` VALUES ('583', 'PIÑATE ', '', '0', '', '0414-301-18-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('584', 'PITER ', '', '0', '', '0416-904-72-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('585', 'RAFAEL SATURNO', '', '0', '', '0212-237-90-95', '0212-235-19-77', '0', '0', 'PROVEEDOR', 'REPRESENTACIONES SATURNO', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('586', 'RAIMUNDO MOSCATO', '', '0', '', '0212-263-92-71', '0', '0212-267-52-12', '0', 'CALZADOS', 'DIST.ZIG ZAG (SAMBIL)', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('587', 'RAIMUNDO MOSCATO', '', '0', '', '0212-300-87-53', '0', '0212-300-87-54', '0', 'CALZADOS', 'DIST.ZIG ZAG (TOLON)', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('588', 'RAIMUNDO MOSCATO', '', '0', '', '0241-839-05-05', '0', '0424-839-05-04', '0', 'CALZADOS', 'DIST.ZIG ZAG (VALENCIA)', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('589', 'RAIMUNDO MOSCATO', '', '0', '', '0212-267-52-12', '0212-267-92-71', '0', '0', 'OTROS', 'ZIG ZAG SHOES', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('590', 'RAIMUNDO MOSCATO', '', '0', '', '0241-839-05-05', '0', '0', '0', 'CALZADOS', 'ZIG-ZAG (VALENCIA)', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('591', 'RAIMUNDO MOSCATO', '', '0', '', '0416-627-18-13', '0416-817-57-39', '0', '0', 'OTROS', 'ZIGZAG SHOES', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('592', 'RAMON COLMENARES', '', '0', '', '0414-814-69-63', '0416-817-57-39', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('593', 'RAMON OCHOA', '', '0', '', '0416-6-33-28-64', '0', '0', '0', 'PROVEEDOR', 'TECNISERVICIOS', 'REPARACION FOTOCOPIADORAS', '0');
INSERT INTO `contacts` VALUES ('594', 'RAMON  OCHOA', '', '0', '', '0212-239-15-02', '0212-234-08-62', '0', '0', 'PROVEEDOR', 'TECNISERVICIOS', 'REPARACION FOTOCOPIADORAS', '0');
INSERT INTO `contacts` VALUES ('595', 'RAMON  OCHOA', '', '0', '', '0212-239-15-02', '0', '0212-234-08-62', '0416-633-28-64', 'PROVEEDOR', 'TECNISERVICIOS (CANON) ', 'SERV.COPIADORA', '0');
INSERT INTO `contacts` VALUES ('596', 'RANDY ', '', '0', '', '0424-202-58-39', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('597', 'RAUL FLORES', '', '0', '', '0416-926-46-58', '0', '0', '0', 'PROVEEDOR', 'AUROMETAL', 'ADORNOS', '0');
INSERT INTO `contacts` VALUES ('598', 'RAUL ', '', '0', '', '0424-176-64-59', '0414-126-72-51', '0', '0', 'PROVEEDOR', 'AURO-METAL STYLE, C.A.', 'ADORNOS', '0');
INSERT INTO `contacts` VALUES ('599', 'RAUL ', '', '0', '', '0212-234-12-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('600', 'REBECA Y/O JOSE ', '', '0', '', '0212-344-15-21', '0', '0212-344-35-48', '0', 'PROVEEDOR', 'CUEROS RECUTEX', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('601', 'REINA ', '', '0', '', '0212-285-99-09', '0416-406-63-63', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('602', 'REINALDO DORADO', '', '0', '', '0416-620-29-92', '0', '0', '0', 'PROVEEDOR', 'CONSUMIBLES', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('603', 'REINALDO DAES', '', '0', '', '0212-472-10-57', '0212-472-08-51', '0', '0', 'OTROS', 'PARTICULAR', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('604', 'REINALDO HERNANDEZ', '', '0', '', '0212-431-10-82', '0212-432-62-84', '0414-157-56-00', '0', 'OTROS', 'PARTICULAR', 'SISTEMAS', '0');
INSERT INTO `contacts` VALUES ('605', 'RENZO LENZI', '', '0', '', '0414-245-26-41', '0416-609-27-69', '0', '0', 'PROVEEDOR', 'LEATHER TRADE', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('606', 'RICARDA PARRA', '', '0', '', '0414-328-76-58', '0', '0', '0', 'PROVEEDORES', 'SERCLIMATIC, C.A.', 'SERV.AIRE ACONDICIONADO', '0');
INSERT INTO `contacts` VALUES ('607', 'RICARDO  ', '', '0', '', '0416-286-04-88', '0', '0', '0', 'PROVEEDOR', 'ARPITEX', 'TELAS Y FORROS', '0');
INSERT INTO `contacts` VALUES ('608', 'RICARDO ', '', '0', '', '0414-286-04-88', '0', '0', '0', 'PROVEEDOR', 'ARPITEX, C.A.', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('609', 'RICARDO HERRERA', '', '0', '', '0416-412-29-85', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('610', 'RICARDO CABALLERO', '', '0', '', '0212-339-74-36', '0414-911-37-11', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('611', 'RICARDO REQUENA', '', '0', '', '0412-607-94-14', '0', '0', '0', 'OTROS', 'PARTICULAR', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('612', 'RICARDO ', '', '0', '', '0414-299-29-57', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('613', 'RICHARD QUERO', '', '0', '', '0212-334-68-38', '0', '0414-238-57-66', '0', 'PROVEEDOR', 'INVERSIONES COPIRY, C.A.', 'COPIADORA', '0');
INSERT INTO `contacts` VALUES ('614', 'RICHARD QUERO', '', '0', '', '0212-242-92-92', '0212-334-68-33', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('615', 'ROBERT MONTIEL', '', '0', '', '0212-344-07-36', '0416-712-84-00', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('616', 'ROBERT  FEO', '', '0', '', '0212-870-66-72', '0', '0212-870-30-50', '0', 'OTROS', 'MERCOSAN ', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('617', 'ROBERT ARMANDO JIMENEZ', '', '0', '', '0212-472-30-81', '0414-338-53-81', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('619', 'ROBERTO RIGGIO', '', '0', '', '0212-693-68-56', '0', '0212-693-96-30', '0', 'PROVEEDOR', 'ADMINISTRADORA NAPOLITANO, C.A.', 'ARRENDAMIENTO', '0');
INSERT INTO `contacts` VALUES ('620', 'ROBERTO ESPINA', '', '0', '', '0412-206-79-19', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('621', 'RODRIGO MENA', '', '0', '', '0212-543-28-55', '0424-131-73-75', '0', '0', 'SINDICATOS', 'FETRACALZADO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('622', 'RODRIGO MENA', '', '0', '', '0424-131-73-75', '0', '0', '0', 'SINDICATOS', 'FETRACALZADO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('623', 'ROGATO ', '', '0', '', '0212-871-21-17', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('624', 'ROMELIA ', '', '0', '', '0212-915-68-98', '0416-409-11-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('625', 'RONALD PARADA', '', '0', '', '0212-905-90-38', '0', '0', '0', 'OTROS', 'FONDO DE VALORES', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('626', 'RONALD HIJO DE SR. PIETRO', '', '0', '', '0212-872-50-91', '0', '0212-872-35-33', '0', 'PROVEEDOR', 'HORMAS ZIMA', 'HORMAS', '0');
INSERT INTO `contacts` VALUES ('627', 'ROSA MARIA  ', '', '0', '', '0212-949-02-17', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('628', 'ROSALBA ', '', '0', '', '0414-389-36-91', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('629', 'ROSANGELA CAMMARANO', '', '0', '', '0212-243-98-61', '0424-231-79-82', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A.', 'RECURSOS HUMANOS', '0');
INSERT INTO `contacts` VALUES ('630', 'ROSARIO ', '', '0', '', '0416-414-36-11', '0', '0', '0', 'OTROS', 'SERVI', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('631', 'ROSMARY MARQUEZ', '', '0', '', '0424-140-67-80', '0', '0', '0', 'PROVEEDOR', 'CORPORACION ADUANERA M.P.S., C.A.', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('633', 'RUBEN ', '', '0', '', '0416-400-98-08', '0414-244-56-44', '0', '0', 'OTROS', 'PARTICULAR ', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('634', 'RUBEN O ESMERALDA ', '', '0', '', '0212-241-05-65', '0', '0', '0', 'PROVEEDOR', 'MRW', 'SERVICIOS DE MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('635', 'RUBINO ', '', '0', '', '0212-241-22-63', '0', '0', '0', 'PROVEEDORES', 'CLARIVOX', 'ART.ELECTRICIDAD', '0');
INSERT INTO `contacts` VALUES ('636', 'SAIDA ', '', '0', '', '0414-892-61-47', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('637', 'SALVATORE MOSCATO', '', '0', '', '0412-242-80-71', '0212-242-96-89', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('638', 'SALVATORE LA CORTE', '', '0', '', '0212-826-94-15', '0212-861-21-54', '0', '0', 'CONTRATADO', 'CREACIONES BEN-HUR, C.A', 'CARPINTERIA', '0');
INSERT INTO `contacts` VALUES ('639', 'SALVATORE CAMMARANO', '', '0', '', '0414-323-80-51', '0', '0', '0', 'SOCIOS ', 'CREACIONES BEN-HUR, C.A', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('641', 'SAMANTA ', '', '0', '', '0416-432-67-16', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('642', 'SANDRA FLORES', '', '0', '', '0212-705-21-96', '0', '0', '0', 'BANCOS', 'BANCO CITI BANK', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('643', 'SANDRA MAIGUA', '', '0', '', '0414-254-93-21', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('644', 'SERGIO ACOSTA', '', '0', '', '0424-175-78-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('645', 'SERGIO ', '', '0', '', '0212-953-05-79', '0212-953-46-90', '0212-951-29-28', '0', 'OTROS', 'SEGTOTAL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('646', 'SERVITO HERNANDEZ', '', '0', '', '0424-125-48-31', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('647', 'SILVANA MARTINISI', '', '0', '', '0416-622-11-28', '0', '0', '0', 'PROVEEDOR', 'INSUMOS  INTERSUELA', 'SUELAS Y TACONES', '0');
INSERT INTO `contacts` VALUES ('648', 'SILVANA MARTINISI', '', '0', '', '0412-242-50-34', '0', '0', '0', 'PROVEEDOR', 'INSUMOS INTERSUELA', 'SUELAS Y TACONES', '0');
INSERT INTO `contacts` VALUES ('649', 'SILVERIO MILLAN', '', '0', '', '0295-416-39-44', '0', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('650', 'SIMON LOPEZ', '', '0', '', '0416-815-02-12', '0212-271-76-17', '0212-256-08-27', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('651', 'SOBEIRA ', '', '0', '', '0212-286-29-02', '0212-284-77-77', '0212-285-18-06', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIA DE VIAJES', '0');
INSERT INTO `contacts` VALUES ('652', 'SOBEIRA ', '', '0', '', '0212-285-18-06', '0', '0', '0', 'PROVEEDOR', 'AGENCIA DE VIAJES SALPATUR', 'AGENCIAS DE VIAJES', '0');
INSERT INTO `contacts` VALUES ('653', 'SOLANGE PINERO', '', '0', '', '0212-901-07-07', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('654', 'SOLEDAD ', '', '0', '', '0212-709-20-04', '0212-709-20-03', '0', '0', 'ENTES PUBLICOS', 'SENIAT ', 'OFICINAS', '0');
INSERT INTO `contacts` VALUES ('655', 'SONIA CASTILLO', '', '0', '', '0424-223-83-61', '0', '0', '0', 'EMPLEADA', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('656', 'SONIA ', '', '0', '', '0212-242-72-38', '0212-242-13-68', '0', '0', 'CONDOMINIOS', 'INDUSTRIAS NAYLAT', 'CONDOMINIO', '0');
INSERT INTO `contacts` VALUES ('657', 'SONIA VIVAS', '', '0', '', '0212-241-83-13', '0', '0212-242-13-68', '0', 'OTROS', 'INDUSTRIAS NAYLAT', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('658', 'SR. MONTERO ', '', '0', '', '0212-243-63-22', '0', '0', '0', 'BANCOS', 'BANCO NACIONAL DE CREDITO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('659', 'SR. VILLEGAS ', '', '0', '', '0212-242-19-17', '0', '0212-242-68-19', '0212-242-37-94', 'PROVEEDOR', 'BUENOS CAUCHOS', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('660', 'STEFANI ', '', '0', '', '0212-620-61-80', '0', '0', '0', 'PROVEEDORES', 'DHL', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('661', 'STEFANO BELLANCA', '0414-016-26-08', '', '', '0414-016-26-08', '0212-242-60-46 ', '', '', '[\"16\"]', 'CREACIONES BEN-HUR, C.A', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('662', 'STEFANO CIARAVELLA', '', '0', '', '0412-390-60-33', '0', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('664', 'STEFANO  BELLANCA', '', '0', '', '0212-242-60-46', '0', '0414-016-26-08', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('665', 'SUHIN  MARCANO', '', '0', '', '0412-887-24-50', '0412-9664243', '0', '0', 'EMPLEADOS', 'GRUPO FERRADINI (MARACAY)', 'GERENTE', '0');
INSERT INTO `contacts` VALUES ('666', 'SUJEY MARTINEZ', '0212-347.42.20', 'sujei.martinez@ferradini.com.ve', '', '0212-347.42.20', '0412-308.41.93', '0', '0', '[\"17\",\"52\"]', 'GRUPO FERRADINI C.A.', '', '0');
INSERT INTO `contacts` VALUES ('668', 'SUJHIN MARCANO', '', '0', '', '0243-232-05-77', '0', '0', '0', 'EMPRESAS', 'GRUPO FERRADINI (MARACAY)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('669', 'SULAY MARTINEZ', '', '0', '', '0212-263-49-01', '0', '0212-263-77-27', '0424-226-71-76', 'EMPRESAS', 'GRUPO FERRADINI (SAMBIL)', 'TIENDAS', '0');
INSERT INTO `contacts` VALUES ('670', 'TAPIA ', '', '0', '', '0212-630-31-95', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('671', 'TARCISIO APARICIO', '', '0', '', '0212-561-67-46', '0', '0412-713-60-29', '0', 'PROVEEDOR', 'TRANSIVEN', 'FLEJES', '0');
INSERT INTO `contacts` VALUES ('672', 'THAIS CAMPOS', '', '0', '', '0212-762-65-25', '0212-762-60-21', '0', '0', 'OTROS', 'VENEVISION ', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('673', 'TIBALDO ', '', '0', '', '0212-516-19-51', '0416-219-86-55', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A', 'VIGILANCIA', '0');
INSERT INTO `contacts` VALUES ('674', 'TIBISAY ', '', '0', '', '0212-905-71-89', '0', '0212-905-71-90', '0414-111-92-70', 'ENTE PUBLICO', 'ALCALDIA DE CHACAO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('675', 'TONINO ', '', '0', '', '0212-661-82-77', '0', '0', '0', 'PROVEEDORES', 'CALZADOS KIARA', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('676', 'TOÑITO ', '', '0', '', '0412-014-17-00', '0212-418-21-64', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('677', 'TULIO ', '', '0', '', '0416-917-55-43', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('678', 'ULISSE CIARAVELLA', '', '0', '', '0412-267-38-53', '0212-243-00-85', '0', '0', 'SOCIOS', 'CREACIONES BEN-HUR, C.A', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('679', 'VALBUENA ', '', '0', '', '0412-604-13-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('680', 'VALENTIN ', '', '0', '', '0426-615-80-18', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('681', 'VALENTINA ', '', '0', '', '0295-772-87-31', '0424-839-80-10', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('682', 'VANESA ', '', '0', '', '0212-400-76-03', '0212-400-76-14', '0212-200-87-76', '0212-400-76-13', 'OTROS', 'PARQUE CANAIMA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('683', 'VANNESA ', '', '0', '', '0212-200-20-70', '0212-200-21-19', '0412-593-39-29', '0', 'TE LEFONIA', 'MOVISTAR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('684', 'VARGAS ', '', '0', '', '0414-205-17-98', '0', '0', '0', 'PROVEEDOR', 'ASCENSORES VERTICAL', 'MANTENIMIENTO ASCENSORES', '0');
INSERT INTO `contacts` VALUES ('685', 'VICENTE MARTINISI', '', '0', '', '0212-242-13-11', '0', '0212-242-12-11', '0212-242-17-11', 'PROVEEDOR', 'INSUMOS  INTERSUELA', 'SUELAS', '0');
INSERT INTO `contacts` VALUES ('686', 'VICKY ROSO', '', '0', '', '0414-215-11-82', '0', '0', '0', 'AGENCIA DE VIAJES ', 'LINEA AEREA DE VENEZUELA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('687', 'VICTOR ', '', '0', '', '0416-638-84-54', '0', '0', '0', 'OTROS', 'PARTICULAR', 'ARMARIOS', '0');
INSERT INTO `contacts` VALUES ('688', 'VICTOR RAMIREZ', '', '0', '', '0275-415-29-15', '0416-676-97-20', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('690', 'VILLANI ', '', '0', '', '0416-635-25-68', '0', '0', '0', 'MEDICINA', 'PARTICULAR', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('691', 'VITA TRIOLO', '', '0', '', '0414-126-24-36', '0', '0', '0', 'FAMILIARES SOCIOS', 'FAMILIA CAMMARANO', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('692', 'WALKAN ', '', '0', '', '0212-372-98-12', '0212-372-99-85', '0212-372-90-29', '0416-717-42-44', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('693', 'WALTER PULIDO', '', '0', '', '0414-366-55-60', '0412-722-52-76', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('694', 'WASKAR ERASO', '', '0', '', '0414-463-21-08', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('695', 'WILLIAN PALERMO', '', '0', '', '0212-543-28-55', '0', '0', '0', 'SINDICATOS', 'FETRA CALZADOS', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('696', 'WILLIAN DAY', '', '0', '', '0', '0212-239-93-80', '0212-952-12-13', '0', 'PROVEEDOR', 'PARTICULAR', 'FOTOGRAFIA', '0');
INSERT INTO `contacts` VALUES ('697', 'WILLIAN ALTUVE', '', '0', '', '0212-205-56-00', '0426-519-22-01', '0', '0', 'PROVEEDOR', 'SUPERCABLE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('698', 'WILLSON ', '', '0', '', '0412-721-18-83', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('699', 'WILLSON ', '', '0', '', '0212-238-82-03', '0212-237-01-27', '0212-235-05-36', '0', 'OTROS', 'PARTICULAR', 'TALLER', '0');
INSERT INTO `contacts` VALUES ('700', 'WILTON ', '', '0', '', '0212-238-82-03', '0212-237-10-27', '0212-235-05-36', '0212-237-10-27', 'OTROS', 'PARTICULAR', 'TALLER', '0');
INSERT INTO `contacts` VALUES ('701', 'WUICHO ', '', '0', '', '0414-252-40-79', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('702', 'YAJAIRA FAJARDO', '', '0', '', '0212-883-96-91', '0412-900-67-57', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('703', 'YAMILET HERNANDEZ', '', '0', '', '0414-018-73-06', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('704', 'YAZURI LINDO', '', '0', '', '0412-273-76-79', '0424-233-38-11', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('705', 'YENIFER ', '', '0', '', '0212-987-97-59', '0', '0', '0', 'PROVEEDOR', 'OMEGA PUBLICIDAD', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('706', 'YENNY ', '', '0', '', '0212-243-95-56', '0', '0212-240-11-11', '0800-377-66-83', 'PROVEEDORES', 'EPSON', 'EQUIPOS Y CONSUMIBLES', '0');
INSERT INTO `contacts` VALUES ('707', 'YENNY,MARISOL ', '', '0', '', '0212-408-20-61', '0212-408-20-58', '0', '0', 'ENTES PUBLICOS', 'MINISTERIO DEL AMBIENTE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('708', 'YERSON HIJO DE GRISELDA', '', '0', '', '0412-960-17-21', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('709', 'YESICA MILLAN', '', '0', '', '0212-991-01-79', '0212-991-12-36', '0', '0', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('710', 'YESSICA MILLAN', '', '0', '', '0212-600-82-36', '0212-991-01-79', '0412-569-39-99', '0412-205-00-79', 'FAMILIARES EMPLEADOS', 'FAMILIA MILLAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('711', 'YEYO ', '', '0', '', '0212-816-77-23', '0414-273-95-06', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('712', 'YOLANDA ', '', '0', '', '0414-274-40-25', '0', '0', '0', 'ENTES PUBLICOS', 'SEGURO SOCIAL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('713', 'YOLANDA ', '', '0', '', '0414-274-40-25', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'SEGURO SOCIAL ', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('714', 'YONNY ', '', '0', '', '0414-195-89-45', '0', '0', '0', 'EMPLEADO', 'CREACIONES BEN-HUR, C.A', 'VIGILANCIA', '0');
INSERT INTO `contacts` VALUES ('715', 'YUGLIS LUGO', '', '0', '', '0414-022-80-61', '0', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('716', 'YULY ', '', '0', '', '0212-234-03-54', '0', '0212-234-20-92', '0', 'OTROS', 'INVERTEX', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('717', 'YURAIMA GARCIA', '', '0', '', '0212-625-25-30', '0426-415-61-67', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('718', 'ZAIDA MORGADO', '', '0', '', '0414-904-39-30', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('719', 'ZULEIMA ANTELIZ', '', '0', '', '0212-891-53-49', '0426-205-51-21', '0', '0', 'EMPLEADOS', 'CREACIONES BEN-HUR, C.A.', 'PRODUCCION', '0');
INSERT INTO `contacts` VALUES ('720', ' ', '', '0', '', '0414-425-30-00', '0', '0', '0', 'CALZADOS', '1,2,3 KIDS C.A', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('721', ' ', '', '0', '', '0212-267-44-17', '0', '0212-263-44-17', '0', 'OTROS', 'ABX LOGISTICS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('722', 'ASERCA LINEA AEREA', '0212-953-30-04', '0', '', '0212-953-30-04', '0', '0', '0', 'PROVEEDOR', 'ASERCA LINEA AEREA', 'AGENCIA DE VIAJES', '0');
INSERT INTO `contacts` VALUES ('723', ' ', '', '0', '', '0212-626-76-60', '0', '0212-606-71-85', '0212-606-71-92', 'OTROS', 'ACOSTA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('724', ' ', '', '0', '', '0212-264-53-67', '0', '0', '0', 'OTROS', 'ADMINISTRADORA SAMBIL', 'DPTO.SEGURIDAD', '0');
INSERT INTO `contacts` VALUES ('726', ' ', '', '0', '', '0212-573-08-88', '0', '0', '0', 'OTROS', 'ADMINISTRADORA YURUARIZ SUR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('727', ' ', '', '0', '', '0212-265-01-97', '0', '0', '0', 'PROVEEDOR', 'ADRIATICA DE SEGUROS', 'ASEGURADORA', '0');
INSERT INTO `contacts` VALUES ('728', ' ', '', '0', '', '0212-266-21-97', '0', '0212-266-11-87', '0', 'OTROS', 'AERO EXPRESOS EJECUTIVOS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('729', ' ', '', '0', '', '0212-303-52-04', '0', '0212-303-52-09', '0', 'AG.VIAJES', 'AEROPOSTAL', 'CONTROLADORES DE VUELO', '0');
INSERT INTO `contacts` VALUES ('730', ' ', '', '0', '', '0212-303-52-16', '0', '0212-303-52-04', '0', 'AG.VIAJES', 'AEROPOSTAL', 'TRAFICO DE VUELOS', '0');
INSERT INTO `contacts` VALUES ('731', ' ', '', '0', '', '0800-284-66-37', '0', '0', '0', 'AG.VIAJES', 'AEROPOSTAL (TORRE POLAR)', 'RESERVA DE VUELOS', '0');
INSERT INTO `contacts` VALUES ('732', ' ', '', '0', '', '0212-331-92-47', '0', '0', '0', 'PROVEEDOR', 'AGENTES ADUANALES', 'IMPORTACION', '0');
INSERT INTO `contacts` VALUES ('733', ' ', '', '0', '', '0212-331-17-17', '0', '0212-331-93-95', '0', 'PROVEEDOR', 'AGENTES ADUANALES KEN WILL', 'IMPORTACION', '0');
INSERT INTO `contacts` VALUES ('734', ' ', '', '0', '', '0212-331-30-39', '0', '0212-331-52-08', '0', 'OTROS', 'AIR FRANCE', 'AREA CARGA', '0');
INSERT INTO `contacts` VALUES ('735', ' ', '', '0', '', '0239-248-58-86', '0', '0', '0', 'ENTE PUBLICO', 'ALCALDIA DE CHARALLAVE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('736', ' ', '', '0', '', '0212-360-03-00', '0', '0212-360-02-11', '0', 'ENTE PUBLICO', 'ALCALDIA DE PLAZA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('737', ' ', '', '0', '', '0283-235-33-43', '0', '0', '0', 'CLIENTE', 'ALMACEN LA SULTANA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('738', ' ', '', '0', '', '0285-632-08-50', '0', '0285-632-47-02', '0', 'CLIENTE', 'ALMACEN SANTA MARIA, C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('739', ' ', '', '0', '', '0212-751-96-19', '0', '0', '0', 'OTROS', 'ALPATHEC', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('740', ' ', '', '0', '', '0212-239-74-61', '0', '0', '0', 'PROVEEDOR', 'ALPES ', 'PAPELERIA', '0');
INSERT INTO `contacts` VALUES ('741', ' ', '', '0', '', '0261-740-07-71', '0', '0', '0', 'CLIENTE', 'ALTAMIRA CALZADO', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('742', ' ', '', '0', '', '0261-793-99-19', '0', '0261-792-07-95', '0', 'CLIENTE', 'ALTAMIRA COSTA VERDE', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('743', ' ', '', '0', '', '0261-792-15-29', '0', '0', '0', 'CLIENTE', 'ALTAMIRA LAGO MALL, C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('744', ' ', '', '0', '', '0276-356-27-11', '0', '0', '0', 'CLIENTES', 'ANTARTIDA SUPER STORE, C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('745', ' ', '', '0', '', '0241-834-76-21', '0', '0', '0', 'CLIENTE', 'ANTHONY\'S', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('746', 'ARPITEX', '0212-492-11-89', '0', '', '0212-492-11-89', '0', '0212-428-53-85', '0', '[\"22\"]', 'ARPITEX', '', '0');
INSERT INTO `contacts` VALUES ('748', ' ', '', '0', '', '0212-239-17-03', '0', '0416-618-38-86', '0', 'CONDOMINIO', 'ASCENSORES ASCELECTRA', 'MANTENIMIENTO', '0');
INSERT INTO `contacts` VALUES ('749', ' ', '', '0', '', '0212-638-61-89', '0', '0', '0', 'PROVEEDOR', 'ASCENSORES VERTICAL', 'MANTENIMIENTO', '0');
INSERT INTO `contacts` VALUES ('750', ' ', '', '0', '', '0212-267-06-45', '0', '0212-266-59-31', '0212-265-23-35', 'OTROS', 'ASCESORIOS LEAL', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('751', ' ', '', '0', '', '0212-870-70-08', '0', '0212-870-73-85', '0', 'PROVEEDOR', 'AURO-METAL STYLE, C.A.', 'ADORNOS', '0');
INSERT INTO `contacts` VALUES ('752', ' ', '', '0', '', '0494-331-90-03', '0', '0', '0', 'OTROS', 'AUTO CAMIONES REAL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('753', ' ', '', '0', '', '0212-266-76-71', '0', '0212-266-93-76', '0', 'PROVEEDORES', 'B.M.S.', 'IMPRENTA', '0');
INSERT INTO `contacts` VALUES ('754', ' ', '', '0', '', '0241-822-77-48', '0', '0', '0', 'CLIENTE', 'BABY IVORY', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('755', ' ', '', '0', '', '0212-234-58-53', '0', '0212-239-44-31', '0', 'MEDICINA', 'BADAN', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('756', ' ', '', '0', '', '0212-501-97-32', '0', '0212-501-97-61', '0', 'BANCOS', 'BANCO BANESCO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('757', ' ', '', '0', '', '0212-242-77-11', '0', '0', '0', 'BANCOS', 'BANCO BANESCO AV.PPAL LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('758', ' ', '', '0', '', '0212-256-76-73', '0', '0', '0', 'BANCOS', 'BANCO BANESCO PETARE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('759', ' ', '', '0', '', '0212-241-55-59', '0', '0', '0', 'BANCOS', 'BANCO DE VENEZUELA LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('760', ' ', '', '0', '', '0212-242-73-82', '0', '0', '0', 'BANCOS', 'BANCO FONDO COMUN LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('761', ' ', '', '0', '', '0212-503-11-11', '0', '0', '0', 'BANCOS', 'BANCO MERCANTIL AV. PRINCIPAL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('762', ' ', '', '0', '', '0212-241-44-87', '0', '0', '0', 'BANCOS', 'BANCO PROVINCIAL LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('763', ' ', '', '0', '', '0212-263-31-81', '0', '0', '0', 'BANCOS', 'BANCORO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('764', ' ', '', '0', '', '0212-331-21-02', '0', '0212-331-44-96', '0', 'BANCOS', 'BANCORO LA GUAIRA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('765', ' ', '', '0', '', '0212-241-41-25', '0', '0', '0', 'PROVEEDORES', 'BATERIAS P.B. (NAYLAT)', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('766', ' ', '', '0', '', '0212-267-16-46', '0', '0212-266-59-67', '0', 'OTROS', 'BERKERMAN', 'MANICURE', '0');
INSERT INTO `contacts` VALUES ('767', ' ', '', '0', '', '0241-858-49-73', '0', '0', '0', 'CLIENTE', 'BOSS SHOES', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('768', ' ', '', '0', '', '0212-901-87-29', '0', '0212-901-87-31', '0212-901-87-65', 'BANCOS', 'CADIVI BANESCO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('769', ' ', '', '0', '', '0258-433-59-11', '0', '0212-433-59-59', '0', 'PROVEEDORES', 'CALZADO ABATE', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('770', ' ', '', '0', '', '0291-641-28-08', '0', '0', '0', 'CLIENTE', 'CALZADOS ALEN', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('771', ' ', '', '0', '', '0291-641-28-08', '0', '0', '0', 'CALZADOS', 'CALZADOS ALEX', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('772', ' ', '', '0', '', '0212-322-7023', '0', '0212-321-34-72', '0', 'PROVEEDORES', 'CALZADOS ALFA', 'BOTAS DE SEGURIDAD', '0');
INSERT INTO `contacts` VALUES ('773', ' ', '', '0', '', '0261-740-07-71', '0', '0', '0', 'CLIENTES', 'CALZADOS ALTAMIRA', 'VENTA', '0');
INSERT INTO `contacts` VALUES ('774', ' ', '', '0', '', '0271-225-91-17', '0', '0271-221-00-85', '0', 'CLIENTE', 'CALZADOS BONA, S.R.L.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('775', ' ', '', '0', '', '0241-857-28-03', '0', '0', '0', 'CLIENTE', 'CALZADOS BON-PAS', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('776', ' ', '', '0', '', '0212-242-53-34', '0', '0212-241-88-03', '0212-241-33-61', 'PROVEEDOR', 'CALZADOS CERERE', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('777', 'CALZADO DANY', '0273-533-57-70', '0', '', '0273-533-57-70', '0', '0', '0', '[\"12\"]', 'CALZADOS DANY', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('778', 'CALZADO DORIA ', '0212-433-95-21', '0', '', '0212-433-95-21', '0', '0212-433-57-37', '0212-433-96-85', '[\"12\"]', 'CALZADOS DORIA (CHICO)', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('779', ' ', '', '0', '', '0212-251-66-31', '0', '0212-251-06-17', '0', 'PROVEEDOR', 'CALZADOS JUNIOR', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('781', 'CALZADO LA FRANCIA', '0243-245-27-97', '0', '', '0243-245-27-97', '0', '0', '0', '[\"12\"]', 'CALZADOS LA FRANCIA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('782', 'CALZADOS MARIANGEL. C.A.', '0286-961-17-57', '0', '', '0286-961-17-57', '0', '0286-961-27-66', '0286-962-16-98', '[\"12\"]', 'CALZADOS MARIANGEL. C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('783', 'CALZADOS MINERVA', '0251-231-82-95', '0', '', '0251-231-82-95', '0', '0', '0', '[\"12\"]', 'CALZADOS MINERVA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('784', 'CALZADO PANORAMA', '0283-235-43-92', '0', '', '0283-235-43-92', '0', '0286-962-16-98', '0', '[\"12\"]', 'CALZADOS PANORAMA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('785', 'CALZADOS PAURIT', '0243-711-41-61', '0', '', '0243-711-41-61', '0', '0', '0', '[\"12\"]', 'CALZADOS PAURIT', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('786', ' ', '', '0', '', '0212-433-18-23', '0', '0212-433-74-59', '0212-433-30-29', 'CALZADOS', 'CALZADOS RIVAL', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('787', ' ', '', '0', '', '022-242-76-72', '0', '0', '0', 'CALZADOS', 'CALZADOS ROSY', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('788', ' ', '', '0', '', '0212-761-18-80', '0', '0212-761-28-90', '0212-762-41-20', 'PROVEEDOR', 'CALZADOS RUGER FONSECA ', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('789', '', '00551691246093', '0', '', '00551691246093', '0', '0', '0', 'PROVEEDOR', 'CALZADOS SOLLU BRASIL', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('790', ' ', '', '0', '', '0243-233-09-75', '0', '0', '0', 'CLIENTE', 'CALZADOS Y DEPORTES MAVIDOL', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('791', ' ', '', '0', '', '0212-241-42-29', '0', '0', '0', 'PROVEEDOR', 'CANON LA URBINA', 'EQUIPOS', '0');
INSERT INTO `contacts` VALUES ('794', ' ', '', '0', '', '0212-291-22-64', '0', '0', '0', 'PROVEEDOR', 'CARTON DE MORICHE', 'CAJAS', '0');
INSERT INTO `contacts` VALUES ('795', ' ', '', '0', '', '0212-631 -11-47', '0', '0', '0', 'PROVEEDORES', 'CARTONES LUWAS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('796', ' ', '', '0', '', '0212-285-70-90', '0', '0', '0', 'OTROS', 'CASA HOGAR SAN JOSE', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('797', ' ', '', '0', '', '0274-252-45-85', '0', '0', '0', 'CLIENTE', 'CASA VALERO', 'CLIENTES', '0');
INSERT INTO `contacts` VALUES ('799', ' ', '', '0', '', '0212-633-09-19', '0', '0212-632-61-98', '0', 'PROVEEDORES', 'CENTRO AUTOMOTRIZ VOLGAN', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('800', ' ', '', '0', '', '0212-241-21-93', '0', '0212-241-57-60', '0', 'MEDICINA', 'CENTRO CLINICO LA URBINA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('801', ' ', '', '0', '', '0212-949-62-58', '0', '0', '0', 'MEDICINA', 'CENTRO MEDICO LA TRINIDAD', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('802', ' ', '', '0', '', '0212-276-10-01', '0', '0212-276-16-46', '0', 'MEDICINA', 'CLINICA AVILA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('803', ' ', '', '0', '', '0212-405-20-59', '0', '0212-405-21-12', '0212-405-21-11', 'MEDICINA', 'CLINICA LOIRA', 'CAFETIN', '0');
INSERT INTO `contacts` VALUES ('804', ' ', '', '0', '', '0241-866-16-65', '0', '0', '0', 'PROVEEDORES', 'COMERCIALIZADORA HISPANA', 'PIELES Y OTROS ', '0');
INSERT INTO `contacts` VALUES ('805', ' ', '', '0', '', '0212-235-82-14', '0', '0212-237-02-08', '0', 'PROVEEDORES', 'COMPU PLACE', 'INFORMATICA', '0');
INSERT INTO `contacts` VALUES ('806', 'CONAVI', '0212-991-38-71', '0', 'LAS MERCEDES CARACAS\r\n', '0212-991-38-71', '0', '0212-991-32-11', '0212-991-83-09', 'ENTE PUBLICO VIVIENDA', 'CONAVI', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('807', ' ', '', '0', '', '0243-233-32-46', '0', '0', '0', 'PROVEEDORES', 'CONDOMINIO (CENTRO COMERCIAL LAS AMERICAS)', 'CONDOMINIO', '0');
INSERT INTO `contacts` VALUES ('808', ' ', '', '0', '', '0243-232-19-44', '0', '0243-233-32-46', '0', 'PROVEEDORES', 'CONDOMINIO CC LAS AMERICAS', 'ADMINISTRACION', '0');
INSERT INTO `contacts` VALUES ('809', ' ', '', '0', '', '0212-241-76-97', '0', '0', '0', 'CONDOMINIO', 'CONDOMINIO EDIFICIO CUARZO', 'ESTACIONAMIENTO', '0');
INSERT INTO `contacts` VALUES ('810', ' ', '', '0', '', '0243-217-33-69', '0243-233-32-46', '0', '0', 'CONDOMINIOS', 'CONDOMINIO SERVIAMERICA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('811', ' ', '', '0', '', '0212-709-00-11', '0', '0', '0', 'AGENCIA DE VIAJES', 'CONFERRI', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('812', ' ', '', '0', '', '0212-706-00-09', '0', '0', '0', 'PROVEEDOR', 'CONFERRY', 'VIAJES', '0');
INSERT INTO `contacts` VALUES ('813', ' ', '', '0', '', '0500-266-84-27', '0', '0', '0', 'AGENCIA DE VIAJES', 'CONVIASA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('815', ' ', '', '0', '', '0212-234-64-22', '0', '0212-238-25-82', '0212-239-78-71', 'PROVEEDOR', 'CORPODATA', 'INFORMATICA', '0');
INSERT INTO `contacts` VALUES ('816', ' ', '', '0', '', '0212-241-32-02', '0', '0212-242-56-73', '0', 'PROVEEDORES', 'CORPORACION CAPI', 'UTILES ESCOLARES', '0');
INSERT INTO `contacts` VALUES ('817', ' ', '', '0', '', '0212-561-67-46', '0', '0', '0', 'PROVEEDOR', 'CORPORACION TRIVEN', 'FLEJES', '0');
INSERT INTO `contacts` VALUES ('819', 'RICHAR', '0212-631-01-51', '0', '', '0212-631-01-51', '0212-537-57-61', '0', '0', '[\"9\"]', 'CREACIONES TU CORREA', 'CINTURONES', '0');
INSERT INTO `contacts` VALUES ('820', ' ', '', '0', '', '0212-344-15-21', '0', '0212-344-35-48', '0', 'PROVEEDORES', 'CUEROS RECUTEX', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('821', ' ', '', '0', '', '0212-620-60-00', '0', '080-022-553-45', '0', 'PROVEEDOR', 'D.H.L', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('822', ' ', '', '0', '', '0212-344-43-20', '0', '0212-344-09-22', '0', '0', 'DECOCAR', 'TRANSPORTE', '0');
INSERT INTO `contacts` VALUES ('823', ' ', '', '0', '', '0800-225-53-45', '0', '0', '0', 'PROVEEDOR', 'DHL ', 'OFICINA PRINCIPAL', '0');
INSERT INTO `contacts` VALUES ('824', 'DICOPESA', '0212-232-94-23', '0', '', '0212-232-94-23', '0', '0', '0', 'PROVEEDOR', 'DICOPESA', '0', '0');
INSERT INTO `contacts` VALUES ('825', ' ', '', '0', '', '0212-574-14-22', '0', '0212-241-15-91', '0', 'PROVEEDOR', 'DISEÑOS LILIMET', 'UNIFORMES', '0');
INSERT INTO `contacts` VALUES ('827', ' ', '', '0', '', '0212-801-22-50', '0', '0212-870-29-97', '0', 'PROVEEDOR', 'DIST. LEATHER AIR', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('828', ' ', '', '0', '', '0212-561-43-35', '0', '0212-561-29-72', '0', 'PROVEEDOR', 'DISTRIBUIBORA COHEN', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('829', ' ', '', '0', '', '0212-262-10-13', '0', '0212-266-98-52', '0', 'OTROS', 'DISTRIBUIDORA ANA ARENA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('830', ' ', '', '0', '', '0212-266-76-71', '0', '0212-266-93-76', '0', 'PROVEEDOR', 'DISTRIBUIDORA DMS', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('831', 'EDITORIAL GIRASOL', '0212-945-95-55', '0', '', '0212-945-95-55', '0', '0212-945-60-46', '0212-945-97-66', 'PROVEEDOR', 'DISTRIBUIDORA NUBECITAS', 'LIBROS PAPELERIA', '0');
INSERT INTO `contacts` VALUES ('832', 'ENGEL ROMAN', '0212-870-30-65', '0', '', '0212-870-30-65', '0416-626-57-48', '0212-870-70-62', '0', '[\"8\"]', 'DISTRIBUIDORA OSOROMA', 'EQUIPOS DE PROTECCION', '4');
INSERT INTO `contacts` VALUES ('833', 'AUTOMECANICA DOFI', '0212-730-74-80', '0', 'LA FLORIDA CARACAS', '0212-730-74-80', '0', '0', '0', 'PROVEEDOR', 'DOFI', 'TALLER MECANICO', '0');
INSERT INTO `contacts` VALUES ('834', ' ', '', '0', '', '0212-40-14-700', '0', '0', '0', 'PROVEEDOR', 'DOMESA', 'SERV.MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('835', ' ', '', '0', '', '0212-242-15-22', '0', '0', '0', 'RESTAURANT', 'DOMINOS PIZZA (LA URBINA)', 'SERV.COMIDAS', '0');
INSERT INTO `contacts` VALUES ('836', ' ', '', '0', '', '0212-256-36-11', '0', '0', '0', 'PROVEEDOR', 'DUNCAN (LOS CORTIJOS)', 'REPUESTOS DE VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('837', 'EDITORIAL PANAPO', '0212-462-13-41 ', '0', 'AV JOSE ANGEL LAMAS CENTRO INDUSTRIAL  PALO GRANDE  EDF 1 PISO 6 CARACAS', '0212-462-13-41 ', '0212-46286-27', '0212-461-37-73', '0', 'PROVEEDOR', 'EDITORIAL PANAPO', 'UTILES ESCOLARES', '0');
INSERT INTO `contacts` VALUES ('838', ' ', '', '0', '', '0212-419-38-96', '0', '0412-219-38-65', '0', 'CONDOMINIO', 'ELECTRO STALFRE', 'MATERIALES ELECTRICOS', '0');
INSERT INTO `contacts` VALUES ('839', ' ', '', '0', '', '0212-662-91-15', '0', '0212-662-59-59', '0', 'OTROS', 'ELECTRONICAS NAVOS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('841', 'EMOZIONI', '0269-246-46-51', '0', '', '0269-246-46-51', '0', '0269-24689-51', '0', '[\"12\"]', 'EMOZIONI', '', '0');
INSERT INTO `contacts` VALUES ('842', ' ', '', '0', '', '0212-232-54-20', '0', '0', '0', 'PROVEEDOR', 'EPA (LOS CORTIJOS)', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('843', ' ', '', '0', '', '0212-632-61-77', '0', '0212-632-83-58', '0212-632-54-30', 'OTROS', 'EQUI HOTEL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('844', ' ', '', '0', '', '0276-344-53-09', '0', '0', '0', 'CLIENTES', 'EXIT TIENDAS MONANINA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('846', ' ', '', '0', '', '0212-285-33-17', '0', '0', '0', 'OTROS', 'EXSELCIOR GAMA (PALOS GRANDES)', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('847', 'YEIMI BARBOZA', '0212-794-27-73', 'SERVICIOSEXTINYEY2011@GMAIL.COM', 'CARACAS', '0212-794-27-73', '0212-793-48-46', '0414-326-24-78', '0416-829-44-41', '[\"49\"]', 'EXTINYEY', '', '4');
INSERT INTO `contacts` VALUES ('848', ' ', '', '0', '', '0212-693-68-56', '0', '0212-693-96-30', '0', 'PROVEEDORES', 'FABRICAS DE TACONES F.C.A', 'COMPRAS', '0');
INSERT INTO `contacts` VALUES ('850', ' ', '', '0', '', '0212-217-63-23', '0', '0212-543-28-55', '0', 'ENTES PRIVADOS', 'FEDERACION DE CALZADO', 'SINDICATOS', '0');
INSERT INTO `contacts` VALUES ('851', ' ', '', '0', '', '0212-205-33-33', '0', '0', '0', 'IMPORTACIONES', 'FEDEX', 'SERV.MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('852', ' ', '', '0', '', '0212-241-56-15', '0', '0212-242-30-27', '0', 'PROVEEDOR', 'FERRETERIA DIFREMAR', 'FERRETERIA', '0');
INSERT INTO `contacts` VALUES ('853', ' ', '', '0', '', '0212-753-46-78', '0', '0', '0', 'PROVEEDOR', 'FERRETOTAL', 'FERRETERIA', '0');
INSERT INTO `contacts` VALUES ('854', ' ', '', '0', '', '0212-761-63-79', '0', '0212-761-84-01', '0', 'AGENCIA DE VIAJES', 'FERRY NAVIARCA MUNDO TURISTICO CRI', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('855', ' ', '', '0', '', '0212-239-11-40', '0', '0212-235-52-27', '0', 'PROVEEDOR', 'FESTEJOS DE VENEZUELA', 'FESTEJOS', '0');
INSERT INTO `contacts` VALUES ('856', ' ', '', '0', '', '0212-731-36-17', '0', '0', '0', 'PROVEEDOR', 'FESTEJOS PLANZ', 'FESTEJOS', '0');
INSERT INTO `contacts` VALUES ('857', ' ', '', '0', '', '0212-284-02-56', '0', '0', '0', 'PROVEEDOR', 'FLORISTERIA (LOS PALOS GRANDES)', 'ARREGLOS FLORALES', '0');
INSERT INTO `contacts` VALUES ('858', ' ', '', '0', '', '0212-242-73-82', '0', '0', '0', 'BANCOS', 'FONDO COMUN', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('859', ' ', '', '0', '', '0212-241-47-20', '0', '0212-241-57-44', '0', 'OTROS', 'FRADIMECA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('860', ' ', '', '0', '', '0212-256-17-23', '0', '0212-256-11-22', '0', 'OTROS', 'FUGAMAZ', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('861', ' ', '', '0', '', '0239-225-13-63', '0', '0', '0', 'OTROS', 'FUNERARIA 3000 OCUMARE DEL TUY', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('862', ' ', '', '0', '', '0212-991-99-46', '0', '0', '0', 'REVISTA', 'GESTIMARCAS', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('863', ' ', '', '0', '', '0212-242-07-78', '0', '0', '0', 'LEGALES', 'GESTORIA LA ROCCA', 'LEGALES', '0');
INSERT INTO `contacts` VALUES ('864', ' ', '', '0', '', '0212-237-13-75', '0', '0212-238-08-48', '0212-238-55-26', 'PROVEEDOR', 'GOMELAST', 'LIJAS, CINTAS', '0');
INSERT INTO `contacts` VALUES ('865', ' ', '', '0', '', '0285-632-66-56', '0', '0', '0', 'CLIENTES', 'GRAN MODA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('866', ' ', '', '0', '', '0212-303-15-28', '0', '0', '0', 'OTROS', 'GUAIRA INTERNACIONAL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('867', ' ', '', '0', '', '0212-406-30-00', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL CARACAS', 'GUARDERIAS', '0');
INSERT INTO `contacts` VALUES ('868', ' ', '', '0', '', '0269-240-51-17', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL DE INDIBENIA', 'GUARDERIAS', '0');
INSERT INTO `contacts` VALUES ('869', ' ', '', '0', '', '0269-240-51-17', '0', '0', '0', 'OTROS', 'GUARDERIA NACIONAL FALCON', 'GUARDERIAS', '0');
INSERT INTO `contacts` VALUES ('870', ' ', '', '0', '', '0248-521-01-01', '0', '0248-521-01-69', '0', 'OTROS', 'GUARDERIA NACIONAL PTO.AYACUCHO', 'GUARDERIAS', '0');
INSERT INTO `contacts` VALUES ('871', ' ', '', '0', '', '0212-264-06-36', '0', '0212-264-13-93', '0212-267-50-12', 'OTROS', 'HABITACASA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('872', ' ', '', '0', '', '0', '0', '0800-768-225-36', '0', 'ENTES PUBLICOS', 'HIDROCAPITAL', 'ATENCION AL CLIENTE', '0');
INSERT INTO `contacts` VALUES ('873', ' ', '', '0', '', '0212-573-69-11', '0', '0212-573-65-55', '0', 'MEDICINA', 'HOSPITAL ORTOPEDICO INFANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('874', 'MARIN', '', '0', '', '0416-211-17-10', '0', '0', '0', 'ENTES PUBLICOS', 'I.N.C.E.', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('875', 'SRA. MIREYA', '0251-254-87-93', '0', 'BARQUISIMETO', '0251-254-87-93', '0', '0', '0', 'CLIENTES', 'ILMERLETTO DEL ESTE', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('876', ' ', '', '0', '', '0212-481-63-05', '0', '0', '0', 'PROVEEDOR', 'IMPORTADORA AMERICANA', 'PANETONE', '0');
INSERT INTO `contacts` VALUES ('877', 'ROSA', '0212-631-10-45', '0', '', '0212-631-10-45', '0', '0', '0', '[\"28\"]', 'IMPRESOS CANAIMA', 'TALONARIOS', '4');
INSERT INTO `contacts` VALUES ('878', 'RICARDO', '0212-871-63-57', '0', '', '0212-871-63-57', '0412-813-67-22', '0212-871-67-68', '0212-872-30-09', '[\"9\"]', 'INDUSTRIAS RUANSA DE VENEZUELA', 'FORROS Y TELAS', '4');
INSERT INTO `contacts` VALUES ('880', ' ', '', '0', '', '0212-562-44-01', '0', '0414-241-51-92', '0414-210-02-36', 'OTROS', 'INDUSTRIAS UNION GRAFICA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('881', ' ', '', '0', '', '0241-832-04-27', '0', '0414-402-11-26', '0', 'OTROS', 'INGENIERIA HENFOR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('882', ' ', '', '0', '', '0276-343-78-41', '0', '0', '0', 'CLIENTES', 'INVERSIONES ADAN Y EVA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('883', ' ', '', '0', '', '0292-337-02-70', '0', '0', '0', 'CLIENTES', 'INVERSIONES CASA DELIA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('884', ' ', '', '0', '', '0212-951-02-20', '0', '0', '0', 'PROVEEDORES', 'INVERSIONES CELEBRE AQUI ', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('885', ' ', '', '0', '', '0241-841-17-36', '0', '0', '0', 'CLIENTES', 'INVERSIONES FACOMAR(VALENCIA)', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('886', ' ', '', '0', '', '0212-761-18-91', '0', '0212-761-34-25', '0', 'PROVEEDORES', 'INVERSIONES LEATHER ', 'DISTRIBUIDORA DE CALZADOS', '0');
INSERT INTO `contacts` VALUES ('887', ' ', '', '0', '', '0241-823-50-01', '0', '0', '0', 'CLIENTES', 'INVERSIONES TERRA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('888', ' ', '', '0', '', '0241-822-06-27', '0', '0', '0', 'CLIENTES', 'INVERSIONES. F.M.R. DE VENEZUELA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('889', ' ', '', '0', '', '0241-822-25-75', '0', '0241-824-01-24', '0', 'CLIENTES', 'IVORY C.A', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('890', ' ', '', '0', '', '0', '0', '0', '0', 'CLIENTES', 'IVORY VALENCIA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('891', 'HERNAN NAVAS', '0212-391-12-92', '0', '', '0212-391-12-92', '0212-391-15-58', '0212-391-16-38', '0', '[\"9\"]', 'K´NOLL GOMAS', 'PLANTAS', '4');
INSERT INTO `contacts` VALUES ('892', ' ', '', '0', '', '0212-391-12-92', '0', '0212-391-16-38', '0212-391-12-48', 'PROVEEDORES', 'K´NOLL GOMAS INDUSTRIALES', 'CONTRAFUERTES', '0');
INSERT INTO `contacts` VALUES ('893', ' ', '', '0', '', '0212-331-17-17', '0', '0212-331-93-95', '0', 'PROVEEDOR', 'KEM & WILL C.A', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('894', ' ', '', '0', '', '0212-872-14-86', '0212-761-18-91', '0', '0', 'PROVEEDOR', 'LEATHER TRADE COMPANY', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('895', ' ', '', '0', '', '0212-241-11-11', '0212-241-33-33', '0212-241-44-44', '0', 'PROVEEDOR', 'LEGIS', 'MANUALES LEGALES', '0');
INSERT INTO `contacts` VALUES ('896', ' ', '', '0', '', '0212-263-31-44', '0212-264-40-34', '0212-267-56-69', '0212-264-34-10', 'PROVEEDOR', 'LIBRERÍA MUNDO PAPEL', 'UTILES DE OFICINA', '0');
INSERT INTO `contacts` VALUES ('897', ' ', '', '0', '', '0212-241-15-91', '0', '0', '0', 'PROVEEDOR', 'LILIMEY DISEÑOS', 'UNIFORMES', '0');
INSERT INTO `contacts` VALUES ('898', ' ', '', '0', '', '0501-836-39-65', '0', '0', '0', 'AGENCIA DE VIAJES', 'LINEA VENEZOLANA', 'ATENCION AL CLIENTE', '0');
INSERT INTO `contacts` VALUES ('899', ' ', '', '0', '', '0212-232-10-33', '0212-232-11-11', '0212-203-44-33', '0', 'MEDICOS Y MEDICINAS', 'LOCATEL (BOLEITA CENTER)', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('900', ' ', '', '0', '', '0212-781-71-01', '0', '0', '0', 'PROVEEDOR', 'LOGISTICAS SISTEMAS (CLARET)', 'SISTEMAS', '0');
INSERT INTO `contacts` VALUES ('901', ' ', '', '0', '', '0212-237-38-66', '0', '0', '0', 'OTROS', 'LOGIVAY (LOS RUICES)', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('902', ' ', '', '0', '', '0212-242-72-69', '0212-242-76-36', '0', '0', 'RESTAURANT', 'LORETO´S', 'RESTAURANT', '0');
INSERT INTO `contacts` VALUES ('903', ' ', '', '0', '', '0212-272-20-36', '0416-62 7-32-85', '0', '0', 'PROVEEDOR', 'LUJUANCLA', 'UNIFORMES', '0');
INSERT INTO `contacts` VALUES ('904', ' ', '', '0', '', '0212-985-83-94', '0212-985-76-16', '0', '0', 'PROVEEDOR', 'LUNA ROSSA', '0', '0');
INSERT INTO `contacts` VALUES ('905', ' ', '', '0', '', '0212-243-50-34', '0212-243-26-08', '0', '0', 'MENSAJERIA', 'MAIL BOXES ETC. (LA URBINA)', 'MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('906', ' ', '', '0', '', '0212-433-25-11', '0', '0', '0', 'PROVEEDOR', 'MANAPLAS', 'PLASTICO', '0');
INSERT INTO `contacts` VALUES ('907', ' ', '', '0', '', '0286-600-31-45', '0286-600-31-44', '0', '0', 'CLIENTE', 'MARIANGEL ORINOQUIA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('908', ' ', '', '0', '', '0286-600-31-45', '0', '0', '0', 'CLIENTE', 'MARIANGEL´S', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('909', ' ', '', '0', '', '0212-241-70-93', '0212-241-93-12', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRICOS SVAT.', 'MATERIALES ELECTRICOS', '0');
INSERT INTO `contacts` VALUES ('910', ' ', '', '0', '', '0212-237-02-15', '0', '0', '0', 'PROVEEDOR', 'MATERIALES ELECTRONICOS (EL MARQUES)', 'ELECTRICIDAD', '0');
INSERT INTO `contacts` VALUES ('911', ' ', '', '0', '', '0212-662-47-40', '0', '0', '0', 'MEDICOS Y MEDICINAS', 'MEDICINA VIAL', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('912', ' ', '', '0', '', '0241-857-66-09', '0', '0', '0', 'CLIENTE', 'MOMPER, C.A.', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('913', ' ', '', '0', '', '0281-280-30-41', '0', '0', '0', 'CLIENTE', 'MONIC FASHIONS', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('914', ' ', '', '0', '', '0295-291-32-47', '0', '0', '0', 'PROVEEDOR', 'MRW  (LA PENINSULA)', 'SERVICIOS DE MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('915', ' ', '', '0', '', '0212-241-00-12', '0', '0', '0', 'PROVEEDOR', 'MRW (LA URBINA)', 'SERVICIOS DE MENSAJERIA', '0');
INSERT INTO `contacts` VALUES ('916', ' ', '', '0', '', '0501-685-87-34', '0501-207-64-49', '0', '0', 'SEGUROS', 'MULTINACIONAL DE SEGUROS', 'ATENCION AL CLIENTE', '0');
INSERT INTO `contacts` VALUES ('917', ' ', '', '0', '', '0212-620-33-24', '0212-620-33-22', '0', '0', 'PROVEEDOR', 'MULTINACIONAL DE SEGUROS', 'SEGUROS', '0');
INSERT INTO `contacts` VALUES ('918', ' ', '', '0', '', '0212-241-28-22', '0', '0', '0', 'PROVEEDOR', 'MUNDO PIEL (NEVISELA)', 'PIELES', '0');
INSERT INTO `contacts` VALUES ('919', 'NAPPO CONSULTORES', '0212-753-51-98', '0', '', '0212-753-51-98', '0', '0', '0', '[\"25\"]', 'NAPPO CONSULTORES', '', '0');
INSERT INTO `contacts` VALUES ('920', ' ', '', '0', '', '0212-243-66-76', '0212-241-44-88', '0212-.241-90-93', '0', 'ENTES PUBLICOS', 'NOTARIA PUBLICA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('921', ' ', '', '0', '', '0', '0', '0', '0', 'PROVEEDOR', 'NUOVA CEPER DE VENEZUELA', 'CONTRAFUERTES Y CARTONES', '0');
INSERT INTO `contacts` VALUES ('922', ' ', '', '0', '', '0212-945-95-55', '0212-945-60-46', '0212-914-02-92', '0', 'PROVEEDOR', 'NUVECITA', 'UTILES ESCOLARES', '0');
INSERT INTO `contacts` VALUES ('923', ' ', '', '0', '', '0212-242-46-59', '0', '0', '0', 'PROVEEDOR', 'OFIGRAPA', 'UTILES DE OFICINA', '0');
INSERT INTO `contacts` VALUES ('924', ' ', '', '0', '', '0245-571-06-12', '0', '0', '0', 'PROVEEDOR', 'PABILOS AILEN', 'PABILOS', '0');
INSERT INTO `contacts` VALUES ('925', 'SR PEDRO', '0212-243-51-43', '0', 'CALLE 7 LA URBINA', '0212-243-51-43', '0', '0', '0', 'PROVEEDOR', 'PANADERIA FINA 13', 'PANADERIA', '0');
INSERT INTO `contacts` VALUES ('926', ' ', '', '0', '', '0212-241-45-96', '0', '0', '0', 'PROVEEDOR', 'PANADERIA TULIPAN', 'PANADERIA', '0');
INSERT INTO `contacts` VALUES ('927', 'BRACAMONTE', '', '0', '', '0414-239-35-67', '0', '0', '0', 'OTROS', 'PARTICULAR', 'MOTO TAXI', '0');
INSERT INTO `contacts` VALUES ('929', 'BERROTERAN', '', '0', '', '0412-391-05-49', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('931', 'BERNOTTI', '', '0', '', '0212-262-10-13', '0', '0', '0', 'OTROS', 'PARTICULAR', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('932', 'GALINDO', '', '0', '', '0412-728-04-50', '0', '0212-344-14-26', '0212-344-83-96', 'OTROS', 'PARTICULAR', 'TRAMITES SETRA', '0');
INSERT INTO `contacts` VALUES ('933', ' ', '', '0', '', '0212-243-71-34', '0212-244-31-73', '0', '0', 'PROVEEDOR', 'PERLATRON', 'RECARGA DE TONER', '0');
INSERT INTO `contacts` VALUES ('934', ' ', '', '0', '', '0212-753-15-20', '0212-753-96-19', '0212-751-45-91', '0', 'OTROS', 'PLUSCABLE', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('935', ' ', '', '0', '', '0212-341-62-61', '0212-341-46-43', '0212-341-29-14', '0212-341-47-13', 'PROVEEDOR', 'POLIURETANOS TEXEL', 'SUELAS', '0');
INSERT INTO `contacts` VALUES ('940', ' ', '', '0', '', '0251-231-70-57', '0', '0', '0', 'CLIENTES', 'PUELLA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('941', 'PELI EXPRESS', '0212-239-49-10', '0', '', '0212-239-49-10', '0212-239-90-58', '0', '0', 'OTROS', 'PULI EXPRESS', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('942', 'COMERCIAL CAZORLA', '0241-894-29-86', '0', '', '0241-894-29-86', '0414-471-61-66', '0', '0', 'PROVEEDOR', 'RECUPERADORA CAZORLA, C.A', 'CAJAS', '0');
INSERT INTO `contacts` VALUES ('943', ' ', '', '0', '', '0212-286-61-31', '0412-235-03-39', '0', '0', 'OTROS', 'REMISUR', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('944', ' ', '', '0', '', '0212-383-28-81', '0212-372-78-96', '0', '0', 'CLIENTE', 'RENIS VALLERY', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('945', ' ', '', '0', '', '0212-372-73-52', '0414-247-18-32', '0', '0', 'CLIENTES', 'RENY VALERI', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('946', ' ', '', '0', '', '0212-256-44-19', '0', '0', '0', 'OTROS', 'REPARMATIC', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('947', ' ', '', '0', '', '0212-241-04-09', '0', '0', '0', 'OTROS', 'REPUESTOS ARENA', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('948', ' ', '', '0', '', '0212-241-19-20', '0212-241-44-11', '0', '0', 'PROVEEDOR', 'REPUESTOS EL PARAISO', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('949', ' ', '', '0', '', '0212-266-09-31', '0212-263-57-08', '0212-267-06-45', '0212-265-23-35', 'VEHICULOS', 'REPUESTOS LEAL', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('950', ' ', '', '0', '', '0281-276-89-34', '0212-271-00-82', '0', '0', 'OTROS', 'REPUESTOS PARA TODO', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('951', ' ', '', '0', '', '0212-944-51-90', '0212-942-14-22', '0', '0', 'OTROS', 'RESPUESTOS (BARUTA)', 'REPUESTOS', '0');
INSERT INTO `contacts` VALUES ('952', ' ', '', '0', '', '0212-243-11-20', '0', '0', '0', 'RESTAURANT', 'RESTAURANT EL BRASERO DEL MARQUEZ', 'SERVICIO DE COMIDA', '0');
INSERT INTO `contacts` VALUES ('953', ' ', '', '0', '', '0212-542-14-31', '0416-414-36-11', '0', '0', 'PROVEEDOR', 'RJ SERIGRAPHIC', 'ETIQUETAS SENCAMER', '0');
INSERT INTO `contacts` VALUES ('954', 'SANGAY CENICAL', '0212-435-28-46', '0', '', '0212-435-28-46', '0416-401-83-27', '0', '0', '[\"8\",\"23\"]', 'SANGAY CHEMICAL', 'GASOLINA ', '4');
INSERT INTO `contacts` VALUES ('955', ' ', '', '0', '', '0212-242-58-64', '0212-241-42-89', '0', '0', 'ENTES PUBLICOS', 'SANIDAD', 'MEDICOS Y MEDICINAS', '0');
INSERT INTO `contacts` VALUES ('956', ' ', '', '0', '', '0800-865-26-36', '0', '0', '0', 'AGENCIA DE VIAJES ', 'SANTA BARBARA', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('957', ' ', '', '0', '', '0212-235-30-33', '0', '0', '0', 'PROVEEDOR', 'SANTILLANA', 'UTILES ESCOLARES', '0');
INSERT INTO `contacts` VALUES ('958', ' ', '', '0', '', '0212-630-31-95', '0', '0', '0', '0', 'SATELITAL', 'TALLER', '0');
INSERT INTO `contacts` VALUES ('959', ' ', '', '0', '', '0212-264-69-63', '0212-266-62-42', '0212-715-95-74', '0414-183-00-73', 'PROVEEDOR', 'SATELITE CREATIVO PUBLICIDAD', 'PUBLICIDAD', '0');
INSERT INTO `contacts` VALUES ('960', ' ', '', '0', '', '0212-870-30-65', '0212-871-36-07', '0212-870-30-91', '0', 'OTROS', 'SCOTT REPRESENTACIONES', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('961', ' ', '', '0', '', '0212-631-01-33', '0212-631-04-24', '0', '0', 'OTROS', 'SEGURITEX', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('962', ' ', '', '0', '', '0212-276-20-00', '0212-503-25-25', '0', '0', 'SEGUROS', 'SEGURO MERCANTIL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('963', ' ', '', '0', '', '0212-952-03-05', '0', '0', '0', 'SEGUROS', 'SEGURO OCCIDENTAL', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('964', ' ', '', '0', '', '0212-901-07-04', '0212-901-09-52', '0212-901-03-91', '0', 'ENTES PUBLICOS', 'SEGURO SOCIAL ', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('965', ' ', '', '0', '', '0212-703-20-11', '0212-703-20-05', '0212-703-20-06', '0', 'ENTES PUBLICOS', 'SENCAMER', 'PERMISO DISTRIBUCION DE CALZADOS', '0');
INSERT INTO `contacts` VALUES ('966', ' ', '', '0', '', '0241-871-61-56', '0212-817-84-19', '0', '0', 'ENTES PUBLICOS', 'SENIAT', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('967', ' ', '', '0', '', '0212-794-01-25', '0212-794-08-62', '0212-794-01-25', '0', 'ENTES PUBLICOS', 'SENIAT ', 'DEPARTAMENTO LEGAL', '0');
INSERT INTO `contacts` VALUES ('968', ' ', '', '0', '', '0212-207-25-11', '0212-207-27-45', '0', '0', 'ENTES PUBLICOS', 'SENIAT (LOS RUICES)', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('970', ' ', '', '0', '', '0212-239-45-46', '0212-239-87-32', '0212-239-29-59', '0', 'PROVEEDOR', 'SERVICIOS  CANAL CORP', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('973', ' ', '', '0', '', '0241-823-84-15', '0', '0', '0', 'CLIENTES', 'SHOES BOUTIQUE', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('974', ' ', '', '0', '', '0212-234-05-79', '0212-234-05-51', '0212-235-36-66', '0', 'OTROS', 'SILENCIADORES DAYTANA', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('975', ' ', '', '0', '', '0212-623-50-20', '0', '0', '0', 'SINDICATOS', 'SINDICATO DEL CALZADO', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('976', '', '0212-241-15-10', '0', 'LA URBINA, CALLE 11', '0212-241-15-10', '0', '0', '0', 'PROVEEDOR', 'SOBICA ELECTRONIC', 'ARTICULOS DE ELECTRICIDAD', '0');
INSERT INTO `contacts` VALUES ('977', ' ', '', '0', '', '0501-763-39-46', '0212-206-56-44', '0', '0', 'PROVEEDOR', 'SODHEXHO PASS', 'CESTA TICKET', '0');
INSERT INTO `contacts` VALUES ('978', ' ', '', '0', '', '0212-243-71-96', '0424-243-08-60', '0', '0', 'PROVEEDOR', 'SOIN', 'EQUIPOS DE COMPUTACION', '0');
INSERT INTO `contacts` VALUES ('979', ' ', '', '0', '', '0212-241-15-10', '0', '0', '0', 'PROVEEDOR', 'SOVICA', 'SISTEMAS DE SEGURIDAD', '0');
INSERT INTO `contacts` VALUES ('980', ' ', '', '0', '', '0212-241-46-37', '0212-242-46-27', '0212-243-57-95', '0', 'PROVEEDOR', 'SUBWAY (LA URBINA)', 'SERVICIO DE COMIDA', '0');
INSERT INTO `contacts` VALUES ('981', ' ', '', '0', '', '0241-832-02-67', '0', '0', '0', 'OTROS', 'SUPLI SEGURIDAD', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('982', ' ', '', '0', '', '0212-234-59-42', '0', '0', '0', 'PROVEEDOR', 'TACHIFICIO SANGIORGIO', 'TACONES Y PLATAFORMAS', '0');
INSERT INTO `contacts` VALUES ('983', ' ', '', '0', '', '0212-838-55-35', '0212-871-21-04', '0', '0', 'PROVEEDOR', 'TACONES BALTAC-ZIMA', 'TACONES', '0');
INSERT INTO `contacts` VALUES ('984', 'ALFREDO FRENESTE', '0212-256-98-89', '0', 'BUENA VISTA PETARE', '0212-256-98-89', '0212-256-67-50', '0212-256-97-86', '0', 'PROVEEDOR', 'TALLER FRENESTE', 'REPARACION VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('985', ' ', '', '0', '', '0416-701-01-62', '0', '0', '0', 'OTROS', 'TAXI', 'ALQUILERES', '0');
INSERT INTO `contacts` VALUES ('986', ' ', '', '0', '', '0212-870-38-34', '0212-870-24-03', '0', '0', 'PROVEEDOR', 'TECNISUELA', 'SUELAS', '0');
INSERT INTO `contacts` VALUES ('987', ' ', '', '0', '', '0212-237-10-27', '0416-819-52-89', '0', '0', 'PROVEEDOR', 'TECNO AUTOMOTRIZ (MONTECRISTO)', 'VEHICULOS', '0');
INSERT INTO `contacts` VALUES ('988', ' ', '', '0', '', '0246-415-79-52', '0', '0', '0', 'PROVEEDOR', 'TENERIA SAN JUAN ', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('989', ' ', '', '0', '', '0246-415-79-52', '0', '0', '0', 'PROVEEDOR', 'TENERIA SAN JUAN DE LOS  MORROS', 'PIELES Y FORROS', '0');
INSERT INTO `contacts` VALUES ('990', ' ', '', '0', '', '0281-282-16-27', '0', '0', '0', 'PROVEEDOR', 'TERRANOVA CALZATURE', 'CALZADOS', '0');
INSERT INTO `contacts` VALUES ('991', ' ', '', '0', '', '0243-615-03-83', '0243-615-03-88', '0', '0', 'PROVEEDOR', 'TODO EN CAJAS', 'CAJAS PARA CALZADOS', '0');
INSERT INTO `contacts` VALUES ('992', ' ', '', '0', '', '0249-331-24-21', '0', '0', '0', 'CLIENTES', 'TOLLY SHOES', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('993', ' ', '', '0', '', '0212-258-18-63', '0', '0', '0', 'ENTES PUBLICOS', 'TRANSITO SUCRE', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('994', ' ', '', '0', '', '0212-577-41-30', '0416-917-90-12', '0', '0', 'PROVEEDOR', 'TRANSPORTE 2011', 'TRANSPORTE', '0');
INSERT INTO `contacts` VALUES ('995', ' ', '', '0', '', '0212-331-36-22', '0', '0', '0', 'IMPORTACIONES', 'TRANSPORTE MULTIMODAL', 'OFICINA LA GUAIRA', '0');
INSERT INTO `contacts` VALUES ('996', ' ', '', '0', '', '0212-975-09-20', '0212-975-05-28', '0', '0', 'PROVEEDOR', 'TRANSPORTE MULTIMODAL', 'TRANSPORTE', '0');
INSERT INTO `contacts` VALUES ('997', ' ', '', '0', '', '0212-331-27-22', '0', '0', '0', 'PROVEEDOR', 'TRANSPORTE MULTIMODAL (LA GUAIRA)', 'IMPORTACIONES', '0');
INSERT INTO `contacts` VALUES ('998', ' ', '', '0', '', '0212-461-65-66', '0212-461-34-66', '0', '0', 'PROVEEDOR', 'TRANSVALVER (SODEXHO PASS)', 'PEDIDOS,DESPACHO', '0');
INSERT INTO `contacts` VALUES ('999', ' ', '', '0', '', '0285-632-62-56', '0212-632-43-67', '0', '0', 'CLIENTES', 'TRAVERTINO SHOES', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1000', 'ROCELIS ASTUDILLO', '0212-383-10-92', '0', '', '0212-383-10-92', '0414-129-18-56', '0', '0', '[\"9\"]', 'TRENZAS CARRIZAL', 'TRENZAS', '4');
INSERT INTO `contacts` VALUES ('1001', 'ULTIMA NOTCIAS', '0212-596-16-34', '0', '', '0212-596-16-34', '0', '0', '0', '[\"9\"]', 'ULTIMAS NOTICIAS', 'DPTO.ATENCION AL CLIENTE', '0');
INSERT INTO `contacts` VALUES ('1004', 'VALTAK', '0212-838-55-35', '0', '', '0212-838-55-35', '0', '0', '0', '[\"8\"]', 'VALTAK', 'TACONES', '0');
INSERT INTO `contacts` VALUES ('1005', 'VENECAL', '0212-871-32-61', '0', '', '0212-871-32-61', '0', '0', '0', '[\"35\"]', 'VENECAL', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('1007', ' ', '', '0', '', '0212-693-66-27', '0212-214-23-80', '0', '0', 'PROVEEDOR', 'VIPESA & ASOCIADOS', 'CONTABILIDAD', '0');
INSERT INTO `contacts` VALUES ('1008', ' ', '', '0', '', '0212-471-24-34', '0', '0', '0', 'PROVEEDOR', 'VIVERES CARACAS', 'ARTICULOS EN GENERAL', '0');
INSERT INTO `contacts` VALUES ('1009', ' ', '', '0', '', '0212-633-09-19', '0212-632-94-93', '0', '0', 'OTROS', 'VOLGAN', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('1010', ' ', '', '0', '', '0800-937-69-00', '0212-237-53-52', '0212-232-39-24', '0', 'PROVEEDOR', 'XEROX', 'EQUIPOS DE COMPUTACION', '0');
INSERT INTO `contacts` VALUES ('1011', ' ', '', '0', '', '0261-752-14-89', '0261-752-39-65', '0', '0', 'CLIENTES', 'ZAPATERIA ALTAMIRA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1012', ' ', '', '0', '', '0269-246-46-51', '0', '0', '0', 'CLIENTES', 'ZAPATERIA LA POPULAR', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1013', ' ', '', '0', '', '0255-621-14-08', '0', '0', '0', 'CLIENTES', 'ZAPATERIA MARACAIBO', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1014', ' ', '', '0', '', '0241-821-10-81', '0', '0', '0', 'CLIENTES', 'ZAPATERIA MINERVA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1015', ' ', '', '0', '', '0416-623-17-32', '0', '0', '0', 'CLIENTES', 'ZAPATERIA NADIA', 'VENTAS', '0');
INSERT INTO `contacts` VALUES ('1016', ' ', '', '0', '', '0241-871-61-56', '0241-871-84-91', '0241-753-63-91', '0', 'PROVEEDOR', 'ZERMAC', 'SUELAS Y PLANTILLAS', '0');
INSERT INTO `contacts` VALUES ('1017', ' ', '', '0', '', '0212-471-63-73', '0', '0212-471-04-45', '0', 'OTROS', 'ZINFOCAL', 'OTROS', '0');
INSERT INTO `contacts` VALUES ('1018', ' ', '', '0', '', '0212-901-07-99', '0212-901-07-23', '0', '0', 'SEGUROS', 'ZURITH SEGUROS', 'OFICINA', '0');
INSERT INTO `contacts` VALUES ('1020', 'EGLEE HEREDIA', '04141234567', 'EGDOL', '', '04141234567', '', '', '', 'EMPLEADOS', 'BENHUR', '', '0');
INSERT INTO `contacts` VALUES ('1023', 'prueba 1', '123456', 'scammarano@gmail.com', '', '123456', '', '', '', '10', '', '', '0');
INSERT INTO `contacts` VALUES ('1024', 'prueba2', '123', 'scammarano@gmail.com', '', '123', '', '', '', '11', '', '', '0');
INSERT INTO `contacts` VALUES ('1025', 'prueba3', '123', 'scammarano@gmail.com', 's', '123', '', '', '', '\"11\"', '', '', '0');
INSERT INTO `contacts` VALUES ('1026', 'prueba4', '123', 'scammarano@gmail.com', '', '123', '', '', '', '[\"8\",\"10\",\"11\"]', '', '', '0');
INSERT INTO `contacts` VALUES ('1027', 'Prueba', '4534534', 'garrybruno@hotmail.com', 'eryerte', '4534534', '', '', '', '[\"8\"]', 'rtyrtyr', 'drgere', '0');
INSERT INTO `contacts` VALUES ('1028', 'Hello2', '0212-415-54-44', 'garrybruno@hotmail.com', 'rtthfghfgh', '0212-415-54-44', '', '', '', '[\"12\"]', 'rrthrrh', 'thrthrt', '12');
INSERT INTO `contacts` VALUES ('1029', 'INSUMOS INTERSUELA', '0212-870-27-58', '', '', '0212-870-27-58', '', '', '', '[\"9\"]', 'INSUMOS INTERSUELA', '', '0');
INSERT INTO `contacts` VALUES ('1030', 'EDUARDO MADRID', '132132132', '', '', '132132132', '123', '321', '321', '[\"9\",\"20\"]', 'INDUSTRIAS BELL POWER C.A.', 'VENTAS / COBRANZA', '0');
INSERT INTO `contacts` VALUES ('1031', 'GAETANO SOPRANO', '', '', '', '', '', '', '', '[\"9\"]', 'CALZADOS KIARA C.A.', '', '0');
INSERT INTO `contacts` VALUES ('1032', 'MARGARITA DE LAN', '0412-900-64-31', '', '', '0412-900-64-31', '', '', '', '[\"14\"]', '', 'EMPLEADOS', '4');
INSERT INTO `contacts` VALUES ('1034', 'PASCUALE ROGATO', '0212-870-39-74', '', '', '0212-870-39-74', '', '', '', '[\"12\"]', 'CALZADO TERAMANO', 'VENTA', '0');
INSERT INTO `contacts` VALUES ('1035', 'ALFREDO', '0414-704-62-10', '', '', '0414-704-62-10', '', '', '', '[\"24\"]', 'CANON', 'MANTENIMIENTO FOTOCOPIADORAS', '4');
INSERT INTO `contacts` VALUES ('1036', 'YOLI LEON', '', '', 'GRUPO GALPA SERV', '', '', '', '', '[\"18\"]', 'GRUPO GALPA', 'SERVICIO', '4');

-- ----------------------------
-- Table structure for contact_categories
-- ----------------------------
DROP TABLE IF EXISTS `contact_categories`;
CREATE TABLE `contact_categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact_categories
-- ----------------------------
INSERT INTO `contact_categories` VALUES ('8', 'PROVEEDORES', '0');
INSERT INTO `contact_categories` VALUES ('9', 'PROVEEDORES NACIONALES', '8');
INSERT INTO `contact_categories` VALUES ('10', 'PROVEEDORES EXTRANJEROS', '8');
INSERT INTO `contact_categories` VALUES ('11', 'CLIENTES', '0');
INSERT INTO `contact_categories` VALUES ('12', 'CLIENTES NACIONALES', '11');
INSERT INTO `contact_categories` VALUES ('13', 'CLIENTES EXTRANJEROS', '11');
INSERT INTO `contact_categories` VALUES ('14', 'EMPLEADOS', '0');
INSERT INTO `contact_categories` VALUES ('15', 'SOCIOS', '0');
INSERT INTO `contact_categories` VALUES ('16', 'EMPLEADOS BENHUR', '14');
INSERT INTO `contact_categories` VALUES ('17', 'EMPLEADOS FERRADINI', '14');
INSERT INTO `contact_categories` VALUES ('18', 'PROVEEDORES SERVICIOS', '8');
INSERT INTO `contact_categories` VALUES ('19', 'MATERIAS PRIMAS', '0');
INSERT INTO `contact_categories` VALUES ('20', 'PEGAMENTOS', '19');
INSERT INTO `contact_categories` VALUES ('21', 'HILOS, ADORNOS, CINTAS, VARIOS', '19');
INSERT INTO `contact_categories` VALUES ('22', 'PIELES, TELAS, FORROS', '19');
INSERT INTO `contact_categories` VALUES ('23', 'SOLVENTES, PINTURAS, QUIMICOS, TINTAS, REACTIVOS', '19');
INSERT INTO `contact_categories` VALUES ('24', 'TECNICOS MANTENIMIENTO', '0');
INSERT INTO `contact_categories` VALUES ('25', 'SISTEMA, COMPUTADORAS, SERVIDORES, REDES, TELEFONOS', '24');
INSERT INTO `contact_categories` VALUES ('26', 'FOTOCOPIADORAS, IMPRESORAS', '24');
INSERT INTO `contact_categories` VALUES ('27', 'MANTENIMIENTO, ASCENSORES, ELECTRICIDAD, PLOMERIA', '24');
INSERT INTO `contact_categories` VALUES ('28', 'IMPRENTAS', '8');
INSERT INTO `contact_categories` VALUES ('29', 'PAPELERIA E INSUMOS DE OFICINA', '8');
INSERT INTO `contact_categories` VALUES ('30', 'INSUMOS DE LIMPIEZA', '8');
INSERT INTO `contact_categories` VALUES ('31', 'AGENCIAS DE FESTEJO', '18');
INSERT INTO `contact_categories` VALUES ('32', 'HOTELES Y TRANSPORTE (TAXIS, AEROLINEAS, LINEAS AUTOBUS)', '18');
INSERT INTO `contact_categories` VALUES ('33', 'TALLERES MECANICOS', '18');
INSERT INTO `contact_categories` VALUES ('34', 'ADMINISTRADORAS, CONDOMINIOS', '18');
INSERT INTO `contact_categories` VALUES ('35', 'CAMARA, ASOCIACIONES', '0');
INSERT INTO `contact_categories` VALUES ('36', 'GESTORES', '18');
INSERT INTO `contact_categories` VALUES ('37', 'ORGANISMOS', '0');
INSERT INTO `contact_categories` VALUES ('38', 'SENIAT', '37');
INSERT INTO `contact_categories` VALUES ('39', 'IVSS - SEGUROS SOCIAL', '37');
INSERT INTO `contact_categories` VALUES ('40', 'INCES', '37');
INSERT INTO `contact_categories` VALUES ('41', 'MINTRA', '37');
INSERT INTO `contact_categories` VALUES ('42', 'ALCALDIA CHACAO', '37');
INSERT INTO `contact_categories` VALUES ('43', 'ALCALDIA SUCRE', '37');
INSERT INTO `contact_categories` VALUES ('44', 'ALCALDIA GIRARDOT (MARACAY)', '0');
INSERT INTO `contact_categories` VALUES ('45', 'ALCALDIA IRIBARREN (BARQUISIMETO)', '37');
INSERT INTO `contact_categories` VALUES ('46', 'ALCALDIA URBANEJA (PLAZA MAYOR)', '37');
INSERT INTO `contact_categories` VALUES ('47', 'ALCALDIA PALO NEGRO (AVIADORES)', '37');
INSERT INTO `contact_categories` VALUES ('48', 'INSUMOS SEGURIDAD INDUSTRIAL', '0');
INSERT INTO `contact_categories` VALUES ('49', 'EXTINTORES', '18');
INSERT INTO `contact_categories` VALUES ('50', 'DUDA', '0');
INSERT INTO `contact_categories` VALUES ('51', '02-CHACAITO', '0');
INSERT INTO `contact_categories` VALUES ('52', '03-CCCT', '0');
INSERT INTO `contact_categories` VALUES ('53', '04-PLAZA MAYOR', '0');
INSERT INTO `contact_categories` VALUES ('54', '06-MARACAY', '0');
INSERT INTO `contact_categories` VALUES ('55', '07-BARQUISIMETO', '0');
INSERT INTO `contact_categories` VALUES ('56', '08-AVIADORES', '0');
INSERT INTO `contact_categories` VALUES ('57', '10-SAMBIL II', '0');

-- ----------------------------
-- Table structure for courts
-- ----------------------------
DROP TABLE IF EXISTS `courts`;
CREATE TABLE `courts` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location_id` int(9) unsigned NOT NULL,
  `court_category_id` int(9) unsigned NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courts
-- ----------------------------

-- ----------------------------
-- Table structure for court_categories
-- ----------------------------
DROP TABLE IF EXISTS `court_categories`;
CREATE TABLE `court_categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of court_categories
-- ----------------------------

-- ----------------------------
-- Table structure for custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `field_type` int(10) NOT NULL,
  `form` int(10) NOT NULL,
  `values` text NOT NULL,
  `max` int(11) DEFAULT NULL,
  `mayusculas` int(11) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_fields
-- ----------------------------
INSERT INTO `custom_fields` VALUES ('1', 'Indique Mes', '9', '101', '', '255', '0', 'Y-m');
INSERT INTO `custom_fields` VALUES ('2', 'Número de Factura', '1', '102', '', '10', '0', null);
INSERT INTO `custom_fields` VALUES ('3', 'Número de Control', '1', '102', '', '10', '0', null);
INSERT INTO `custom_fields` VALUES ('4', 'Proveedor', '2', '102', 'J-00041093-3,J-31333443-0,J-29901259-9', '255', '0', null);
INSERT INTO `custom_fields` VALUES ('5', 'Indique Período', '3', '103', 'Abril,Agosto,Diciembre', '255', '0', null);
INSERT INTO `custom_fields` VALUES ('6', 'Período', '9', '104', '', '255', '0', 'Y-m');
INSERT INTO `custom_fields` VALUES ('7', 'Período', '9', '105', '', '255', '0', 'Y-m');
INSERT INTO `custom_fields` VALUES ('8', 'Período', '9', '106', '', '255', '0', 'Y-m');
INSERT INTO `custom_fields` VALUES ('9', 'Empleado', '2', '106', 'Gabriela Zerpa,Yilda Tapia,Yuris Tapia', '255', '0', null);
INSERT INTO `custom_fields` VALUES ('10', 'Probando', '1', '107', '', '255', '0', 'd-m-Y');

-- ----------------------------
-- Table structure for days
-- ----------------------------
DROP TABLE IF EXISTS `days`;
CREATE TABLE `days` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `working_day` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of days
-- ----------------------------
INSERT INTO `days` VALUES ('1', 'Monday', '0');
INSERT INTO `days` VALUES ('2', 'Tuesday', '0');
INSERT INTO `days` VALUES ('3', 'Wednesday', '0');
INSERT INTO `days` VALUES ('4', 'Thursday', '0');
INSERT INTO `days` VALUES ('5', 'Friday', '0');
INSERT INTO `days` VALUES ('6', 'Saturday', '0');
INSERT INTO `days` VALUES ('7', 'Sunday', '0');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Administración', '', '0', 'ADMN');
INSERT INTO `departments` VALUES ('2', 'Recursos Humanos', '', '0', 'RRHH');
INSERT INTO `departments` VALUES ('3', 'Sistemas y Progamación', '', '0', 'SIST');
INSERT INTO `departments` VALUES ('4', 'Logística', '', '0', 'LOGI');
INSERT INTO `departments` VALUES ('5', 'Comercial', '', '0', 'COME');
INSERT INTO `departments` VALUES ('6', 'Producción', '', '0', 'PROD');
INSERT INTO `departments` VALUES ('7', 'Directiva', '', '0', '');
INSERT INTO `departments` VALUES ('8', 'Mantenimiento y Servicios Generales', '', '0', 'MANT');
INSERT INTO `departments` VALUES ('9', 'Soporte Técnico', '', '0', 'IT');

-- ----------------------------
-- Table structure for dept_categories
-- ----------------------------
DROP TABLE IF EXISTS `dept_categories`;
CREATE TABLE `dept_categories` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_categories
-- ----------------------------
INSERT INTO `dept_categories` VALUES ('1', 'Administración');
INSERT INTO `dept_categories` VALUES ('2', 'Recursos Humanos');
INSERT INTO `dept_categories` VALUES ('3', 'Sistemas');
INSERT INTO `dept_categories` VALUES ('4', 'Mantenimiento');
INSERT INTO `dept_categories` VALUES ('5', 'Comercial');
INSERT INTO `dept_categories` VALUES ('6', 'Logística');
INSERT INTO `dept_categories` VALUES ('7', 'Producción');
INSERT INTO `dept_categories` VALUES ('9', 'Soporte Técnico');

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_case` tinyint(1) NOT NULL DEFAULT '0',
  `case_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('1', '', '1', '1');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `UserId` varchar(4) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DeptId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employees
-- ----------------------------

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(9) unsigned NOT NULL,
  `cod_interno` varchar(7) NOT NULL,
  `rif` varchar(255) NOT NULL,
  `razon_social` varchar(1000) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cod_interno` (`cod_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=9993 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('0', 'GRUPO ECC', '9999', '000', 'N/A', '-', '-', '-', '', '4', '1');
INSERT INTO `empresas` VALUES ('2', 'CLARAS', '9991', 'AAA', 'J-29861451-0', 'Inversiones Claras 2009 C.A.', ' Zona Industrial La Urbina, Calle 8, Edif. Cuarzo, Piso 3. Caracas-Venezuela', '-', '', '3', '1');
INSERT INTO `empresas` VALUES ('3', 'SUCA', '9992', 'BBB', 'J-29865932-7', 'Inversiones Suca 2009 C.A.', ' Zona Industrial La Urbina, Calle 8, Edif. Cuarzo, Piso 2. Caracas-Venezuela', '-', '', '3', '1');
INSERT INTO `empresas` VALUES ('4', 'BENHUR', '0', '001', 'J-00041093-3', 'Creaciones Ben-Hur C.A.', 'Zona Industrial La Urbina, Calle 8, Edif. Cuarzo, Pisos 2,3 y 4. Caracas-Venezuela', '0212-242.62.11', '', '1', '1');
INSERT INTO `empresas` VALUES ('5', 'GRUPO FERRADINI', '0', '020', 'J-29901259-9', 'Grupo Ferradini C.A.', 'Zona Industrial La Urbina, Calle 9, Edif. Miranda, P.B., Locales C y D. Caracas-Venezuela', '0212-242.70.30', '', '1', '1');
INSERT INTO `empresas` VALUES ('6', 'MODAS BH', '0', '098', 'J-29670391-4', 'Modas BH C.A.', 'Zona Industrial La Urbina, Calle 8, Edif. Cuarzo, Piso 3. Caracas-Venezuela', '0212-242.17.52', '', '1', '1');
INSERT INTO `empresas` VALUES ('7', 'ACALUROSA', '0', '099', 'J-29407318-2', 'Inversiones Acalurosa C.A.', 'Zona Industrial La Urbina, Calle 9, Edif. Miranda, P.B., Locales C y D. Caracas-Venezuela', '0212-242.62.11', '', '1', '1');
INSERT INTO `empresas` VALUES ('8', 'SHAKE', '0', '021', 'J-29353058-0', 'Grupo Shake C.A.', 'Zona Industrial La Urbina, Calle 9, Edif. Miranda, P.B., Locales C y D. Caracas-Venezuela', '0212-242.70.30', '', '1', '0');
INSERT INTO `empresas` VALUES ('9', 'MODAS', '0', '008', 'J-00220139-8', 'Ferradini Modas C.A.', 'Calle 8, Urb La Urbina, Edf Cuarto, P 2 y 3', '', '', '1', '0');
INSERT INTO `empresas` VALUES ('10', 'MODASII', '0', '002', 'J-00363856-0', 'Ferradini Modas II C.A.', 'Nivel Plaza Brión, Urb Chacaito, Centro Comercial Chacaito, Local 131', '', '.cha', '1', '0');
INSERT INTO `empresas` VALUES ('11', 'MODAS TAMANACO', '0', '003', 'J-30037074-7', 'Ferradini Modas Tamanaco C.A.', 'Nivel C-2, Chuao, Centro Comercial Ciudad Tamanaco, Local 53-07', '', '.tam', '1', '0');
INSERT INTO `empresas` VALUES ('12', 'MODAS PLAZA MAYOR', '0', '004', 'J-30417678-3', 'Ferradini Modas Plaza Mayor C.A.', 'Calle 8, La Urbina, Edf Cuarzo, Piso 4', '', '.may', '1', '0');
INSERT INTO `empresas` VALUES ('13', 'MODAS CCS', '0', '005', 'J-30518096-2', 'Ferradini Modas C C S, C.A.', 'Av. Libertador, Urb Chacao, C.C. Sambil, Nivel Autopista, Local AR-30', '', '.ccs', '1', '0');
INSERT INTO `empresas` VALUES ('14', 'MODAS MARACAY', '0', '006', 'J-30937842-2', 'Ferradini Modas Maracay C.A.', 'Calle 8, Urb La Urbina, Edf Cuarzo, Piso 4', '', '.mca', '1', '0');
INSERT INTO `empresas` VALUES ('15', 'KIDS', '0', '007', 'J-31455364-0', 'Ferradini Kids C.A.', ' Avenida Las Delicias C.C. Las Americas, Urb. El Bosque, Mezzanina L-421 Maracay', '-', '.kid', '1', '0');
INSERT INTO `empresas` VALUES ('16', 'SUC 02-CHACAITO', '5', '020-002', 'N/A', '-', ' Chacaito, Centro Comercial Chacaito, Nivel Plaza Brión, Local 131', '0212-952.11.61', '.s02', '1', '1');
INSERT INTO `empresas` VALUES ('17', 'SUC 03-TAMANACO', '5', '020-003', 'N/A', '-', 'Chuao, Centro Comercial Ciudad Tamanaco, Nivel C-2, Local 53-07', '0212-959.10.10', '.s03', '1', '1');
INSERT INTO `empresas` VALUES ('18', 'SUC 04-PLAZA MAYOR', '5', '020-004', 'N/A', '-', 'Lecherías, Centro Comercial Plaza Mayor, Nivel PB, Local', '0281-282.16.70', '.s04', '1', '1');
INSERT INTO `empresas` VALUES ('19', 'SUC 05-SAMBIL', '5', '020-005', 'N/A', '-', 'Chacao, Centro Sambil, Nivel Autopista, Local AR-30/32', '0212-263.77.27', '.s05', '1', '1');
INSERT INTO `empresas` VALUES ('20', 'SUC 06-MARACAY', '5', '020-006', 'N/A', '-', 'Las Delicias, Centro Comercial Las Americas, Locales PB-311 MZ-421', '0243-232.05.77', '.s06', '1', '1');
INSERT INTO `empresas` VALUES ('21', 'SUC 07-BARQUISIMETO', '5', '020-007', 'N/A', '-', 'Barquisimeto, Centro Sambil, Local L-9', '0251-713.77.07', '.s07', '1', '1');
INSERT INTO `empresas` VALUES ('22', 'SUC 08-AVIADORES', '5', '020-008', 'N/A', '-', 'Palo Negro, Centro Comercial Parque Los Aviadores, Local L-264', '0243-201.9500', '.s08', '1', '1');
INSERT INTO `empresas` VALUES ('23', 'SUC 09-CERRO VERDE', '5', '020-009', 'N/A', '-', 'Cerro Verde, Centro Comercial Parque Cerro Verde, Nivel , Local ', '', '.s09', '1', '1');
INSERT INTO `empresas` VALUES ('24', 'SUC 10-SAMBIL II', '5', '020-010', 'N/A', '-', 'Chacao, Centro Sambil, Nivel Autopista, Local AR-39', '0212-263.77.27', '.s10', '1', '1');
INSERT INTO `empresas` VALUES ('25', 'BEMOCICA', '0', '011', 'J-00156005-0', 'Inversiones Bemocica C.A.', 'Calle 8, Edf Cuarzo, Piso 4, Local N/A, Urb La Urbina,  Caracas (Petare) Miranda', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('26', 'CONDRILA', '0', '012', 'J-00276327-2', 'Corporación Condrila C.A.', 'AV PRINCIPAL CC CHACAITO NIVEL PB LOCAL 131 URB\r\nCHACAITO CARACAS (CHACAO) MIRANDA ZONA POSTAL 1050', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('27', '3CTAM', '0', '013', 'J-30005058-0', 'Inmobiliaria 3C TAM, C.A.', 'AV AUTOPISTA FRANCISCO FAJARDO CC CIUDAD TAMANACO\r\nNIVEL C2 LOCAL 53-R-07 SECTOR CHUAO CARACAS (CHACAO) MIRANDA ZONA\r\nPOSTAL 1060', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('28', 'PIAZZA MAGGIORE', '0', '014', 'J-30312315-5', 'Inmobiliaria Piazza Maggiore 1 PLC, C.A.', 'CALLE 8 EDIF CUARZO PISO 4 APT 1 URB LA URBINA ZONA\r\nINDUSTRIAL CARACAS (PETARE) MIRANDA ZONA POSTAL 1071', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('29', '2CSAMB', '0', '015', 'J-30518108-0', 'Inmobiliaria 2C SAMB, C.A.', 'Av. Libertador, C.C. Sambil, Nivel Autopista, Local AR-32,  Urb Chacao, Caracas (Chacao) Miranda', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('30', '4CLASAM', '0', '016', 'J-30967051-4', 'Inmobiliaria 4 CLASAM, C.A.', 'CALLE 8 EDIF .CUARZO PISO 4 APT 1 URB LA URBINA ZONA\r\nINDUSTRIAL CARACAS (PETARE) MIRANDA ZONA POSTAL 1071', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('31', 'IMB CUARZO', '0', '030', '', '', '', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('32', 'IMB CHACAITO', '0', '031', 'J-31334095-2', 'IMB CHACAITO, C.A', 'CALLE CALLE 8 LA URBINA EDIF EDIF CUARZO PISO 2 LOCAL 1\r\nZONA 1 CARACAS (PETARE) MIRANDA ZONA POSTAL 1073', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('33', 'IMB TAMANACO', '0', '032', 'J-31333304-2', 'IMB TAMANACO, C.A.', 'CALLE CALLE 8 LA URBINA EDIF EDIF CUARZO PISO 2 LOCAL 1\r\nZONA 1 CARACAS (PETARE) MIRANDA ZONA POSTAL 1073', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('34', 'IMB PIAZZA MAGGIORE', '0', '033', 'J-40734512-5', 'IMB PIAZZA MAGGIORE, C.A.', 'CALLE 8 EDIF CUARZO PISO 4 LOCAL 1 URB LA URBINA\r\nCARACAS (PETARE) MIRANDA ZONA POSTAL 1073', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('35', 'IMB LAS AMERICAS', '0', '034', '', '', '', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('36', 'IMB CERRO VERDE', '0', '035', '', '', '', '', '', '2', '0');
INSERT INTO `empresas` VALUES ('37', 'FTL', '38', '097', 'J-31333443-0', 'Alimentos F.T.L., C.A.', ' CALLE CALLE 8 LA URBINA EDIF EDIF CUARZO PISO 2 LOCAL 1\r\nZONA 1 CARACAS (PETARE) MIRANDA ZONA POSTAL 1073', '0212-2426211', '', '1', '1');
INSERT INTO `empresas` VALUES ('38', 'LUCIO-TORE', '9993', '-', 'N/A', '-', '-', '-', '', '4', '0');
INSERT INTO `empresas` VALUES ('9991', 'FAM-CAMMARANO', '0', '-', 'N/A', '-', ' -', '-', '', '4', '0');
INSERT INTO `empresas` VALUES ('9992', 'FAM-CIARAVELLA', '0', '-', 'N/A', '-', '-', '-', '', '4', '0');

-- ----------------------------
-- Table structure for empresa_tipo
-- ----------------------------
DROP TABLE IF EXISTS `empresa_tipo`;
CREATE TABLE `empresa_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa_tipo
-- ----------------------------
INSERT INTO `empresa_tipo` VALUES ('1', 'Comercial');
INSERT INTO `empresa_tipo` VALUES ('2', 'Inmobiliaria');
INSERT INTO `empresa_tipo` VALUES ('3', 'Holding');
INSERT INTO `empresa_tipo` VALUES ('4', 'Grupo de Empresas');

-- ----------------------------
-- Table structure for empresa_usuario
-- ----------------------------
DROP TABLE IF EXISTS `empresa_usuario`;
CREATE TABLE `empresa_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `nomina` varchar(255) NOT NULL,
  `fecha_ingreso` varchar(255) NOT NULL,
  `principal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa_usuario
-- ----------------------------
INSERT INTO `empresa_usuario` VALUES ('1', '4', '5', '5', '92', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('2', '5', '4', '1', '73', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('4', '9', '5', '5', '94', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('5', '10', '4', '1', '71', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('6', '28', '7', '2', '76', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('7', '29', '4', '1', '75', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('8', '30', '4', '6', '103', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('9', '33', '0', '1', '74', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('10', '39', '5', '5', '92', '', '', '1');
INSERT INTO `empresa_usuario` VALUES ('12', '3', '4', '1', '71', '', '2003-10-03', '1');
INSERT INTO `empresa_usuario` VALUES ('13', '56', '0', '5', '98', '', '', '1');

-- ----------------------------
-- Table structure for extended_case
-- ----------------------------
DROP TABLE IF EXISTS `extended_case`;
CREATE TABLE `extended_case` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `case_id` int(9) unsigned NOT NULL,
  `next_date` date NOT NULL,
  `last_date` date NOT NULL,
  `note` text NOT NULL,
  `document` text NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0',
  `is_view_client` int(10) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extended_case
-- ----------------------------

-- ----------------------------
-- Table structure for fees
-- ----------------------------
DROP TABLE IF EXISTS `fees`;
CREATE TABLE `fees` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `case_id` int(9) unsigned NOT NULL,
  `payment_mode_id` int(9) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fees
-- ----------------------------

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `location` varchar(1000) NOT NULL,
  `id_task` int(11) DEFAULT NULL,
  `id_comment` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_publicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', 'ER1.pdf', 'assets/uploads/tickets/10/ER1.pdf', null, null, '10', '0');
INSERT INTO `files` VALUES ('2', 'ER1.pdf', 'assets/uploads/tickets/11/8/ER1.pdf', null, null, null, '8');
INSERT INTO `files` VALUES ('3', 'ER1.pdf', 'assets/uploads/tareas/16/ER1.pdf', '16', null, null, null);
INSERT INTO `files` VALUES ('4', 'prueba.txt', 'assets/uploads/comentarios/4/prueba.txt', null, '4', null, null);
INSERT INTO `files` VALUES ('5', 'V13580675.jpg', 'assets/uploads/tickets/1/9/V13580675.jpg', null, null, null, '9');
INSERT INTO `files` VALUES ('7', 'abc_ab_share_pack_mtrl_alpha.9.png', 'assets/uploads/tickets/41-0-6/abc_ab_share_pack_mtrl_alpha.9.png', null, null, '41', null);

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holidays
-- ----------------------------
INSERT INTO `holidays` VALUES ('1', 'dasdas', '2017-08-30');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `flag` text NOT NULL,
  `file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'french', 'french-flag4.jpeg', 'admin_lang.php');
INSERT INTO `language` VALUES ('3', 'spanish', 'Spain_Flag.png', 'admin_lang_es.php');

-- ----------------------------
-- Table structure for leaves
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(9) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `leave_type_id` int(9) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaves
-- ----------------------------

-- ----------------------------
-- Table structure for leave_types
-- ----------------------------
DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE `leave_types` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `leaves` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_types
-- ----------------------------

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of locations
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `from_id` int(9) unsigned NOT NULL,
  `to_id` int(9) unsigned NOT NULL,
  `is_view_from` int(9) NOT NULL DEFAULT '0',
  `is_view_to` int(9) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '', '<p>prueba envio mensaje de administrador a martha</p>', '', '1', '3', '0', '0', '2017-07-31 14:59:08');
INSERT INTO `message` VALUES ('2', '', '<p>prueba de envio mensaje de admin a martha</p>', '', '1', '3', '0', '0', '2017-07-31 15:00:28');
INSERT INTO `message` VALUES ('4', '', '<p>asdasd</p>', '', '1', '11', '0', '0', '2017-08-23 18:12:10');
INSERT INTO `message` VALUES ('5', '', '<p>asdaaaaaa</p>', '', '1', '2', '0', '0', '2017-08-23 18:27:50');
INSERT INTO `message` VALUES ('13', 'llamo sr antonio de querin', '', 'Llamada Telefonica', '1', '9', '0', '0', '2017-09-22 16:54:02');
INSERT INTO `message` VALUES ('14', 'Llamó el Sr. gesler Castillo', '<p>gesler castillo</p><p>corporacion passe</p><p>04121166575</p>', 'Llamada Telefonica', '5', '6', '0', '0', '2017-10-09 09:15:03');
INSERT INTO `message` VALUES ('15', 'Tecnico de impresora', '<p>Buenos días sr Salvatore</p><p>vino el sr Alfredo y le trajo una impresora y reviso las fotocopiadoras</p>', 'Visita', '5', '6', '0', '0', '2017-10-18 08:13:39');
INSERT INTO `message` VALUES ('16', 'GRUPO GALPA', '', 'Visita', '5', '6', '0', '1', '2017-10-24 14:59:58');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1');

-- ----------------------------
-- Table structure for months
-- ----------------------------
DROP TABLE IF EXISTS `months`;
CREATE TABLE `months` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of months
-- ----------------------------
INSERT INTO `months` VALUES ('1', 'January');
INSERT INTO `months` VALUES ('2', 'February');
INSERT INTO `months` VALUES ('3', 'March');
INSERT INTO `months` VALUES ('4', 'April');
INSERT INTO `months` VALUES ('5', 'May');
INSERT INTO `months` VALUES ('6', 'June');
INSERT INTO `months` VALUES ('7', 'July');
INSERT INTO `months` VALUES ('8', 'August');
INSERT INTO `months` VALUES ('9', 'September');
INSERT INTO `months` VALUES ('10', 'Octomber');
INSERT INTO `months` VALUES ('11', 'November');
INSERT INTO `months` VALUES ('12', 'December');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'prueba', '', '2017-10-09 09:31:00');

-- ----------------------------
-- Table structure for notification_setting
-- ----------------------------
DROP TABLE IF EXISTS `notification_setting`;
CREATE TABLE `notification_setting` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `case_alert` int(10) NOT NULL,
  `to_do_alert` int(10) NOT NULL,
  `appointment_alert` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notification_setting
-- ----------------------------
INSERT INTO `notification_setting` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for payment_modes
-- ----------------------------
DROP TABLE IF EXISTS `payment_modes`;
CREATE TABLE `payment_modes` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_modes
-- ----------------------------

-- ----------------------------
-- Table structure for pub_campanas
-- ----------------------------
DROP TABLE IF EXISTS `pub_campanas`;
CREATE TABLE `pub_campanas` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_campanas
-- ----------------------------
INSERT INTO `pub_campanas` VALUES ('3', '2017-11');
INSERT INTO `pub_campanas` VALUES ('4', '2017-12');
INSERT INTO `pub_campanas` VALUES ('5', '2017-01');

-- ----------------------------
-- Table structure for pub_medios
-- ----------------------------
DROP TABLE IF EXISTS `pub_medios`;
CREATE TABLE `pub_medios` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_medios
-- ----------------------------
INSERT INTO `pub_medios` VALUES ('1', 'Facebook');
INSERT INTO `pub_medios` VALUES ('2', 'Instagram');
INSERT INTO `pub_medios` VALUES ('3', 'Twitter');
INSERT INTO `pub_medios` VALUES ('4', 'Revista Vanidades');
INSERT INTO `pub_medios` VALUES ('5', 'Página Web');
INSERT INTO `pub_medios` VALUES ('6', 'Revista Cosmopolitan');

-- ----------------------------
-- Table structure for pub_parrillas
-- ----------------------------
DROP TABLE IF EXISTS `pub_parrillas`;
CREATE TABLE `pub_parrillas` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int(9) NOT NULL,
  `pilar_id` int(9) unsigned NOT NULL,
  `copy` text NOT NULL,
  `fecha_pub` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `etiquetas` text NOT NULL,
  `datemod` datetime DEFAULT NULL,
  `agente` int(9) unsigned NOT NULL,
  `medio_id` int(9) NOT NULL,
  `campana_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_parrillas
-- ----------------------------
INSERT INTO `pub_parrillas` VALUES ('9', '57', '1', 'xzcbfb', '2017-10-16 15:18:00', 'c c cvz', null, '0', '5', '3');
INSERT INTO `pub_parrillas` VALUES ('10', '57', '2', 's<dvb', '2017-10-18 20:00:00', 'zsd', null, '0', '1', '3');

-- ----------------------------
-- Table structure for pub_pilares
-- ----------------------------
DROP TABLE IF EXISTS `pub_pilares`;
CREATE TABLE `pub_pilares` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_pilares
-- ----------------------------
INSERT INTO `pub_pilares` VALUES ('1', 'Alimentación');
INSERT INTO `pub_pilares` VALUES ('2', 'Bienvenida');
INSERT INTO `pub_pilares` VALUES ('3', 'Contacto');
INSERT INTO `pub_pilares` VALUES ('4', 'Mitos');

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `fees_id` int(9) unsigned NOT NULL,
  `case_id` int(9) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receipt
-- ----------------------------

-- ----------------------------
-- Table structure for rel_case_study_attachments
-- ----------------------------
DROP TABLE IF EXISTS `rel_case_study_attachments`;
CREATE TABLE `rel_case_study_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `case_study_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_case_study_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for rel_contact_category
-- ----------------------------
DROP TABLE IF EXISTS `rel_contact_category`;
CREATE TABLE `rel_contact_category` (
  `id_rel` int(11) NOT NULL AUTO_INCREMENT,
  `id_contact` int(9) unsigned NOT NULL,
  `id_category` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id_rel`),
  KEY `id_contact` (`id_contact`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `rel_contact_category_ibfk_1` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id`),
  CONSTRAINT `rel_contact_category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `contact_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_contact_category
-- ----------------------------
INSERT INTO `rel_contact_category` VALUES ('18', '1007', '10');
INSERT INTO `rel_contact_category` VALUES ('19', '1027', '8');
INSERT INTO `rel_contact_category` VALUES ('21', '1028', '12');
INSERT INTO `rel_contact_category` VALUES ('23', '1029', '9');
INSERT INTO `rel_contact_category` VALUES ('24', '647', '9');
INSERT INTO `rel_contact_category` VALUES ('25', '648', '9');
INSERT INTO `rel_contact_category` VALUES ('26', '685', '9');
INSERT INTO `rel_contact_category` VALUES ('28', '661', '16');
INSERT INTO `rel_contact_category` VALUES ('29', '1030', '9');
INSERT INTO `rel_contact_category` VALUES ('30', '1030', '20');
INSERT INTO `rel_contact_category` VALUES ('31', '773', '12');
INSERT INTO `rel_contact_category` VALUES ('32', '774', '12');
INSERT INTO `rel_contact_category` VALUES ('33', '775', '12');
INSERT INTO `rel_contact_category` VALUES ('34', '1031', '9');
INSERT INTO `rel_contact_category` VALUES ('35', '919', '25');
INSERT INTO `rel_contact_category` VALUES ('36', '841', '12');
INSERT INTO `rel_contact_category` VALUES ('37', '746', '22');
INSERT INTO `rel_contact_category` VALUES ('38', '174', '20');
INSERT INTO `rel_contact_category` VALUES ('39', '422', '16');
INSERT INTO `rel_contact_category` VALUES ('41', '769', '12');
INSERT INTO `rel_contact_category` VALUES ('42', '770', '12');
INSERT INTO `rel_contact_category` VALUES ('43', '771', '12');
INSERT INTO `rel_contact_category` VALUES ('44', '772', '12');
INSERT INTO `rel_contact_category` VALUES ('45', '776', '12');
INSERT INTO `rel_contact_category` VALUES ('46', '807', '34');
INSERT INTO `rel_contact_category` VALUES ('47', '808', '34');
INSERT INTO `rel_contact_category` VALUES ('48', '809', '34');
INSERT INTO `rel_contact_category` VALUES ('49', '810', '34');
INSERT INTO `rel_contact_category` VALUES ('50', '666', '17');
INSERT INTO `rel_contact_category` VALUES ('51', '666', '52');
INSERT INTO `rel_contact_category` VALUES ('52', '142', '17');
INSERT INTO `rel_contact_category` VALUES ('53', '142', '51');
INSERT INTO `rel_contact_category` VALUES ('54', '1032', '14');
INSERT INTO `rel_contact_category` VALUES ('56', '790', '9');
INSERT INTO `rel_contact_category` VALUES ('64', '786', '9');
INSERT INTO `rel_contact_category` VALUES ('72', '777', '12');
INSERT INTO `rel_contact_category` VALUES ('73', '778', '12');
INSERT INTO `rel_contact_category` VALUES ('75', '781', '12');
INSERT INTO `rel_contact_category` VALUES ('76', '782', '12');
INSERT INTO `rel_contact_category` VALUES ('77', '783', '12');
INSERT INTO `rel_contact_category` VALUES ('78', '784', '12');
INSERT INTO `rel_contact_category` VALUES ('79', '785', '12');
INSERT INTO `rel_contact_category` VALUES ('80', '882', '12');
INSERT INTO `rel_contact_category` VALUES ('81', '883', '12');
INSERT INTO `rel_contact_category` VALUES ('82', '884', '12');
INSERT INTO `rel_contact_category` VALUES ('83', '885', '12');
INSERT INTO `rel_contact_category` VALUES ('84', '886', '12');
INSERT INTO `rel_contact_category` VALUES ('85', '887', '12');
INSERT INTO `rel_contact_category` VALUES ('86', '888', '12');
INSERT INTO `rel_contact_category` VALUES ('87', '889', '12');
INSERT INTO `rel_contact_category` VALUES ('88', '890', '12');
INSERT INTO `rel_contact_category` VALUES ('89', '1034', '12');
INSERT INTO `rel_contact_category` VALUES ('90', '832', '8');
INSERT INTO `rel_contact_category` VALUES ('91', '819', '9');
INSERT INTO `rel_contact_category` VALUES ('92', '877', '28');
INSERT INTO `rel_contact_category` VALUES ('93', '878', '9');
INSERT INTO `rel_contact_category` VALUES ('94', '891', '9');
INSERT INTO `rel_contact_category` VALUES ('96', '6', '17');
INSERT INTO `rel_contact_category` VALUES ('97', '16', '17');
INSERT INTO `rel_contact_category` VALUES ('98', '18', '17');
INSERT INTO `rel_contact_category` VALUES ('100', '26', '17');
INSERT INTO `rel_contact_category` VALUES ('101', '27', '17');
INSERT INTO `rel_contact_category` VALUES ('102', '28', '17');
INSERT INTO `rel_contact_category` VALUES ('103', '30', '17');
INSERT INTO `rel_contact_category` VALUES ('104', '1000', '9');
INSERT INTO `rel_contact_category` VALUES ('105', '954', '8');
INSERT INTO `rel_contact_category` VALUES ('106', '954', '23');
INSERT INTO `rel_contact_category` VALUES ('107', '1001', '9');
INSERT INTO `rel_contact_category` VALUES ('109', '1004', '8');
INSERT INTO `rel_contact_category` VALUES ('111', '1005', '35');
INSERT INTO `rel_contact_category` VALUES ('113', '743', '12');
INSERT INTO `rel_contact_category` VALUES ('114', '999', '12');
INSERT INTO `rel_contact_category` VALUES ('115', '744', '12');
INSERT INTO `rel_contact_category` VALUES ('116', '745', '12');
INSERT INTO `rel_contact_category` VALUES ('117', '754', '12');
INSERT INTO `rel_contact_category` VALUES ('118', '1011', '12');
INSERT INTO `rel_contact_category` VALUES ('119', '1012', '12');
INSERT INTO `rel_contact_category` VALUES ('120', '1013', '12');
INSERT INTO `rel_contact_category` VALUES ('121', '1014', '12');
INSERT INTO `rel_contact_category` VALUES ('123', '1035', '24');
INSERT INTO `rel_contact_category` VALUES ('124', '847', '49');
INSERT INTO `rel_contact_category` VALUES ('125', '1036', '18');
INSERT INTO `rel_contact_category` VALUES ('129', '239', '17');

-- ----------------------------
-- Table structure for rel_department_designation
-- ----------------------------
DROP TABLE IF EXISTS `rel_department_designation`;
CREATE TABLE `rel_department_designation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned NOT NULL,
  `designation` varchar(255) NOT NULL,
  `parent_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_department_designation
-- ----------------------------
INSERT INTO `rel_department_designation` VALUES ('71', '1', 'Analista Administrativo', '74');
INSERT INTO `rel_department_designation` VALUES ('72', '1', 'Analista Contable', '74');
INSERT INTO `rel_department_designation` VALUES ('73', '1', 'Recepcionista', '74');
INSERT INTO `rel_department_designation` VALUES ('74', '1', 'Jefe de Administración', '75');
INSERT INTO `rel_department_designation` VALUES ('75', '1', 'Gerente de Administración', '0');
INSERT INTO `rel_department_designation` VALUES ('76', '2', 'Gerente de Recursos Humanos', '0');
INSERT INTO `rel_department_designation` VALUES ('77', '2', 'Jefe de Recursos Humanos', '76');
INSERT INTO `rel_department_designation` VALUES ('78', '2', 'Analista de Recursos Humanos', '77');
INSERT INTO `rel_department_designation` VALUES ('79', '3', 'Gerente de Sistemas', '0');
INSERT INTO `rel_department_designation` VALUES ('80', '3', 'Jefe de Soporte Técnico', '79');
INSERT INTO `rel_department_designation` VALUES ('81', '3', 'Jefe de Programación', '79');
INSERT INTO `rel_department_designation` VALUES ('82', '3', 'Programador', '81');
INSERT INTO `rel_department_designation` VALUES ('83', '3', 'Técnico', '80');
INSERT INTO `rel_department_designation` VALUES ('84', '4', 'Jefe de Almacén', '85');
INSERT INTO `rel_department_designation` VALUES ('85', '4', 'Gerente de Logística', '0');
INSERT INTO `rel_department_designation` VALUES ('86', '4', 'Jefe de Logística', '85');
INSERT INTO `rel_department_designation` VALUES ('87', '4', 'Almacenista', '84');
INSERT INTO `rel_department_designation` VALUES ('88', '4', 'Chofer', '86');
INSERT INTO `rel_department_designation` VALUES ('89', '4', 'Jefe de Compras', '85');
INSERT INTO `rel_department_designation` VALUES ('90', '4', 'Analista de Compras', '89');
INSERT INTO `rel_department_designation` VALUES ('91', '5', 'Gerente Comercial', '0');
INSERT INTO `rel_department_designation` VALUES ('92', '5', 'Gerente de Tienda', '0');
INSERT INTO `rel_department_designation` VALUES ('93', '5', 'Sub-Gerente de Tienda', '0');
INSERT INTO `rel_department_designation` VALUES ('94', '5', 'Gerente de Operaciones', '0');
INSERT INTO `rel_department_designation` VALUES ('95', '5', 'Asesor en Ventas', '0');
INSERT INTO `rel_department_designation` VALUES ('96', '5', 'Vendedor Comercial', '0');
INSERT INTO `rel_department_designation` VALUES ('97', '5', 'Jefe de Marca', '0');
INSERT INTO `rel_department_designation` VALUES ('98', '5', 'Especialista en Publicidad', '0');
INSERT INTO `rel_department_designation` VALUES ('102', '8', 'Jefe de Mantenimiento', '0');
INSERT INTO `rel_department_designation` VALUES ('103', '6', 'Gerente de Producción', '0');
INSERT INTO `rel_department_designation` VALUES ('104', '6', 'Jefe de Producción', '0');
INSERT INTO `rel_department_designation` VALUES ('105', '6', 'Jefe de Modelaje', '0');
INSERT INTO `rel_department_designation` VALUES ('106', '7', 'Director Ejecutivo', '0');
INSERT INTO `rel_department_designation` VALUES ('107', '7', 'Jefe DOFAT', '0');
INSERT INTO `rel_department_designation` VALUES ('108', '7', 'Director Administrativo', '0');

-- ----------------------------
-- Table structure for rel_document_files
-- ----------------------------
DROP TABLE IF EXISTS `rel_document_files`;
CREATE TABLE `rel_document_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `document_id` int(9) unsigned NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_document_files
-- ----------------------------

-- ----------------------------
-- Table structure for rel_fees_tax
-- ----------------------------
DROP TABLE IF EXISTS `rel_fees_tax`;
CREATE TABLE `rel_fees_tax` (
  `tax_id` int(9) unsigned NOT NULL,
  `fees_id` int(9) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_fees_tax
-- ----------------------------

-- ----------------------------
-- Table structure for rel_form_custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `rel_form_custom_fields`;
CREATE TABLE `rel_form_custom_fields` (
  `custom_field_id` int(9) unsigned NOT NULL,
  `reply` text NOT NULL,
  `table_id` int(9) unsigned NOT NULL,
  `form` int(9) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_form_custom_fields
-- ----------------------------
INSERT INTO `rel_form_custom_fields` VALUES ('1', '2017-10', '1', '101');
INSERT INTO `rel_form_custom_fields` VALUES ('1', '2017-10', '2', '101');
INSERT INTO `rel_form_custom_fields` VALUES ('10', 'Funciona', '5', '107');
INSERT INTO `rel_form_custom_fields` VALUES ('10', 'Funciona', '6', '107');
INSERT INTO `rel_form_custom_fields` VALUES ('10', 'Funciona', '7', '107');
INSERT INTO `rel_form_custom_fields` VALUES ('10', 'Funciona', '8', '107');
INSERT INTO `rel_form_custom_fields` VALUES ('10', 'Editando', '9', '107');
INSERT INTO `rel_form_custom_fields` VALUES ('1', '2017-10', '10', '101');
INSERT INTO `rel_form_custom_fields` VALUES ('2', '1234567890', '11', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('3', '1234567890', '11', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('4', 'J-00041093-3', '11', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('2', '12345', '12', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('3', '00-00112', '12', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('4', 'J-00041093-3', '12', '102');
INSERT INTO `rel_form_custom_fields` VALUES ('7', '2017-10', '13', '105');
INSERT INTO `rel_form_custom_fields` VALUES ('5', 'Abril', '14', '103');
INSERT INTO `rel_form_custom_fields` VALUES ('6', '2017-10', '15', '104');

-- ----------------------------
-- Table structure for rel_pub_campana_cliente
-- ----------------------------
DROP TABLE IF EXISTS `rel_pub_campana_cliente`;
CREATE TABLE `rel_pub_campana_cliente` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `campana_id` int(4) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_pub_campana_cliente
-- ----------------------------
INSERT INTO `rel_pub_campana_cliente` VALUES ('1', '1', '2');
INSERT INTO `rel_pub_campana_cliente` VALUES ('2', '2', '2');
INSERT INTO `rel_pub_campana_cliente` VALUES ('3', '3', '2');
INSERT INTO `rel_pub_campana_cliente` VALUES ('4', '4', '2');
INSERT INTO `rel_pub_campana_cliente` VALUES ('5', '5', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('6', '6', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('7', '7', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('8', '8', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('9', '9', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('10', '10', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('11', '11', '57');
INSERT INTO `rel_pub_campana_cliente` VALUES ('12', '12', '57');

-- ----------------------------
-- Table structure for rel_pub_medios_cliente
-- ----------------------------
DROP TABLE IF EXISTS `rel_pub_medios_cliente`;
CREATE TABLE `rel_pub_medios_cliente` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `medios_id` int(4) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_pub_medios_cliente
-- ----------------------------
INSERT INTO `rel_pub_medios_cliente` VALUES ('1', '1', '2');
INSERT INTO `rel_pub_medios_cliente` VALUES ('2', '2', '2');
INSERT INTO `rel_pub_medios_cliente` VALUES ('3', '3', '2');
INSERT INTO `rel_pub_medios_cliente` VALUES ('4', '4', '2');
INSERT INTO `rel_pub_medios_cliente` VALUES ('5', '5', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('6', '6', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('7', '7', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('8', '8', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('9', '9', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('10', '10', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('11', '11', '57');
INSERT INTO `rel_pub_medios_cliente` VALUES ('12', '12', '57');

-- ----------------------------
-- Table structure for rel_pub_pilares_cliente
-- ----------------------------
DROP TABLE IF EXISTS `rel_pub_pilares_cliente`;
CREATE TABLE `rel_pub_pilares_cliente` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pilares_id` int(4) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_pub_pilares_cliente
-- ----------------------------
INSERT INTO `rel_pub_pilares_cliente` VALUES ('1', '1', '2');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('2', '2', '2');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('3', '3', '2');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('4', '4', '2');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('5', '5', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('6', '6', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('7', '7', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('8', '8', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('9', '9', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('10', '10', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('11', '11', '57');
INSERT INTO `rel_pub_pilares_cliente` VALUES ('12', '12', '57');

-- ----------------------------
-- Table structure for rel_role_action
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_action`;
CREATE TABLE `rel_role_action` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(9) unsigned NOT NULL,
  `action_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_role_action
-- ----------------------------
INSERT INTO `rel_role_action` VALUES ('1', '4', '63');
INSERT INTO `rel_role_action` VALUES ('2', '4', '64');
INSERT INTO `rel_role_action` VALUES ('3', '4', '66');
INSERT INTO `rel_role_action` VALUES ('4', '4', '65');
INSERT INTO `rel_role_action` VALUES ('5', '4', '129');
INSERT INTO `rel_role_action` VALUES ('6', '4', '137');
INSERT INTO `rel_role_action` VALUES ('7', '4', '132');
INSERT INTO `rel_role_action` VALUES ('8', '4', '138');
INSERT INTO `rel_role_action` VALUES ('9', '4', '130');
INSERT INTO `rel_role_action` VALUES ('10', '4', '133');
INSERT INTO `rel_role_action` VALUES ('11', '4', '134');
INSERT INTO `rel_role_action` VALUES ('12', '4', '135');
INSERT INTO `rel_role_action` VALUES ('13', '4', '136');
INSERT INTO `rel_role_action` VALUES ('14', '4', '131');
INSERT INTO `rel_role_action` VALUES ('15', '4', '1');
INSERT INTO `rel_role_action` VALUES ('16', '4', '55');
INSERT INTO `rel_role_action` VALUES ('17', '4', '56');
INSERT INTO `rel_role_action` VALUES ('18', '4', '57');
INSERT INTO `rel_role_action` VALUES ('19', '4', '71');
INSERT INTO `rel_role_action` VALUES ('20', '4', '72');
INSERT INTO `rel_role_action` VALUES ('21', '4', '74');
INSERT INTO `rel_role_action` VALUES ('22', '4', '73');
INSERT INTO `rel_role_action` VALUES ('23', '4', '161');
INSERT INTO `rel_role_action` VALUES ('24', '4', '162');
INSERT INTO `rel_role_action` VALUES ('25', '4', '172');
INSERT INTO `rel_role_action` VALUES ('26', '4', '164');
INSERT INTO `rel_role_action` VALUES ('27', '4', '163');
INSERT INTO `rel_role_action` VALUES ('28', '4', '165');
INSERT INTO `rel_role_action` VALUES ('29', '4', '4');
INSERT INTO `rel_role_action` VALUES ('30', '4', '5');
INSERT INTO `rel_role_action` VALUES ('31', '4', '9');
INSERT INTO `rel_role_action` VALUES ('32', '4', '11');
INSERT INTO `rel_role_action` VALUES ('33', '4', '105');
INSERT INTO `rel_role_action` VALUES ('34', '4', '59');
INSERT INTO `rel_role_action` VALUES ('35', '4', '171');
INSERT INTO `rel_role_action` VALUES ('36', '4', '166');
INSERT INTO `rel_role_action` VALUES ('37', '4', '169');
INSERT INTO `rel_role_action` VALUES ('38', '4', '6');
INSERT INTO `rel_role_action` VALUES ('39', '4', '8');
INSERT INTO `rel_role_action` VALUES ('40', '4', '84');
INSERT INTO `rel_role_action` VALUES ('41', '4', '156');
INSERT INTO `rel_role_action` VALUES ('42', '4', '13');
INSERT INTO `rel_role_action` VALUES ('43', '4', '10');
INSERT INTO `rel_role_action` VALUES ('44', '4', '12');
INSERT INTO `rel_role_action` VALUES ('45', '4', '7');
INSERT INTO `rel_role_action` VALUES ('46', '4', '170');
INSERT INTO `rel_role_action` VALUES ('47', '4', '167');
INSERT INTO `rel_role_action` VALUES ('48', '4', '25');
INSERT INTO `rel_role_action` VALUES ('49', '4', '26');
INSERT INTO `rel_role_action` VALUES ('50', '4', '106');
INSERT INTO `rel_role_action` VALUES ('51', '4', '28');
INSERT INTO `rel_role_action` VALUES ('52', '4', '27');
INSERT INTO `rel_role_action` VALUES ('53', '4', '29');
INSERT INTO `rel_role_action` VALUES ('54', '4', '32');
INSERT INTO `rel_role_action` VALUES ('55', '4', '33');
INSERT INTO `rel_role_action` VALUES ('56', '4', '35');
INSERT INTO `rel_role_action` VALUES ('57', '4', '34');
INSERT INTO `rel_role_action` VALUES ('58', '4', '36');
INSERT INTO `rel_role_action` VALUES ('59', '4', '207');
INSERT INTO `rel_role_action` VALUES ('60', '4', '208');
INSERT INTO `rel_role_action` VALUES ('61', '4', '209');
INSERT INTO `rel_role_action` VALUES ('62', '4', '210');
INSERT INTO `rel_role_action` VALUES ('63', '4', '211');
INSERT INTO `rel_role_action` VALUES ('64', '4', '21');
INSERT INTO `rel_role_action` VALUES ('65', '4', '22');
INSERT INTO `rel_role_action` VALUES ('66', '4', '175');
INSERT INTO `rel_role_action` VALUES ('67', '4', '24');
INSERT INTO `rel_role_action` VALUES ('68', '4', '155');
INSERT INTO `rel_role_action` VALUES ('69', '4', '23');
INSERT INTO `rel_role_action` VALUES ('70', '4', '173');
INSERT INTO `rel_role_action` VALUES ('71', '4', '174');
INSERT INTO `rel_role_action` VALUES ('72', '4', '184');
INSERT INTO `rel_role_action` VALUES ('73', '4', '67');
INSERT INTO `rel_role_action` VALUES ('74', '4', '68');
INSERT INTO `rel_role_action` VALUES ('75', '4', '70');
INSERT INTO `rel_role_action` VALUES ('76', '4', '69');
INSERT INTO `rel_role_action` VALUES ('77', '4', '30');
INSERT INTO `rel_role_action` VALUES ('78', '4', '31');
INSERT INTO `rel_role_action` VALUES ('79', '4', '46');
INSERT INTO `rel_role_action` VALUES ('80', '4', '47');
INSERT INTO `rel_role_action` VALUES ('81', '4', '49');
INSERT INTO `rel_role_action` VALUES ('82', '4', '48');
INSERT INTO `rel_role_action` VALUES ('83', '4', '176');
INSERT INTO `rel_role_action` VALUES ('84', '4', '178');
INSERT INTO `rel_role_action` VALUES ('85', '4', '180');
INSERT INTO `rel_role_action` VALUES ('86', '4', '179');
INSERT INTO `rel_role_action` VALUES ('87', '4', '177');
INSERT INTO `rel_role_action` VALUES ('88', '4', '181');
INSERT INTO `rel_role_action` VALUES ('89', '4', '183');
INSERT INTO `rel_role_action` VALUES ('90', '4', '182');
INSERT INTO `rel_role_action` VALUES ('91', '4', '118');
INSERT INTO `rel_role_action` VALUES ('92', '4', '119');
INSERT INTO `rel_role_action` VALUES ('93', '4', '121');
INSERT INTO `rel_role_action` VALUES ('94', '4', '120');
INSERT INTO `rel_role_action` VALUES ('95', '4', '122');
INSERT INTO `rel_role_action` VALUES ('96', '4', '153');
INSERT INTO `rel_role_action` VALUES ('97', '4', '37');
INSERT INTO `rel_role_action` VALUES ('98', '4', '38');
INSERT INTO `rel_role_action` VALUES ('99', '4', '124');
INSERT INTO `rel_role_action` VALUES ('100', '4', '191');
INSERT INTO `rel_role_action` VALUES ('101', '4', '123');
INSERT INTO `rel_role_action` VALUES ('102', '4', '40');
INSERT INTO `rel_role_action` VALUES ('103', '4', '125');
INSERT INTO `rel_role_action` VALUES ('104', '4', '127');
INSERT INTO `rel_role_action` VALUES ('105', '4', '126');
INSERT INTO `rel_role_action` VALUES ('106', '4', '39');
INSERT INTO `rel_role_action` VALUES ('107', '4', '192');
INSERT INTO `rel_role_action` VALUES ('108', '4', '190');
INSERT INTO `rel_role_action` VALUES ('109', '4', '189');
INSERT INTO `rel_role_action` VALUES ('110', '4', '41');
INSERT INTO `rel_role_action` VALUES ('111', '4', '143');
INSERT INTO `rel_role_action` VALUES ('112', '4', '144');
INSERT INTO `rel_role_action` VALUES ('113', '4', '145');
INSERT INTO `rel_role_action` VALUES ('114', '4', '108');
INSERT INTO `rel_role_action` VALUES ('115', '4', '109');
INSERT INTO `rel_role_action` VALUES ('116', '4', '110');
INSERT INTO `rel_role_action` VALUES ('117', '4', '81');
INSERT INTO `rel_role_action` VALUES ('118', '4', '83');
INSERT INTO `rel_role_action` VALUES ('119', '4', '82');
INSERT INTO `rel_role_action` VALUES ('120', '4', '139');
INSERT INTO `rel_role_action` VALUES ('121', '4', '140');
INSERT INTO `rel_role_action` VALUES ('122', '4', '142');
INSERT INTO `rel_role_action` VALUES ('123', '4', '141');
INSERT INTO `rel_role_action` VALUES ('124', '4', '51');
INSERT INTO `rel_role_action` VALUES ('125', '4', '52');
INSERT INTO `rel_role_action` VALUES ('126', '4', '54');
INSERT INTO `rel_role_action` VALUES ('127', '4', '53');
INSERT INTO `rel_role_action` VALUES ('128', '4', '15');
INSERT INTO `rel_role_action` VALUES ('129', '4', '196');
INSERT INTO `rel_role_action` VALUES ('130', '4', '111');
INSERT INTO `rel_role_action` VALUES ('131', '4', '146');
INSERT INTO `rel_role_action` VALUES ('132', '4', '147');
INSERT INTO `rel_role_action` VALUES ('133', '4', '149');
INSERT INTO `rel_role_action` VALUES ('134', '4', '148');
INSERT INTO `rel_role_action` VALUES ('135', '4', '150');
INSERT INTO `rel_role_action` VALUES ('136', '4', '80');
INSERT INTO `rel_role_action` VALUES ('137', '4', '75');
INSERT INTO `rel_role_action` VALUES ('138', '4', '76');
INSERT INTO `rel_role_action` VALUES ('139', '4', '78');
INSERT INTO `rel_role_action` VALUES ('140', '4', '77');
INSERT INTO `rel_role_action` VALUES ('141', '4', '50');
INSERT INTO `rel_role_action` VALUES ('142', '4', '14');
INSERT INTO `rel_role_action` VALUES ('143', '4', '79');
INSERT INTO `rel_role_action` VALUES ('144', '4', '112');
INSERT INTO `rel_role_action` VALUES ('145', '4', '186');
INSERT INTO `rel_role_action` VALUES ('146', '4', '113');
INSERT INTO `rel_role_action` VALUES ('147', '4', '117');
INSERT INTO `rel_role_action` VALUES ('148', '4', '116');
INSERT INTO `rel_role_action` VALUES ('149', '4', '114');
INSERT INTO `rel_role_action` VALUES ('150', '4', '194');
INSERT INTO `rel_role_action` VALUES ('151', '4', '185');
INSERT INTO `rel_role_action` VALUES ('152', '4', '152');
INSERT INTO `rel_role_action` VALUES ('153', '4', '188');
INSERT INTO `rel_role_action` VALUES ('154', '4', '115');
INSERT INTO `rel_role_action` VALUES ('155', '4', '157');
INSERT INTO `rel_role_action` VALUES ('156', '4', '158');
INSERT INTO `rel_role_action` VALUES ('157', '4', '160');
INSERT INTO `rel_role_action` VALUES ('158', '4', '159');
INSERT INTO `rel_role_action` VALUES ('159', '4', '9999');
INSERT INTO `rel_role_action` VALUES ('160', '4', '16');
INSERT INTO `rel_role_action` VALUES ('161', '4', '17');
INSERT INTO `rel_role_action` VALUES ('162', '4', '20');
INSERT INTO `rel_role_action` VALUES ('163', '4', '18');
INSERT INTO `rel_role_action` VALUES ('164', '4', '107');
INSERT INTO `rel_role_action` VALUES ('165', '4', '19');
INSERT INTO `rel_role_action` VALUES ('166', '4', '42');
INSERT INTO `rel_role_action` VALUES ('167', '4', '43');
INSERT INTO `rel_role_action` VALUES ('168', '4', '45');
INSERT INTO `rel_role_action` VALUES ('169', '4', '44');
INSERT INTO `rel_role_action` VALUES ('170', '4', '219');
INSERT INTO `rel_role_action` VALUES ('171', '4', '214');
INSERT INTO `rel_role_action` VALUES ('172', '4', '218');
INSERT INTO `rel_role_action` VALUES ('173', '4', '217');
INSERT INTO `rel_role_action` VALUES ('174', '4', '216');
INSERT INTO `rel_role_action` VALUES ('175', '4', '215');
INSERT INTO `rel_role_action` VALUES ('176', '3', '1');
INSERT INTO `rel_role_action` VALUES ('177', '5', '1');
INSERT INTO `rel_role_action` VALUES ('178', '5', '25');
INSERT INTO `rel_role_action` VALUES ('179', '5', '26');
INSERT INTO `rel_role_action` VALUES ('180', '5', '106');
INSERT INTO `rel_role_action` VALUES ('181', '5', '28');
INSERT INTO `rel_role_action` VALUES ('182', '5', '27');
INSERT INTO `rel_role_action` VALUES ('183', '5', '29');
INSERT INTO `rel_role_action` VALUES ('184', '5', '21');
INSERT INTO `rel_role_action` VALUES ('185', '5', '22');
INSERT INTO `rel_role_action` VALUES ('186', '5', '24');
INSERT INTO `rel_role_action` VALUES ('187', '5', '155');
INSERT INTO `rel_role_action` VALUES ('188', '5', '23');
INSERT INTO `rel_role_action` VALUES ('189', '5', '184');
INSERT INTO `rel_role_action` VALUES ('190', '5', '143');
INSERT INTO `rel_role_action` VALUES ('191', '5', '144');
INSERT INTO `rel_role_action` VALUES ('192', '5', '145');
INSERT INTO `rel_role_action` VALUES ('193', '5', '15');
INSERT INTO `rel_role_action` VALUES ('194', '5', '196');
INSERT INTO `rel_role_action` VALUES ('195', '5', '111');
INSERT INTO `rel_role_action` VALUES ('196', '5', '146');
INSERT INTO `rel_role_action` VALUES ('197', '5', '147');
INSERT INTO `rel_role_action` VALUES ('198', '5', '149');
INSERT INTO `rel_role_action` VALUES ('199', '5', '148');
INSERT INTO `rel_role_action` VALUES ('200', '5', '150');
INSERT INTO `rel_role_action` VALUES ('201', '5', '219');
INSERT INTO `rel_role_action` VALUES ('202', '5', '214');
INSERT INTO `rel_role_action` VALUES ('203', '5', '218');
INSERT INTO `rel_role_action` VALUES ('204', '5', '217');
INSERT INTO `rel_role_action` VALUES ('205', '5', '216');
INSERT INTO `rel_role_action` VALUES ('206', '5', '215');
INSERT INTO `rel_role_action` VALUES ('207', '7', '1');
INSERT INTO `rel_role_action` VALUES ('208', '7', '4');
INSERT INTO `rel_role_action` VALUES ('209', '7', '5');
INSERT INTO `rel_role_action` VALUES ('210', '7', '9');
INSERT INTO `rel_role_action` VALUES ('211', '7', '11');
INSERT INTO `rel_role_action` VALUES ('212', '7', '105');
INSERT INTO `rel_role_action` VALUES ('213', '7', '59');
INSERT INTO `rel_role_action` VALUES ('214', '7', '171');
INSERT INTO `rel_role_action` VALUES ('215', '7', '166');
INSERT INTO `rel_role_action` VALUES ('216', '7', '169');
INSERT INTO `rel_role_action` VALUES ('217', '7', '6');
INSERT INTO `rel_role_action` VALUES ('218', '7', '8');
INSERT INTO `rel_role_action` VALUES ('219', '7', '84');
INSERT INTO `rel_role_action` VALUES ('220', '7', '156');
INSERT INTO `rel_role_action` VALUES ('221', '7', '13');
INSERT INTO `rel_role_action` VALUES ('222', '7', '10');
INSERT INTO `rel_role_action` VALUES ('223', '7', '12');
INSERT INTO `rel_role_action` VALUES ('224', '7', '7');
INSERT INTO `rel_role_action` VALUES ('225', '7', '170');
INSERT INTO `rel_role_action` VALUES ('226', '7', '167');
INSERT INTO `rel_role_action` VALUES ('227', '7', '21');
INSERT INTO `rel_role_action` VALUES ('228', '7', '22');
INSERT INTO `rel_role_action` VALUES ('229', '7', '155');
INSERT INTO `rel_role_action` VALUES ('230', '7', '23');
INSERT INTO `rel_role_action` VALUES ('231', '7', '15');
INSERT INTO `rel_role_action` VALUES ('232', '7', '196');
INSERT INTO `rel_role_action` VALUES ('233', '7', '111');
INSERT INTO `rel_role_action` VALUES ('234', '7', '146');
INSERT INTO `rel_role_action` VALUES ('235', '7', '150');
INSERT INTO `rel_role_action` VALUES ('236', '7', '112');
INSERT INTO `rel_role_action` VALUES ('237', '7', '186');
INSERT INTO `rel_role_action` VALUES ('238', '7', '113');
INSERT INTO `rel_role_action` VALUES ('239', '7', '117');
INSERT INTO `rel_role_action` VALUES ('240', '7', '116');
INSERT INTO `rel_role_action` VALUES ('241', '7', '114');
INSERT INTO `rel_role_action` VALUES ('242', '7', '194');
INSERT INTO `rel_role_action` VALUES ('243', '7', '185');
INSERT INTO `rel_role_action` VALUES ('244', '7', '152');
INSERT INTO `rel_role_action` VALUES ('245', '7', '188');
INSERT INTO `rel_role_action` VALUES ('246', '7', '115');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
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
  `invoice_no` int(10) NOT NULL DEFAULT '1',
  `exp_cal_events` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'AOMS', 'GECC.png', '1', 'Caracas', '+58(212)242.62.11', 'soporte@gecc.com.ve', '0', 'm/d/y', 'America/Caracas', 'smtp.gmail.com', 'scammarano@gmail.com', '13308720sc', '465', '00:00:00', '1', '1');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Sin Procesar', '');
INSERT INTO `status` VALUES ('2', 'Procesado', '');
INSERT INTO `status` VALUES ('3', 'Anulado', '');
INSERT INTO `status` VALUES ('4', '', '');
INSERT INTO `status` VALUES ('5', '', '');
INSERT INTO `status` VALUES ('6', '', '');
INSERT INTO `status` VALUES ('7', '', '');
INSERT INTO `status` VALUES ('8', '', '');
INSERT INTO `status` VALUES ('9', 'Borrado', '');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `case_id` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `due_date` date NOT NULL,
  `progress` varchar(255) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `id_empresa` varchar(255) NOT NULL,
  `creacion` varchar(255) DEFAULT NULL,
  `vencimiento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks
-- ----------------------------

-- ----------------------------
-- Table structure for task_assigned
-- ----------------------------
DROP TABLE IF EXISTS `task_assigned`;
CREATE TABLE `task_assigned` (
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_assigned
-- ----------------------------

-- ----------------------------
-- Table structure for task_comments
-- ----------------------------
DROP TABLE IF EXISTS `task_comments`;
CREATE TABLE `task_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `comment_by` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tax
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percent` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax
-- ----------------------------

-- ----------------------------
-- Table structure for to_do_list
-- ----------------------------
DROP TABLE IF EXISTS `to_do_list`;
CREATE TABLE `to_do_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of to_do_list
-- ----------------------------
INSERT INTO `to_do_list` VALUES ('1', 'cosas q hacer marianella', 'prueba', '2017-07-30', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `extension` int(11) NOT NULL,
  `address` text NOT NULL,
  `user_role` int(10) NOT NULL,
  `user_type` int(10) NOT NULL,
  `token` varchar(255) NOT NULL,
  `client_case_alert` int(10) NOT NULL DEFAULT '1',
  `department_id` int(10) unsigned NOT NULL,
  `empresa_id` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `visitable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '0', 'Administrador', '', 'admin', '07b9ef4762aaa5fc88a20c3e27a67c0d6045a018', '', '0000-00-00', 'scammarano@gmail.com', '', '0', '', '1', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('2', '0', 'Il Merletto', '', 'ilmerletto@dmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2017-07-30', 'ilmerletto@dmail.com', '02517131111', '0', '', '2', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('3', '0', 'Martha Morante', '', 'martha.morante@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-09-11', 'martha.morante@benhur.com.ve', '02122426211', '1417', '', '4', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('4', '0', 'Marianella Borges', '', 'marianella.borges@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-07-02', 'marianella.borges@ferradini.com.ve', '02517131111', '0', '', '7', '0', '', '1', '0', '[\"21\"]', '1', '0');
INSERT INTO `users` VALUES ('5', '0', 'Marisol Valderrama', '', 'marisol.valderrama@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '2017-07-03', 'marisol.valderrama@benhur.com.ve', '04143332222', '0', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"6\",\"7\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '0');
INSERT INTO `users` VALUES ('6', '0', 'Salvatore Cammarano', '', 'salvatore.cammarano@ferradini.com.ve', '9199059a80dcdcb06097784f63c22d70383104ad', 'Male', '1978-12-06', 'salvatore.cammarano@ferradini.com.ve', '04143238051', '1414', '', '4', '0', 'expired', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"9991\",\"9992\",\"2\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('7', '0', 'Edith Lopez', '', 'edilopsa25@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Female', '2017-03-25', 'edilopsa25@gmail.com', '04129065321', '1409', '', '1', '0', '', '1', '0', '', '1', '1');
INSERT INTO `users` VALUES ('8', '0', 'Eglee Heredia', '', 'eglee.heredia@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '1968-01-16', 'eglee.heredia@benhur.com.ve', '04242705713', '1410', '', '4', '0', '', '1', '0', '[\"4\",\"5\",\"6\",\"7\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('9', '0', 'Rony Gomez', '', 'rony.gomez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2017-07-14', 'rony.gomez@ferradini.com.ve', '04143332222', '1415', '', '7', '0', '', '1', '0', '[\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('10', '0', 'Cesar Aponte', '', 'cesar.aponte@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '1977-07-30', 'cesar.aponte@benhur.com.ve', '04128233794', '1406', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('11', '0', 'Carlos Valero', '', 'kilordpepo', '7157d8989295534fc48a9fce47c7891166ec64bb', 'Male', '1995-03-09', 'kilordpepo@gmail.com', '04149151275', '0', 'Terrazas Del Avila\r\nApt 11-C', '4', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('14', '0', 'Garry Bruno', '', 'gjbm', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2018-03-28', 'garryjrbruno@hotmail.com', '04123352179', '0', 'Caricuao', '4', '0', '', '1', '0', '[\"17\"]', '1', '0');
INSERT INTO `users` VALUES ('27', '0', 'Gianfranco Verrochi', '', 'gianf', '74de6975f42a2a5892c9ff01b73750dc3969dfd2', 'Male', '1994-03-27', 'gianfrancoverrocchi@gmail.com', '04241294050', '0', '--', '4', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('28', '0', 'Rosangela Cammarano', '', 'rosangela.cammarano@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '1974-05-03', 'rosangela.cammarano@benhur.com.ve', '04242317982', '1405', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('29', '0', 'Ulisse Ciaravella', '', 'ulisse.ciaravella@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'ulisse.ciaravella@benhur.com.ve', '', '1402', '', '5', '0', '', '1', '0', '', '1', '1');
INSERT INTO `users` VALUES ('30', '0', 'Lucio Cammarano', '', 'lucio.cammarano@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '1969-02-15', 'lucio.cammarano@benhur.com.ve', '04141262435', '1301', '', '5', '0', '', '1', '0', '[\"4\"]', '1', '1');
INSERT INTO `users` VALUES ('31', '0', 'Alessandro Ciaravella', '', 'alessandro.ciaravella@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'alessandro.ciaravella@benhur.com.ve', '', '1202', '', '5', '0', '', '1', '0', '', '1', '1');
INSERT INTO `users` VALUES ('32', '0', 'Stefano Ciaravella', '', 'stefano.ciaravella@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'stefano.ciaravella@benhur.com.ve', '', '3000', '', '5', '0', '', '1', '0', '', '1', '1');
INSERT INTO `users` VALUES ('33', '0', 'Gloria La Cruz', '', 'gloria.lacruz@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'gloria.lacruz@ferradini.com.ve', '-', '1408', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('34', '0', 'Irma Oses', '', 'irma.oses@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'irma.oses@benhur.com.ve', '', '1411', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('35', '0', 'Esteban Velasquez', '', 'esteban.velasquez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'esteban.velasquez@ferradini.com.ve', '', '1419', '', '5', '0', '', '1', '0', '', '1', '1');
INSERT INTO `users` VALUES ('36', '0', 'Margarita De Lange', '', 'margarita.delange@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'margarita.delange@benhur.com.ve', '', '1418', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('37', '0', 'Jimmy Salas', '', 'jimmy.salas@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'jimmy.salas@benhur.com.ve', '', '1407', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('38', '0', 'Julio Perales', '', 'julio.perales@benhur.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'julio.perales@benhur.com.ve', '', '1303', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('39', '0', 'Ma Coromoto Hidalgo', '', 'coromoto.hidalgo@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'coromoto.hidalgo@ferradini.com.ve', '-', '0', '', '7', '0', '', '1', '0', '[\"16\"]', '1', '0');
INSERT INTO `users` VALUES ('40', '0', 'Ana Gabriela Gomez', '', 'anagabriela.gomez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'anagabriela.gomez@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"16\"]', '1', '0');
INSERT INTO `users` VALUES ('41', '0', 'Marisol Fernandez', '', 'marisol.fernandez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'marisol.fernandez@ferradini.com.ve', '0', '0', '', '7', '0', '', '1', '0', '[\"17\"]', '1', '0');
INSERT INTO `users` VALUES ('42', '0', 'Sujei Martinez', '', 'sujei.martinez', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'sujei.martinez', '', '0', '', '7', '0', '', '1', '0', '[\"17\"]', '1', '0');
INSERT INTO `users` VALUES ('43', '0', 'Miguelina Rodriguez', '', 'miguelina.rodriguez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'miguelina.rodriguez@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"18\"]', '1', '0');
INSERT INTO `users` VALUES ('44', '0', 'Ana Teresa Gutierrez', '', 'ana.gutierrez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'ana.gutierrez@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"18\"]', '1', '0');
INSERT INTO `users` VALUES ('45', '0', 'Suyhin Marcano', '', 'suyhin.marcano@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'suyhin.marcano@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"20\"]', '1', '0');
INSERT INTO `users` VALUES ('46', '0', 'Gabriela Zerpa', '', 'gabriela.zerpa@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'gabriela.zerpa@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"20\"]', '1', '0');
INSERT INTO `users` VALUES ('47', '0', 'Joselith Perez', '', 'joselith.perez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'joselith.perez@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"21\"]', '1', '0');
INSERT INTO `users` VALUES ('48', '0', 'Rosibel Galavis', '', 'rosibel.galavis@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'rosibel.galavis@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"22\"]', '1', '0');
INSERT INTO `users` VALUES ('49', '0', 'Ydix Espinoza', '', 'ydix.espinoza@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'ydix.espinoza@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"22\"]', '1', '0');
INSERT INTO `users` VALUES ('50', '0', 'Noelia Garcia', '', 'noelia.garcia@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'noelia.garcia@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"24\"]', '1', '0');
INSERT INTO `users` VALUES ('51', '0', 'Morayma Guerra', '', 'morayma.guerra@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '0000-00-00', 'morayma.guerra@ferradini.com.ve', '', '0', '', '7', '0', '', '1', '0', '[\"24\"]', '1', '0');
INSERT INTO `users` VALUES ('52', '0', 'Kender Robles', '', '', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', '', '', '0', '', '5', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('53', '0', 'Gabriel Sanchez', '', 'gabriel.sanchez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '0000-00-00', 'gabriel.sanchez@ferradini.com.ve', '', '0', '', '5', '0', '', '1', '0', '[\"4\",\"5\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"6\",\"7\",\"8\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '1', '1');
INSERT INTO `users` VALUES ('54', '0', 'pedro perez', '', 'pedro.perez@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Male', '2017-09-22', 'pedro.perez@ferradini.com.ve', '-', '0', '-', '4', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('55', '0', 'Homero Manrique', '', 'hachedavid', '2afbe692d2735776b9e5ef7c40b2a7a9f43b3213', 'Male', '1993-10-13', 'hdms26@gmail.com', '04125977223', '0', 'Los Teques', '4', '0', '', '1', '0', '', '1', '0');
INSERT INTO `users` VALUES ('56', '0', 'Paola Rigio', '', 'paola.rigio@ferradini.com.ve', '7c222fb2927d828af22f592134e8932480637c0d', 'Female', '1996-10-11', 'paola.rigio@ferradini.com.ve', '0412', '0', '', '7', '0', '', '1', '0', 'false', '1', '0');
INSERT INTO `users` VALUES ('57', '0', 'Ferradini', '', '', '', '', '0000-00-00', '', '', '0', '', '2', '0', '', '1', '0', '', '1', '0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', 'Admin', 'Admin Have All Rights');
INSERT INTO `user_role` VALUES ('2', 'Clients', 'Clients Have Default Permission');
INSERT INTO `user_role` VALUES ('3', 'Usuario Restringido', 'Usuario Restringido');
INSERT INTO `user_role` VALUES ('4', 'Usuario igual q Admin', 'Usuario Con Privilegios');
INSERT INTO `user_role` VALUES ('5', 'Recepcion', '');
INSERT INTO `user_role` VALUES ('6', 'Gerente', 'Jefe de Departamento');
INSERT INTO `user_role` VALUES ('7', 'Gerente de Tienda', '');

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `badge` int(9) NOT NULL,
  `contact_id` int(9) unsigned NOT NULL,
  `motive` varchar(255) NOT NULL,
  `date_time_in` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text NOT NULL,
  `is_closed` int(10) NOT NULL DEFAULT '0',
  `date_time_out` datetime DEFAULT NULL,
  `user_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitors
-- ----------------------------
INSERT INTO `visitors` VALUES ('1', '11', '1031', '', '2017-10-09 16:15:39', '', '1', '2017-10-09 16:17:17', '30');
INSERT INTO `visitors` VALUES ('2', '12', '969', '', '2017-10-09 16:16:46', '', '1', '2017-10-09 17:09:23', '31');
INSERT INTO `visitors` VALUES ('3', '11', '13', '', '2017-10-09 16:19:20', '', '1', '2017-10-09 16:21:00', '8');
INSERT INTO `visitors` VALUES ('4', '11', '12', '', '2017-10-10 18:57:18', '', '1', '2017-10-10 18:57:36', '33');
INSERT INTO `visitors` VALUES ('5', '11', '847', 'DE TRBAJO', '2017-10-11 15:43:02', '', '1', '2017-10-11 16:50:18', '6');
INSERT INTO `visitors` VALUES ('6', '11', '353', 'Trabajo', '2017-10-13 08:49:41', '', '1', '2017-10-13 08:59:45', '6');
INSERT INTO `visitors` VALUES ('7', '11', '847', 'TRABAJO', '2017-10-18 11:00:21', '', '1', '2017-10-18 11:09:44', '6');
INSERT INTO `visitors` VALUES ('8', '11', '847', '', '2017-10-18 14:55:21', '', '1', '2017-10-18 14:58:24', '8');
INSERT INTO `visitors` VALUES ('9', '12', '377', '', '2017-10-18 14:57:32', '', '1', '2017-10-18 14:58:39', '8');
INSERT INTO `visitors` VALUES ('10', '12', '314', 'MANTENIMIENTO FOTOCOPIADORA', '2017-10-20 07:31:47', '', '1', '2017-10-20 13:09:38', '6');
INSERT INTO `visitors` VALUES ('11', '13', '1035', 'MANTENIMIENTO DE IMPRESORAS', '2017-10-20 08:29:16', '', '1', '2017-10-20 10:01:58', '6');
INSERT INTO `visitors` VALUES ('12', '11', '373', 'PERSONAL', '2017-10-23 12:36:00', '', '1', '2017-10-23 12:39:53', '36');
INSERT INTO `visitors` VALUES ('13', '11', '1036', 'TRABAJO', '2017-10-24 14:34:51', '', '1', '2017-10-25 07:37:55', '6');
INSERT INTO `visitors` VALUES ('14', '11', '585', 'TRABAJO', '2017-10-25 09:32:41', '', '1', '2017-10-25 10:09:36', '30');

-- ----------------------------
-- Table structure for visitor_badges
-- ----------------------------
DROP TABLE IF EXISTS `visitor_badges`;
CREATE TABLE `visitor_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgenumber` text,
  `userid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_in_use` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor_badges
-- ----------------------------
INSERT INTO `visitor_badges` VALUES ('1', '900000101', '187', 'VISITANTE 901', '4019237', '0', '0');
INSERT INTO `visitor_badges` VALUES ('2', '900000201', '307', 'VISITANTE 902', '3999314', '0', '0');
INSERT INTO `visitor_badges` VALUES ('3', '900000301', '308', 'VISITANTE 903', '4134934', '0', '0');
INSERT INTO `visitor_badges` VALUES ('4', '900000401', '309', 'VISITANTE 904', '4033375', '0', '0');
INSERT INTO `visitor_badges` VALUES ('5', '900000501', '310', 'VISITANTE 905', '4040038', '0', '0');
INSERT INTO `visitor_badges` VALUES ('6', '900000601', '311', 'VISITANTE 906', '4035744', '0', '0');
INSERT INTO `visitor_badges` VALUES ('7', '900000701', '312', 'VISITANTE 907', '4483069', '0', '0');
INSERT INTO `visitor_badges` VALUES ('8', '900000801', '313', 'VISITANTE 908', '', '0', '0');
INSERT INTO `visitor_badges` VALUES ('9', '900000901', '314', 'VISITANTE 909', '4035905', '0', '0');
INSERT INTO `visitor_badges` VALUES ('10', '900001001', '315', 'VISITANTE 910', '4039481', '0', '0');
INSERT INTO `visitor_badges` VALUES ('11', '900001101', '316', 'VISITANTE 911', '4039366', '1', '0');
INSERT INTO `visitor_badges` VALUES ('12', '900001201', '317', 'VISITANTE 912', '4032097', '1', '0');
INSERT INTO `visitor_badges` VALUES ('13', '900001301', '318', 'VISITANTE 913', '4036351', '1', '0');
INSERT INTO `visitor_badges` VALUES ('14', '900001401', '319', 'VISITANTE 914', '4047546', '1', '0');
INSERT INTO `visitor_badges` VALUES ('15', '900001501', '320', 'VISITANTE 915', '4046419', '1', '0');
INSERT INTO `visitor_badges` VALUES ('16', '900001601', '321', 'VISITANTE 916', '4052145', '0', '0');
INSERT INTO `visitor_badges` VALUES ('17', '900001701', '322', 'VISITANTE 917', '3987212', '0', '0');
INSERT INTO `visitor_badges` VALUES ('18', '900001801', '323', 'VISITANTE 918', '4066426', '0', '0');
INSERT INTO `visitor_badges` VALUES ('19', '900001901', '324', 'VISITANTE 919', '4050841', '0', '0');
INSERT INTO `visitor_badges` VALUES ('20', '900002001', '325', 'VISITANTE 920', '4062551', '0', '0');

-- ----------------------------
-- View structure for v_calendario
-- ----------------------------
DROP VIEW IF EXISTS `v_calendario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_calendario` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`due_date` AS `due_date`,'TASK' AS `TASK` from `tasks` `t` union select `td`.`id` AS `id`,`td`.`title` AS `title`,`td`.`date` AS `date`,'TO_DO' AS `TO_DO` from `to_do_list` `td` where (`td`.`date` >= sysdate()) union select `h`.`id` AS `id`,`h`.`name` AS `name`,`h`.`date` AS `date`,'HOLIDAY' AS `HOLIDAY` from `holidays` `h` where (`h`.`date` >= sysdate()) union select `ap`.`id` AS `id`,('CITA ' or (`ap`.`title` <> 0)) AS `'CITA '||ap.title`,cast(`ap`.`date_time` as date) AS `DATE(ap.date_time)`,'CITA' AS `CITA` from `appointments` `ap` where (`ap`.`date_time` >= sysdate()) ; ;

-- ----------------------------
-- View structure for v_calendario_copy
-- ----------------------------
DROP VIEW IF EXISTS `v_calendario_copy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_calendario_copy` AS SELECT
	`t`.`id` AS `id`,
	`t`.`name` AS `name`,
	`t`.`due_date` AS `due_date`,
	'TASK' AS `TASK`
FROM
	`tasks` `t`
UNION
	SELECT
		`e`.`id` AS `id`,
		`e`.`name` AS `name`,
		`e`.`dob` AS `due_date`,
		'BIRTH_E' AS `BIRTH_E`
	FROM
		`users` `e`
  WHERE
e.`status` = 1 AND
month(dob)=month(NOW())
			UNION
	SELECT
		`td`.`id` AS `id`,
		`td`.`title` AS `title`,
		`td`.`date` AS `date`,
		'TO_DO' AS `TO_DO`
	FROM
		`to_do_list` `td`
	WHERE
		(`td`.`date` >= sysdate())
	UNION
		SELECT
			`h`.`id` AS `id`,
			`h`.`name` AS `name`,
			`h`.`date` AS `date`,
			'HOLIDAY' AS `HOLIDAY`
		FROM
			`holidays` `h`
		WHERE
			(`h`.`date` >= sysdate())
		UNION
			SELECT
				`ap`.`id` AS `id`,
				('CITA ' OR(`ap`.`title` <> 0)) AS `'CITA '||ap.title`,
				cast(`ap`.`date_time` AS date) AS `DATE(ap.date_time)`,
				'CITA' AS `CITA`
			FROM
				`appointments` `ap`
			WHERE
				(
					`ap`.`date_time` >= sysdate()
				) ;

-- ----------------------------
-- View structure for v_clientes
-- ----------------------------
DROP VIEW IF EXISTS `v_clientes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_clientes` AS SELECT
users.id,
users.`name`
FROM
users
WHERE
users.user_role = 2 ;

-- ----------------------------
-- View structure for v_contactos
-- ----------------------------
DROP VIEW IF EXISTS `v_contactos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_contactos` AS select `c`.`id` AS `id`,`c`.`name` AS `name`,`c`.`contact` AS `contact`,`c`.`email` AS `email`,`c`.`address` AS `address`,`c`.`phone1` AS `phone1`,`c`.`phone2` AS `phone2`,`c`.`phone3` AS `phone3`,`c`.`phone4` AS `phone4`,`F_CONTACT_CATEGORIES`(`c`.`id`) AS `categoria`,`c`.`company` AS `company`,`c`.`department` AS `department` from `contacts` `c` ; ;

-- ----------------------------
-- View structure for v_pub_agentes
-- ----------------------------
DROP VIEW IF EXISTS `v_pub_agentes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_pub_agentes` AS SELECT
empresa_usuario.id_usuario,
empresa_usuario.principal,
empresa_usuario.id_departamento,
users.id,
users.employee_id,
users.`name`
FROM
empresa_usuario
INNER JOIN users ON users.id = empresa_usuario.id_usuario
WHERE
empresa_usuario.id_cargo = 98 AND
users.`status` = 1 ;

-- ----------------------------
-- View structure for v_pub_pilares_cliente
-- ----------------------------
DROP VIEW IF EXISTS `v_pub_pilares_cliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_pub_pilares_cliente` AS SELECT
rel_pub_pilares_cliente.id,
rel_pub_pilares_cliente.pilares_id,
rel_pub_pilares_cliente.cliente_id,
pub_pilares.`name` AS PILAR,
v_clientes.`name` AS CLIENTE
FROM
rel_pub_pilares_cliente
INNER JOIN pub_pilares ON rel_pub_pilares_cliente.pilares_id = pub_pilares.id
INNER JOIN v_clientes ON rel_pub_pilares_cliente.cliente_id = v_clientes.id ;

-- ----------------------------
-- View structure for v_tareas_asignadas
-- ----------------------------
DROP VIEW IF EXISTS `v_tareas_asignadas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_tareas_asignadas` AS select `t`.`id` AS `id_tarea`,`u`.`name` AS `name` from ((`tasks` `t` join `task_assigned` `ta`) join `users` `u`) where ((`t`.`id` = `ta`.`task_id`) and (`u`.`id` = `ta`.`user_id`)) ; ;

-- ----------------------------
-- View structure for v_visitors_registro
-- ----------------------------
DROP VIEW IF EXISTS `v_visitors_registro`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_visitors_registro` AS SELECT
visitors.id,
visitors.contact_id,
contacts.`name` as Visitante,
visitors.date_time_in,
visitors.motive,
visitors.date_time_out,
visitors.user_id,
users.`name` as Visitado
FROM
visitors
INNER JOIN users ON users.id = visitors.user_id
INNER JOIN contacts ON contacts.id = visitors.contact_id ;

