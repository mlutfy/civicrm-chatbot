-- +--------------------------------------------------------------------+
-- | CiviCRM version 4.7                                                |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2018                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from schema.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--


-- +--------------------------------------------------------------------+
-- | CiviCRM version 4.7                                                |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2018                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from drop.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--
-- /*******************************************************
-- *
-- * Clean up the exisiting tables
-- *
-- *******************************************************/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `civicrm_chat_user`;
DROP TABLE IF EXISTS `civicrm_chat_hear`;
DROP TABLE IF EXISTS `civicrm_chat_conversation_type`;
DROP TABLE IF EXISTS `civicrm_chat_cache`;

SET FOREIGN_KEY_CHECKS=1;
-- /*******************************************************
-- *
-- * Create new tables
-- *
-- *******************************************************/

-- /*******************************************************
-- *
-- * civicrm_chat_cache
-- *
-- * FIXME
-- *
-- *******************************************************/
CREATE TABLE `civicrm_chat_cache` (


     `id` int unsigned NOT NULL AUTO_INCREMENT  COMMENT 'Unique ChatCache ID',
     `identifier` varchar(255) NOT NULL   ,
     `value` text NOT NULL   ,
     `expires` datetime NOT NULL    
,
        PRIMARY KEY (`id`)
 
    ,     UNIQUE INDEX `index_identifier`(
        identifier
  )
  ,     INDEX `expires_key`(
        expires
  )
  
 
)    ;

-- /*******************************************************
-- *
-- * civicrm_chat_conversation_type
-- *
-- *******************************************************/
CREATE TABLE `civicrm_chat_conversation_type` (


     `id` int unsigned NOT NULL AUTO_INCREMENT  ,
     `name` varchar(255) NOT NULL   ,
     `timeout` int    COMMENT 'Timeout in minutes for this conversation type' 
,
        PRIMARY KEY (`id`)
 
 
 
)    ;

-- /*******************************************************
-- *
-- * civicrm_chat_hear
-- *
-- * FIXME
-- *
-- *******************************************************/
CREATE TABLE `civicrm_chat_hear` (


     `id` int unsigned NOT NULL AUTO_INCREMENT  COMMENT 'Unique ChatHear ID',
     `chat_conversation_type_id` int unsigned    COMMENT 'FK to Contact',
     `text` varchar(255)     
,
        PRIMARY KEY (`id`)
 
 
,          CONSTRAINT FK_civicrm_chat_hear_chat_conversation_type_id FOREIGN KEY (`chat_conversation_type_id`) REFERENCES `civicrm_chat_conversation_type`(`id`) ON DELETE CASCADE  
)    ;

-- /*******************************************************
-- *
-- * civicrm_chat_user
-- *
-- * Connects chat service user accounts to contacts
-- *
-- *******************************************************/
CREATE TABLE `civicrm_chat_user` (


     `id` int unsigned NOT NULL AUTO_INCREMENT  COMMENT 'Unique ID',
     `contact_id` int unsigned NOT NULL   COMMENT 'FK to Contact',
     `service` varchar(255) NOT NULL   COMMENT 'Service that the user account belongs to',
     `user_id` varchar(255) NOT NULL   COMMENT 'User identifier' 
,
        PRIMARY KEY (`id`)
 
    ,     INDEX `index_service`(
        service
  )
  ,     INDEX `index_user_id`(
        user_id
  )
  
,          CONSTRAINT FK_civicrm_chat_user_contact_id FOREIGN KEY (`contact_id`) REFERENCES `civicrm_contact`(`id`) ON DELETE CASCADE  
)    ;

 