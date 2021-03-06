CREATE TABLE IF NOT EXISTS `altasib_support_category` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `RESPONSIBLE_USER_ID` int(18) DEFAULT NULL,
  `USE_DEFAULT` char(1) NOT NULL DEFAULT 'N',
  `NOT_CLOSE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `RESPONSIBLE_USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_client2clientworker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `WORKER_USER_ID` int(18) NOT NULL,
  `R_VIEW` char(1) NOT NULL DEFAULT 'N',
  `R_ANSWER` char(1) NOT NULL DEFAULT 'N',
  `R_CREATE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_file_2_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` int(18) NOT NULL DEFAULT '0',
  `FILE_ID` int(18) NOT NULL DEFAULT '0',
  `TICKET_ID` int(18) NOT NULL DEFAULT '0',
  `HASH` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_MESSAGE_ID` (`MESSAGE_ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_sla` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `SORT` int(11) NOT NULL,
  `RESPONSE_TIME` int(11) NOT NULL,
  `NOTICE_TIME` int(11) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `CREATED_USER_ID` int(11) NOT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `MODIFIED_USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_sla_group` (
  `SLA_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS `altasib_support_status` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '500',
  `SKIP` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_MESSAGE_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_USER_ID` int(11) NOT NULL,
  `LAST_MESSAGE_BY_SUPPORT` char(1) NOT NULL DEFAULT 'N',
  `IS_CLOSE` char(1) NOT NULL DEFAULT 'N',
  `DATE_CLOSE` datetime DEFAULT NULL,
  `OWNER_USER_ID` int(11) DEFAULT NULL,
  `CREATED_USER_ID` int(18) DEFAULT NULL,
  `MODIFIED_USER_ID` int(11) DEFAULT NULL,
  `RESPONSIBLE_USER_ID` int(11) DEFAULT NULL,
  `CATEGORY_ID` int(18) DEFAULT NULL,
  `PRIORITY_ID` int(18) DEFAULT NULL,
  `STATUS_ID` int(18) DEFAULT NULL,
  `SLA_ID` int(11) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `MESSAGE` text NOT NULL,
  `GROUP_ID` int(18) DEFAULT NULL,
  `TASK_ID` int(18) DEFAULT NULL,
  `DEAL_ID` int(18) DEFAULT NULL,
  `PROJECT_ID` int(18) DEFAULT NULL,
  `IS_OVERDUE` char(1) NOT NULL DEFAULT 'N',
  `IS_NOTIFY_SEND` char(1) NOT NULL DEFAULT 'N',
  `IS_DEFERRED` char(1) NOT NULL DEFAULT 'N',
  `COMMENT` text NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_ticket_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DATE_CREATE` datetime DEFAULT NULL,
  `TICKET_ID` int(11) NOT NULL DEFAULT '0',
  `IS_HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `IS_LOG` char(1) NOT NULL DEFAULT 'N',
  `MESSAGE` longtext,
  `CREATED_USER_ID` int(18) DEFAULT NULL,
  `MODIFIED_USER_ID` int(18) DEFAULT NULL,
  `ELAPSED_TIME` int(11) NOT NULL DEFAULT '0',
  `PAID` char(1) NOT NULL DEFAULT 'N',
  `TYPE_TIME_ID` int(18) DEFAULT NULL,
  `REPORT_ID` int(18) DEFAULT NULL,
  `COST` int(11) DEFAULT NULL,
  `PRIME_COST` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TICKET_ID` (`TICKET_ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_worker2client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `CLIENT_USER_ID` int(18) NOT NULL,
  `R_VIEW` char(1) NOT NULL DEFAULT 'N',
  `R_ANSWER` char(1) NOT NULL DEFAULT 'N',
  `R_CHANGE_A` char(1) NOT NULL DEFAULT 'N',
  `R_CHANGE_R` char(1) NOT NULL DEFAULT 'N',
  `R_CHANGE_S` char(1) NOT NULL DEFAULT 'N',
  `R_CHANGE_P` char(1) NOT NULL DEFAULT 'N',
  `R_CHANGE_C` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_ticket_member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `TICKET_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_quick_response` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `SORT` INT( 11 ) NOT NULL DEFAULT  '100',
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_ticket_message_read` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TICKET_ID` int(11) NOT NULL,
  `LAST_MESSAGE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `READ_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `altasib_support_ticket_message_favorite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TICKET_ID` int(18) NOT NULL,
  `MESSAGE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`)
);