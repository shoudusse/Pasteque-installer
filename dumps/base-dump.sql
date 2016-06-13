-- MySQL dump 10.15  Distrib 10.0.24-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: pasteque-db    Database: pasteque
-- ------------------------------------------------------
-- Server version	5.5.49-MariaDB-1ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APPLICATIONS`
--

DROP TABLE IF EXISTS `APPLICATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATIONS` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VERSION` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATIONS`
--

LOCK TABLES `APPLICATIONS` WRITE;
/*!40000 ALTER TABLE `APPLICATIONS` DISABLE KEYS */;
INSERT INTO `APPLICATIONS` VALUES ('pasteque','Pasteque','6');
/*!40000 ALTER TABLE `APPLICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTE`
--

DROP TABLE IF EXISTS `ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTE` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTE`
--

LOCK TABLES `ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTEINSTANCE`
--

DROP TABLE IF EXISTS `ATTRIBUTEINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTEINSTANCE` (
  `ID` varchar(255) NOT NULL,
  `ATTRIBUTESETINSTANCE_ID` varchar(255) NOT NULL,
  `ATTRIBUTE_ID` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ATTINST_SET` (`ATTRIBUTESETINSTANCE_ID`),
  KEY `ATTINST_ATT` (`ATTRIBUTE_ID`),
  CONSTRAINT `ATTINST_SET` FOREIGN KEY (`ATTRIBUTESETINSTANCE_ID`) REFERENCES `ATTRIBUTESETINSTANCE` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `ATTINST_ATT` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `ATTRIBUTE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTEINSTANCE`
--

LOCK TABLES `ATTRIBUTEINSTANCE` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTEINSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTEINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTESET`
--

DROP TABLE IF EXISTS `ATTRIBUTESET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTESET` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTESET`
--

LOCK TABLES `ATTRIBUTESET` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTESET` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTESET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTESETINSTANCE`
--

DROP TABLE IF EXISTS `ATTRIBUTESETINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTESETINSTANCE` (
  `ID` varchar(255) NOT NULL,
  `ATTRIBUTESET_ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ATTSETINST_SET` (`ATTRIBUTESET_ID`),
  CONSTRAINT `ATTSETINST_SET` FOREIGN KEY (`ATTRIBUTESET_ID`) REFERENCES `ATTRIBUTESET` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTESETINSTANCE`
--

LOCK TABLES `ATTRIBUTESETINSTANCE` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTESETINSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTESETINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTEUSE`
--

DROP TABLE IF EXISTS `ATTRIBUTEUSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTEUSE` (
  `ID` varchar(255) NOT NULL,
  `ATTRIBUTESET_ID` varchar(255) NOT NULL,
  `ATTRIBUTE_ID` varchar(255) NOT NULL,
  `LINENO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ATTUSE_LINE` (`ATTRIBUTESET_ID`,`LINENO`),
  KEY `ATTUSE_ATT` (`ATTRIBUTE_ID`),
  CONSTRAINT `ATTUSE_SET` FOREIGN KEY (`ATTRIBUTESET_ID`) REFERENCES `ATTRIBUTESET` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `ATTUSE_ATT` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `ATTRIBUTE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTEUSE`
--

LOCK TABLES `ATTRIBUTEUSE` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTEUSE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTEUSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTRIBUTEVALUE`
--

DROP TABLE IF EXISTS `ATTRIBUTEVALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTRIBUTEVALUE` (
  `ID` varchar(255) NOT NULL,
  `ATTRIBUTE_ID` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ATTVAL_ATT` (`ATTRIBUTE_ID`),
  CONSTRAINT `ATTVAL_ATT` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `ATTRIBUTE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTRIBUTEVALUE`
--

LOCK TABLES `ATTRIBUTEVALUE` WRITE;
/*!40000 ALTER TABLE `ATTRIBUTEVALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTRIBUTEVALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CASHREGISTERS`
--

DROP TABLE IF EXISTS `CASHREGISTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CASHREGISTERS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `LOCATION_ID` varchar(255) NOT NULL,
  `NEXTTICKETID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `CASHREGISTER_FK_LOCATION` (`LOCATION_ID`),
  CONSTRAINT `CASHREGISTER_FK_LOCATION` FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATIONS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CASHREGISTERS`
--

LOCK TABLES `CASHREGISTERS` WRITE;
/*!40000 ALTER TABLE `CASHREGISTERS` DISABLE KEYS */;
INSERT INTO `CASHREGISTERS` VALUES (1,'Caisse','0',1);
/*!40000 ALTER TABLE `CASHREGISTERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIES`
--

DROP TABLE IF EXISTS `CATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIES` (
  `ID` varchar(255) NOT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PARENTID` varchar(255) DEFAULT NULL,
  `IMAGE` mediumblob,
  `DISPORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CATEGORIES_NAME_INX` (`NAME`),
  KEY `CATEGORIES_FK_1` (`PARENTID`),
  CONSTRAINT `CATEGORIES_FK_1` FOREIGN KEY (`PARENTID`) REFERENCES `CATEGORIES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIES`
--

LOCK TABLES `CATEGORIES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` VALUES ('-1',NULL,'Pré-paiement',NULL,NULL,NULL),('0',NULL,'Formules',NULL,NULL,NULL),('000',NULL,'Catégorie standard',NULL,NULL,NULL);
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLOSEDCASH`
--

DROP TABLE IF EXISTS `CLOSEDCASH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLOSEDCASH` (
  `MONEY` varchar(255) NOT NULL,
  `CASHREGISTER_ID` int(11) NOT NULL,
  `HOSTSEQUENCE` int(11) NOT NULL,
  `DATESTART` datetime DEFAULT NULL,
  `DATEEND` datetime DEFAULT NULL,
  `OPENCASH` double DEFAULT NULL,
  `CLOSECASH` double DEFAULT NULL,
  `EXPECTEDCASH` double DEFAULT NULL,
  PRIMARY KEY (`MONEY`),
  UNIQUE KEY `CLOSEDCASH_INX_SEQ` (`CASHREGISTER_ID`,`HOSTSEQUENCE`),
  KEY `CLOSEDCASH_INX_1` (`DATESTART`),
  CONSTRAINT `CLOSEDCASH_FK_CASHREGISTER` FOREIGN KEY (`CASHREGISTER_ID`) REFERENCES `CASHREGISTERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLOSEDCASH`
--

LOCK TABLES `CLOSEDCASH` WRITE;
/*!40000 ALTER TABLE `CLOSEDCASH` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLOSEDCASH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURRENCIES`
--

DROP TABLE IF EXISTS `CURRENCIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURRENCIES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SYMBOL` varchar(10) DEFAULT NULL,
  `DECIMALSEP` varchar(1) DEFAULT NULL,
  `THOUSANDSSEP` varchar(1) DEFAULT NULL,
  `RATE` double NOT NULL DEFAULT '1',
  `FORMAT` varchar(20) NOT NULL DEFAULT '#0.00 $',
  `MAIN` bit(1) NOT NULL,
  `ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURRENCIES`
--

LOCK TABLES `CURRENCIES` WRITE;
/*!40000 ALTER TABLE `CURRENCIES` DISABLE KEYS */;
INSERT INTO `CURRENCIES` VALUES (1,'Euro','€',',',' ',1,'#,##0.00$','','');
/*!40000 ALTER TABLE `CURRENCIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMERS` (
  `ID` varchar(255) NOT NULL,
  `SEARCHKEY` varchar(255) DEFAULT NULL,
  `TAXID` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `TAXCATEGORY` varchar(255) DEFAULT NULL,
  `DISCOUNTPROFILE_ID` int(11) DEFAULT NULL,
  `TARIFFAREA_ID` int(11) DEFAULT NULL,
  `CARD` varchar(255) DEFAULT NULL,
  `MAXDEBT` double NOT NULL DEFAULT '0',
  `ADDRESS` varchar(255) DEFAULT NULL,
  `ADDRESS2` varchar(255) DEFAULT NULL,
  `POSTAL` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `REGION` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `PHONE2` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `NOTES` text,
  `VISIBLE` bit(1) NOT NULL DEFAULT b'1',
  `CURDATE` datetime DEFAULT NULL,
  `CURDEBT` double DEFAULT NULL,
  `PREPAID` double NOT NULL DEFAULT '0',
  `EXPIREDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CUSTOMERS_SKEY_INX` (`SEARCHKEY`),
  KEY `CUSTOMERS_TAXCAT` (`TAXCATEGORY`),
  KEY `CUSTOMERS_DISCOUNTPROFILE` (`DISCOUNTPROFILE_ID`),
  KEY `CUSTOMERS_TARIFFAREA` (`TARIFFAREA_ID`),
  KEY `CUSTOMERS_TAXID_INX` (`TAXID`),
  KEY `CUSTOMERS_NAME_INX` (`NAME`),
  KEY `CUSTOMERS_CARD_INX` (`CARD`),
  CONSTRAINT `CUSTOMERS_TAXCAT` FOREIGN KEY (`TAXCATEGORY`) REFERENCES `TAXCUSTCATEGORIES` (`ID`),
  CONSTRAINT `CUSTOMERS_DISCOUNTPROFILE` FOREIGN KEY (`DISCOUNTPROFILE_ID`) REFERENCES `DISCOUNTPROFILES` (`ID`),
  CONSTRAINT `CUSTOMERS_TARIFFAREA` FOREIGN KEY (`TARIFFAREA_ID`) REFERENCES `TARIFFAREAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISCOUNTPROFILES`
--

DROP TABLE IF EXISTS `DISCOUNTPROFILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISCOUNTPROFILES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `RATE` double NOT NULL,
  `DISPORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISCOUNTPROFILES`
--

LOCK TABLES `DISCOUNTPROFILES` WRITE;
/*!40000 ALTER TABLE `DISCOUNTPROFILES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DISCOUNTPROFILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISCOUNTS`
--

DROP TABLE IF EXISTS `DISCOUNTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISCOUNTS` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `STARTDATE` date NOT NULL,
  `ENDDATE` date NOT NULL,
  `RATE` double DEFAULT NULL,
  `BARCODE` varchar(21) NOT NULL,
  `BARCODETYPE` int(4) DEFAULT NULL,
  `DISPORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISCOUNTS`
--

LOCK TABLES `DISCOUNTS` WRITE;
/*!40000 ALTER TABLE `DISCOUNTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DISCOUNTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLOORS`
--

DROP TABLE IF EXISTS `FLOORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLOORS` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IMAGE` mediumblob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FLOORS_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLOORS`
--

LOCK TABLES `FLOORS` WRITE;
/*!40000 ALTER TABLE `FLOORS` DISABLE KEYS */;
INSERT INTO `FLOORS` VALUES ('0','Salle','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\05���\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0�IDATx��	x�u�{\n�J��F @� 	.��Q�(K��ț�=��xƞ(���2N�O���7�l\'��$�yy�\'3����D��Rl)-Y�$��v� Hp@+Ab��pq{����o�E�\r��۵uuW���9u\na�A\'�t�I\'�t�I�����褓N:餓N:i\0�I\'�t�I\'�t�I�N:餓N:餓N\Z\0u�I\'�t�I\'�t�\0��N:餓N:餓@�t�I\'�t�I\'�4\0ꤓN:餓N:�P\'�t�I\'�t�I\'\r�:餓N:餓N:i\0�I\'�t�I\'�t�I�N:餓N:餓N\Z\0u�I\'�t�I\'�t�\0��N:餓N:餓@�t�I\'�t�I\'\r�:餓N:餓N:i\0�I\'�t�I\'�t�)S��>��ꤓN:%!���X?�u�)�s8�Ik\0u�I\'�t�I\'��X�\0��N:餓N:��RF2��O���j�@���#{n�	Qk��C���|伴������UF$\'�Ą�k�6��=U}S��υ�d.�,�9�Z�X�<�&6��-~Ř����1�Vl�����o��L.�������cJ�H�Ř�GS�����b޹`S6R^k��1F����3t��9&�:1m����ρ�GL:3¹���rD�帶�u�딹^��O2/w.Y�&�m{~�=˝/���9ϫ%�NA�l߰M�.�&2�1L*����Re�CY�t�j�`z�R�褓NQI�~Y�N:��������[����ߍ�_o��4f6\0a�?s�3��ǦW}l�G5O�[\\S��KR�,a\0��.�.\0���Y�P������(Z�^VX%P�_	�ū��/-*�V\n�v�k��K(�yS�	d��&�k��5u�%U��Ik����i1q�pR4�l\r�]�dת(�B15���4�\Z>\Z7�@E�\"j�����p�����ߦ�&�\'&F�_&��a|�6������M�o���ء��߅���v|��<&��E�,Q\0�cз.���_c��U�k���	ꖯ��^UT;[ C%&��4�@ �%LA�x�����*#2��8^���O�ne��NJ�c!������2?�iu�ʓ�-��ؠ��P%�\Z{n ��m�@���Ҟ�V���B����bs	��X?�z��<�� �X�];��R�-�Α��0�\Z�.(?/�G��@����G#��/�\\_�Xb�}`��Ǐ4^��1�͞/�%�|�~��#��~1�����Sk�\Z8�9��CkF���E��z1�?�9��fff���^B�\'n�\r��>��9�o�������޽k�#����%�* �����o[\r�k��R��n7���Y���;\r�\Z5��@^]2����Т\Z*\0��@�w�H�\'Z��4��7$��*$Ý��A�2��!�0vH�ƌk \0�4hW��1s��\"/�W7�}tt��F���7�x������ݹ��?!P����\\���|Y͆͵w��ջ� �D}S���e��@�$\r�х@  O8!0!\"\n�F)�\n�?�\\\'A$�;㻈��@X�<��(&�4i>A �h��Z�EkgՎ��@���@�i e М?/���A�\r04x}]oߕu��������)w�2\Z\0%!��������֪�����?M5��/2��\"�)�E1�\r�b@�!0x�!��h�T�vӵ\',)�����@ 0��HAP\"*���\0e>ge?��$B �^ �e�\r���ƿ�TBqq%LN�AWw���W��@�X�#1���@��0�	a�B�F����[@1�����ʜ�oEYÆ�>\r�Ͷl�%�BĈ���5e��C��H�<H�.7�/����J�%�0��8Dfa�E�\'�9��`��!��i�l߱���O��$�������Y���?a�3�H2��>`,t .����\"Ċ܂R���6)1kя��>n{��Y]����I��j���aff��1|�<WXu�������R�\0�5f1�ˍ�sOq~���o����F�>��4��5�Z�&�y.�إ5�Ah�u+�.h�����j7?���ifS��@N�1��,hِ�&���\'�%�	�?��9ρ��&��Isj�\\j�|�����?P�֋&��5�jA�z�	��{fF��n���5p�����{�1v�m玏��%5�@��/q\0d��7��r+Bi��� �^�0d�g�)iH��\n�[T�t�]\Z�B  R�g\r�|�6�@(��@�`&�\"8�(O��@p��C�`�@���$\Zy�2�������]u��UG��Su���;v|l�r��}5�U�:b&1%u+8�1>���ʇ�t��a_�1�� ��dM�#&���x>����O4/�Ɔ��m�ˈ�D\r�\"��d,]�����ط�iH�g!�\"Bby��q$R��ր��Gj��+B�����;���?r}�qFY��Cd9�Q��\"��H}��-~C_��:\'��\'\'/2a䥎Q���!ԉe��o�|�^;\"�M�G�#��\"�VY�u�%�=�k`;Wj�L��l����?ۜ�����-((�-��5wž~�رZ�8�;Z��\0\0�>2��o=������7�j�����\rˋVpļB� 4���MC��#a�� \\C [��@P����@�;�KD>A x�@�|�@��5\n�8��[4�G(V�ZM�Z�edd>��=Q����w��L�z�+w��e���>��K;�8��\r۾y�@L�QC��@\r�a�@1�`p!�-��B8����@��4�H��Ԁ@��u������y�^��/:�����#*j\04!S����Y�����M�ְב��!��X2�C	�XC���@!�\n�/�|�@��	arDJ!��W���J��\Z��@ R�y��ʅ捻`y�ʻb�p�/�Z?0 P�\\��s_�gY^郟��[P]����\'B(!����n�i\\���@�AQ�.!� 	�H!\"IS����i��!%��L�� ��@��g�9�\r\r[����5��GbXL��<�����e��?�oAI�r��N���\"�UNC�_��Z���ع�@�\n�7D~A HB @�4s�:�A ���Y��!PlL��$!�������\Z�{��v��h@�=1�bA �&�9����������*����]�!�@��/\Z�4�z�� �ԃ@P�(����@��@.ع�@�\0B�Ϛ4�\Z>\\�\n/�GD�y�HX�$s��T���՛��>�&4��{v�k\0��ܯ�]R�|�c��9Y��\0�\Z�J��!K-���!PJ�ť�R��A x�@o����\n�� D)�@�9��?\n	\"A�s	����ݽ_QQkh\r�Ú�K\0���.x�31���+W� TB�X?d 4j9�g�:�%\0�(2H����R�H�TB%�Α���\ZѮ�x�7&�,B� 15��u��ca��d����O|zחm>\"p}��!P6���@\r�\n E	a	@ �,�kD�>fr��� <@ �_n��^I�@Ѽ,DԹK���ꚡ��rG$�ץ	�-k�<T�ց��[>��@ $eC�$y%4F!��C B\n ��YC``�����I���;\"Ϊe��@��Ϣ\'i4L��k�Ann��1��x�,\0|pk��M�W���7��C���c�\n�z�3�!PC e����@�_�<\"6\\J@���\n@]\nC (�@�4i� �C �:��@�k �7y�8���tX۸���c�+�==�#\r�;ʖUݽ링���/��C��y��� !PT(���t!��_�eb�A (�@�В�@p���� ��떸��n ��/J��dC����s��^��	j\r� ��(7�\0�j7\Z_[óp�\0X�����Gw~b��ALC��@���}�@/��!P�)���ݜ Z���]F�@ Q�\'��eW׺�@��4�յɄ@�1=B;�A�X�Jcepii����^�\0�޵�!([V���B��-�4��G�j\Z5�\r�4p��@H*�� \\B���\n��4D�B R�.����@����[ ##�V.�@��J\n��jY{7D ���WBJA����AA��©����O�R��B �	A1\"�.!�-ܹ�-�(�/�}����ffd�ʕ덏-KIز� =-��\";m$y۴�!�(]K������@���D�A �\0��!D�,[�ə\"�  �E\n�Ý�8{�����\'��*|8�\r���k!/oY��c/n^\n\0xWC��u�U��v\r�\Z=\r�\Z��@�V� <C h�B�ۀ��B�cNd��\n3�{�����v���\'\Z�X}�&�Kk�`\ZBiݻ�\\��E�-z[!,�\Z��@H1D�@��ti���@i/ ��A�GM\Ze�(���~y�@�b�a��&D���K�!��>��Le\0�cm�f(-\\.y\Z��jʨ�@QL]��!p�C �A\r\"� $!9ЌXF\n���F�bt�IC��c�\"���I��@H*�ۏZ��n4>$��o\0l��t��-%t�\Z5j���|�@H>��P��CԄ ���C\r�\0j�B+�=i�\\B��� �\0��7tv� 0?�����<�4ژ�\0���b]Me�*�����]��^c�!0yd�h\r��K\0A\Z�B\\B �C���\rI�@\0��L��	�/�!�����a��-`�|����u�P�i\"�\rb��V*B Na��p���4z�@�!�	�d�9P��� ��B�� �.5i�!<B r\r��B�x�#�b�U@ಢr��/��iT�J\0XZ\\P���b�J�A ���+�n��2�@E�y#�!0��a�@������@v^o��A ���\"�!PUe��4\r�2��Y������\"������*+W�)�R	\0�n\\��/I�@�v��FB� 4���MC��#a��|�@�v���Bh!�=D!7pG�G݅d�A x�@�����VCZZ���>�2S\0�l�m��֢B#�����C -�!PC��@z.(��UC b���\'D!�@Q��8\"(�X%D	C�\0�%�(����ە����,()�0>�M\0�Z^��dY~)��J��@�<(�B�HY(��,bO�v�`\r�K!t��C ��|M�%�� $!q!���m��Z�`!����Յ�������\'�J�\\\0_\r�\0�k�� dC��\n�  P�l��@~~/0�!PC`�!�	�(\n� ����,Tw`^���O(P�(�Ja,.�4���ѧQP��Υ�_��qA�����w+�,���!�q�Q�H3ׄ	d~�Β�~Q�r�A BĞ��(�Or}ľPK����`�蔩�6~�sWQ��O�/�����D�pO��	Ѽ��#�Y�cm��҂�q����\\u�sX����Ǟ��ֹ�()(�������p݉�Ɣ�X �n�qK&k	VM��g�>��/H�b;bLl11����Z,���E�R��9��{���iP��d��H�ؑ����s��o���l�8��O���q������/=�է�,ԙh�R�e�y-瞸����v�?B\ZWZ�lu.�i��:�־�ۛ��s�m��s�%�/#_�0������S>f����\\�_�N���-��9�n�{/~4#=\n�a�����OW�\n����5�u�@��O\Z݀��@u�䕷w��]8r�e����#Q�@�	��{��V�����_��@��d!�VO�!�Q�G<{���C�����j�8���&�*�s� l���@�(A�;�|���@����@v��f�g�eB��`�T��e�\0�	��ՍՕ�+c4��0�0���������]/�� �u��9K-���`�ɀ���ʟP�~��`\0o&�g���c$�3g��js0)�so�9�V�䚃��`���{��?<f�?4߹���fe���/	��C,s*��S��9�k�E�|�:��O��,��	�o�y����P^���8������L�5���*\Z�Y^5�n4}dM��fE�@XxkA*4�b�����u@�~kM Wŝ�5�eu�aj�M�枼��n�F�w��z��O�ZR�@Ir�ߦ	�o5��[�i�=	M �FR�	�k�x�@0�h��T������#_B.`j����X��K�&�}������\0�u���?�g��+�JVQ  �TSt� P<_ nn�S��I��c��}� �|���n��ˏ��=��+\0.!T^?�\"\n�\0����\0��@ Y�G�:<ׄ!�L�PQ\rQ�@ �_~A�c��C�\\^\Z��gBnn!���\\;r=\0Tm�,_V�0�6[�t�&�f7[�Q���Lk�K>��`ٸ�0��P�:��;?w\"z�����~�ұjpվ����4?�����2S�B�`�A�fN%�]��\n�9��6Ș��\n��s��Z�̌)�V�:�ͤ^̩\"�����/O��Mfo����%��{\r��{��˔{O����]f|����J\r`VfFVQa^Gs�&�}�\"�@����qp�m���<�x��B˭��5Sӓ�����5��[е���mcݦv�&PV��!XM x-���ĵm��S�\\|��w�۲��������wt���iM���@�����%h��h�C�5�`YC��	h�/�n5��_���� PFh����	$j�d%��u�\\i���i��������HOO����*+-m��X��Z����J۪	��k�k`|�S5�z�4��$`��h�s�`y�hY^�\" �2���~��==-�g�!�L/x��xNO;F\0���b�4I�/ߊ��yq@�C\0xz����HS[g_ӕ���l�w0?\'B�	�\"���F�X[��\0����9|]������ݗ�:\Z��ieY���⚮��~��|��Sۻ/W����n?f�A���p��5�{�?�!iF}��~��1�<~���������o�y}EӠ�ñ�������K��L�L���SRP>���\'N�@�����\':�X�|������u������~�2f_~�wbe\Z퍘�����?��;�X�|YUǮ����q���}7�a��+�Nl����]��� C`\"|�?�����}v��۱�\"�O��-GJ�K?z�c\'�PiZϿ����/_����<���^��;{�b����d婕��;>��\'D ����������ȍ�?~������?_Q^7(�D�������\0!prr<�L��C7C*;P��dZSW���7�V����̜�A\"���\Z\0�V�\\/�����Λc�(`I\05��~���]���Ĵ�f͋�ǭ�x�k���H˝���K-GN��G��j�.�H�B�*�Iۖ�a�^~���j�ō��{����x�g�1�H���熟���#��Jh��j�p�@�^����\'���3\r����&�w�����q\Z��S<��o�~��O����@�Jj���	������큚<��O�����AX4M�������O��q\Z���٫�ύ�{��޿��v�����@{2�?���}���uuw��Ս�߇�N��h�c�lX���[�0NbWC\\��x�@�0 ���3�]�_d���LKg\'�66���wM ��ḏ�8�Q&N&���?�RA�J����B�c����\n�@�]C��	L����w7w�w� Ik�\n��h��VF���{�:i��5	a���>�x\Zzn]��N��f����?X�O��01��F?�3t���������!�Go}����`�h�߽t���X�ٓ��;/�Ɏ�gK�����Ӈ�����~����!其���{���[�~#��[3�<�x�v��GO�|�}�{�}��c\"�g�H�����]�q���cH9۱��������ǆo�P�]�D2>����fS{�D6~(�?���l��W;6DJvܚ�������\'p�R~�mHj�׋y�q�8�߲2�lA5��9Yy��@�S�M\0v���K=�Z�\0�����������F6�#��g_��H/���=��\Z���k�¥	�+�Nw(cX�x�\\���K�}�\n+Ej5��L�q�����R\Z�����ӧx��w�=@:�X��Dq~�\\_cm4�c��+�����N��|j�\\���s/D6sm^v��ƕw,�g��J�h}5�H�Gұ5�~��Xr�0F�?{��ݿ���yAV�gz���G����	�1�,֬���+��8s�}Ü[b��K���Imp���w/�E���u\'��J��gxt�$v_�g*�^������|s0Cd�\r��i>1>5�{�ڇ�I�ڇ?��K;?B\n�b��jy}�����=;�=�&��ɚ�5���¼�1�@�ҩ	�풀�ءY����i�n�_���l���>I��	k������v�G�&�\\��[f�\\��h`f\n��)�b&�:�������t>�m*v�[����A��`8�S�	��7-����UⰔ��N��g�V_�����{̞��km����̀Ǹ	Ӝ�w��=�����������S��7���Sh�ٗ����yw!�ٻ?��һ?�������K��� p���Ɵ����w��� �p�r.��?r��Z*��;~�����v|<���x�0�[M�W\Zhx&��Æ@�m_��V�֝���}㙅�G^h{z{ya� m)��s�:Ƨ|Ye����3�y��g����7�\Z�l���\Zh\0D�X.\n�������ɾM=��^N����<�?�k���v��p��oê���Wm�6�^�>����������?�`�������o��L�S��SSSU����z�@\0�-�Y��32�@�&����4�	�l�ߝ;b���{y��v�7���d[-�|7��\rgWQ���6��4c�7q3l���G�l����������׌�/�[W�.-(����w�s��V�\0s�+���V�n�4�Yg�3t�a�ݻ�#m�7���d˚=�k��k1uef5AÍ�vH���\\��#�����>���ab�5 N���K�����O���H�gO��t_�sא�OW�:���C��4��i���C����Ǫ��]�2����;>�̾M;e.W�_:���_~ƀCs^����9��!��Zn׆ĮH��\'N!�9�d2������0�-f楙���9�0v��Q\'�=��qi���Ai���(=j\Z���-�X�����ei��FL���X��(�ݘ{#2�_/\Z,Z�&PM�@+<�.����W��e��b�g�I��3��v�1�]�\0������z�kO}ɢe��{ހ�2��SW�i~hNs�Lw����{U�A��K	������e�e1�c�__��C����Ǣ�f�uZ4���Ƶ.)(�\Z_�� �T����N���`�\\l^lKukN�YX��6y�{R*[V�Ѻno�\\./����b�6^�X�����z����6����@�\0�5��X�!�����=zR\",;d| �X\Z�m�d�&�΅XZ\\�e�/m�szZ:L��\Z05%\0�BP�H��/�x�ZGݵ�\ZG������*�x����\n��	��w#~\0�Tn�����{�����E������u��V��Lu���̕�_ψ�˩����l���H+�Wt�M�ׇ�5�ΏoWb�����Dm�����4��f0�w�#�Iz|Y�ɪ?\'+o����b�����*�k��C����������W+�d�q{����tuG\\�B2u�\rv�����6p��)2��j ���k�W��{Gnߜ��U0[�A�q��i�gee�����͹��hY{YYi���C �t�?��B�|_B�#\0b��M\r����8~��������<�R�aѩ�\'ߍ�_�.k���os`�����j��7W\\�����7FW��߽q��̜i\r�	�����\'>���\'�qW������}��؟t�H\Z\Z��E���=�?//�{�v��h�/�����+4�`(�������D�$ P\0V衣���lM7[�E��>���o�(�-!n%g�@gZY^�m�*+�@����b\Z�\r�����!��uW\085=�q��=}C7Zgfg���ʎ�q�ܘ����#��+n�\Z�s�j��e��W�Zq8==}\Z��(������B��.����$\0�e}�ʼ@ 0̲<�`~�÷�\\��ߝ������ɍov�ϱ�ioPY��2�|V�:�/���}k�׾r�����\r��d@Ж�-�s��s����g���?��F�k��>��M\0�����_?��W�ۓ,�������������O�|�2y�,G����̙.�0;����[�!���t�1)�)C;�� ��7����\\��\Z��({n4$����1�\0��wQpҁS�`~��Ξ�k�������r����}C�+))y��n�aQ3�R�r�!����\rF\0%�M��B����8:p�����>`[�/3��m�41q�|7�s�c�۝鳹��V:xn�_�~��щѢ��;�-N�[Y�L��c����G��y�������������߈��y�7�}R��GsZ�O�u�qAǓ��7�mGv�x��*__��!n����#ߥ��qC���r�c��e\ns��)�Ǆ����9Ͼ��M;�x\'dY⅀F���E����B m<McA�@րz�@�&�&�\n�7o\r��|f��p_��+Q��Vn�?}a�����pn^�,�D�q׫���&Yk������G?�W;Zn4+b�I���\09�\rd��5�y��I����0�㣗��g�j˛g&s�Vl8�n���@ �䁋�[4��5|�~��K3\Z���b%!Й�q���~E��c�32v����aB�����ƞX�����cPS�?�W�`�~@ ��@��V��GD!�ҍ���^��O,��U32����i�����%��B Y�#���W�_�����:|k�Yս5��Enܺ=�r��lnYY��R�?P��]5�>�˷��7\0�d����#��j��ѭ����y�����y0eBU��vb���m>{\r��h�@Ya�H*C��խݷ�o>󣷞z�n>}�Ϳ~lYn�S���*��hY��$\"�i���\r�=��x��q��x2I�\0�)?X����bj\'�y~ч�B�#��0��\'(���C����8H���a�߆�[�d/�������S��!�����aY�U� �Q&�8/��Gn�,T�4%#,;�ʍ������\0yy�9��#�@_�-��@kؗ�!pn0�Y���νw���[㻁I��v`���\\$�\r�����MU�ݼ�|��[c�<��Ew�����ƅ�\'.�q��)�]��o��G���o=�j\'^gd~�\'����@��cg�������[��G��~����vd���D\nV=�{�Vi|r4�?9Mz9&\"&�.q�4\r�����V�w��1>���>��]_<b>G��`c�1��{� ��f�9I�@\01��_�v��G��/Ҳû�m���[���EY�@\'uկ;��#\n��4��6M �;�����{�{���(���z��n&-ѷ�m�I�]��4\0Yv3���(�A}�3}���k-����^�=ú��{����-�kO���}�HEQ�c���ឹ\0Ѽv����i�ߍ]4�􈗾����7���ߝ����~�/~���;�8�۟�����6�c�=�U\'~�����,�3ҵ����J}�\Z�\\���w�v\r[�\'P9q5���g���8�]M����\"�Yj]��=p���<���\n�-\0q�U\Z8:ǉ�0X����g���{I9���~�>�Ӌ��P#7FFn�tv^����@34yO`įS\"��=\09=u�0�8>9�u���~u��|7\0��	,�a{[���p��a!OGO�����,�!Яr�~Z������j�~��Km{�-�x�lY���^��\"���������3��d���X��/��h\r��a�e�@���h���g�;�t������}�b#]�=[��]��^M�\Z����f�}����Mu-���\Z���G����^��t�d���\ZGDj!pbz2���B��#-;Tʍ������3Y�q���u�B �!0�\0���@��3��R6���z��ȝ�f�n$�1\\�o`[��.�u��.�m����k�Z�ϱe�	��<&�Ζխ��3m�8|� ���g�|��feY=3n_ӊ��2V+nI���g�>�h#\rXm`�7&\00˲erz2\\>��<��B��Q}�����!�9}��F<E{o��<V}�ܫ�5*�@��o��F�q���s��م��!7��h.���ls(y�@��@ā�S�)�A�e�j�q��]�-���b�=2���Em���EW�_ݧd(�[�P|7�W�\r���~��7,b�&� ��oؾ�ӥ��&g�җ~b��\'V��v��h�`v;m��	c�{��?z�O�gAC3�{���\'I�Q����a֙�Y���g���7����߱h���y��Oڵ]M5�N��&����6\Z�����)�i�v����?|Ĭ�3������\'Y�wst(�\'�[�q@�1&��7�|��m��$�/������S���\'��?A�s�m�����x��_��<b�6k�����=���426�#�HY�}���i�y{ ���p�����!8�1���R+7RFv��CC��b�9��@ <@���\\eJB�K�����!�\Z1p���r�Q�[���I�݀��nP|\0��o�����\r�Vo9/�m���ˈ/���l\Z����O����7��X$r��{O�W���jn��������:4/����Af[��>�^82�H��\r�1@��I3��;�8,2b�r�{���y��?�|�F췎�2���/;v+1������b�]�f��#x���\r\'�;�������$�:��GdB�X<�?���So�yepԶ\n������}��R��;�U�ۻ�e�EgY����ad��%\nr�\r���Zʾ����x����%�e�{7=x��\\/�0���1�۶ċ��}��i١^n��\r4,�(?o��h��g���y�Ŷ�C�D������7ZLA�-#���װ��/<����덞\'q�!�[��wQ|7�@��)u�_m�k�X�@�2j4�\"H�ŀ��6�\'��	S0�U�>u�O��	yɀ������32�ٻ�#/ȶa�����Nl�0��1A_B��q ���\\����s����˄}�-�D �/M�\'v�K��YQZ����+5NM�wM [	H�n\\u�)��H���4�}C���F�e�r��͑�ū��5|��-�	��U�	��I�F\0-��\rfa��[��k<Obbv����!4�i���	����^�7�&��\Z��$�P�k�l��7�D�M��Vw�?���?��?k^����>��{����\'~Fƶn_���~���{��g����.\"��e��1������;vN?�~�����~���n޾�{n��#׀�o|�Ͼk�d�3�kO�����AQM����i�cA�����v}�˗Uq��\0���>��W>���Ͳ�t��ot ��^2��زvOǖխ�u$	G�}�fP����CnLLL�X��;�q5��@ J\n*5��8�d�p����<19Q��M�4��w<�nP\'��Kjzlz�GsW�aO�c���r�K&�\ZspSͦS���r��ܒa\n��;�;B�8}����/���!x�ș�\r�ot8Vo���\'w~��h�h����\\@g��_�Ƌ�h�V®�������n�􉟾��4i�m�ͱ\r�.�&���X��B{��`����������fl���8������9f��]�ؽ��@�X�lo�m��<�,6#��׆��E�e��\')�\\��l@�準����7��8>1H<��F����g[�no-�pm\\���GNQ^��d\ZWj�(_�X&��͕Y���7яG��ܑ}�?z����qϬ�iw0OL��(.F#+;�ˍ���R�_\rξ��f^ ��3[�>i\'��\0B�j[� �\Z|�i�E{��;~�us�+�\"�[�j��dœ\"S3�-kl��g>�cc���--@�m��4H/�NL�4 ~6���	��}7op����u�n�Y���gnf@��X�gM�g��oX���/<�o���\Z	����k%�9��\r.��#_���^���ӿBX2f��m�b,Z�_�1�B�b�ѱ�b���Rf�GX(��VluL#��h��L�a�92����7�\\n�av<²�`��q�[��x/`�u\'�s^o����R�{���ڞd�׏>�3S���g�8��|���2s0~@y1�����K�m=�\0b�4(�߰ʜ�8�2�m��B�$캇^���K~��\"�!�\\l3.��Ć�H���9���L�!�k�(⿤�����V[^����y��������`_��yM��ܠ�\"�`�u���#�_\'�o\'�q\0IoS�!�z��JOb�\n��b�\r��*�\ry�����u\r�\Z�\r�d@s�\0v_F��܈���On0�L\n�:tN&��Vp�!�za�@�$��o\n�w���\Z�	y�>��ߐ�@��AB��X����A0�!i��@��K�GnDYv�+7T@ �A 7�4mS�!�����B���>R�����&#�D�&�>fb6Y�g���\Z�<�m���8β����е�!�m`�A�X�1D�!�\n�H1�BW��@����\r\'���d�����F\0Y�6$����6!��g�o���}7����qW�w����o�SzZ��,���2\Z5��@^�U�!|�@H	4�4��̃�@8ڲ���	3�{��\n\'>T�Ċ!P|u\Z&���]vV���$��o�}7\0���\0��Az����/\'+w\0+�\n�\rʖ	\nE������pA ��pC R	���>b��L�Y�A��������;Z�?���}���>�V� \r���3R~n~��3_��l�� ề�R�?�\r������_ana�^	\nՔQ���$�\0CC���@��\ZD>A HB 2iqeH����H	١Vndgg��5|���;��Oy\0�@������Ue���yQ�\r�[���P�����n8��A�7=P�aN+�W���+\Z5.D�uIB $�X(�H�0��������F\Z����Cn,[Vt���.�%Q�!�\0Ă� B`����绠��б1w��\0|�\r���*�7̩i�������빬!�?�%\0� \r��E�Y���?�U�Q.7P*�Er�byE	�TA ���U�2y\r`� ֗��1����5�$��� �\0\"d}�C(d���5����S]e�k�8��Q�@�+���n��\Z�B �Ȅ@������l<�j�V��6����r����������8�[���@p	�(i�\0q�!$ pk��7��b9�\rdc�C`���T�\rZ4�xS����h��&whO��B �40:l\Zٚ?����\r�467lS+7R@v����j�$@9���@�!�Zg�5�8��57;gbU��C�g����L\r�)뻱��%�1K�I��n5��\r#�W�9���?��4Fe��!��0XD�A _��@���ܬ���k��\r�#-;Tʍ�ҲC�YY��7C B�B ���@��>L�!����M�_�(]������K��x����z���j&quiM��-�^�v\Z5F\rQ�(�T\r��ݮ�J�F�B��uw�^^\\�Dn ����ErcYᲶ5�k^�(d��a+xD��@�|\0�@ ����-k�QRXrr�=ɍ��i�T�\r�<�\r ��u��E�\'��m9L�.�C ��!00��A R���	J\ZB�ؼz�/��K�ˍ��r#?��d����p8�KD����A��[�E��F\ZV�/)�Mf��=�w�9�m�J������~3\Z�vE��ؿ���,��� �M9\r�\Z���LDQ�@�\n�JF��/�/�&7�&�(��� ���c8�\n�����+\"� (L��z<�c�,�%\"�[��1����bl�p��o����}�~j�w���/`���b�q؞�~�n�\'0�|7�\0���������~]�׎~�d��O����Ԕc����H=�=�8��� �7u�ea�Y9�����uێ[2YK�jB�g	¶u���4�+�C ��cn?\Z��Ҟ�^d+���G���~�h�p1v�q~7��ܮ��|��U\r�E�C�.�?�w�ǝܠ��GDvx�E�Em�V�.���0��½���Ȗ/q}��pG�g�o����9�_s���:�K>��Ջ�&�dY��=w�z����<�x\Z\'&bmڍ�ề	��)�<�@�C/&�s���4�8I�@��iM��@W��H�P�iI��4��z$W�(G��kM`IA��M����l�{��a��2�������b��揣I��	�s�$f��94�H�&0�\Z@�nMDh=�pj�_w4�yx��M��=�ޮ���30����x^���M�3g�&?J�iE\'���Wme�g��(_y|ǆ�o�d�N���5�@�K�giM��zR�I�4FE���ş֖�7�&�VO�5��rM 84{��@�w6�u��~�.����PO�,L��\r�c�Ґ�i��E��j׼���1��aФq5|�H�\\\r�h>�&�|��5�	��j#��:�z�@2P������ɻ��x5��Ջ�.�u��4�ܬ��K�����P&�UMD��O�����wAJ\nK/�\\��}�ʦN��A 5j�g�A u�	ЕrH�:Y̎����5\'7:�w�]�j�=To���FF�YwI*ʎ����?��yK�J�+�WuZBҜʄ@ӕw�	��B��n1C`�5�N1��5���KƿׯX�i�9Է�=�~����\ru��(���!�V&��l\n��.�>�����\rQ�`@��%_Be��@�(k�<:�MC дq�@�06u�\r����0a�����t0B������榭?�pF��}�V�դ���~��� ��[��Cg���Q��Fc�J�!b���	���*O�i��Ɇ��t��Ƚ���ʰ��L�w#�VUiU�]�>�n��ߗ��aa_72��XyeC�$�\'P���	t�s~R��_>��;!�@�fV����@��a�>����E���؀@~Ӿ�[�*�hȎ�e%mM�!�8�}���A§���g껭_�-��8q	���E�Z�}\\�&0~c\"^;�h�z��C��9��l������^�v��V���������y+?\'�ښ�m�k׷\'�D�u��q�\Z$��@\01�A�&PV��!XM x-iM���4�@)OY�K��s-0�V�5i|M X\"�\Z=M��%ѭ&��=�&�z��\'Ssh�b��(obg�/v���z��e�/&;f�#;���o�f�^�*�i[Q��=1��\"�I���?M�y�]j�+u0�_��H �=hX(꫗\Zh���k���6�����Q�y�X��? Z�vj�0A \ryd �\r�	�\"����0@�k���@��E&�҅�\n����\r�%��G��<.!�(U_��n�Y��ly�D��9bl�E���h�tԬb�Նg�d��Ν���%��/�|�7)7;�m�̴�|Ӻ6�ofӳ�9�����\'��$�,vE�\\�mz��\Z�;��Dϋu~\0�{~\0��`^Y���`캇� ��js��9xA\n�3Ӆ9L��9��a��`gY�9X`K.$f޵��ٻ��5;s�}�̋���^�?#{��f\\v�k�T�y����`�ds�3��N��/��~�|1;uA�5t�5�<m�?����/^�l����*�\Z?3#s$?\'��aŚ90q���IM ��␨h�k����i���&P�&0.��&Ю	$k��h�\Z*��Ѕ&�RW{��ZF\'Fk�g�#;2�3Fr�s��ʪ�v�X�t�\n5�@�,\Zl�\\�&�E�a\0Ğ �칑j86>�}���7Z/�g$���.nd���7\r7\Zwl1���O��ۓ����h�q������M�*үi�!@e��ԇ@��ϩ���r����@p-����M�H0Gr plr,�����\r��VvLL�n����?�׶���`vVք�յ���;q�BɆ@��.��\n�eʔ0�\n����c���b}&��e_����ɷ���?���m�������g`H˝���q�1{��So����=_�i��5$(s�\\Y����l�Z;\r��,�9�W��9�ۗȚ��m��`��B�9�m,h&T�wspBCE�1�2�w�m�+�K�츙v���œ���uas0i�Dͼ�j*g�]��<��i�G�{0��@|\r�K�J!�^߇Nm�>л��L�>ۜ�#�m����&�}P\\-\\<\r����x����<\r����2\Z5��@�7Qx 4:ZB64�w����7��GJv���t�B��(	w.!�!	@ P!0Ȥ��\\h�6�\n��ٌ<l��1As0{�:R�a��K�:���7������*���3�0&-Y%Oy�3׍l�$�J/��;>���G<�X�ٹ=�ћ-),��bn�����g�ʰ��\Z��\"�9��E�neU�F���K�\"0�o�C�=L��9�\Z0�d[_e�����W�z7�W�.������=�z�5���	d|b�\nCjɎK]?c�QNgge��>��;���W-��d��ꧮ�5�4�V�\"L�c/��X�V��@��U�У��q� мo���T�ۧ��s���uzf&ϛZ��b��u�|0�������V��}PZ��HV�x\"�,�>#41=Um|�9�����=\'ζ�֔�8~�ƻgefM/mTSF=�b��\r�a�@��W��X�� ��WI��RQ\n�Z;����x���==�]�33�K^vL/Ȏ���7o���>ZRTz|�����ֈ���E\n����8,h�?�};�\'N���r����ؔ�n �N�`��n8�\'-a�H��0�Y��2c�gg��_�w����^ٽy�a��`QC��@\r�l�KM��A`\"n�{4k��ξ��r�E-;��dG�Hﾾwn�(�|��a�a��;��Ň@0Šd�?�\Z�Ģ�Ԁ���CE\'���1�עF�`����w��}�ܞ�0�lL��/�?61V�m��eE�ò(�$ \r�Ɂ@�|�i�\n�� �KI�ǆ@\0����\r�F��>��Ξޡ-;$dG�`���g\'�V��?\\�_8<:5|�bf^f��K�,�f��e�-��Xыݵs����Μ|@	�!�DR�a���|7��T��=#�{M\ZM�c�>��r���گ��������X�����e��]⥌�����_@2O���t��-��H^/�-!��ja���� @Xq���L6}\'����Ş��w.{@	�-A�1|k��B��znt�9W����\n���R>p�C����|8�LW��E�������1\0l�9ԬNb�໱XԻ�cR�~ǔ�LT������5��v�u`d�0<(�7�����}���H>��L�gq��K�Ş�#�Zvx���n6�\0����B�Y���@�|�����a`�!��k�h���O�3xs�YِD�wL��d���Y�ڨj~SS�7���>�v�:��^NAC��@\r�. PL/,\"��� �E ���o������:2:�|�J�=�5i�!��]\nA�b\0$��5��j��ݽ7����g�^�e����n`�b��A}�3}���������b��7^�5��XC���@!�\n�/���@����Gϼ��w�[���c��`˙���B�;���@_L�с@g��ɉ��=���I�o��^�4�\r���@��Y��as���p��a!ϥ�K��\'ǲ��\'\n�J���A��r\Z�.B� |�@)&>MĞmWz/j���1лrj*K%z���|��4\0�B �w��.eؼj���E��p廱ئ�����q���MO�w�ڳu���c��\0۽T�@��i���gĒ�@�y�@�|����>ʎ��w�Ѥ���[�G�@ J�N i�U-\n�|�\ngfgQWo�>5R;�toe���\rk��\r�ع��|7l������}�3�������@�!PC�?�@	rL=%H��-`�ų�j_��>ʎ���fgg�E �u�j� p�_����6�\0�\'b_ ��Jg�*u\01@�[�\r¤%�v\0�ms7l��,���}Rz�ݠI�sW�5\0G�Ƈ@���b\r�\Z@�D!\r������Ni������j�(5\n Ъ\r�E\0�k��!s5?���=\\�������vLX��ō�\0�w�3��|7����w�8���\Zլ�U��!PC` Pv�p4!E\n{���@v�lפ	@ R��p�����D@�\Z@)�<-�\Zt%C���\Z���d����r绁9����42:RC���A�(�h�f�j�@%�HAୱ-;�c�2�̼��#��h�|\0@Q=k��@���d���>%^�\'4���|n9\'�}��o[�}\Z�~^|7�i|r�Ԧ!T([�o�B=�a�d@ R��\0��NL�i��옚�*ED(C����k��@$\0��4�m\'�EB(�u�{����v��G�}V���a��`�q���0��ٙl��=�~�8>��������!�\r�$��C ��*��]C�iZv�-;f�!�M����.9�q\0�A�<b���aM۪Ƕ�N�}7�w�0A��nX��8�a�@P��v\r�E��r�A\r�K\"ЌG��(����@{N-;���!��@D��E\r}1�����̭zL��F�^|7�&0�Q�8�i�֛��I)tu�@w�ƾ)�C V����	L�!��eGP��H�]DF\01L���@�>��$�q׋�u�e%AM�Moa�h�|7��eK8\r��@�����@\r�Ɇ@-;�O	[�?�H���C �\0�\n؅�^� !4#u�|7̓ ��c��s����nX���8\n����]!�������h�B���p���l���N,���H�j�?��<@LKK��{~2|7�ora��\0��n`�|*|7�)=-}�\nH)�R����\r�~hS���A��J`\"_!���x�i���HC��\r�@�pg]���n!P|�`w���\Z��<�\r�fۑ�� �q��\n����d�0	cM��@,TFC��@�8���@���+�3s��@vdff\r�����y�C J��@�\Z��������#����n����n8�`����n��8,ot�n҂܂. a,\0QKe���Vk3B�A R\n���Zv ;r�c2����*��;��,ퟏ\Z�(A`�xEY�9�R�w#>ӜK�پؽ�H�n\0�}7K���n�Suy�9!@�(�#�@��\r�X�.\r�)\r��/5����UZv ;ʊ��Y!��Ç\"B�C��a`�A N\n֭X���	�n��H�n�{�\r�[�k�\rJ4w���v���`�>@�;X������dC����b����l,���ښ�Zv ;VT��\n�b�G��!�ꞥ�>���_�g�HO����x�:�e|7~�n\0x�ݠ�遊x󩶲����:z���5�\Z��A��(\n��  0##sf��z-;|��������H��s��00�C �B`��h82�iݺ7��39�\r����\rL}z��ֽ����ܜ��m{��a�@���u�� !�\rvi�\n�HC�0��x��>ʎuu��tZ����@Wc��Kbƪ�DM9��+*+Y��.|7X��B����!�5f�M��n����P^N�+ƣ<b�!$!P4o �7\Z�6\r�\\����]0QW�F�dGeY��쬜	OA� <C ���Y���{d�o���M�^//-m��a���	��n\0�}7lA@U�nT�V��ڼ�u޽!���4�����@پi��|$�\0�K�ڸ��ʒ\Z-;ʎҢ���k���$􋉨�B�4��@ J�00<�.-�������e\'�ދ��n��m��\n��iŖ�	����k��70��-b�U�\Z5j��B�B��^08�m�]�(-X�e�ٱ���d㪦�`ٞ��H4|�|���pG[�|�a/`2��R8!���p����xqa�ɹd}7���o~l���������\ZW�9�wX��y��@�U��@Q_�`!k�B� ��H���4֬?^ZP�e�G�[YQ{<���8ɇ@�>�^\Z����x����n�s>�r[\"��1��m�Œ�~�^��~r=�6jW��\\VX8t�����������c\0�(�|7�W�wc����;�n�a�ݺv���ee��f]SrR��#D��@�K.����PK����&?i���.���M���_D���!O�8񾩁@�c!񬉜Ɣ�X �n�qK&k	VM(��C��>��F�u�$H-��5�7l鯵�D�5��;c 8�nǱ���״�U���]�t8f�0`9l\Z-<�W,~E����%q�?/܄�z�w��1B>g{�8`�}Dh۸��\"��k\\��	Ğ4��˖\r߽mۋ++�_�Si��qR\"V�N��w��lr����;8R]U�������O�̚M��� �R���E��5�a�\"7�RX\\M OcG�Zu2���_Z�������>����k��HU�+�l��bQA��ٔ����k�b�Y\r���%hM ��1��r[s��k�����]�����0����x^}��`��v��~��݉N`�����؅�H��.�:�}��o�d�L�5l�����&�	B��WiM`�4����H�HSOh����ꙫ�i����p��mkvk;�Ʈ�+�30�e�-������T�X������x�iZ4������[D\r��&�;�=��o�Ĥ��\n��\0�����5ٲy�c�^�v��z__��zC�:62^-�0f�n0\'�Mq��w�#�3R^N^w�ْ��5˫�V4t��50\\x\n��@��C�*~�!PC�?(QH���6\r~\0���7����Wc_^��}��Z����[�1ف�FGn/9ّ����6�,������U�u���Ql�!����6�e�v� 0�m\r�Iff��\Z����`5\\����7i��	,�\r�) �����O@7�T�<;��+����S�b��Ea���k�b�j�@*��	��\0 0\"����tJq����׾Y���O�\'Ls�N�+�?��ͧ\0-���@\0��!��� �[��4�A�b�?�xs��&�W�Qk\riii��ềM�X�\'����b+o�>��X���aj�T#��^��\Z��\'P6�O�}��M�YH��q��	��gD-��	D�6,_��/�i�є(m��Aı����n�_�\"�k �	H��/e�|��.{�r��A()~�>m�l��N�!0\';�����3!���N&^�A ��[\r�\\�\r��,�_i\r�\Z�!y�@d�@�@ k�8�f�ERv�f����# D�qu��:}����qT �;�� pEeU��Pft|7ڭ�Zy�ZLP	q�!�����5{AC��8�\Z5� Pf�82��\n��@ĩU�9k+\Z\");j��:N�q�R�Ý*�8\0B�(�@�3�$baܰf�e�ˏM�z����x+��d��*K+�5��pRH�\n��C��y��� !PT(����!P:�7_!�A`<����T䭊��X^\\y����$B� \nd�@ �\"��\n\Z@�!�@���;6n<T�^�6Փ\r���g�{�\r`��a�����F�����m��w\"yvk��\Z�A�kC<a���0@ h�֦=���j#!;ʋ+��X�r�|n\\� �g��ީ�@�@�Z;���i�.F5�c��b-�������g����A�p%�6�}��>b?���3�k��;�\\>{���e�ol���t�$e�g���ͻ����mm�v�J	���y�9V�kOo[d��\"��`��_�p2�󣵧2?��HN�+�E����y[춌X�%�:�z�8�9��P��\0�����q�+�k��*MZۄ6mv�j]/\Z����삉{�<�⹫\'�^�9�r�o$&;�B%;�r\n���X��P���J�շֳ7�鵬Ħ��]�_cF�>�N �����K���EV���1!�\\F��!\\���+�@�z �J�� ����Aê���Uu펷\rD{��M��H�o��p.�=_�@\0k�\0i�82�U\n���( @<LL��2LL�C �ZLy�h�R\r�@��V6��\"Z�(�L��Q�Z��6 �1�g�	�t4o�&��ϫ���@p��hà�O��970poB�����Hl�\r�y��;�2fg�>������:���%�:s0X�O�i�9�y����k�+��<?_���^k�a����7��3�����u)�\Zs0PM�Μ�6��J�P2Pc͔�L���h\\�6j���x�`di��m��l�K>k=����.�\0�ABH!\\B���$�0s��T�@����/�!PC�\n�?U�!4:ZB����\r.�B�092�c�D�4\0J�pY�7�!P�4.%�-z[!,�\Z��@H1D�!��H%�h��)�, cC ;�;d��@Dќ2���\0j��k�8��A��|�ק!p)A��2�!P����IC��@��w!$!Y�s�2l�ưAH5�Ȁ;f>[)�(\0�*l�C���c�!�t�\Z5j���|�@H>\"��@ ���5r��a]��@�p2�H��0C�{�C AC ��q��x�C�8,b\r���� w\r�H�,r�� \r�t�H>�!���-u� 0�\0ȃ@& ��@�!�%��=��A�P��)�^��`��@/\Z�H������A���.�(��\'�H#�N����-B �ҨE��@�=G�v� Э��O�䍀���w\rY��G��A ��@c]�� ��{�8\"�!\\B���\"!��4�w��E<4��j�o�NϽf.�(׮����j����@��R(�7\r�n!PL/,\"�\'l�\ZBh!�w<�4\0���g˥\0�k@��@/x�\"\n�ke Pl�c\r�\Z5�r�PA �9�;��@��(���C R��_�4\0\nÕg�A/�%�\Z�@/X��\"t�-�@�>� P��/XĞ �M9\r�K!T�@ ��%�� $!q!��&���]$��\0%��%bI������@��\n�  P�wB	���^`NC`� �)�!�DQ�@���/�.!�E�G�k\0��@\r����w�(�O?!Pp��%\r���䘚����!�\Z�/����@��@.�y�@�=z��$������N \ZIǼ�u�@�|�K�����@\r�\n P�P�A x�@)B� <B �h۸�(��I�=r\0�]�O�A����r}� �e!��B�*!+�@��!0(0:���\0��@�Ckǁ@�&\\ 0�\0(�%[�B �\r/\Z:1��p@�M��Vk� TB�X?H�!PC`T!P<�\rQ� �\0B�B ��@_?�C`�5�^!G��A�`�h\r�4�\n/B� P6�����z�!0�)��\0�HC`����#��:#�� \"�Vm ��U!5!�]�\")��C�l�?� �K�A\r�\Z�B ��$�@yD�Z�!��8BC A)������W�x�d����X�a˩�s���Jcl�ɼ��~b�d��c�\0¶�g���/^��x���et|�fzz�B�232F�r�jkV�5�ַ�ϔv>�+����g9�lOE��kOo��7p��Q��3�w����t��]�[n�ݮ����=���5��[ص�����nK;��f��7�r��*��󈟋|���A�ۍg�N�5��!��G\nr�u5�4�m����d6A\"˚�5��ZȖ�s|n�b;�ʓ���gvB���95�?��6�=}���=g[n����9���9��]е�rMۚ�ۭg�\'�(����%g��&.\n)�����\"Ӌ�)�B}�1M�X�d���y��X���K�������˩�rHL���U<\0�C X!\r{�@���������O�=�70��x�2�!���;���\Z7��w��żi_�Ǒ)���,���|O�Q�������z�z۶7o=���3A��	���=@���h�����=1Vxkr����Fӕ�m{7�?���?5ih��ڢ�`�~�×\\���ad�f����M�ot�ݻ���P8U4�@y1���\'������Cz��Xv�j�����{�j��u�b�#oL/���\0�p��!�v8�B.�\Z�l���\\�����k��@=sp����?��μ�z�:��8��f`H˝���q��ny��{�Y�B>���I��ݷɾ��{��6v��\'��wI�\'zg/�>��������_<���!��`캇��H#�v�����/	�C�셖�N����l�)Y�`��S^�L7�3�y���]�_�~��r������b.��j΋9ؚC�����L0�2G\0�V���X1\n�C���.n����s�����{\n���H�=~Y\'�c��@{f�{�Q<\r}�{w��p�9y��Q<��7i|��ۛ���\"uO�ܺ���c�ɂ@�+���3-<~��������n]���~�9e ���8��{�j�d���;�k��@�#\"���	\\B J\Z��\0�@ $�G����8�7�E֤%��)oz溑�9�7��������)�r�Z+o\\�A �u@�N�6!�x��R$���Z\"]с�=g\"y?���iUDvI�@��!b(����/��GSvܸ�J]L�h���$\"˖ur��Y!P4��@\"�B�(���Ɋ8>1Y�6�������ǠM|�?����:����x�ȸx��a���T�@�6mc���\'n�ߪb���@7x{�v��0C /Қ*�hoq,��E��VE2���@D1˪�@�7�n 0�\0�@�@8�2���f[�	u�ȃ�s8P�B�a���[\Z���ۤ�����D��X�kČoɄ@oab�B���tD��l�d�Bd!0��	���E��3��v)�@�\ZQ���+� S# 0q��R�\rP�1���\\:$]b۸i�ɞ��n PM�(\nnl�Ru����!p�*M`��Q��\n��@$\0v cC ;�;���9!��?�}��чwl��ڴz�sb0W:!�$E��\"Q�ߌ�Ol ��u��F�`��[��\r������l��n����l*�4����}N9����&��wcqw<�������\Z���鉕�-*\\v����}���NV0Q�u���E���q�-�s�~����_�Pw��������8��M���	����C�]VX~q�����;EE<�c�~md���EO��g�~X�y�bc�H��3��ĭ%w?�g����_�[�о~�NY>ƒ�0��Yua�K.[#g�>���w�q�V_��i����}��ȍ�4[TPr����}uUc\'y�U����,��¦�p��	;�U���|��7�?�R�Ԧ9��{�[09=���G\0���[�L~�+�@���S�3\'�t���l���͓~�\rA�&������\\���k9�U3>7��n�Y0}FF���ϓis��!c���������̜^\n895�q���=]}]��3���p���+���޸�pvf�t�C���D����w)v?L���q?d�֖�߻���9�K\'c��g��ߩ��}�{NT���ָ�pfF�4\0����A�ӯ~30\0�%�9.���c�(	��8F�K��^�\\�����7n#���2�RIqE\n)���@�9jJ<��9gN�q�o�{����������<�މ��`�ɾ���y�2q��3gZ�V��:-�W�7�Wp	��F\0i�kU�2+�*�PEf�,UY��/�~��/3��hU��\'������jx��n;{7��ԝ�:�����#]�!{r\0�z�V\"+C�OV����?��?\n\0�d��o�M�-�HzW)�b�j������׃oW�\nMhh\"�5;���7C�[n<��p�������o=M�����!_�������Qɪ�����/��zZn>��;���2�dѠh�g��Z���\'�f�,\Z���8�&,tA�*<;vBC�Z�r�q�ƽQ��\0��6��|�g�}�\'d���Xh�{8a�[	��(��(��������7���ݠ�P�һA\Z�����z7~xi����Oz0\n��*�����d*Y��9z��R�\'��B�@%����n��Ñ���&ެM=L��u���F�D�A��Y���������Ȣ��f�^=�������m�m����<-n�Ս��fpU�I��������ڻ��j�Q�([�Sc���cf)�J e�%m>�(�>\\^��\\^Y�C`?�wI��0gmKO���O��J�\0�(���J�|�R�Orҝ0�l��Tv�u���8�E��C��74xv�o��t�.��!PhB�&Vw��L�+{�n����΄���or���FtM�A�VvB�Ѽn���k�r2ɻ���S+y�С�����O��ך��u6_�@�%��!��x���}���f�H1�|���I�F�\"��@=�X,�[��I6��v�&Y,Kz�9���]\\+M��Tf�0��9�v����C;��OτѤ��$��5�}N��؎m������Vl�j���Vl�G�Џ��;Ǡ������b>.�w���[���b`3��c�.�� ���|	�9����ώ�f����ގOz�ţ��e�M|�/$��F�B���t.����|~B���?\rrM��]x��+�0�2`�w�뤂yF`|�旜f;���r��RjA�|���@��?<�������]��z������N=}�-�w������v��V6��P�!p|��n������������SİB �����@���d�@�l���/&f����x7T*�����g�»��K)+��wۺ���o��������@���́���o^<��Y�ਉ��R�˟?���z���#?��QϟЃ\\ˑ��ȋG��B ��|���+B\\u���M}}�\n��9B����@&�V�Nx�k�a.Xz>#�\r\0��\r�\n���P��\0�w���\'Ʉ�}��ét��4L���P8$4a�&��3Ét���̇�D:�y�z0A�����A��D,�xnM��],m��SI�&3!0B $@ ���RYL\"� pr:t�[���n�w��n �wC��`�n Ź����{d(�~7��Є��x���=�0g.~���������\0��;�@�)�3u�ӛ�{ZP�5�N7]x\"��e��!X������C\\�@�\ZST8��̺��x7\0λQ��\0��\r�{鶼�:�����@�f�Ι����ڢЄ��x��f�@�	;C`.���k�B&�anm�LȼtG̡,|�>#ta�csa(�˸yC 0�EK�9� ˚�������I���ŵ\0�T_�Qͻ���P�q��n����K�n��|�B ]�����&,����D7���/~z�@�������8�Z�Q�g��l��BQ��@��m�&������F�5nm�W��4�FY�»1�\r�J	�{7Զ��̀v���[a�	4��� �.m-=X�����d��q\\�\n	]X����Հ��@���@D��D<�j��,�s�/U�2��`_�S)ռ���r�O�ҕ���u�X|Oh�M���V�)_J�g���w�,�CT-�m��	�k��V������@�B  B`���o��Y�����w[���/�0=���ȳ��n(�d:��2��Ι*�V�	34�H\'��26颁\'�)�`��~dg9\n]X���A�/��s	��\0\0��@�s9��݂�jKH�5K�ݐ|G�NcQ�_�wC��r9/�h��@`6���@�|.\r�E���Ѓ%z �\r!P������$��0��\Z�QB �)�:\rOd�����yܺ���x8>T��m��\0�n�F\0�y7��>�wZ}��&�Մ�!P�4z�;\n]X�(�\Z��D�8@�jt�:\0Y�vt�[:�<�U�q�{����\rl�5�� k��(4a�&X��+U$P���{��\"�B����*B����@��vt,�@}�T�%�\n�F��K\0��@�øw�\r�̀@���!Ph�_�u��� ��I��.�:;B� �@�}	���8@ ���,�݄�ݐVP\0�H�w0x7�B����yx7dWy��fC R|E���{�	�5Q:�9V�zp\0\n]X�V6�@(;��\\	����(jG\Zi!��)�����2��λ�{7Tͷ�ͻ�����n�D�r��E�\rY)�@��-4a�&���8j��nW�Ѓ%z��g[@ �(�}�BB�7�O�j��k���ĭ<\"��S^���Z�\r��\n�\0��-=3<=^�\'�4\"o��u��(z=^�	4Q驌�G�H�z�_��=TE�*R^�Ѕ�gGyEB�/lx�-��+*��M�$C�ɻ�Jo���P7���ޭ��n\0�Z�\0��驮�\n���e��?�����@5��a��+��@_e�Ѓz��糮J�B=;*|�b`Ӏ@(��a�a�@h���@��l��@���i�{�w�R�T*5�w`��Eet�&\\K\0n�\r��T�8�mXu���\r�Bh���c���g=v4\\z�@\r]Ӻ�!%����kB���6}�V� ��-�	������E���@k[���=�һ!�N���\0h{7����nH�k�W瘡M���5��ʣ��w	MX��ގ�s��������w�,�í�w�t�e������]�tq��wN1��8�~��a*:\08��Av�@�ەml�{���,�\r��By�B�y70�5^sy�^i~R��g]��#wz!Pyt��,���&4a�&�5u?)w�g��Y\nT?�p�]M����t�Tv�@���C]\\�!ta�.�:���E^9S PB ��N�\0:{zڞ��}6�l�&��ڃ@>�{I����߹����{�@#j�I���xWh�DM������?���B&��^ﯞ乒@�/z��.L��{��>S�<6�� �x	7z��}����l�^oy���҈�e�û��O���ջq�0�ލ�ʄ������	߷7��Tz+R�i[�C �\0������B&h����HuEU\nh��� ���&u���Ѓ	z4����Kq�9�!�����O��]\\��=R�N��C ���\0\":\0�Ј�Ȟ/k �֭Χ�/׌�nH[z�$�06gP[�7}��\n����;O�K�&HX:���>m�_�ਉ���;�Oq��}�7O[��B���:����r�9�!A���4���Bu�t�e�}CO�@m��h�(`�0;◎c�@D����@���Z_���j�ݻ!�Oq#�z7`�@m�v� ���Rm�ĭ�Qy:��@����ܸ���wYh��&\Z�\Z\'>�%���^Ə<��q�~�Uc��zh�k������	<g\"U����W��f����\Z&�tG$�B� 0B ,	Z3\nX?�u@���A`MMe���?V뫞8��ջ��\Z�\rbVT*��\r�>j��V���ֶ��ں�Y3�~( ��R���k���M����ޱ����h�B���$d;��k�����5�6	=���m����GM�9K!��w%�����]���-���mcT9M�~� ����e+3+at*Xx�J>��`t�E��#��7��Щ{�\"\r�$����8�jZ[�Cyܙ�[MlGcA�>Ff\n��;\0J�ݐV`@�n�t�7��㷮��^:�?I�\"(k�\"Y�@�2�҆�l�S�������\rX~��%ߥ�3/k;kB�[��u�����<F��Hz�����m���cH�H������}�;c3�$Vv��B�o!��\n��	�x��ٞ�r�k�}���Ѽ.BB�[����B�/��3hBG�̣�9.�U�)_��S;���!:�J�����_( ���P���<;f�����l�D��@Rć6Ȑ�OC�ommU����?jj�?F.�2P�RB҂ݮ�(��H�]�����<r��]����淃#����ѡ�?�l��`غ����&���YP���g�H`Cݕ���Q��O�a+����?��E!�Az#�����O?�gy]��`�:�\\����=�tT��Z���h��@@	T.G	�n�r0b���oe���o4�vC�@�ó���-뢖y��Ii@�4�������ҽH$6��*X�ϻrtH���U`EK�`��]>\0.oN5�O�� x3?�I_KB�9���ZZFGm��������۽}�x=�4U�A|	Ӗ�ڑ�%�@�+\'�|�t�����kYp 4��bp���\Z:�>���o*=�i�#��Ē�z\\k�Z!�;�����_�[����z(�Cy�jC���7~S�J�~0� ĸ����P�#���.0���X0p/��(�\'(,_�ܠG\ZC&�s)E��#�\rT��Gʳ`�ͧ�o�� �I����J:\0�\\�֋�r�!w����W++�έ����^�+_z�d*�B��+pys�̻�	���!֏!���O��)���H�U��UVT�R����onh�����Uf����\'���|��F8���*y<�p�����k��>�|{c�lO{oH��/�l�K�:7�[�ͮ�-޵�ܻpz������8���=��~\'d(r�DT4���sqs.����.@^���*o�j�1��\\S?�Zu�zK_H_�;��o?�o,�23�����\'CUO�|_}�@��G����Ґ����<�����O3���D�Zs������l�W�������g����ţ*3$�����åU��V�j���(=_�X�K�����O~����M�Է>����|��l�pOP�iO����	T���J����\n����h�?����]xg�1zh��|����3��Q������}�\n��䠂?�������_��E�����w��S�!�}��I�xJ�T��	,:N�	T~k�\'�0�K�	�p3i\"hJ?��@���z������9R�<~��\\�}^���\0��XH9\"�ʻqv�z���;�zG��D�ty����y�i�Z����>��\"�&���4����f�����G�u���ݏ�\'�u�?>�@����<��d����=o��f�G�̌����������ct�|�}��}��5��w���\"��)�����	T97��\'Т̈́.����\n)�d��`�wMy���끕�f0�H�e��\Z`����ޫ��Xnom��h�5#/��Ҝ����,�^��/�\r�%��2��m4Q^V�WSY�|�50~���,��G������{Bm3w�G?��E4��2�c`z�U0��m;Ȥm�Ϟ��n����v���	�\"v�&����y]L�\"k#]�������}�7;��\"\\3i7֕]��\0�Z���;��{�������`�������=�=�\0Ά�K��[\Z�ӧ���t +4�33!P�����	�h`��3�����AH@ /�wn=�������@#XܓE{<&z���@�\'��UzT�AcH܇Z	�.s*��nRħ�/@rw0Kw#k���#�h�Z��\"��}ʫ������`�k�����`��$����4ύ�ί�@��\0�~��K��f��Z�|�b�	}]�H���TTǊ�`����:���c\Z���y��)d	Jw��\Z�4��j�yw0n8�h�jw�BE��4	���`r�ל�� �Aʽ�!��40D����O�^�Q�V0�L�f2Y��VVV��𮴷6�wu���K�n��\\�rJu���!,硻f���E70\0�0�x?��z�9��&��<����Bp_��Y��T@���p��C\0��/c��Iǐ����B�������nk:���<e޼|+g]���S��<�vB���ӓ.�d,����t�UW�V���ߝ����~7�Eɰ<NAI}`H�ҁ!�+�\r)$O�q�)D��b�b�s�?��@���� \0�Q�����Jx_�}��5� i�Ht�=]*H��l�(���x�C�iP����ީ�X��fd�έ�Wz+R< P��v:�4��ǓI��矬E�m���o/��>�ջ��4~?���N���_Z�9v?��}���OV\"���C,���mh�wac~�W������?e��q1 0���b��X��}bi�wi+4����ϫ��)��e�����dO� q����n�\"3\'��V�kDl�ʹ���dhX�AP�=v� �k�y�2\\�YPޒ;����W3�����:rh���i!C��t׬��\\�2V�>�4O^��\Z�%��Fn!�l��a\'t�����i�Z��`�c���|X��@�ܛ���?��L�;ϙy���_��Y���>���L~1̿;���w+��{�!Ÿ|w��=�;J2Q�;ء\0�$D� �t�ss��#��]��-��žq�2��l(n�1/t������3s��RB �	��^I2�QNo��/f_�o�9Jk{�w�����B \"�3��3�n/o-:J+{�w�g��h�����r$���~��O���	��\'����Xz�:\n�����i`Բ�q��@|�\Zy��yΠ�-��ݹ�;\\	$���t��!������Zl.Eޥ|��lP����r	8X��B��^o�⛿�P?{��%�4����d�Q�f5m,��o��v�nV�v�3ҕH%�@HUy�]/��r#T�����ƕ#�c��W�o��@����jo͡�}W�W�ҋM���\Z<��s^��@6�u�w�tQ���0�V�98\\	�(j8!�����P�{�=\'�r�k�����}��?�W �I8o\Z���\0P��@`&�-��\\�D���\\���\r���x���YR+�ӜĮYX���u�h�s(�_���ݾ�7Z^V����`ڌB`�����?���2٬ЄBnPokh�ŭ�G=垌��d����t�ׯ�\\�\\���@�H�õ����d�[^��(�:H�=}��y]�]`����c�>��y38���G\0fJ>��g���?����I��i	���-�җ���\rQ^�د20d�������C.}�Ѐw���Hf~/� ���h	��ޮ�e�<9\0�������\'Cm�M���5�9����d�� ���y�������V�&���5��5?���Pw����~0�>�D}��\rQ?��ήN=����ߚ\Z��bz�����_���( �A�d���6{`��˿���Ѕ�}bq������PWS��{7�G�����\r�P�8��tLn`������FTFC@�t<YQ��a�bpef$��G�j@ ��mc�D�������~�S̕�wp�n�.\0ۚ���\\����ᇩt���z����ڨ!`4ֽٍ�}5���`������x*^�AOp���!J�@��=!p3�^7>���Ȓ��f�^���_w�gp���9z� pc7\\�|���t\0�Ѕ�.�7�&����?\Z��5F� P��B�|�`�ie�!��7�C��P�\0��/ҹͅ��������@���e���-����VKO�ݐ�O��\n��iT)B�ZkF*ך,�ҍ��N$81���hm���\Z��@���C���ۻ;B:4����v�YeO[�؍C ���w8\0P����&:��_�!P�A�VvB���t�Ͷ�cg�@�\0�����y��s��.Ǧӕ�֛c���!5���������d�B����>�R��	i �!0���q�?�MBbW���\"?�ZŗE��ܻA(�wCZ!-:0���%��Yt/�V�T[���Ĝ�;�]������6�g��������c| v�A�Vl���.�6c����zh�k�4���h1Ϯ�[�q���~��_�]��\'|���5\r��ȟۨ!H�\n�	��������M�A;5ii7E\Z�}z�����K�O���wH���(o��[m�0��T;�X�������3��,-�1t�ќ����.�?�	���������9����Õ��}�t����Գ\\\"B����o��z@Sv���c.�};���ȟ�������͟\0�R�A{�x!8��U��q\ZSĜ@������K�A��t\0j�ڼ�i 蠂O��|�r���O6ϒ✐�G��n U��{7��;��B�8�����}k �z� p�����#�B5������~qy���g-J������s��	=��������;G^<����\'tqv��^~���}�!�\r�d�L�h��	��kL�<����\"*ފm`��ͻ�*��wCḁ�n��$�p�����p*���Z����tҳ^�0Ao�s��t�C3at�!��D:��=������p!������p�B&�\'�g��A �	��Q�2+atC���=�k|3�~�[���Rku��5ty7N�I�݀�\ZP�%m�Q{7��|�K����G_����\'_\nM�����t��gv��g��\n=����_��Ӄyf@ �#��׏�.L�����=�E9�@ 0���K�!;@ ��(����!>wTd�-j�k�H=[�Zl@^��Gr6��t[]��d���27�ԟY��kby}Uh�DM����5�v[�H��vmN��D=̭Md�v�@ڸL.�����0OsC��T�C 4�D�����\0�f��D�z�*�V��p�^�»��孳��>��n���ҭ^������y�	41�8խ��4��i�y�W/�,���ş��b^) ���B�bf�u�bq`K!X\0��@�p܎���%�[X��\0�\Z�ͻ����\r�mc+�?v�!PSWL����ֆЄ�X�Z	��N?����(�`���B�&@���[�t����Ek7���@���8���V�Xe�~q���w��n \r�F�7ÀwC���V@|���A�,�нD\\h�M�⻭�Ȧ�4���X<*�`���V��] ��z�.��\'�ꟽ!�@�`i!��������3_�WhhԻQ���\n,�$��ݸ\n�:�\'���Pn��<\'�	�h�S�V*���@�t�O�l���8&�	���H����;@ ��\n]�O��?u�����@e��3�7�:F�2B`.���#@��@��KJ���w�����ݐn\'�L��3}(4a�&�����!��8\"�u\n=������ySjd�^�c�	2A<v��U��iz�M_	)`L?�E�@`~W��;n��2;%�n@�wC���ͻ!�>����Y\n��k��B�!p�@�^�,�G8�.�ԅJg/\'�]xn���A ���ĥz$��,�mĻAU�qF]�\n���Ƽ$���9��&�҄���(�`��	�0_��f%B���(!Pލ}��5�H�ڼ,�,�@�u\Z�\"�X���+�D%L�$�0�l��@��&�ӄ���v�@�k���.��y� P%���\n:<XjT��~^;Y&���J	�=���aw�9�;�wC�ufyA }�NʯUh�lM��Jq����W\r��\\� �\0��\0:\0����\\�[����P�����\0\0��@���û!]>���@�\"�t�(!Ph�\ZM�]�nUp;A��u\n=�����1LC�`�^�kt9G�	��z\0Y!Y��闗�#�X˻��ض#�j>E�Ш���)����(!���MX��\nOEW�v��\nO�Ѓz��TE�c�uxv�B��\'�O��9�@�G\0�A (1z+��t�8m�2�n�w�h\rF��n �w�㐵茉���\"|vC0i��#C`ue�Є����I�v�@_e�Ѓz�����4k P~�Bf�P���	�h[B ��2p�P��^�@�eմf�ֻqR]�C���\r�߻�E�|���<�ҭ���4\rs 0B R�����	4���:\r���>���!�`�:\Z�M��4�!���K��D��i5�\"����$��@F����\0����4����\r�w\00x7�~�ۻ���ݨwC�]mk�S�(=U�l�*4a�&ntܘ�=�i!P,�A`oG�Ѓz��qg�/����:���@�m��ɣt�!���l9@ ,�4\n�7D!��ve���`+0�w���a�w\0��\rLK�˫�J��۝-NܞX����+�B&j�jS���,��6Z�1���rwy�ZS�Ѓ�z�n�yR�g��f����Ѕ���r�Iى.8@ `�@��@��NF� ]���L\r��s_�?Soűy7d�\r\0tx7��`�@�֣�H8������LuІ�!��>�	5�ao���`\"�8��K�����_=3/Vg��]��]���築U!p�@\0�Y0̓�����a��q�\Z�Ԍ�[S:�$c/�w`��EML�s6�Zz��w���45�Tx=��7�����^o���Eh�M\\k�6R�L����A `���ϫ+�S��ׅL�C��w���&������?atu�/h��0A]M7��	_�����@7BIW��!�� � p�@�4zn6>��\\9nȻ!���X��\0@ۻ����w��r����=O�`�Ƞ)��;w�6��&8j���<�������N���?�3����&��Qm����;�>��3r�������6�U���h��>���7O�aMB� P�ntp�t��ҧ���n�W55މ�Bؽ����KZ��̻�6b�`������9�\rh�����_]��	Mp�D}m��{=��-���~J��}�P�(��A�uMw{G����w���f��h�m�����Q2�� �� BCm���\'<z_]�]i���TL�ؼ*��+[~(���һA���(���^������}!��W���>v�wIh� �]o��k���[\r��5�H;��~_}�F[�XC������v{,�Tv�|Wb7���E�� ��h���cS�}�\n�iA  B��[�$On�\'فN �|\n$�I��ߒ��FH���t��+������CB\ZM-�Pw��h<���L�ݐ}\0vwCލSH��n�T&�T�܎���n��u�7�_�C`���O�;����Y�A�MY��|�lk��|;�fg;�B�[���ݞ�F�U���B��Y|���}\0A@�|q���w����Pw��K��,	=0n�n߁����)��l~(��َgM�f��Pw��y�X�		]0n-y]|���цc���5�\0���B档_%��J?S|�SA�tU���w_���?�\'����P~���FT�H$PV@|\"��k<����޺�������\0�@�J	I�u���؜ME�>���������7�G�t�6�J	�T[��A�QGS������92���zE�O5��;���{$���1��৏�7�=0lכ{G>\r��Gg�?�.{�D뚣��z�n	]0l�M7F~��?y�P\'��A��&��@��~����R�\0!B�+�_���������nB�3I3UT�6[5�\n�K��Q��� 癟ټ���@�\n�����a9:����^z�<����%�\r�P�V���8�,\'}-i���~ji�˰�ݮxC����7�}��iʛ�<��t���\n��MyA��i�ϓ��mm�5��Pv1���-\r-c���o*=i\\��\r�\r݀P���O�AJ1�Nx�}�����Ł,8z(�Cy������7��CU��\"�;Њr{,rO=��{F_?���9��EZ�BE���c���թ.�J���aֈDZ�ze*H;`��B�(��������2�����BI�Ф.`��=I�w�w���@|����(߷�ܕ����e��뫱�����^�+��+˴��5��\rbV��{7���턭�³Z�꾚��ƆK�m��!���j�;X� �C�Mrw0^�g�����Oz�λyM�/Cˋ��͍@4��U��\'b������CM\\�]�okl���v=�ՙ\n0%rv�R	\0��`�{��J�vKS��T���\'������ō�@$�u����ޅ�Cu�o�ЁX�k����5���N��)����#]T�����P��~�\\ؘl�6�@��X����_�8���5{���T��������Vt��q�v���u[�q@�\"�=!�ğt��*xɑ��W_9�ߕ̻!�����P�\n�o��_�E�!Et��g���A�T�BP��Sg[G��RD�����ޱ����?�kR$���Ԃ/,x!^Hwg\r��p)����Z������s������MY�Z·����,�ł�d����?9V����U��+� 6T�.��ͤ��B���w)�\'MoN���+��\0r�wI��ם��yf��@��H~=-ݵR�J&Q��TiZn�ˡ�p��<yZ~<R�a:sT�Z��\'u���bd?�\"s@��Hn������\n�~Z\0��c}}���:!�\'�E��u����KI����xC�rGHqF=�@h�\'��\0�X�\0W\n ��-[;5\0�j�ѻ\0�9���wC��z]��_XR�f,\Z�Vj]1B`���8��� T|V�v�j*jV�JZ@�~�v�.|���E\r��0B%B���\'�@� ��L�F!��\rWjƳ;���n����?���Q��r�����Gj�����|| �iG� ��������c�������}��ES��`q$M	� ��QtA��`5z�jv�B ���(?2��I��U�����y�P����׻A�*���I� ����=��*�f_��+���Ff̈́@d	޼~�EC�Gi�����;��\'h~?6�@��EF�{^4�\\u���;����w�C��ht�`�!p�g�EkM��t��|���{�߃����B ����C�cɌv�@��n��2�s���^�������n\0r�)[fTލ�s]�����9Bz@�_��tC����G��&Gh��e|�Vp�XVC���@����C#Wܝ��C��c�A�\'#�y��Ih�J�C��ivw;DW���@b\\�����x����:���|j��/ �\'P��s挃�i�,��û�d\"Ӗ��j�M6�۵WY�]ni��wt4��Z>B�2e�t:�R��Gu���u���f�m`ae)��H�e��h���l���z�Z۵�W{fIu�����^+OI7f�z�y[�x���v��{���������^b�� s`=��y�|��������|o��-�%I�?4��yh\Zy�B�R&���w����`,��\"m]���������j5Ɋ0�ƻF��6���\nd�\'h,O�8B��%��g��e�\0���`@�@w:��g�|��\Z![>� �nhH7�(� P��2��,�4�ϩ��ɰD����AH��/�]l4��!ƽ� D�.)-T�HA P�V�!��C\0�@Ӗ���EhNw0�S��VDN���X�5\"�.k�F�\"@Q���G�~�8=�`Ѧ<-�st0�5�n(��bK���Zy��h��,��b�q@w0�7��u�G���\\��������6�:7���w%\r�`k�Ў�j�@��|p��4���]+Kw���J���@\0D� �à�\r6��M!��@`S:!��+I2ʑ����@��i�3\Z�@�ѭ��@`t4\0�@mx�8@ �DM�!P;?�@ ���tF��% �\"A �1VA����@+ �z�C 4�q���@�\0��\"S ���-h�5Z��b��\0�FǳC �J\'�=�?�b�(\\�v�@Ȝ#3!PA ����#�H�a�\0���l��l��j罀@3 P,\n( �r��t4\0R=�-�@�\rv�\"}�i� 	,\"#�!���E�@zXDm�V�\Z\" P}�g�t��.`;B ��ܻI w>Q7���@V�������.\r�U���9�@�#�K�z��(Z;a�� Ԅ@�\n��G]�&�a��\r\"��3�q �=��R�.Ա2�C P��A���H^6��4i��j��E�@�kh���~l������d�@�p��wq��&E�#{��@7��Q	{zM/��o�k����Ϋ�}�gy9\n��tqAk!\Z�@�F\0�C �o�=B��t��R������\n��	M�N[C 	���@$#\"�@ {����1L�\"���\n��� ��\Z�;�@���$�I��� Ѥ�Y��XD�#�<!1F��/j���(�+��@}�BZ��F�/�j��z�xq!�\n�)́@\'G\0���@�_�!��y�f#�?lK�H@�M �m�H�<�h�q͂@��\r�Z�f\0!:\Z\0\r>Щ \0S�Im��R���w{�?�NG@�5���\Zi��L��\" �BC�.�` ����b\'x�!��H� Pw���@ C\Zȼ�yq �ص^d?���xB ���i���@� �� ��3�@�G\0�������+r�F�@ ���k�,3&D6�@Vȣ�+NxB �u�@ ( ��<a�#!�;�`��!]H\\!��5�ͺ��!���T �5o��z\"}4p�|�������* :	�E���	�̂@`D�\Z�C I��FH9a�� P�9i!Pk�@�@ ���-h6\"�+�`��@�!�\0��h)8�J	�HW\Z���\\A pF4~��ev� P�9i PB �9�_:NY��3��3( P@��,��j�@v$�l�Vf�A�+$���O��!�ϗ�u���G�t�\"c��ȿ���|�HZd(��9\r�5�^�6�{�T*ۚ��|�&[Y�+��47_\Zok�� �l#�Tv�;N!Ie4�> �N3�t\n<\0��R\Z�����Ņ���J0�L�d2��DyYy���r�Z������juJ�wG�G�s4y���@����V^����s��i�S{�W�����tp?�ךΤm�O�\'VS�[�i���|wV����]+?���s�탘�c�~���^��L�Lc�ݼ.R6҅7VSQ����?~�ꇳ\'e�\r�g{����O��ú�h�W{��a��_����[P�[地肝�f8�9[��O�0�r��A*�}3�dw;,j  J\Z,���0N�CP��t_��g������i����^i���D��R�wk+6������[��A P�Gc�R��(jA��(?K2������\'���m5O���X��]�\\���y��2% ��\'��_�|��jdŦzH�b�X�Xh�wq#4~���ϫ+jR��@}І��$��;�F<�~2����>Y�,�X��߆�z6�����y]�R���c�\n��s<r^��Cy7����O��nƣ�sS�a]�A����\"���\nT+���2\\�YPޒ1���\\>��l�Ƚ��L\Z�f��D�b�>����իa]�WMl�V��?���`̹��%ᴯB����ú�zX��G\'����|�=��D���{�F��{쓉�%�E8�&���?&��|�t��u��j[w0�\Z\Zm\0�����K�;���ɻjz��9:Sĵ��*���䕶h�D\0�m�/)���x��������l&@ e:�r�Jxy����H�Q���_����d�1��C��|�� ����n�n-;J�{����>�7\n�|G�/����r�.V�����6Z�Zp�(�u���v����4�x	�V=$�i�Iӆ\n�V>�}�t\06֣�!����A �������XY[s�&ז�@��5��C�V��y�6<�H=̅g���(�]|�t�.fÓx���F�A �H`\r�,�t\0,~k�F����-�@D���t����!ve�K��(�c�*>P�(ntH��֑rR��f��,#{K�����DL�R��D\"�h����F��_ڎ㩸#����k�G�\Z������Ѕ9��|\Z/�!0@�\0@�����3j�+�r�++g��\rh��Q\\,���Bg׭q+���r��D��)V�8�L��l.�P=�[ϴ2VA��ib����2���u�\n�4�$t���`�t���A�\\��wp�n��e����x��w�!й�`.�l�@g���Ha���Y\r���>q� ���G!20��/�Vv�����́�Wۏ�ւʐ�U�P,�PH���e���6W��H*��t@:��6kj�Ļ��bs)B�.��!�\Z�E�T�ލӥ���g�\nR�C^Oy8����b���7����棡���4�v-�ʨrx����j��f$����U(�T*Ռ���̟��[.�/���[\Z�g�ڮ�d9i�A�\';h��ل��-P�gvi�sic)���#�x^�B��[����\Z�6v����\n�b�;\n���O�=����\\z�ژl��u��ڻp������0W�k��{���N�\n��L\'���\Z �����9�O	��«����%H�����\n%�}y\0��́@͇�I�ˠ��tl0��\Z�eQsݷ��M�X�G�-�����\n�iMV�C���5,�w�:�:|���_3v��m��̝��@��2����3�[��lVhB�	7(�7�7�}p��Qo�\'��@-s\n��ez�lpesy ��=���h�:��_����8�A0u�,{�����ͷy]]��k���?��\"s�!��\0M[	�h�d��v����H27�Dφ\'.�������z��𽝽\0�湴��N+��u�H�񄹞�����\\��vth���PSӥ�}��G�=SMЍ�,\Z�ʚB��wk�|�ӫ�����A��&�#�CKOV���t<��?8�\\�ww��,\Z(�|���Мn���o^�ί�	=���z�5;4�ś�@K��۟��KB����	M:@C���Y}-t������/������|:*\'`�JJZ�_5D>�4�d�\'�\\5�~�h����:\0�B �j@�\'��2u������t�P�U�� ��RTpK�\nߴ��k��\'=�IA�{mc�a��L]Ww�hmmU�(�#5S�,H�2Fwcu�oB�[�;B�XX[x�L%�n�G����| �\r���v#u?�|?����0�6�0�گ��r���J����ѵ��3���I��.(t��a\"���������QUhg\0T�@�;�Ƽ|�T� |~���@��d���@�����\'	�K�\'U`�w�$�-i�I+���*_�T�t#��gf��--��V�?P�2~fA (�B/��u.����{B:4����~2S��vm���,��W����f�g;g�f�v��t�aug1�l2]���?&�:>���/�(t�C+;��ׯӕ}�������@����!б\0�h��\'��Ob/��PrIE�蛳I��lM;g�ܸ�k�I�A�ʬ\Z�?9G���^�u\0_me�WS�ݥ�@isY�w�؞��]pM��E����^�\\�]��E�\n�����X���.�6cyH�롡�1R�k�97c�>.�w�u���?�@cms^Wb@\r�,�@�� O�n3y)8I��A��T �5\\}:��d�ӑ�<���[�`Ze�\Z�±�I�\n���8�+<6�/9M,�蟛\r?��\"FY�ӻ �U`X����}��[��kb;������l�뙂iޡ��������?����z��]�>����豈�V@��)b��};�����E�E,������r�O����\Z�1��dSRs�\"ơ\0��	4!�������A�Oŕ��׻�RiU���<[�\r\0e����Z�\rl�N������~�x�T��V4������ਉ��F�ۗc�K�ls	��������z���zX�,�������#?vߨ�O�B��B~��xt��8B��POdx�S@`&��l����T`i�F�\0�\Z�ͻ�h��FQKO�	����E��錧�mL�<�k�B&hb1�4�L\'=��@m�P������o�L�Û��p\"�8���\rO	]���I�.��ZSTY�&\0 e7.7d|�k@��l��\n,���4����@D����@�s+.ovz垦6l����&L�ď�?ݓ���!p|rL��D=<{��=\Z\0�~���u����{�pgkt�� %��B ���@`a6�����,���b*�.�D],�\r��n�8\0�wC�^�ml�e�97]t����!���%4a�&��W�2ٌ[�z�C`.��kB&�a~���A���$��p~mF��T]Lt�t,\r���Q%����d�KN�K��n\0�y7T|z��{���V7]����������Є��[z�]TT��ԟn48�8%�`�&_v�?iJ�/~��@��~ꦂ;?̎X�X � rJ�6��L�p>9��(+[x7 ƻ�R)�q�ڶ���S��C�VdGh�M�m�T��2T���*�`���d3\n�ZG�A��VH��],m�\rPf$�@@��\0xr�o��@�G�D��pVY��T��\rdȻ��P7�R�y;�-@�\r喈�[��)�ѻ�!0�H\nMX����^+�t@ 2	��{B�a7m�1#Hs}\Z���KtA�ϥ�@h����9@~c�8̚����\0���\n��#�0=���ȳ��n(����ߒ2�A �O?�>��@�t�O�}2B 0	��ЃzH�~:ӂ@�.a�(�^��t���iBM$Ԃ�Rq��8���C �!��T�e���XB��;�u\Z�B����-��y)2�BJ�	MX��l^\0lv��l.+�`�2^���Q���FDu�B��>nf21���h�40l�J�y1�u��A�p|���ƻ\0�:�\0p�nȮ�8����3�@�Qh�M 7��%�@���@�vfA ۹�}�j]��9�@ӧ�q����������\Z�n�h�>�4�@h�lM�@ֹ�@�Ѓ���@�Ѕ���v@�#4M�@d�*���Y��(�	���P�q�no���@�	�&�h�\r� �\riVz0_| ��41<!P�\'K[���fX!��\ray�SL����z�b`ȗE�Iu$����@�����Q�����û�h9e�!�!�B�hf��������Ѓ�z�;��(ı/ta�}������B�i]�tA �9�� ii�`�MG��P~:����P5�6�r6w�ǻ!�˕B��@`t	MX�	w^�ؔ��q�!��r=X����vD�>xv�B���\nԚ���h�(`��\rA��7e�0B�-�҈k�w\0�ލ▞ލ�rw[�md���o� ��)��@^�7���Zz<�N���P驌\0l�N�T�W��<]TE����s��=�fA �\0=�0�~���F^���@XU���\0�0ŻQQ�	�\08�XY���@ՕUa�{H�!���F��=�*k�Z�{@��\'��uB�&��\0�m �@�e���fh�\'�ҥR���\0�/�(�s6�Zz\0p�nH����i��������\nMX����+�T�?J�-\r�B衭�c�����\r�B袣�k�\r��C��UC� й@�@���^����R>��J��;�J��n\0���PL�˻!�ZZ�����.<Y+���Є��j�:\'o��@�	�����qk���\0�7;n]X�������!���<@�)@�@��_�f�\Zʞ`˕Ż��q@(o�Ah3����cΦ����{�r�����\0I߹]��+��&L�Dە�\'e�,��P: �@��enw���C��D=\\k�~R�.���O�#��!�p�]M�u��t�H�u�u� �ĵ��	�-���˕ͻ!��	��� ���^R�n6w�wΦ�@�3f}p�@�y*�\rtM���;���X��4�?�����L���ޏ������i����Ѕ���eﯞ�$;C ���\r�,�x��g\0@��.5��(K�ٻ��O���ջq����n�T&����.��O���o��-�G����z&+�x�S�M~�	4���:R����#s������Tg�U�������N�E����5���7�.L�E��/�_Jo�̮H��#��@ \"B `�@������5��ㆼҖ0ɻ���Ԗ��Mo�_�\\5�{��)m��\r�ou=�_�	Mp�D��a|�����2m��\r�B�/o��i��I聣Z�m�Cw>U�.� ���O��Bu��:>|��O\r�#��|G#+}�n�,zfDl�����=q�B�wC���F��n��y7��l�j�U[��b���~1���B �9�� �_����&8h�rm�D�w���Y:��w��W~�_聇7��q\"���(	��C�����A�G��_5�6	]p�Ec]��ݞ��Ȏq�RB��#��3�C�`7�jk_V�����l���l�h\r(���P�\r��+���w���2����ͭ�cy�jӼ�%�@_MU���a��W#4a���]���3P�4x�w9v��{��z0�m7���G������~_c������Y�� ��l�=��?ʑ�J�23-<��,�Щ|�i��ނ������Щ{����t��t����<TY��	����L����»!���y7���*]��u�+�;�F}>o(�]^\"�r=�S��Lg�� �O�\Z�ZB��ʝ7sˉHtWh�������\\{)\nT�|qm%�W�O	e\\to�s��o�ۺC�}�v~�y�X�	=0n�n�`��ц�+Qu��*� £RY��w|�S�����P��qgl���΂��V�����~^�\'D�+�N����O5m���� 0*�K�x$�O�[$��vݮ|t����\0�@�J	Iv�����n ew��V�����w[��<Q��������a0X[[}���Z\Z�&��斑�?���$�G5���\"���\\��G��УkMׄ������0�#lN�6�5E?\r��G���B[a��_���B�OWj��n%�Z�A����_�����}��j��P����\n$D��m����Y!{:�-���7�{���\0�*X�ϻrt����+Zz[���pys��}*���q�YN�Z��A����2:j�������o�=�4��x�$茾L�^�A��39�xok+:�Y�	��v��M��c�������Y�V�֓�V�|)B��ѥy�o2��|7�ý��Ձ,8zPv9����\rc����JOU���Z�k����;ۚ�Y�ԯ3��{�~����P^i��\"]�ǯ6t�\r�|X���D�{WI�Q�G�b������ y����+�t \06k<��\r�\'�\"��X$H��\n�� �k!�Q��7�μ��}qb���}N��tߜ�޻�]Z��[�Z8CU�g�r}�lS�/t�D�XN�@x�4\\^���܌b{�CM$����ʊ��B�u5��͍���m�!\Z�:Ox����\\���J`;�}��x2~��P]Q����}���Wgo����a�|B��6���sa�m`+�ѕ�F�~2v�tQS�;�E��q�jc����;!�<g\r�������`�9ɒ�Zgߟ�+�\"z=�x/���P�#y_�����,�?�b�w���Bkΰw�b4ݜM�\n\\w��yߝ+�����DG��~,6��vy�z��T�\Z�{1������*�����~����Ζc4���?���|���D����V��[�	�KS�����P�/m������Βc��R����>��� e�:X���p�;�\'Pc�\'`��k\'T�K������.�3�]��w>�����NM]N9���v%y���N���e^�$����Ꜭ�	����������U:!mǍ��JX1~��\\�}^���\0��XH9\"�ʻqv����]����uz�m~�(�@e�ڊcK��f�H���M4����ݺ5���M���R+�=��4������n}4��ns�Z�������z(Q���?�rn,���}��32� m�	���ߌ4���������ߎ��1�V��g�`�AF<��l����ڎ=��Hd���mD�Z6�;X�e/�n,��p:�N��rYTl���p�[Q���\\=��^3˥��\\uc�w-�>��b8���L$Rm�l�6�(s���*+�;Z[ƻ:�Β;�(�\Z�פ|\'�{�Xw��s��5�0�[��\'��2��CyY�^Me�r�������Y���zw(]��丼��z�B�_Ċ�@�2�C`je\"K��u���.<{�ʺ�����۝�r�6&��P���ۿ�w�©�\06k��/$�����t��^��� �~)!��oŦY����	���|� �x�熀��t0)�G@��H����rFP\r���E�@+�ԥ�����__�q���t���f|�\n��Dz&Kf��Ť�8����d:c�Gc��*ׂ8i��b�A�ݧ��i1+��־fR}\"߂�w�?\'��4�ynDw~\\�@3h���]��Gz�ڡ;�s��X�/=�HEu�����r+3/铛�POr������M���2���d �v<H�Z��6��e����^ih��u���Hu`P�K�4��G!�n�΢tБ��5���\ZX^�&���L&kM���Ū**V:Z�����	U~�B�R�7>0���vN\0�&Z�>�n=��F�e�XMe�J���X}�l�\Z�S����\0@?8_�Z���!]ͱ�<�?���Up/kMgR�х�̛�E�\n��_| �<q0\0ү���ʴ��@P�J��A\ny����d�E�IkF��8��RA��g�G!ՅƋ��L#�2�w�v�.-�zw\"����˟{�e)���^ħa��L����?�l��V��~���޵ͭ� ��+���Y2��3 ��W��\0U������ɸ�O�~�Y����t����V������������:e���\nqz��O�y����\'ˑE��\"����6�ֻ�17��w����\n_�>�*ȵ���E�\'2�]��J�7�ˇ����8��}�]6��Zy^���We��$�>��Mms5�\0 u7��j��F���l^w��ޯ^�낿hb;�����a}uQ��Pw�ڞF��1�CliҟS}�o_=�%��zn!�����oQ/5ܾ���������,��`�cُ2�ú�����L��0`��h�A������+\0�\"d�x`@ �6u{o;sWM��0�žq�2��l(n�1/t��{��ݥ���΄@D��\n�^���7sK��\"�������ݩ��~�����@V��ZI�k��}q;�v������8�C��!ޕ�����ւ�t��7w|��~�Z������u<\n����!�t��)`�����g:c�l y�jf�<��Pk��ax����A@�/\0���%\\�`�K���;\\ص��3��r�JKM�z�,$�����4��<�/Ncee�ss+\Z��Kt��ӕJ���8���_T��j���7���0{��-D��6:�mԴ��Hקu��6�<߹��\Z؎��#�D^�B��[>Z	�?�~�Ho��H����d��R*\'���D���|`+�y�H<�w�tQ�9�E��q��r%� �9�\\ܤ�W��?r�40G\0��nJ,~���T�2s0����eA��f�\r���x���YR+�ӜĮYX���u�h�s���]�W�uݨ-/se.f3ٲ�������@6��Ph���W���޻y+����^s�@��3����?�7��lF�A�7(��5t�ݻ��ܛ�(�:H���\Z,���]��s���[6�-��\\T,l���\0h�Rp�Aj���ԑ�3���}�4u0]�>����݀��J���^�AH+m�B��]�<9\0���窶���\"_Ǉ\Z���\ZF��P:0���\r����Z����\rї��W����m�	\rM�#kC�=Yjony�A�;��z-1M;���HO1pE�v/|��˱����A����B_�u�߿=4j��!|�Q~��?ήN	]u���ߚ\Z��bz������۟�\Z�.��}�v����X�n�mfp\'�s���\0������f$82*�����t:[w���h��%B ��L7����ݯ��no�	M0hbi}�a2���u�g�Rmm�T�GZ�ݮ{131�Yz`������D*^�AOp���J��(���G���g�\\�,	]0�bf���xj����u������A g\0D�\nw�2�;��@��W^�^.���YH^��\'�nH�\'U`�w����}�5#�kMN�F M�gr�M-��# ��3 pue�se52ۍM�����V��Legk�Xg[[���~�����P����@�t�!���v򠲧�w�F{_�պX�\n�g�O-MtN-OlDׅ.t�be\'|:����v{̈?�nx�N�y�-%&��og5;��C��+�t$aQ�S��I~��/�h\0�w���H��j�R�9�Tf�0�ɍ!�\'���_[���T�xb�!P}�E+!po/�[Y���_Bh&�{���\n\0�jk#u>_̎�Ƽ���ގ��]p=l��@C]C��k�с�}!0�{|\\���b3���:��ƺ�H��J��@�u�)K�!S$ৈQ�ϒ��)b��f�?�𽝽ǐ-<y�M�jÆ�%���K�������L�yTs�i�b��7����Oh���Nl�bv��^�����G��Hm/ez?M�|�%�\'�\06w7�ǧ�?`����)b��|�\\\"B`c7����\'xQ�<���z@`�Z���.�Ýy����S��\\<�y�焤P>*�wa�\Z�����$����v28�z�>��aįl_�Z����\'4q���H$�����!�z�B��^��_�l=p��jd%���_޷\ZG���?�����8��rd!���G��B�@�	\0Hx�kDݴ �<a4��sp�<��a�Mm*ފ�ʅ�n\06�T�O��Z�\r�1�ڻQ�ғd��>[���t:�A4a��uB ��Q�����Є	�X^��ij��5�L�<��%��0~3�H\'<VB���Zx�.��{ބg�.L��lxr�����m Ф ˍ���b�ko���U`�-�V��_C�w�����\r�h�ՑZҖ�w)Χ�������Q<-D �2\r��f�W�&L���S��i�?l�?N�$�`��}��;����={��Ѕ��}��x���.6���]!���(����\rq�i`Ze�\Z��e�I�\r�+p�H.���P��n���P6��� p�@�4\n����B&jbu}}� �q;s�\\Z_z0Q����L���QI �����7B&�bnm:�8p��]y�]Z�D����\\�W���8�z7T*�����-��wH��[gg!~}�\r�}t}%�M�/;A��ҖЄ�-/uS�Y�!pfqN��=L-Nvk�\Zb\Z�a.N,�,ta�.^-��͓X������A�)@�B��6\n�Q�zK�w\0�wC��y7�}`ܻ��E��-�**?ߎ�	MX����#�&����+�m�=X�����A��֢Ѕ�X�zk�-�@�]K�l��2����H\'A�a��/�s�n@}�\r���(�f�n(�d\"ӊ�Ki!P�o\"���@��D+S���T�;��_�\'��,�C,�ۊ(@�\Z�>f7��@��N���]Tt��4�7�2��O+{���T���	�+44��\0@����\08���aĻ���~��]%f1]�ЄٚH��~]e�h�<?L�SB�!�N����ld���dpB��]$�q�VlV@�-\0��t@ ͨM�i�r��[9Pm^zP4��һ��� �8�{7d��C^C#{-��\\.\'4a�&�����z�D�\\֋G;��رB �	�Q�z3B���,��/:\Z\0}|�8B`�w��>n��2;%�n@�wC���ͻ!/��|6pVA�ЄE�@n`��,�@�u\n=X�D��a�@����B�Ѕ�@[ BN�@��N\\�Gf�,�mĻAU�qF]�\n���Ƽ�,���B�Є5���3�J@�!�<W����Ѓ�{\r���.J����\0�Q� Pc�Ɠݰ�\r`Ȼ���ʬQ	�#I+7�;/�1� �@�	+5�\'BgMh=p�G�g����\0��b$-ǞV�D�L�G�nH+%\0��nH�C�Yܑ�l���\rY���\"̺��i`\0\0\nMX�	����u�0��)�`��eȺ~��Ѕ��	��U�%�\0J!P��~�����|f�@����\reK�N�\r\0��\r��k�,�\\0E߭O�`�@y\Z.�Kh�M�>D&C�[��=�]��`���\'C��U&ta�.��Y@`IP�w��A�����*�m;»���P�\n�z7��]��+��@����n�	4���Gh��7v������\n=X��\nOe��H�VʮW��,]Tz�������:��� ^�%A���\"%J�M�e�kW\\�����Tm���~ߏ�a+)Yv*�SI*��d�[�G	���t�!�K �e	K��||�\0�~���ދ;��t����=�\n���s�g�7gz�&)o�\n�d\"���i[K�w�8�Iߍ]s0��\r���׏���ά���W��!�5��WK���M4�׏��k$m3R�o�o��A{h�o\ZW���A`s}����EK}�8�x�����!�[^�����]Un!jߍ��b����}7P��0�n�J����n��F~���^\rB�Klko�6A���h���3�\Zs����A{���J�\r�t�vA�����!� 0� F�@�F�����Pobߍ��0�n�~ߍ��8�>�����ȏ��o�ނn\"0��U�Dm�`���8##, 0}J{��=�=v�Ԡ<�\"�X�	i��㽯��/iL4\0��\Z����^%�5w�{���wcW?��n\0����{c6�uս�Uz>O#1�k��(���b���Y�D�mb�ޮ��*+��2t� ���j�g�>i!��C�}��P����C Ɔ��l}��_�vb�x���{��ۅ �Y\0��ѱ;dv�å���w����F�\r�m8��݀¹�?/Kc6�n��mv��Y<���i���2���M��&N=|���u�\'����b{8u��%5�8sG��׏������׎}�	���T�%?�l�t_������.,����Ա��w|���Z��M~Wz`��F.���\r�����?a�7.X[[�Ե�Y�Dmb������%�1>��u���[:��/�!��З�l�kX�l ��Z5�\Z�^�H��]d^l�k^R��I0S!��\0o���1�ذF��n��%wx������F� ���n4�y��=�ӲqH,#���c\'�]��� m�b��h�3򥗏_<NĂ@�E��_����)��b{ȴ��W�|�aa �\"�[����}�=�.,�����#�~��\\�Ds��3;����Fݸ.�黑�:(ځ�=ϱ����2�c\Z��G{����b4\"	�%�w���T\'m�B�hmi}�p��8	��(������y����s��#�\r!��[s���}��Ζ��.,�������G�1d�A`D\0ԁ������m��5z����(1�{�E����w#`4wS�ufꇳߧ��`	�h��Ʀ�����ᦦzi���ݟ�~�&\'BG ����e���w���Mڃ!����~�VߖB ��_��h�9�s|���[څ��G����\"p�4	%,U��~��^�������\Z7�W�*�	�=�-������v�ښ���&o��-oa���*��L�Q�7\0�Q܍�n<���wc�Ā��#�����������8��\\3]r �l��	�����~�Te��Q�I�ߺ���55�Nݺ�xajzN��d߶g��ᾡ�������]���r<B�`���J�����Xks����M=����L{f�#_��_�m]�6�_Sj{����^W�D�k7�z����掩�/�����.������e8m*��O-��Yu/�Ƒ�\'h/c�ِ�k�鞗��N�p�p�+�SzA�uBH}7�l̦]W}/I���ye�;\r��Өʲ��L��@T���լ�~�����j�6��}�]�����;�?>V$)�ֲg�_��;���=0�/�7�[���NGk�4=�G�Ņ�	DV&��u���>�o�9�}L�#2���ﾳ�?SE�	��$�x��Ua��L�6�3���g�zC]�p��u��sO+OgKh�����q3}_	��un/#?�EWw�8���w�����WTTz�-m5ýMV�T,�21Y6��	���g�2>�3�G�g��w]���ï?��;�k�&����r��c�����?���Y.ئϿ�>V��k��E�	����K_\Z:y���?��ē���`U�C�	��j~����ǿ�a]M�r��.(φ�d��kK�3����䷇N���_\\�����og�Ŋ��]�z�`g��o����5\r��su�f�{#�*��ӆ��jo9�\"\\�����xš�IX����}Vg`e���܁�.D����J��յr7ꛪn���\\��W7�k���5��/���B�����|2;07�ԟ-�bif���D]]̓���[�\Zovu�]�ݟ�B i8���+w�U[S���+_�hc��z�xb`z�Y��3e�\Z�\Z��o����fOׁk=c���\"�>�_��������|���vq��Cw�\rL�<�hs3�e�.�ꚳ�	X�h�{�PW���3E\\j�l\0�>I�	�ۥ���f������s?Z����n����w�ĭ�l���=on��+y��w����|n�%��e,��u�p�{��C���/\\Il�x��_}��r��y��=:�pHjW%>H�++�zz�r}�.��K��w���p�;g�,}�G�����~d+�@ ��6�#�?0��)S>����ib�ſ�?�IKtq�%�!\rc>�o�}i�	o#д,��\0��w�nd�\\z�������q�	D�>��:�Y+*�D��l��K��n��\n��@��9�I۬`�~2կ,α���\"��bygM�y(������>����g\r���)|EeEeB�E�2G&�0������M=\0�G�Փ��UU�;\0?O�;�w#o�����O�Q #A Ą��ڪD�����܇-Xm��v�k�6��u�u�l�u����O�F`p�8\Zj�.6o�r�%L\0�\\v�N������ߴty#kS��黱��=]���\'��Xj�@}j\0.v�mMd��t���納@H{3=�l�2��X*�Y��K伾�2_�$�]d��%LA���k!�A XD������O��+/��v��V��w�pUF�)�V@�k�ڪ.w�ł{� �\"Pp!#����ֆ�D�����ˇ_80�ߏ]@ ga#���O~����D��LG����\'GiX�d�҆@U6P�����\'��&�]�t�������AK�&T+o�����hK03G��Z�zde���+�=��|U��Wf��;�j�S5�{�np�Z8�@��@��@>T���o���5m���e����AjvM?3��@��@u�7N�/}i��2������=����yX�\"�d6��!�/��`we_\"�EO{�ȷ^�� jf4�Z�\"�C�_���Q�j���=�3;\nV3�i���=Y��`���4�W�t0����q`zN�,b��\Z49s%P����y�ںkF�zj��\\�]��ԧ������	������G�.�7�/��2���ݧ�S�Vz��֝i������5����9��}��}����1w�ۅܮ<���꜋�oܺ����|��ڪ3��j����^O�ȱ�G�ю������C������TO)����^A�\r:��=�1:��/�vjf�Y���3��f����ޱ�\'F^>��5��?l�V^��Sq�ֹ���2�����b�w�<��(�՞�rtN褓`�\\>\r��u�x��TK�ѳ�fh�n���x跿�@���OU&}��c� �iT�X������@�`E�������+to��ܑ�vppy����ei܂*~5R��/�Z­=���o��T2H��vpp��O��y���ֳT��f������Q����B����:������C^��e򏹪���Pp;8x�6�o�c`�zOP�(��~��\\�lZz��\r��O?�#�|F�,C����@u�\Z6�E $Z�#�a}B,���G ��d0ȈǷ�!�%ۂ�Oq\"��$A`���H��V͗�}Bg#P���F XB`uL=i���̠�Z(����2)��*K;\0ӂ@nyA4{ZV� #�#CA p�@�Lcr��#�!�:^\n}q��EA`T��� �\0��?�x�fYQ P}r���*QW�d\0�a��� G XC����F�~�P�0:z&�ı�\"G �Q=B*�U�H��f}�v��A�(�\r�Fw:��y��u�1��#P���8��.A`����E�<�\'4I�-�r�4��6u2���ޯ@���H�@�噮�}�d+9�&��u��O@ǀ�	`���,���@�8BK�8u�@����!����E �H���z�u���������H9�D�@�\n�ܺ�\01P��D~��;,C\Z�C\n@B`$24�ũ}���s	���@4nè\r4]\Z�o#��G�̜��.Wu���@�x��@A`�!0�a`�wv�N9e���>�\'4�>�@�Lb��6)��u%�a������iA/z^��@>���1�Ծ~�\"��@�\0�}@1G���-�,P5V��Ӹ�(��Q��}V��V�\"�3�6�̬Wz��^�,�W�E �	bWN\"P�zu�\'L���\Z�;Yl����]�M2�CF �G �E h#�t�<�B���6���Z�G���)�L#�z� 0	�!A�erO�>\'bkd�u���mR\'�H,�o{���r�/r�	G ��a\"���� P�.\0Q�!��ΐ���20��,��5�TOU+�&�:8{���\0\n��@;�w��@u��|�Vh��	A ZD }�l�~�#Py\\YB �D �� P�6\0����r��+y�U�-BJ�e�@��@Ku�����?(���mV�D�c�����3���&|r������@�瓃@��m��@bXg��F &\0���@g@0:I�[&����A Ă@�/q!P=?� 0�\0��n�Dg�q���=w�0h����IS�@�!0�i�D;�u\"P���8�����E�@�q�	`�dg�4��1�u�7,�9%V9!�pq�&�\n��b��cT\"����+g��h�#��^�Q%��@^n0z���6C�8�.1\Z�E�,O��!E \Z�k�mҘ�)�z����u���u�\n�G�ڂ�f�@S�����p��Tň@ތQ ���(��-߲v\n�	�Ċ@��@u���4�N�&A�\0;{L\'4u�IY. C@`����7��f;j�A ��@b9H���@�:F� �Vg��M��[&2���T!�;pT���p�C\Z���[@��>|�9��Ɂ��\\2lLҧ*�E�*C�d����N��(�e�����/_⸎���S�I_&��k��YM�C 8�@>���qd�g\0�F~g!����j�9��>�k!�B�ѷ��#P����4ƃ@{]�Q�&��`�a`V.�T%\Z����}o\0>u�^�:D4_��	��!z��!- ���u�\"�:u�`�@�� ��}OT4{B��t#��@����#�[^��P#R�@\"�R�@�����z�>\0���|��7A`�h�=�H����D�M\0.����#ҏ@ډ�Q���Ș��xBG�d\0Nh�@�+#r���\\�]�\n�A����ŕy8w��5\\G;�@\"��h����al\"G�����d�Dk���4A�9Azw&(�2G�~�P��5��k�ߒ�\\X]Y3���H?���@��݂@��?F�k\\S�ȹ�LF �3�IA` ������T�]���D ����G�@��A���̆������5Br5��:Nh^���� \r�g�1�g�tH�̆�@���+�p�/��@�l%�u�D ��. P�	s_�K�6,�D\0�,/�(���#�0�� 0o�a�O#Z������+��\'{]B h#-�a�thؾG�rĊ@�rK�A��8w��@�\n�\0��7,�D\0>]�_!N\r��@��D�r�;6W�A�M�@�aI�g�X$��k�@�B &�`���t\Z�Ac��G P�6�&	�ڑ��e-5�p�[\"3�+K��{�65�U;��C��?�k�,�t��6�*i0�#P���`	�h�@N���h����a�Y��=y�G�@>���1�G��-�����/��O�M%����d|anYy�p���F�t�@ՀѼ~v�(�t�C �G �G R��n�R�p�깢�q bD �	�(H9��T��s��☘���D\0�b|�����ޑ���N�O�&ei\"m\"�Q�YgK�I-#�h:O2�����h}���>qG�@j=�D ��A`�|0us�QI���֕� 0��9[C �>��!s�`��2м�c��.G�\"���_f9#Y���� ����,>}z�,�&�7�M.0\Z\ZeGFA��&���&�2A \r����f��+}�D�~��#��<���h�h� L$o>\Z�}��6\0/�-?[^\\�B`�k�IG �@��@uL\0��0�����l�@�N��y�0A �D ���.Lo<�����\r��<]���h���\"���C�!�q�@[e%�&�	b���T���y�B q�@A����\Z�)r��	�H�����\0�J:\0o>��W^ń�@�i�\\A�Փ�*K�6n\\�0N R�@L\0��j������R�@�eR�@%���Ł@�;�C���05�h��Y�N:\0�<���u��lq\"�v�eg�4��1���2,K���,\Z���m�T!x�2M���D�=�9�_�M��ԟ?X?�5M�v����0���A�\0VW֮�L�k�ln#t�� ,\"P�d8�^� �pq�&�\n��b�@��l���,l�}�6���om�.JRХ�):~n�g�^z\0��O�<�!nB3�c�\r�\\��\"\r�5�6)�p���@��h�vm�$�c��D ZD��΂�|��\"�zh�8�!���]�����sg�~Z\08:9>k�k�;�ߎ���cB 8�@,s��Te�4`��2��Ć@��@Z��E��[�a\"R�@���C��\'��h��o�<��_ ��+�kx���g;�_���4u�IY. C@`��I�F��0.�ZI��+��h�\"����!�V&o��<��Q���&�W�[����*M\0�������A�F g�������9��Ɂ��\\2lL���E D�@����?�A :�@{Yh���m�ŗ8�!�g �L�2��\\[�O� ,\'��9,,�^:w�����ՏߟQ�l:�>�;;�����T#��Y��	]��@5l��@$ ��@�uD�6��@p���@n�4d��[��J4�\'1�8h�p�>k�0��O71EE�双ߚ*<癌�	�W��@D4_��	�ʰ!�@��@;����q�b�@�mrT^T���c��l`0U��˱�l��G���dZxqn���!�F\Z1���@�%�X\02S�O�\n��jg\Z��@����#���\Z1�� �wzXF���u�e�����$�,c���\'������@��̡!�z��A j��\'7��V�\0��D��zeD�@p�`\r���^h��CA`��������c藨x{yq����\'���\r�\"Q �?Ǩ!Ԫk�D4|����A�(�\r�Fw:��y��u�1�DA�#|��.|�׹.A�Q�r.��M���� ����E���-�I�-Z�M��	3��6u2���ޯ@���H�@�噮�}�d+9���#�d��h��O�\"7�����m����	�E\\��cW�n��t\"�7� 0��D��e�\0��,�.i�S�砅@�ۯ�@�6��@�u�/��@�sW�����>7x��(||���y�}�YC�\n��t�����6�N\nmp��2QwX�4\"0���Vq��8�o�\"x��D�6��@�E�a�6B m��̹�@�rK�=�T��@ZD`n��G�8��X���+~��\'�8�b�@O�F *��q^�@�6��h�,\"B o�¼������z���@�ܼ�2�,�vu��B`h�t\Z�AЋ��׆� Pk�[2Mf�O�����_�gx:7���ϼ�i���x\0x}m�g�>��54@ ��@��@KB#Z:Y`�01\Z�(��ʉ��uE_��r���D�M��	,��-i�G�@�X$R����!P�zu������>���9%�\r������򥛣� ���N��(;��@�h�������v�4�\"��4����h}��!�7�L���҈���g�w\'�������̭�8���f��\\}�;� 0JrO�>\'bkd�u���mR\'�H,�o{���r�� P���H�g�$>�Rf|2;?������w�?�v�c���\\���ͩ�w���@;� 0FB*��!K\re`x�Y>4�k� ���P�6����yأ|8�����[����o~F�\0\\̥Do_yO�ň@��v��\n��Y�\"�\"�B�@���u�ϝMٯ�qr��<w� l\"�VA�����2���?�e\0����m9�@8���������LN��@$�_\n���r��+y�U�-BJ�e�@��@Kut�ʩ+� ���J ��ٺ�@�L�ܑPR3\\�#�;��\\\\��?���\\߿KY��3��SF\0�B�5\\���x6�4C m�@�8�2Oh��\"�B 8�@L51!̟*�!�N��IE�j�@w� �;�K\\~���S�����=�2���y*&��[��=���[��>\Z�5�l��)z�D ��>�Yj���B D���0\Z���m�T!�@`\"��הm�2�/��@ \"G���q�����7����c���<����Y����(�-\0��{Bf���O�sS��:���ID ;s��@݌�þaY�)��	�����U�+\'���	4���U]�8F�@p���M�E�@j6p\'n?�\n6�s}�������gcڸ��\'������ӿ�l�>,/����iD �\"�A XD���\"�D�Q��&�d�H_�h!Pw\0lA� 0>~p��7n��.N��[g~2�Z��Y\0�Jyg�~껇6;����w`��|�D�ț1#\nb�#E XB Z@��[ֈ��1\\b$�+�\"�u�#�dJ8A�M������!���1����GY�}�[v���>i��w~�-�+o�oV\"�ߝ�y0r��ќ	��=p�**+v�n�^�ϪW���}���wϯl����:��o��g�<��y�IYA�R}�[��L�	�k�:o��q˱TO�#nK���Au$���=<��h���>G�҆	mƤ�����i�>�ʣ-�w�T���u�xeҗ�?�>���Zgj�Ύ��qη~��[^P�zOP�J�t}��p��ܾ?x��_�#���q��ߕo0�j\'�S�}�j�?������nem]q�]WP��h�tigM2w�9����u�+Ѥ��3�H��M?�ʐ��	E&п|��v�:\"/�^&m�^�|�`[�bq��$H��Y&�t�Teҗ�?��g!5���sd|�@��.,���#~��Y��x��K�D0�J`+���\rl�l8�{��k��d�eUW�2����E\Z3�AY��L w�e-e�<u��d���β�3���1�L��,tɿ9�	,��g��a�	�{�2���4��������Η��.\\�In�������I�;�\0U�E��sl�n���\ZvAP(��mh$�l���=<;����=\r�o���#��=9�\rg�w���M閛�c8��I�ȿ)s\0��Aщ<��d���B0��k��=u�#��� ����id�����	��E��� PX\"�����.��&��<:��F���|�篿���5��v�o���WM]� �9����F����=�?�� 0a�K�Y�3�\\���� P��D�:����Ƿ/�g�G`m}u~�˃��\ZOV��\0���	���W�__j�hhi�l�=]�P�X�$C���F��^��kd,z��\0��!3�ܽ��IF���O������\n\\�	|z��\\����sù|��3?^�}���@�N#���6|���췁�ב�����hi����:������2G �@\'4I��4����vڰ 0��Q84_��!P}u��w`j��}z\rn>�;O�.f=�����\Z͢o��,3�\r��8��>\Z���~�ǝ����w�om��Y6M���e�e��~�UUW��6TC��$^�W�a*��%xG�Ԁ�Ϸj�F��^���]�}�� ���1�[Q�G�k�!����F=�x��!��r<��J�@��&��m�� ����c��R�,���\r�q��j?���hҖ��W~~��t�s���NR�c��c�1����l�fq\n&g\'�ѳ��~Me��e�n�y�/��>�B���\'�2��hA^(܎,g��>������^>�E���Z���bf�W�ٯn�������Hz�2y�[��`��3?zT\n�~v��qG���%$$$$���Y�c��D���8�B6��������Dy�\0PBBBBBBB�������������D�B2�@									����������\0PBBBBBBBBB\0(!!!!!!!!!\0���������\0JHHHHHHHH\0%$$$$$$$$�@									����������\0PBBBBBBBBB\0(!!!!!!!!!\0��������\0JHHHHHHHH�I�\0#�a�68�\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `FLOORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATIONS`
--

DROP TABLE IF EXISTS `LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATIONS` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOCATIONS_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATIONS`
--

LOCK TABLES `LOCATIONS` WRITE;
/*!40000 ALTER TABLE `LOCATIONS` DISABLE KEYS */;
INSERT INTO `LOCATIONS` VALUES ('0','Principal',NULL);
/*!40000 ALTER TABLE `LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERLINES`
--

DROP TABLE IF EXISTS `ORDERLINES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERLINES` (
  `ORDER` varchar(255) DEFAULT NULL,
  `LINE` int(11) DEFAULT NULL,
  `PRODUCT` varchar(255) DEFAULT NULL,
  `ATTRIBUTEINSTANCE_ID` varchar(255) DEFAULT NULL,
  `UNITS` double DEFAULT NULL,
  `ATTRIBUTES` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERLINES`
--

LOCK TABLES `ORDERLINES` WRITE;
/*!40000 ALTER TABLE `ORDERLINES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDERLINES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ID` varchar(255) NOT NULL,
  `ORDERTYPE` int(11) NOT NULL DEFAULT '0',
  `ORDERID` int(11) NOT NULL,
  `PERSON` varchar(255) NOT NULL,
  `CUSTOMER` varchar(255) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0',
  `NOTES` text,
  `DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTMODES`
--

DROP TABLE IF EXISTS `PAYMENTMODES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENTMODES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `BACKNAME` varchar(255) NOT NULL DEFAULT '',
  `FLAGS` int(11) NOT NULL DEFAULT '0',
  `ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  `SYSTEM` bit(1) NOT NULL DEFAULT b'0',
  `DISPORDER` int(11) NOT NULL DEFAULT '0',
  `IMAGE` mediumblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTMODES`
--

LOCK TABLES `PAYMENTMODES` WRITE;
/*!40000 ALTER TABLE `PAYMENTMODES` DISABLE KEYS */;
INSERT INTO `PAYMENTMODES` VALUES (1,'cash','Espèces','Rendu',0,'','\0',0,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�~.�\0\0\0tEXtComment\0Created with The GIMP�d%n\0\0�IDATxڽ�i�^U�眻��;3�t�Li;]\nCYD[B�(DLM� ��h4��&��cB��1����\0�-�1`R�J�M�v��,�����{��4(X*���|����<��?��`��ʽ�y7�V��?޴vÎ}+>L�l{���ñ����kξ�=�d���\n��jŧ���e-/M>���o���ъ�h�vPBQ��8�9�޹=m���֏o�Ǉ�}� :on6�p��ơ��_��D:�/��PB��vg�=��w�y��+J+�p���^���7�s��RK����rW��N�����#�D�P(zIm5\ZL4����_^�f���\Z �u��֩��ܚ�E�9D�TS�+��KA�R�P6�Lw��j\"#ciߩęf����Lg�֏/\Z��I��7�L����t�׈vK�z!���N�ީ�����\'5�Vؤ�t�$m7`Iu	[�4�&}�>�>�u�z?��ލ��4_��/��2چ�p*��XYF�2��q���0�s8H!.Q�U�3�+,�JC��OG���|�c���W_���p\r�!TTT	Td�� �� �:��Zr�?��4åa����I5W%�9T�D�ce�==а3�~�Y��J��FW�~!.�ξm{X<r\Z�	6D��1TN	!K�*@B�\n�#��s4�L�	˪K����Q\Z��滍�������m���%#���jI��r>��k���<�%�W\\��:�J�@*�r���p� }D����Q����j�)�P�P�A\0s��mǓ�ѝ���{��Pms�����c,��D�-��Bf0񷭬��fx�\Zd�!��C�SA��q ��X����4K��ؔ�)�9�Q����۝#i�g���:��[V��5YF��$��+x�GXV �`���dr�0����3.@�s �*�\\��U���t��6������������$��:㺱�NY~����ڝ6&ͨ*��R:d:���I\Z�K��ӿh��g�g\ZB�C�{G�5��&��;��SAX7��C�t��R	9S���q��y8��s<�H`br?ӳ�t�.�n�F�����!�/��%l��8� �XU!��QHҝA�f�Gb�n�$K�\n~-��R����n�1���h7I3H�*�(�p�\n)��#��ϻj̿�Et�#�Σ;�$�#$�,q\Z�I�DiB������;]	�\"Zk\\����e��bZ��\\���!��\nI��\\u�;\Z�|�N���_|=�_�5�}�I�0&�1:$K{�&RA����8B�d�L�f�{���nw,f,J�,�u<����-!�\"p��+R	JH$BHt����F�#4�u�&��-��d:$KCL\Z!mYQk�&CZ��_�8��Q\0DG� H��sP�az~��b�Z�6}�*RH�8���U�`a�s��Y�\nΑD	Y\Zb�)c���ڤ�7�>w���mo����Si��\0%:��]�8�	�Q2T��m�I�$I(�%*~���$��t���,nwz�c��t��R��h\'�?�D��q|��w6>�1��8i��.I�1��.�N��9�N��6J�#��~\\�|��_\\�j�\ZҰ��d�,��Y\Za]��5���v����;��I{��$I��Q\n�5y/O��d��q<&�N�lp���;wp�T�iH�-�4�4j���4���E,+��7���w_\00)��q\\�$��܀8NHM���$:��12�H�ȱ4��G�D��EI	ҸAҭc��a�i�Ny�s�;��C��ŕ��]��^�w�$�1�u�Z�H$��ws�YL�&xN@�e$F�9t��H�4n��M\\O�z�|�:���;�ǇN�����\n6��aKs�y��v*N��l�i�4Ap�B��RDY����!N\nlJ�Vb�8O���\\�ƞ���qA��M/$��<�/�:�s=��H��J���\r�$�`�Wa\Z�H�6)�#��L�g���?�,����ȽQD�����-]�j��L�Ծm�w=t��,���\r�lJf�ͺq�?[����z�j���\n�����On{r}m`�/��P��d��X��! ���2�Mn�~����d�8�*����T*�G<�_U��������n��K�߰���?����7��ro�X�֓�\nR�1۞����~��k��e�;��`�����}�O����ة����d˲����ۭ����W�����?~c(l,y�\0\0\0\0IEND�B`�'),(2,'cheque','Chèque','',0,'','\0',7,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0gAMA\0\0��7��\0\0�IDATx���{p���o/g�%	�$!9�\'0܅� B���\nS/S������hG[���v:m�ө��VG�T�Zk�1�@\nB��\\��`HB$�rr��s�ݳ�_�8�(�Z��?�����>���V��H����s��B*֟{o��:C~N�/��b����L��_Y�k���\0�ְA#��R��<��Y���3q�|纝��!!��H��jy_��p������J����\Z#p*;���s���y5L��$ew���VJ����e�#��S}��N��_�~�?����>pCX1�G_}x��\0,�����9K/w=�[��-׮޸�T)؀[B���_\0�\\��C+\r5 �;������>�U.�|d���@\Zx�:�l�k�|��Op��v]V<��Ά\"��n��\0�l���[AD��a�ɖN�Ɵ|j�U��O��g�\\m�\ZEP�Rchp=e�,Ȅ	Y?�^~�Յ�S�S/�)n����/��Tgv�J4F����;�U�H��Pȇϧ��.S��K`�dx ˮ�+��L�C&T R�\0�\0����_0�悠\rT�\0��s��2��n&�&�)/����Df�r��Y}����GP��^\n�F4���C�z2���g�/\\z��s���BӲ��e{8����|@��UL�\"�G3<�݌VR-\Zf�m\Zqk��z}/�������	\0�{c��+n�����|��*��L,2�<�!�s9~/5=�߈��[a�k&�8��?>�_�Lm�s֘/:c�c�v��$}�2i\r��\r�S���V���5U�T�����x\"K� v����T�CZY0f�1���_�ۈ��QPx�ע�ģy��/�H�_qf�{��@\n0�o��U^yxy��s5�GC`:��AN�Ɏ��xR�G��\'��t�ދ0����G\"4�)�gs���c�d f��\\�mj��E��x[�x�\0��߻w�uӵ`c,Yr.8.��L��p\r<�O�@ �T����xkS���M\"�{DC�=�c���fK�$Ӓ���ʼ�%����e��������2cB�r2_��9/����LQ6�����@�&(���`�M�HOP-$���>��Q a0f�7�e��jV\\2���/7q�K��޲�jQs�6:�.\0RB:�xrƲ�r�!4�R�P�����i�b�\n�����3��PD���kH/�vh��`g��%�z��K����<rdۆ��e��Ԗ4�\" iP�4:\"��:l������\"=���@���I�δ\n�7��o�G6��**���uUɜ����\0s����gW�����]�� l�#��@\n�QK#cZh�:���RQ>]#ԙP��o�L�\r�r��me��q��5<~K�*l}+�&���\Z��zъ����kVͫ9�&�7�e�,\n�qVM��#Q(�\0)H\\�%���\'��e8ؓ�@oA�r�XQC,�i�M/���w>��\\��?�Uh�ʦe?����W6O�_\ni:G a�D7��\rEU�،$MG��t\r����:�)�h���a�0X�#ņZ������$����/\0\0���Ew�]w����YX	fڇ!eJ���)������Ω��N�R1m�H8��A�4P���������-o����ܭ@�9:���g{�ګ��~YS\r�N��$S.v�\"�eIL[4&W��Y��)���cs�^��G���?��\\� �Q/\0@���~��7���e���n�\\̬�m�tA�D��TCW��v��{oo|����>Av���TNz\Z~H�ؾM�Ɲ*_ò9�%\n�\0�mYBU�Ni��߯0�mm�hyb��w����L�Kw�d78��\0�9zhǦ��X��k^P7Qg~��(���3p�P���>չk�mkF�>}��F�#���O$�d�5w�~:���7{����~y�\rO��\0��4��L\"2{��Ͽ�`r��O��ϹXδ� P�f�	�}Zc� /mQ\r�N�\0\0\0\0IEND�B`�'),(3,'magcard','CB','',0,'','\0',4,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0	wIDATx�b���?C~~�EEEyտ~�e���\0c\01�4����g������S�?�D���?yzu�ԩ\0��\0df/ȍ�d���\nd0����1���ҿ�ف�~��F�+�ɐS��bܙ00��\r�O����+�G;��D��``�\0ҟ10|�t\0��3XH�x�S�\Z�\0bA��v����k��DL��a`���{a���x�Xy^\\�X�L�@���\0�J\0 �	@	6���������@�|:�\'�\"i`h0����ῼ;�nc�$����q���1����T\0���9E`�\0�@&�Q�u20A1H��?�pVr 4e���醍�/�<�\0b�)\"*���3���f���+��ß���Cr� ��98�fI�I��>}��p��O�]7�1�z��p�5?�?���t�����\"0\\���䘿 !\0r�(f���ͻ�Ǯa�w�Ég,��p1|e����� óW�6�}ˠ#\'\0�!0�~������Y���\0��r�� ����í�?��~e��������ظ��9��$����Y޼g`���5&�c�����)���\\����3�Y���Ofc5`q����Q� ��w�0����������1p\n�3���2h-�,��\03�;`����O�~�F��O>�1�:\\� (u�������g?olb�+\\���C&&&\0�\n�dx�AMA��Ĕ��	h�G`|�Z�	X(~��/@��GPˡـ������E�30�f�W�`�d�����0�	��j�	@L������c&�x/aSm6f�?�=b`���A��r���1|���@<|��#�r`���L<�W�Y2�y\0,�]��?VN��2�gb;\0�\0��-,@C�E�������A�����0��fHV=� �d+��������;H>d�`Pz��\rh�+Fc�GO� �%F��̜��ߞe���#�J�X��0���A��w^u���a`���A��0�G����B*��@�\0�Z1�c`ȴf`p7e8��\\�1�]�\nd0�g��w����O� �PҀ�ì�����3(?�\r�ǿ\'\\�?lُ0��}����8�����`��P���D�/��/����\' \"�pP�X�n``g����d�`����#0�DtQ\0@(P��`P���p����4N�׿�1�}�ʰ�+Ï_��KM��0�\0�[�1ܽ��a���~01���1�I�0|��� ���\0���sc`������^��F�Bn\'@\0��l�3��m���u*�ǧ��;1�\n*3Xr2���g���Í����� &��p��o+)`P�|����y�_�D�s���qk\0KB`[B�-�����\0S//7�F�\0Bq��_�5�������\\�`\r���51Tի�?V�y�X�t�T$��4�3�{r����W�<�F*�u_\0�U`��x�����Ic`�c��	��x�v���cdP��dW��\"��Ɏ�`��8,u�q�����m��>0��0h��0�e`�}\r�x�	2	X(\0mK��q�������ϟ�����\0�R�R<���/�e��$÷��^}��p����0�ˊ0�I�0HH�0p�Ku��`�sh-0j�ţ���,0�0����������e�	T�_ՐA�_�5	@,��#��h���p��k�Kw�>���A��7���u�=�쥄�t��Ajl��p1�Z����o���$�D���xYXX�XY�\nv@\0a8��������������2l�4���������R\n�+A���o�?}����3`���\'�O��b�+N�\Z�,���@�����\'�f��\0��\0pZ\0:BR��A\\�-L���ll������c���Ï��~+��b��Z,\"R���;3�b�I�����(�/Ќ�o�2��ս�5kV�̙3\0gur#��5�~�b�/���\r�z�-��&�rc��nL��^P�?hk��x�� ���������i�����@XC\0�%���X�ex���?Ĳ����;�j���zA!���d�o�� &�{���Z��cA����;��˗X-�\0B	&p�?	mD�������`��⼽��� \0@,4����?f\0Z�\n��Y\0Ă�\'����b90�_�v�ϲe˞͙3��� \0@�� ��ɹ,##�̚)�-߾}cx���c���r��\r�~��\0;\0�	؄aЀ�s�S�He�p������g\00\0K�o����\0\0\0\0IEND�B`�'),(4,'paperin','Coupon','',0,'','\0',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0\n*IDATx�b���?�@b�\0bh\0ï��T1��[���^߯�� u��a52��������ږ�O���f���$�%3����P�e.��K�~��\0D�������?O�]=V������?v��������������\0�\0\"�<@l��������_4������������n��w_0d����g����f|:��\0��U����獟��n���в�=�������d����>����������g2����\0@���&@����j�\0-���5Ч�;�������ϯI@K��|���; �68����n�/�?gZ.���\0���W\0-=��YÇ���>}�W��_�>�����i�w���������L��������^�#f��v������t�O`h|������<�\0 �?7RAqj����������f��� �~Z�k\n�7 _�\0[������t��ml������G�����k��֔���L\0;�Ƀ)�������P�\nğg�\0:@\n�\0���Tz���M���i�X������\r���t��3���/���_��������=����ɉ�?�����\'���q��̆�l1��2Ȟ�������ǯ]L�~�a\0 ��j�Z��L@����t�����{�j\Z������/�N��H������?d_�8���7���Z����I�~��& �:a��@�CqЬ����\\����^���\0���:�K�*��?\Zĳ�߻?����m�/_����]P(�������{w��?�����S���G��9�����e�~_����%?C,��?�\0�@�g5Ќ��D���������c5k֓�\0�p|�����w��\0[������ϙ��ނ��m�M��}�\r��N���L��q|��gS�����z ��C�H�F�ҿ@���@����N���[U�]�������kj�N�/�� ��SS��r�v_^��Rp�}�b��O����Ì������2���r`�/^����`T<\0Z�k$�����.����x\'з;����@�������M���)750�����?��2ϑI�|<\0İli|�i̲F�wO\0��`����/`��\r�ݟY�����	@60a}��|��!A��}{\n������ǆ�od���F���V�����ML����2��O���?3O`��\n.�\0b�}c*gA��nY���]S�~��o��>�\0e�E����2����@��-:\0d)0�~.:r�b`���ď�������3��O��������4��ӄ��	�_X\"�~���9|�\'�g�	�[P&�@�_.d�퉓�7�Z�y��ڢ��-�:�m�>��j)0%��������o�z�����[;�g���\'$����#�q����U����!�J����)�\'�������@�/N`�5#�;!�N/-֢~cO�߇g���}������^	������q��e���\'���%�I	��II��\'�\n��U �I�����\n��(���-�R����$��]I�?jb��Fx*N�����\0�\0~�\0��|\0��hkiHST4B�vN���]�������������������������N�Σ��}��f��`��g��p��w ��v%��q%��i��d��`��`�va\'�d\\/xEF+P!\"\Z;\'++%\0�\0~�\0mlK\0onL\0fdE``?/e^9p��b�ԱY���������H�٬���\0��n\0��b��c��i\Z��p ��t%��s\'��n#��e��a��`�|c#�oe.�_]1cMN/L>>(B21 02/!\0���ה��ǔ��ݐ5!�A>,�̡�2`���9��lR�X���US�؀���B���)�R�g����U��F>з��{���ǉ}�O�?_��5\'3�8?&�$��G���Z�F__ASSCZTOO���L�A^N�ATD� ��y���dE����2�M��H�9+�����}	����?5K��D��,�ƭ0AI����\'}�<Isu^�QeJ�yDD������������������7//�&&*@� \0 8`dd��csv֓��70���|�����S��O��Zt@�����b����/��\"^yWN�A����s7??#[{{Mc33U--1))!nNN6��`+�9\0 ��;;+���4����Zj�]Ć��/�g����*��w&���W<U��3%%�,1\"��������I���TUC]]ZJ\\\\������������/&&& f��\0�\0b@L@E��Z���.���.S&�I�l���^��7/3�<#:��= ����I���HICMURFFZX��������d�� K!��v\0@\01`@Gprjh�ʸ;i9$G�d��ع��Z��������hj�(JK�\np󱱱�}	��f1� \"\0@�\02��~�%Rں��&&���Zr\n22|@q�����E�-#���:\0 �p\0&���XY����8y���9���A}ʌ�8\r!�\0�K/#�`\nf`E��I\r�\0 Bf0b��h@�\0h�;�\04�\00\0���t�8�\0\0\0\0IEND�B`�'),(5,'credit_note','Avoir','Ce ticket donne un avoir de                       ',0,'','\0',3,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0\n*IDATx�b���?�@b�\0bh\0ï��T1��[���^߯�� u��a52��������ږ�O���f���$�%3����P�e.��K�~��\0D�������?O�]=V������?v��������������\0�\0\"�<@l��������_4������������n��w_0d����g����f|:��\0��U����獟��n���в�=�������d����>����������g2����\0@���&@����j�\0-���5Ч�;�������ϯI@K��|���; �68����n�/�?gZ.���\0���W\0-=��YÇ���>}�W��_�>�����i�w���������L��������^�#f��v������t�O`h|������<�\0 �?7RAqj����������f��� �~Z�k\n�7 _�\0[������t��ml������G�����k��֔���L\0;�Ƀ)�������P�\nğg�\0:@\n�\0���Tz���M���i�X������\r���t��3���/���_��������=����ɉ�?�����\'���q��̆�l1��2Ȟ�������ǯ]L�~�a\0 ��j�Z��L@����t�����{�j\Z������/�N��H������?d_�8���7���Z����I�~��& �:a��@�CqЬ����\\����^���\0���:�K�*��?\Zĳ�߻?����m�/_����]P(�������{w��?�����S���G��9�����e�~_����%?C,��?�\0�@�g5Ќ��D���������c5k֓�\0�p|�����w��\0[������ϙ��ނ��m�M��}�\r��N���L��q|��gS�����z ��C�H�F�ҿ@���@����N���[U�]�������kj�N�/�� ��SS��r�v_^��Rp�}�b��O����Ì������2���r`�/^����`T<\0Z�k$�����.����x\'з;����@�������M���)750�����?��2ϑI�|<\0İli|�i̲F�wO\0��`����/`��\r�ݟY�����	@60a}��|��!A��}{\n������ǆ�od���F���V�����ML����2��O���?3O`��\n.�\0b�}c*gA��nY���]S�~��o��>�\0e�E����2����@��-:\0d)0�~.:r�b`���ď�������3��O��������4��ӄ��	�_X\"�~���9|�\'�g�	�[P&�@�_.d�퉓�7�Z�y��ڢ��-�:�m�>��j)0%��������o�z�����[;�g���\'$����#�q����U����!�J����)�\'�������@�/N`�5#�;!�N/-֢~cO�߇g���}������^	������q��e���\'���%�I	��II��\'�\n��U �I�����\n��(���-�R����$��]I�?jb��Fx*N�����\0�\0~�\0��|\0��hkiHST4B�vN���]�������������������������N�Σ��}��f��`��g��p��w ��v%��q%��i��d��`��`�va\'�d\\/xEF+P!\"\Z;\'++%\0�\0~�\0mlK\0onL\0fdE``?/e^9p��b�ԱY���������H�٬���\0��n\0��b��c��i\Z��p ��t%��s\'��n#��e��a��`�|c#�oe.�_]1cMN/L>>(B21 02/!\0���ה��ǔ��ݐ5!�A>,�̡�2`���9��lR�X���US�؀���B���)�R�g����U��F>з��{���ǉ}�O�?_��5\'3�8?&�$��G���Z�F__ASSCZTOO���L�A^N�ATD� ��y���dE����2�M��H�9+�����}	����?5K��D��,�ƭ0AI����\'}�<Isu^�QeJ�yDD������������������7//�&&*@� \0 8`dd��csv֓��70���|�����S��O��Zt@�����b����/��\"^yWN�A����s7??#[{{Mc33U--1))!nNN6��`+�9\0 ��;;+���4����Zj�]Ć��/�g����*��w&���W<U��3%%�,1\"��������I���TUC]]ZJ\\\\������������/&&& f��\0�\0b@L@E��Z���.���.S&�I�l���^��7/3�<#:��= ����I���HICMURFFZX��������d�� K!��v\0@\01`@Gprjh�ʸ;i9$G�d��ع��Z��������hj�(JK�\np󱱱�}	��f1� \"\0@�\02��~�%Rں��&&���Zr\n22|@q�����E�-#���:\0 �p\0&���XY����8y���9���A}ʌ�8\r!�\0�K/#�`\nf`E��I\r�\0 Bf0b��h@�\0h�;�\04�\00\0���t�8�\0\0\0\0IEND�B`�'),(6,'prepaid','Pré-payé','',5,'','',99,NULL),(8,'free','Offert','',0,'','\0',8,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0gAMA\0\0��7��\0\0	�IDATx���kl�u�sgfg�M.�\"W$ŗDY�%�aIqd�I\ZÍ��\r\ZM����A�5��uѢA��@�\"�Q�H\0H#*�4��Z�E�%:6%[o�)R���������~X�i���`��s0�����s��j܃}�@��`[�_�A\'�R)j���ړ�Nt�^��(3>,p�����;O��xK����o���Wn7�w���\r�Zu�Ư\n�}X���\'ɧ2&?_�.����_���O�$wkIu_!�\r��0���Hm�U��3���l38��?�_�@�o����G7��\'��C]���Qe��h{����G�]\nijHe6-���i�s�mN^/�1�8�����֠���@z>�%��/=.�l�ݎ��\\\Z�\"0�����&Z�\\f�*�Y~�$��ɹ�_?^��{�\0O\rd���X�����JU�J�ە�*���R��Jɷ��sJ�%�dY)���j�_�5ןQ���Q��ȾК��M��{;~b���i�*<��Q�Џ���5A�\0�6(_>���#LH�%�������4��ȹ��q�J`�4w}����\'��֛\Z��K��!5����@5�%Cd�\"@���MN��S4g�y�(�Pw�~���<;w��ٗ�O�{/��<�����ӵ]���,����v��a%�:56�o�*Z���WN�<6���t=x����X}e�uMmq�%��*���#������ʟD�W��S�W��d�G��xeoy���<�)�,���c�f�|�t���<kW�qWx�(F*JA<� =��T��{���X�+����w��|{�jI�+�J���}k#�Q�t@���A��h�jq���\0I�N�|�%ٞ.�\\��P���}�Jݠ\\_U����2����㷂�@xrK��������R��0�x��G?ǖ��&�����yz]��*��:*��{t3BA��X�9ڷm��e���n�l��@?O��A�#5�Kja���7��K�����d���g�M\"!�h�>��N�b\nT鬢j/��3i���d�,-`A����������m��8I��*+*t�ϡ%RX���k��X%<fܗ2w���F2�0� /\"+,�v�r= �����vg�DB�$�4�:�<�6�<�t�nA4��KM����G[�NLv�����ǘj�Ci{OW�4A�JF�>�p��į/q�\Z��@Xk��H�O�tA8 �Áာ�����I�(}�+�B3�C�Mz{ӛJzy�H%m	:4W��β<����	�jDc�\'��%%$<�P�\0]�\0؉X�&�3�b�Z��x����l�6h>�$�vK�[校i��PK:�Ǔ��v9��*�����w�L�Hb�A�S��$Ic����Y�T�t��yD�G��l:|��_��a�c����-@1��R� !���&�>Nnp��!�����A�f���:�e���O�y(�<�\'i\r3��A�MJ��d3μ�����=�@���@ڀ�\'tB3P��l�DD�\Z��Q �<ɂMr�	��j9�a�3?8��9��WT�&0:;9����wk$�Ez���F�f@�>�5�PS\r�h�������M4HX`[��o�[�)�<`�����qkl���i���!^X [sȯE�=�(��1x\n�Ƃ��k���L�9ݏ#��B���B��Ǡ9`�`X��2�z]�~W>�(\r�N��O0�z�𪇽V�]\\�^]!��J�3���ŀR,^Lr�Mq��R�Y�Sݙ�>9�Շ��^KWh�Ȁ�-*j}���/\0щ�^ef�F��:��e�j�u�0 녌[Yr�#r�Y�����kީ�z�\0xu�9v�Vg�l��8� \\��A�r�=�@�Q�����dz]��n#�E�����+���)� a��䬐�k��\0�p��ܟ��(`uww{`j`x�o��h�*yw�J�}\"�4m���5&�-�adtt���V2�N����1ŕ����;:Z��	��s��~Xٝ�?iE{����*���%x�$�%B���%��i�?�kP*��SY����4[���\\:��ؔh>7Y��\'��_�˞��Aw��=h	I�����Vm�1ZKƪw�A16�z��	zo�1+Un���n����}�op��<�i��X��\\#z����#ɮ�gs����fG4\n��A���[zP�|	X� �N3?�bf��-��ɾ��l-5�x����4ߚ��8���-P� I��[�~��H���^_5����!�%Ӛ5����\0���r͍(m\nh��?�s�IP���̂�s��Zr�\Z��ߧ��ƅ���V�J�-f�暎�)�B\n�j�ʰ����|0\"��$����x���V��7�W�;��=0�^���\0zGB�2�P1�HWJ�TZ�o���\"l;�4$JA�\r�ZͤVK�x�;N�\\��=~��-O���wɏ\"���m��������{�3�p>�\'-t�uى��Aُ��\r���u���k������G\r~/���c��Τ��-���\Z6@���^<_��lSwA��2����.����\0\0\0\0IEND�B`�'),(9,'internet','Internet','',0,'','\0',6,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0�zTXtRaw profile type exif\0\0x�u��\r�0C�\"#�g�\Z� t��p��A���^\'ma%oё\0���)�yb̢,c�N�iRNWL�� {��E��f�8�#аc�j��Ĵ��h��F�������??�,�J+\0\0	�iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">\n <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n  <rdf:Description rdf:about=\"\"\n    xmlns:exif=\"http://ns.adobe.com/exif/1.0/\"\n    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"\n   exif:PixelXDimension=\"32\"\n   exif:PixelYDimension=\"32\"\n   tiff:ImageWidth=\"1\"\n   tiff:ImageHeight=\"32\"/>\n </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                           \n<?xpacket end=\"w\"?>#�L�\0\0\0sBIT|d�\0\0pIDATX��[l��s�]����kc�8v��ML.`�c����k�O)�Z�T�Ї\"�R�\\�����\n--�q\')Lr�I␘8v|�z}]ۻ;�3gf���I�IA��#�5��������w΁��C�2/��|7�nE�Q�*O�J�u�ʩ�6��~�+��	�y��������T��#E���oh֮�n]h��jJ�B!���Az�@ߙQ��ۙ?v�c͑��#!��{�<>��\0���S�v|��o�n��Y����pY�t��;�{�/4�݄�{�u<�W^���%=o۾�\'�y��K߰�����]����Ŗ5T��C�L��I�4�8��/�d�D�I�%��YQeK{�v�׿9t��T���Ї{���M?�Ik�?}���	�;t�i�Uc���55���-f��7ވ���St�P�5�Ed�Ӝ8=�ʆE�q����S��j94����`Æn�����?m(���$Ѫ�k#�������S���8���H<�Üc$3���3�y�-�\'����m;���\'쩉�]{����K��=-N��^xᑊDq�\\��#\'N�01c�Ҿ\0�u�KH�c��4m-kPU\0����r!���aJ\n����y.��Y�po���dI\"6/Q\'=�a,\'Y�b>�����*��P�L�f�r,�F8��ઊ�iH)��(��ͫ���Cu����h4�����/�6���>�=�d����n$�_\0�H�v��\n�N��Ү�\\���TK�.\'YVJ.��0|�����:Z�8�����6�u�������I֭eӖ��E��_N����>G{��m�܁�XD��I���͋��AQ<�C�5\Zk\"��l=7�~���Ƚ7nm	���GG�Q���i�|��U	���Hw�F��J��Ҷ�\"�M�\r��e�Ft|�òll!��u�v�\'s/��s\0���oXZ�/{��e+��U�\\ݎ�H�B�H� ���\nJ�K柕$�X^W���wQQ��8\Z���iI����\'e*\Z��Z�DScUu+���i;�\Z�l^`	�%$�-1���Tiт���<�km��\"�0wn^�xA��Zق\0�����w߰�J}�|�Ĳ%��`���`|�f:o�7���>�pxA\0�q�}�3�H���J��/X���\'������\'\Z�֯`lb��fUQ���p]GJ�r��Ɔ�}�!�ͫ83�A)[�tUP���\0���d6_VQ��a�%2>LmU�U%\n|�a҉|��!�����|��G���{�\r)%�mc�6���\"��ɑ�����_�y]��3$\"\Z��\\}���\'�x�-�u$�)K�7m�a\n,?�;�*g�W�m�2�/`�&�e�C<�������̔�*~�\0�v���,�*�`X����\\��m�M|smŚ�`΁L��a	�r�8t�4��qO/����1�}Cy���[@QBo��:��yh�Ͼ#�H)?W\\�t|��1�`\n\n��+Vۡ/3����4Mfff)OVV<&�(J����������5����5k�}��8�R<���^����(V�+�b���T��mށ��1�H)}������o��}r�E\'#)�G�t�u-��d�����avvv^�L�p���.�\\��P(0�޾3�:t��#���~������2U�jp�g�֍��\nM>���X!o����WN-�v\\�1Y�Ĳ�T0L��uL��lz���\Z���Fvb�����\0�R+���H�DqI},=0�n�u�\"\r�� �`�����\'�>8[B\"���X��m�*%��20��P�){,=����/���hA�8�9�	U���l�ؾJ��(a�{��u<���#�D\nOX���/La��=}��; 2ç�8��Ⳁ�\0��\0\"@��f�Oy24�Q�xsztR-��Q��\\��8�Ɨ6�6	+�b�gQ2̪�eԥ��rOt���ϝ���\Z`2�`_lM*��@�X,��~馻��j��ZRMm��P2UFQQ=�af�`rt����2;�%����{�˚MY`*�$0x��D���T\n�+��W7�W�_���(��P®�9�/\raώNN�=vTJk\n�\r4h�u�_7&\Z�J�D�b \0F���\\\Z� �\"��\0\n��3�hp�٭�\Z,	 ��\0�<\07\0��`����+oN�����[\028�_d��\0��o�**\0\0\0\0IEND�B`�'),(10,'credit_note_out','Avoir émis','Ce ticket donne un avoir de                       ',0,'\0','\0',99,NULL);
/*!40000 ALTER TABLE `PAYMENTMODES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTMODES_RETURNS`
--

DROP TABLE IF EXISTS `PAYMENTMODES_RETURNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENTMODES_RETURNS` (
  `PAYMENTMODE_ID` int(11) NOT NULL,
  `MIN` double NOT NULL DEFAULT '0',
  `RETURNMODE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PAYMENTMODE_ID`,`MIN`),
  KEY `PAYMENTMODES_RULES_FK2` (`RETURNMODE_ID`),
  CONSTRAINT `PAYMENTMODES_RULES_FK` FOREIGN KEY (`PAYMENTMODE_ID`) REFERENCES `PAYMENTMODES` (`ID`),
  CONSTRAINT `PAYMENTMODES_RULES_FK2` FOREIGN KEY (`RETURNMODE_ID`) REFERENCES `PAYMENTMODES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTMODES_RETURNS`
--

LOCK TABLES `PAYMENTMODES_RETURNS` WRITE;
/*!40000 ALTER TABLE `PAYMENTMODES_RETURNS` DISABLE KEYS */;
INSERT INTO `PAYMENTMODES_RETURNS` VALUES (1,0,1),(4,0,1),(5,0,1),(4,1,10),(5,1,10);
/*!40000 ALTER TABLE `PAYMENTMODES_RETURNS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTMODES_VALUES`
--

DROP TABLE IF EXISTS `PAYMENTMODES_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENTMODES_VALUES` (
  `PAYMENTMODE_ID` int(11) NOT NULL,
  `VALUE` double NOT NULL,
  `RESOURCE` varchar(255) DEFAULT NULL,
  `DISPORDER` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PAYMENTMODE_ID`,`VALUE`),
  CONSTRAINT `PAYMENTMODES_VALUES_FK` FOREIGN KEY (`PAYMENTMODE_ID`) REFERENCES `PAYMENTMODES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTMODES_VALUES`
--

LOCK TABLES `PAYMENTMODES_VALUES` WRITE;
/*!40000 ALTER TABLE `PAYMENTMODES_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYMENTMODES_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTS`
--

DROP TABLE IF EXISTS `PAYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENTS` (
  `ID` varchar(255) NOT NULL,
  `RECEIPT` varchar(255) NOT NULL,
  `PAYMENT` varchar(255) NOT NULL,
  `TOTAL` double NOT NULL,
  `CURRENCY` int(11) NOT NULL,
  `TOTALCURRENCY` double NOT NULL,
  `TRANSID` varchar(255) DEFAULT NULL,
  `RETURNMSG` mediumblob,
  `NOTE` text,
  `PAIRED_WITH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PAYMENTS_FK_RECEIPT` (`RECEIPT`),
  KEY `PAYMENTS_FK_CURRENCY` (`CURRENCY`),
  KEY `PAYMENTS_FK_PAIRED` (`PAIRED_WITH`),
  KEY `PAYMENTS_INX_1` (`PAYMENT`),
  CONSTRAINT `PAYMENTS_FK_RECEIPT` FOREIGN KEY (`RECEIPT`) REFERENCES `RECEIPTS` (`ID`),
  CONSTRAINT `PAYMENTS_FK_CURRENCY` FOREIGN KEY (`CURRENCY`) REFERENCES `CURRENCIES` (`ID`),
  CONSTRAINT `PAYMENTS_FK_PAIRED` FOREIGN KEY (`PAIRED_WITH`) REFERENCES `PAYMENTS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEOPLE`
--

DROP TABLE IF EXISTS `PEOPLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEOPLE` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `APPPASSWORD` varchar(255) DEFAULT NULL,
  `CARD` varchar(255) DEFAULT NULL,
  `ROLE` varchar(255) NOT NULL,
  `VISIBLE` bit(1) NOT NULL,
  `IMAGE` mediumblob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PEOPLE_NAME_INX` (`NAME`),
  KEY `PEOPLE_FK_1` (`ROLE`),
  KEY `PEOPLE_CARD_INX` (`CARD`),
  CONSTRAINT `PEOPLE_FK_1` FOREIGN KEY (`ROLE`) REFERENCES `ROLES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEOPLE`
--

LOCK TABLES `PEOPLE` WRITE;
/*!40000 ALTER TABLE `PEOPLE` DISABLE KEYS */;
INSERT INTO `PEOPLE` VALUES ('0','Administrateur',NULL,NULL,'0','',NULL),('1','Responsable',NULL,NULL,'1','',NULL),('2','Employé',NULL,NULL,'2','',NULL);
/*!40000 ALTER TABLE `PEOPLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLACES`
--

DROP TABLE IF EXISTS `PLACES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLACES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `FLOOR` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PLACES_NAME_INX` (`NAME`),
  KEY `PLACES_FK_1` (`FLOOR`),
  CONSTRAINT `PLACES_FK_1` FOREIGN KEY (`FLOOR`) REFERENCES `FLOORS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLACES`
--

LOCK TABLES `PLACES` WRITE;
/*!40000 ALTER TABLE `PLACES` DISABLE KEYS */;
INSERT INTO `PLACES` VALUES ('1','Table 1',133,151,'0'),('10','Table 10',532,377,'0'),('2','Table 2',532,151,'0'),('3','Table 3',133,264,'0'),('4','Table 4',266,264,'0'),('5','Table 5',399,264,'0'),('6','Table 6',532,264,'0'),('7','Table 7',133,377,'0'),('8','Table 8',266,377,'0'),('9','Table 9',399,377,'0');
/*!40000 ALTER TABLE `PLACES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `ID` varchar(255) NOT NULL,
  `REFERENCE` varchar(255) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CODETYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PRICEBUY` double DEFAULT NULL,
  `PRICESELL` double NOT NULL,
  `CATEGORY` varchar(255) NOT NULL,
  `PROVIDER` varchar(255) DEFAULT NULL,
  `TAXCAT` varchar(255) NOT NULL,
  `ATTRIBUTESET_ID` varchar(255) DEFAULT NULL,
  `STOCKCOST` double DEFAULT NULL,
  `STOCKVOLUME` double DEFAULT NULL,
  `IMAGE` mediumblob,
  `ISCOM` bit(1) NOT NULL DEFAULT b'0',
  `ISSCALE` bit(1) NOT NULL DEFAULT b'0',
  `ATTRIBUTES` mediumblob,
  `DISCOUNTENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DISCOUNTRATE` double NOT NULL DEFAULT '0',
  `DELETED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PRODUCTS_INX_0` (`REFERENCE`),
  KEY `PRODUCTS_FK_1` (`CATEGORY`),
  KEY `PRODUCTS_TAXCAT_FK` (`TAXCAT`),
  KEY `PRODUCTS_ATTRSET_FK` (`ATTRIBUTESET_ID`),
  KEY `PRODUCTS_PROVIDER_FK` (`PROVIDER`),
  KEY `PRODUCTS_NAME_INX` (`NAME`),
  CONSTRAINT `PRODUCTS_FK_1` FOREIGN KEY (`CATEGORY`) REFERENCES `CATEGORIES` (`ID`),
  CONSTRAINT `PRODUCTS_TAXCAT_FK` FOREIGN KEY (`TAXCAT`) REFERENCES `TAXCATEGORIES` (`ID`),
  CONSTRAINT `PRODUCTS_ATTRSET_FK` FOREIGN KEY (`ATTRIBUTESET_ID`) REFERENCES `ATTRIBUTESET` (`ID`),
  CONSTRAINT `PRODUCTS_PROVIDER_FK` FOREIGN KEY (`PROVIDER`) REFERENCES `PROVIDERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS_CAT`
--

DROP TABLE IF EXISTS `PRODUCTS_CAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS_CAT` (
  `PRODUCT` varchar(255) NOT NULL,
  `CATORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT`),
  KEY `PRODUCTS_CAT_INX_1` (`CATORDER`),
  CONSTRAINT `PRODUCTS_CAT_FK_1` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS_CAT`
--

LOCK TABLES `PRODUCTS_CAT` WRITE;
/*!40000 ALTER TABLE `PRODUCTS_CAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTS_CAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS_COM`
--

DROP TABLE IF EXISTS `PRODUCTS_COM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS_COM` (
  `ID` varchar(255) NOT NULL,
  `PRODUCT` varchar(255) NOT NULL,
  `PRODUCT2` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PCOM_INX_PROD` (`PRODUCT`,`PRODUCT2`),
  KEY `PRODUCTS_COM_FK_2` (`PRODUCT2`),
  CONSTRAINT `PRODUCTS_COM_FK_1` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `PRODUCTS_COM_FK_2` FOREIGN KEY (`PRODUCT2`) REFERENCES `PRODUCTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS_COM`
--

LOCK TABLES `PRODUCTS_COM` WRITE;
/*!40000 ALTER TABLE `PRODUCTS_COM` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTS_COM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVIDERS`
--

DROP TABLE IF EXISTS `PROVIDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVIDERS` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IMAGE` mediumblob,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `ADDRESS2` varchar(255) DEFAULT NULL,
  `POSTAL` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `REGION` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `PHONE2` varchar(255) DEFAULT NULL,
  `WEBSITE` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `NOTES` text,
  `DISPORDER` int(11) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVIDERS`
--

LOCK TABLES `PROVIDERS` WRITE;
/*!40000 ALTER TABLE `PROVIDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROVIDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECEIPTS`
--

DROP TABLE IF EXISTS `RECEIPTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECEIPTS` (
  `ID` varchar(255) NOT NULL,
  `MONEY` varchar(255) NOT NULL,
  `DATENEW` datetime NOT NULL,
  `ATTRIBUTES` mediumblob,
  PRIMARY KEY (`ID`),
  KEY `RECEIPTS_FK_MONEY` (`MONEY`),
  KEY `RECEIPTS_INX_1` (`DATENEW`),
  CONSTRAINT `RECEIPTS_FK_MONEY` FOREIGN KEY (`MONEY`) REFERENCES `CLOSEDCASH` (`MONEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECEIPTS`
--

LOCK TABLES `RECEIPTS` WRITE;
/*!40000 ALTER TABLE `RECEIPTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECEIPTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVATIONS`
--

DROP TABLE IF EXISTS `RESERVATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVATIONS` (
  `ID` varchar(255) NOT NULL,
  `CREATED` datetime NOT NULL,
  `DATENEW` datetime NOT NULL DEFAULT '2001-01-01 00:00:00',
  `TITLE` varchar(255) NOT NULL,
  `CHAIRS` int(11) NOT NULL,
  `ISDONE` bit(1) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESERVATIONS_INX_1` (`DATENEW`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATIONS`
--

LOCK TABLES `RESERVATIONS` WRITE;
/*!40000 ALTER TABLE `RESERVATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVATION_CUSTOMERS`
--

DROP TABLE IF EXISTS `RESERVATION_CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVATION_CUSTOMERS` (
  `ID` varchar(255) NOT NULL,
  `CUSTOMER` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RES_CUST_FK_2` (`CUSTOMER`),
  CONSTRAINT `RES_CUST_FK_1` FOREIGN KEY (`ID`) REFERENCES `RESERVATIONS` (`ID`),
  CONSTRAINT `RES_CUST_FK_2` FOREIGN KEY (`CUSTOMER`) REFERENCES `CUSTOMERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION_CUSTOMERS`
--

LOCK TABLES `RESERVATION_CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `RESERVATION_CUSTOMERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVATION_CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCES`
--

DROP TABLE IF EXISTS `RESOURCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `RESTYPE` int(11) NOT NULL,
  `CONTENT` mediumblob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RESOURCES_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCES`
--

LOCK TABLES `RESOURCES` WRITE;
/*!40000 ALTER TABLE `RESOURCES` DISABLE KEYS */;
INSERT INTO `RESOURCES` VALUES ('0','Printer.Start',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2008-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n\r\n<output>\r\n    <display animation=\"scroll\">\r\n        <line>\r\n            <text>Pastèque</text>\r\n        </line>\r\n        <line>\r\n            <text>   Bienvenue   </text>\r\n        </line>\r\n    </display>\r\n</output>\r\n'),('1','Printer.Ticket',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2007-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n<output>\r\n    <display>\r\n        <line>\r\n            <text align=\"left\" length=\"10\">Total.</text>\r\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\r\n        </line>\r\n        <line>\r\n           <text align=\"center\" length=\"20\">Merci.</text>\r\n        </line>\r\n    </display>\r\n    <ticket>\r\n        <image>Printer.Ticket.Logo</image>\r\n        <line></line>\r\n        #if (${ticket.ticketType} == 0)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Ticket : </text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        #if (${ticket.ticketType} == 1)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Refund:</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Date  :</text>\r\n            <text>${ticket.printDate()}</text>\r\n        </line>  \r\n         #if ($ticket.getCustomer())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Client : </text>\r\n            <text>${ticket.getCustomer().printName()}</text>\r\n        </line>      \r\n        <line>\r\n            <text align=\"left\" length=\"15\"></text>\r\n            <text>${ticket.getCustomer().printTaxid()}</text>\r\n        </line>  \r\n        #end\r\n        #if ($place != \"\")\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Table : </text>\r\n            <text>${place}</text>\r\n        </line>  \r\n        #end\r\n        #if ($ticket.hasCustomersCount())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Convives : </text>\r\n            <text>${ticket.printCustomersCount()}</text>\r\n        </line>\r\n        #end\r\n        <line></line>    \r\n        <line>\r\n            <text align =\"left\" length=\"17\">Article</text>\r\n            <text align =\"right\" length=\"10\">Prix</text>\r\n            <text align =\"right\" length=\"5\"></text>\r\n            <text align =\"right\" length=\"10\">Total</text>\r\n        </line>      \r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        #foreach ($ticketline in $ticket.getLines())\r\n        <line>\r\n            #if ($ticketline.isProductCom()) \r\n                <text align =\"left\" length=\"17\">*${ticketline.printName()}</text>\r\n            #else\r\n                <text align =\"left\" length=\"17\">${ticketline.printName()}</text>\r\n            #end\r\n            <text align =\"right\" length=\"10\">${ticketline.printPriceTax()}</text>\r\n            <text align =\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\r\n            <text align =\"right\" length=\"10\">${ticketline.printValue()}</text>\r\n        </line> \r\n        #if ($ticketline.productAttSetInstId)\r\n        <line>\r\n	        <text align =\"left\" length=\"42\">    ${ticketline.productAttSetInstDesc}</text>\r\n        </line>\r\n        #end\r\n        #end\r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        <line>\r\n            <text>Nb d\'articles : </text>\r\n            <text align =\"right\" length=\"10\">${ticket.printArticlesCount()}</text>\r\n        </line> \r\n        <line></line>\r\n        #foreach ($taxinfo in $taxes)  \r\n        #set($taxline = $ticket.getTaxLine($taxinfo))\r\n        #if ($taxline.getTax() > 0.0)\r\n        <line>\r\n            <text align =\"left\" length=\"18\">${taxline.getTaxInfo()}</text>  \r\n            <text align =\"right\" length=\"12\">${taxline.printSubTotal()}</text> \r\n            <text align =\"right\" length=\"12\">${taxline.printTax()}</text> \r\n        </line>\r\n        #end\r\n        #end\r\n        <line></line>\r\n        <line>\r\n            <text align =\"left\" length=\"16\">Sous-total</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printSubTotal()}</text>\r\n        </line> \r\n        <line>\r\n            <text align =\"left\" length=\"16\">TVA</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printTax()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line size=\"1\">\r\n            <text align =\"left\" length=\"16\" bold=\"true\">Total</text>\r\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotal()}</text>\r\n        </line>    \r\n        #foreach ($paymentline in $ticket.payments)      \r\n         #if ($paymentline.name == \"cash\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Espèce</text>\r\n        </line>  \r\n        <line>\r\n             <text align=\"left\" length=\"22\">Payé :</text>\r\n             <text align =\"right\" length=\"20\">${paymentline.printPaid()}</text>\r\n         </line>  \r\n        <line>\r\n            <text align=\"left\" length=\"22\">Rendu :</text>\r\n            <text align =\"right\" length=\"20\">${paymentline.printChange()}</text>\r\n        </line>   \r\n         #end\r\n         #if ($paymentline.name == \"cashrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Refund</text>\r\n         </line>\r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"magcard\")\r\n        <line></line>        \r\n        <line>\r\n            <text bold=\"true\">Carte bleue</text>\r\n        </line>   \r\n         <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"left\" length=\"22\">Numero:</text>\r\n            <text>${paymentline.printCardNumber()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Expiration date:</text>\r\n            <text>${paymentline.printExpirationDate()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Operation:</text>\r\n            <text>${paymentline.printTransactionID()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Authorization:</text>\r\n            <text>${paymentline.printAuthorization()}</text>\r\n        </line>\r\n         #end  \r\n         #if ($paymentline.name == \"magcardrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Mag card refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"cheque\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Chèque</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"chequerefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Cheque refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperin\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Ticket</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperout\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Note Refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"free\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Offert</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"debt\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Dette</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end \r\n         #end \r\n        <line></line>\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Opérateur :</text>\r\n            <text>${ticket.printUser()}</text>\r\n        </line> \r\n        <line></line>            \r\n        <line>\r\n            <text align=\"center\" length=\"42\">Merci de votre visite.</text>\r\n        </line>   \r\n    </ticket>\r\n    #foreach ($paymentline in $ticket.payments)      \r\n     #if ($paymentline.name == \"cash\")\r\n    <opendrawer/>\r\n     #end\r\n     #if ($paymentline.name == \"cashrefund\")\r\n    <opendrawer/>\r\n     #end  \r\n    #end\r\n</output>\r\n'),('10','Window.Title',0,'POS-Tech point of sales\n'),('11','Ticket.Buttons',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<configuration>\n    <button key=\"button.print\" titlekey=\"button.print\" template=\"Printer.TicketPreview\"/>\n    <button key=\"button.opendrawer\" titlekey=\"button.opendrawer\" template=\"Printer.OpenDrawer\"/>\n    <!-- <event key=\"ticket.change\" code=\"event.change\"/> -->\n    <!-- <event key=\"ticket.addline\" code=\"event.addline\"/> -->\n    <!-- <event key=\"ticket.removeline\" code=\"event.removeline\"/> -->\n    <!-- <event key=\"ticket.setline\" code=\"event.setline\"/> -->\n    <!-- <event key=\"ticket.show\" code=\"event.show\"/> -->\n    <!-- <event key=\"ticket.total\" code=\"event.total\"/> -->\n    <!-- <event key=\"ticket.close\" code=\"event.close\"/> -->   \n    <img-width value=\"128\"/>\n    <img-height value=\"64\"/>\n    <cat-height value=\"300\" />\n    <taxesincluded value=\"false\"/>   \n    <!-- <printselected value=\"true\"/> -->    \n    <!-- <taxcategoryid value=\"001\"/> -->\n    <!-- <pricevisible value=\"true\" /> -->\n</configuration>\n'),('12','Ticket.Line',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<line>\n    <column name=\"label.item\" width=\"125\" align=\"left\" value=\"&lt;html&gt;${ticketline.printMultiply()}x#if ($ticketline.isProductCom()) &lt;i&gt;*&amp;nbsp;&amp;nbsp;${ticketline.printName()}&lt;/i&gt; #else ${ticketline.printName()} #end&lt;br&gt;${ticketline.getProductAttSetInstDesc()}\"/>\n    <column name=\"label.value\" width=\"80\" align=\"right\" value=\"&lt;html&gt;${ticketline.printValue()}#if ($ticketline.getDiscountRate() > 0.0)&lt;br&gt;-${ticketline.printDiscountRate()}#end\"/>\n</line>\n'),('13','Printer.Inventory',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line>\n            <text align=\"center\" length=\"42\">Receipt sample.</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">You can change this template</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">in the resources panel</text>\n        </line>\n        <line></line>\n        <line>\n            <text>Date:     ${inventoryrecord.printDate()}</text>\n        </line>\n        <line>\n            <text>Reason:   ${inventoryrecord.printReason()}</text>\n        </line>\n        <line>\n            <text>Location: ${inventoryrecord.printLocation()}</text>\n        </line>\n        <line size=\"1\">\n            #if ($inventoryrecord.isInput())\n            <text align =\"center\" length=\"42\">In</text>\n            #else\n            <text align =\"center\" length=\"42\">Out</text>\n            #end\n        </line>\n        <line></line>    \n        <line>\n            <text align =\"left\" length=\"17\">Item</text>\n            <text align =\"right\" length=\"10\">Price</text>\n            <text align =\"right\" length=\"5\"></text>\n            <text align =\"right\" length=\"10\">Value</text>\n        </line>      \n        <line>\n            <text>------------------------------------------</text>\n        </line>   \n        #foreach ($inventoryline in $inventoryrecord.getLines())\n        <line>\n            <text align =\"left\" length=\"17\">${inventoryline.printName()}</text>\n            <text align =\"right\" length=\"10\">${inventoryline.printPrice()}</text>\n            <text align =\"right\" length=\"5\">x${inventoryline.printMultiply()}</text>\n            <text align =\"right\" length=\"10\">${inventoryline.printSubValue()}</text>\n        </line> \n        #if ($inventoryline.productAttSetInstId)\n        <line>\n	        <text align =\"left\" length=\"42\">    ${inventoryline.productAttSetInstDesc}</text>\n        </line>\n        #end\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>   \n        <line></line>            \n        <line>\n            <text align=\"center\" length=\"42\">Thank you for your visit.</text>\n        </line>   \n    </ticket>\n</output>'),('14','Menu.Root',0,'//    POS-Tech\n//    Based upon Openbravo POS\n//\n//    Copyright (C) 2007-2009 Openbravo, S.L.\n//                       2012 SARL SCOOP Scil (http://scil.coop)\n//\n//    This file is part of POS-Tech.\n//\n//    POS-Tech is free software: you can redistribute it and/or modify\n//    it under the terms of the GNU General Public License as published by\n//    the Free Software Foundation, either version 3 of the License, or\n//    (at your option) any later version.\n//\n//    POS-Tech is distributed in the hope that it will be useful,\n//    but WITHOUT ANY WARRANTY; without even the implied warranty of\n//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n//    GNU General Public License for more details.\n//\n//    You should have received a copy of the GNU General Public License\n//    along with POS-Tech.  If not, see <http://www.gnu.org/licenses/>.\n\n    group = menu.addGroup(\"Menu.Main\");\n    group.addPanel(\"menu_generic.png\", \"Menu.Ticket\", \"fr.pasteque.pos.sales.JPanelTicketSales\");\n    group.addPanel(\"menu_generic.png\", \"Menu.TicketEdit\", \"fr.pasteque.pos.sales.JPanelTicketEdits\");\n    group.addPanel(\"menu_generic.png\", \"Menu.CustomersPayment\", \"fr.pasteque.pos.customers.CustomersPayment\");\n    group.addPanel(\"menu_generic.png\", \"Menu.Payments\", \"fr.pasteque.pos.panels.JPanelPayments\");\n    group.addPanel(\"menu_generic.png\", \"Menu.CloseTPV\", \"fr.pasteque.pos.panels.JPanelCloseMoney\");\n\n    group = menu.addGroup(\"Menu.Backoffice\");\n    group.addBackOfficeAction();\n    group = menu.addGroup(\"Menu.System\");\n    group.addChangePasswordAction();\n    group.addPanel(\"menu_settings.png\", \"Menu.Configuration\", \"fr.pasteque.pos.config.JPanelConfiguration\");\n    group.addPanel(\"menu_printer.png\", \"Menu.Printer\", \"fr.pasteque.pos.panels.JPanelPrinter\");\n    group.addExitAction();\n\n'),('15','Printer.CustomerPaid',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total paid.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotalPaid()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line>\n            <text align=\"center\" length=\"42\">Receipt sample.</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">You can change this template</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">in the resources panel</text>\n        </line>\n        <line></line>\n        <line>\n            <text align=\"left\" length=\"15\">Receipt:</text>\n            <text>${ticket.printId()}</text>\n        </line>    \n        <line>\n            <text align=\"left\" length=\"15\">Date:</text>\n            <text>${ticket.printDate()}</text>\n        </line>  \n         #if ($ticket.getCustomer())\n        <line>\n            <text align=\"left\" length=\"15\">Customer:</text>\n            <text>${ticket.getCustomer().printName()}</text>\n        </line>      \n        <line>\n            <text align=\"left\" length=\"15\"></text>\n            <text>${ticket.getCustomer().printTaxid()}</text>\n        </line>  \n        #end       \n        <line></line> \n        <line size=\"1\">\n            <text align =\"left\" length=\"16\" bold=\"true\">Total paid.</text>\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotalPaid()}</text>\n        </line>    \n        <line>\n            <text align =\"left\" length=\"16\" bold=\"true\">Pending.</text>\n            <text align =\"right\" length=\"20\" bold=\"true\">${customer.printCurDebt()}</text>\n        </line>          \n        #foreach ($paymentline in $ticket.payments)      \n        #if ($paymentline.name == \"cash\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Cash</text>\n        </line>  \n        <line>\n            <text align=\"left\" length=\"22\">Tendered:</text>\n            <text align =\"right\" length=\"20\">${paymentline.printPaid()}</text>\n        </line>  \n        <line>\n            <text align=\"left\" length=\"22\">Change:</text>\n            <text align =\"right\" length=\"20\">${paymentline.printChange()}</text>\n        </line>   \n        #end\n        #if ($paymentline.name == \"magcard\")\n        <line></line>        \n        <line>\n            <text bold=\"true\">Mag card</text>\n        </line>   \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n        <line>\n            <text align =\"left\" length=\"22\">Number:</text>\n            <text>${paymentline.printCardNumber()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Expiration date:</text>\n            <text>${paymentline.printExpirationDate()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Operation:</text>\n            <text>${paymentline.printTransactionID()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Authorization:</text>\n            <text>${paymentline.printAuthorization()}</text>\n        </line>\n        #end  \n        #if ($paymentline.name == \"cheque\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Cheque</text>\n        </line>    \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n        #end\n         #if ($paymentline.name == \"paperin\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Note</text>\n        </line>    \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n         #end\n        #end \n        <line></line>            \n        <line>\n            <text align=\"left\" length=\"15\">Cashier:</text>\n            <text>${ticket.printUser()}</text>\n        </line>\n        <line></line>            \n        <line>\n            <text align=\"center\" length=\"42\">Thank you for your visit.</text>\n        </line>    \n    </ticket>\n    #foreach ($paymentline in $ticket.payments)      \n    #if ($paymentline.name == \"cash\")\n    <opendrawer/>\n    #end\n    #if ($paymentline.name == \"cashrefund\")\n    <opendrawer/>\n    #end  \n    #end\n</output>\n'),('16','Printer.CustomerPaid2',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total paid.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotalPaid()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n</output>'),('17','payment.cash',0,'//    Openbravo POS is a point of sales application designed for touch screens.\n//    Copyright (C) 2007-2009 Openbravo, S.L.\n//    http://sourceforge.net/projects/openbravopos\n//\n//    This file is part of Openbravo POS.\n//\n//    Openbravo POS is free software: you can redistribute it and/or modify\n//    it under the terms of the GNU General Public License as published by\n//    the Free Software Foundation, either version 3 of the License, or\n//    (at your option) any later version.\n//\n//    Openbravo POS is distributed in the hope that it will be useful,\n//    but WITHOUT ANY WARRANTY; without even the implied warranty of\n//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n//    GNU General Public License for more details.\n//\n//    You should have received a copy of the GNU General Public License\n//    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n\n// payment.addButton(\"banknote.500euro\", 500.0);\n// payment.addButton(\"banknote.200euro\", 200.0);\n// payment.addButton(\"banknote.100euro\", 100.0);\npayment.addButton(\"banknote.50euro\", 50.0);\npayment.addButton(\"banknote.20euro\", 20.0);\npayment.addButton(\"banknote.10euro\", 10.0);\npayment.addButton(\"banknote.5euro\", 5.0);\npayment.addButton(\"coin.2euro\", 2.0);\npayment.addButton(\"coin.1euro\", 1.0);\npayment.addButton(\"coin.50cent\", 0.50);\npayment.addButton(\"coin.20cent\", 0.20);\npayment.addButton(\"coin.10cent\", 0.10);\npayment.addButton(\"coin.5cent\", 0.05);\npayment.addButton(\"coin.2cent\", 0.02);\npayment.addButton(\"coin.1cent\", 0.01);\n'),('18','banknote.50euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\nEiCCPICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ���������5��\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�\n. ��7\0\0:IDATh��ُW~�?�sNUݽo��;{�&Q��I��6�=��p�1q򔧼$�?y�<&H�%A�$�`<Yl=cI֌��DJI�l����w��s~y��&�o0�E�f�[U����]΁��4���x\ZO�i<���!ާ\n� \0�AD��j@�@�{H�{oCT�@��\0�K�(��DP�9��H�w�tBؽK8�B\0�3Y�\n�������f ������ٿ�֗�A�cSUEUA����΄��UE��ń�����\0b��\Zh1I�S<\0\rT��Z US|O�\"^���\n�1�r)�K1���hT>K��P��F<�D~�٥�\r\"�¢8T�T����sܛ���A�?����@P�LeDR#�0��o�qG7cO�����Α�z�$�^`z�st�#y�\r�7��6�D�W�}x�j�Sy�tp�8K��,h�J&B�C�@PN��`��DJ���-ޣ�!�qF���$��L�f(�X -yz��\0���t@��WPq��[��h�)K�]n=Z`m�Sn�m�Zq�h%!�A�Q$~��i� ���$IY��`��K��(�s��\\^��4g�3�b5E	�@>,2��>���?y@P�^0���l����M�W��G�yt8�犈ry����Z��!h��[�]�tw�&���PE�s�;�?��\Z����V��/�J���M���]Z\0���U�MPD���1���+�X>ޟa_*T�\"+=��B�y��K�o��\Zo�na��G<��ĕ��\\���||k��~�+�6x�r����gw���:as��v����\'���J ���t@�� ��/~��u0��Xn�x��;�*�\"F�WA��H���\rLBĝa���ek�b��S�$�����N���XS�������n����N.q�(5\'�\'v���+��,/uY^�ҝ�M��5�Q���ؤ�+_�$N�ܻ���qw�s��s�\r��W:<�N5������^��Esj�`\Z�$ID\Z,Әn����\ZI%AL��EsiqQ��q�,x�l��A�5dا�	X��s���gn�EC��f*)��ӝQI=��h�D\"��n?t$q��|c#&�)�I����23���X�M��?���v�ǟ}�k��i��a�ΰ�!`�����Z4{�o������w�L�&��⧘��Ϡ��@��Ż*�P�U���(&��3�6�H�dR�EJ��������\nh	�^�Jx��co���`��n�XY����I	�UkLFC:��[\'4*�϶#^����ݢ�˗9�HTÞ�8#){ԓ�o�\"�g�	i��ٙ��И�1NZ�urfj�v��)\'-+Ȣ*(�k��LͲ�\Zc�C�0�&�Y��ʳ������K�(J�^!������96m��	j\n��\"\Z��w�!�&˭!�i/M��w��/�ќ�@��+c��1���GK΀*�C&�2�,�֛S���iD�v�Ÿ��ظr֊��)�9�(r /V�EDϽ�`����u2S�G�|�G��x��8\Z1H�MR��\Z�����8��M�0:�E\'rq�\\<7à�mD�	G���P,�i�1�*B ��s�$J�HG\Z;\"\'d�M�S�|ĳs`\'�L�#Mڤ�YQ�=\\$�QO�)�R2�\0�I���p���{���o�iX��$�+<x8�Q��hTc��S�c��ܼ��Rˀ���-�֗9����ϵ2�<˗��}T���e�?AˁJ�HgS�忒�������#���L1Y��cG;��]�V9��Q��Q��,�@�r����I����6Yeqf�<��ҫ�S^�t���XYH�9T∃����{{��\073?;C��fy��-~T���>�m�5MS�<|Y8k1ƜM�Y\Z#h���Y �O�Ӑ�����\r\"�R�\"F\"23O/_a��W�PAq�Y�;����v�\n��X�VY�k2��_��+���Ql��;F�#�㔝�2Qa}.a��!ְ��\\P�\r�P<����Z-�Y�(\Z@���EC,�Ax�er0=A|���0v���)AZx�`@�J�����I�i@X�%;r�;��i���Cn~:�]��4�4j��h�Z�Ko��ˀjR��V�훏�m��l�њa�c=�vNh�k�ڶH�sBȁ�?�ha�j�e�i��Rl��\"�Tr��\nO\'KL��5�1YJ��`��:���A�5�Ĳw0\"���3��\"Bb9�TZK���~�vH���=^zy��a��~v���Y�5ۤ�k�c�\0 M�f��׮,`�mt�:	v�l�}��U�۠YQ�\"�b���={_�����V���I�!����Vf�x�袾�W�p����1�z*.[O�g<!���wi�|����{�1���ty���Q�f\\�0%L�*/\\�N��/�����h��Sq`�R?�T�c*�2������Bz\0:.;�`�T�e�t*k�1z�40儘�>�Eš٠P��@\Z`�xVQUrY#�2�1|p7�O�#)�V?MiT�7N#:Kk�^ h�+�|��p��B::��c�D��r��2��P]A�u�a\Z-�{�0:j�|�qp:����X���&��#0�?Eo�q�[�����#��uD`�-�р��5&�u��K�,��G�;T��N�F���8��_��������ށ(H�X��*��eB�3��r$&�B��G�e���	(�_���/��)̒S��)&\nA�fZC#��J�PR�Z�1�����:�0�1�@B�ڜ��ha�ei���[=� d���g~/C��X��J%�tb�i�0�$qH}�Po`��	�hܧ�͕3f�FW~\0��-�-]\"%��P(��#���B\\aM�������9+k+����d�vw���!������Y8W+��x��>��!�X�D�Ѡx\n�ɹ*�38g��H��؀R3qEi�c{��rs��+�Mn�|���9v�S:���~���O0�4/m8-g�1}E���b12�������������ԛSD�6Vyp�!�L�c�7�A{8[�b�\'$�NoCM~F.��C0đ#�q#)b#�#�%�SQ&����lm�˯/�{�8lf|<F���ǿ���*�`�|�SKψCC���� Lӌ@�������M�a<����C�ڗ61�{f[]y����jm��0GH\r�z�������y�Y�?H�#}�Qx��+�HR\"�A$�r)^����27O���M�����;�Oy��S</��}Q\0\Z�\n΄��`J	�;:d��=����X������!��|����K���[���|u	��g�)�XS8Å)\"HP�!�m*�#f���k�i�BQ�*�wU�I�\01���?���\\���ޚ���*f<�h�y�?��埲��\\��OEAЀ��T���ޟ	���	�?��k_�:�|m��wv�4\"Bjx��<���������Έ+W��X��(�G�1%�:��L�3g=�\n\Z 7��gIu��|���!����8�8r�M���8.Pl��N�����،�6`��%��\'lq�Ǌ/d���6Qsn}�l_`u�<��N��!K���[cd��%���%���4��\'L�uB�:��P�xDr���6g�?&Mc��1	��oPbL�zb�=!�x\\gq>#e2\rXñG���o��+l�������x�o��\\X<�귾{�g\\���A�,K����+W9��eiy�g`a��~�s��\\丿͋�y�i��$���H��3��_!��j���(6F��\"x�������M�=|�݃�[dyN����\'L�fj1��3�d�&\'.��NX��~A����y���[����Zip�����_�O��R���VU�iJ��}��ܹ�)�<�<!�t�*�G��xi�k�k$֡�@�PMSA�-j�?��>M�{��_��0b����X�<\")N�`��ٯU1���or4������F)�P�V�������c�u�L	aB�SR?�ӝ�����w���+\\���7/,�ޝG���,�B�=&ET�5�����O�i�r��ﳰ�B{�� ̴�4[3�ti���[M21�d\r/���U������UD �7�z����؟V�ԙ0G�c�\"7>r8X`uc�CP��I3a�z�c�Kwn���^\r�i ��g-c}q���E@�<[��K�mJ���z�K\nKς���`��z��)�+/\\�?~H��J���#h���f���6��\ZQ�^���Z�S�oĮǬ��!����\Z��+�n�8�c�Sg�ۡ�����\'G�l�c<̙�)y|�3�N����\Z�������;�B/�Mп��H�$Md�O����3���o�ַ��7o�1��4uls��O��Y��ԪU�\\�r�� �>���췞P�s�D�\"���u�)P��U�0H�h5�,g�;&�@0�ߛ0ߩr���d��ݣ�2�0r��KVS�]�x�kUѳ��0�5ؿ�Y����˼��\r��<z����*�;�LFM*I̽G�̝[%˔�Q�4K�%�(o^x����$�&▉�6U7ƸC�����Pq1GG\'��SD�3	.��(�^e�Ѫ\n�I�I[�����Ic���JagqE�\"�dH�\\�m���	�W~B����#o�◯�T0����:��0���6��.m�99>�g���\Z�\Z�v�)0��d3o��Y@L��]b7�DY�5��6����x�\Z\n�U\",��>���;��dJ:�L�)CM���%޻�tܢr嫈ue&؂!j na���w ��.r|�x�j���ր76�S4�f�Bl��t�	���Y�I�c���C�w�eM�<Ż:��W*e�\0��!�6�X��OSB.��N3g��=���N-X]lq\r�4����5��e���H�����6Q��R�	�b_�d���1��x���2W�|�􃏹�g��o�@�1�5PI,Ӊ�Z����ED�1߭\Zl|�h��{�y�B=&^�hc����	�؄�X������0Bs�f�X*�[���N��]�`J���G�X����֑B4;N���Yv�h|�g�\"���c��4}�����zlAE)գ�m�:��-LU��B0T���\'=4/6Hԣ{����l���C�����-�mA��	���).�&̽��$�0��p����x\ZO�i<���4��_����Dg��H�U\0\0\0\0IEND�B`�'),('19','banknote.20euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\nEiCCPICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ���������5��\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�\n/�o~\0\0�IDATh��i�]ו������<�\\$�IQ�5К�m�m�3��� A�$\r$?&��%? H#	�t\'A�n۱l�-Y�%�3Y�p��ϰ�ʇs�Hu~Bs�{o�{��g�w��]�>�<���x��y<����4d�f��g�P@-?p��٧��Rb\"�TAyz�W@���GP\\��DȽGQ��X)�����q�-<�̯.R��ϯ�UA� 9��d�PM9ZU�4����c�߸���.�ɀ��������$s�9�̈́�4������>.��@e>Hd�M�d������,r�����n��p�x:eu��x:ûc<�a�eDV�\'�<�՚ظ���O��\n���A����Z@�\"�^9::f2\Z�l5�.tȜ�p���t�����O~�1�6.q�w��7\0�fAL2�OfTB�x��o���IDX��b�\\�\'�E$0���W*�F��>�ը2�׸�!�Fl��f)��p�����R�	��<��!&���D�џ��Gw#\n�z�Q�o��]�z�����音�d��*y����ÿ�]�*�L�&異�`��w��p0�Z��@�\n�j�W��ј�FR��*�d��aoԣ\Z���}�y�\'☥�.h��o��\Z6�\0,�,��S��r#�w9�N��{D\"����1�{�}�M2{m^�v��^��������Տ~�?���\'����{����7���U~��Mn}�)�.�g���8��*��zG��k�9�(&MS�(�*�:5\ZIȽ�!�/g1���x�0���Kh-�Z�  �0 ,A��Z�O���f\'�L\r�$���z���$;����?���aD�b���y�k/^��ms�˼��E���Yƽ������wXX���{�4���[s^(y	�0��88�pt4��po�t�Пd�*Ih	���b\rüN3�a�~������攁x�^�4�\n��Q��$���2s�T����෨���5iI���i�g����%��rG,�a��e��|k\n4�U:Mn��G0�1�n}B\\�Sp�x�lV�H�h�N\0�2��)qa�N���{yN�WKRBxU��hU����\n�Η���D��n�n�\"\'�!�uL��)��Ցj(0b0�$��H���O�a�z��d��{O8��F>�������x�F���ɐ�d���[�N����o�����N���G�YE^� @��6V������3F�sS���o�gF�rZ6ALg}0\r�r̔��,c�q8��Q���� ��9N\n#^^��)y��/~�kLQ������FG)1hPB��QxO�ޤ�3ڽ%^z�m���Ư~�j��q�W~�h9��kYN�B�T\0Hy�_����Ώ�(�+�/p�S�=U+Yk�Ԩ�M�h�s�<J��o��V�!Y��W�;�T>e��ɓ{O����_�`<e�x�X�x0`t�c\"?��[�f)V�[�X�Ew6Q���F�|�o3JS:T��k�R��i:���ҧ��:��ȩ,*g_�@�f���1ք�~d�\Z�Ӕm�=�,Vm������b���Q�sb�춾����<�u��+�8�xGP���|pa̰u�q�E\0�YNPip���,����3��TC�\n���߼�7�Ou��s�=��+�*N��_�8�l�<8ӡ�B,˄R�v��S���.U[4���˄���9���!o�����k�������+hQ�<�ϩ��$Հ^��Z�E�K�Y]8O6�`���}���m±cpw�<�spZ6N�y�����$�&~~�?U�\"�2�(F	�JT�F	�G�U��	�.h��A���@��U���ǟ�sR�\\��ʍK�t�Z�.�_������\n��R�\'<�K��.�Y<���R��X�X�(-�r�oq|rD\'��	2G���K�\Z���v9\r��Y;���{3�J��S\rRfy����C����:F�\'(\r��).W�c�+���?e��Ҽ�6/�oQ��1wvjd�q��kl��#=���lmn�8��պeںH[+^��$S���Ө�{O����h�\"\"�lw��r��<C�L+�l��|��rQgC���G�vQ!(6��j���?ܤ��p���J�.\'�bE�1�=r�}�����߼��/���4��Cr�ʅ5��m&��\0)p֖�[K�c-�����Z-ao�K�j�p���w�3�9���2N;2����r��B��u��o�U)�*��PuH���:��y��6r��1��1�8�c��)�n�Y�G�r�@�k���;����(�� {�/����;��ܻ��o����J��iwWj��-=-�hɒFJuǼ�����y�)K�]��\\N���mc��¬�\\!�?BU �����#�i.�a�Ik���D\\_mr�`�ڀ^ื�g�X\'/\n��1�����=4��<���]������+i�q�8�qޣ.WEi���T������^]�R�)�YCa޶\"��2��p����U-��X7�r��`��JJ��9�٘;7N�� �D8�\'�t._g�i�}��7۞��b���a�ǻ3��h2*��TҔ�\'[�W�q����b��Fԥ�-k�S!$��S�AU�j>s��{��{�{k�A���%��)&,@+���M�Ý)�\\}���n#�N:�T)&Hk�J�N�����[���N�|v�IhH��k�\ZY�h����f��#ғq����+�I�p{9�\"�w\\���{�B6\ZRiw����q&��)4����<�aT(�5�EH�����<E��LG�Ի��\Z+ט�Hx��t���}\"+tV.r������q��F8Mp6bsZ��Ҏ�lM��5�2QO3�0��?�ҭ�L\'\0�i�Xg�[U�PhG����(���������LϹ�+�{J~`�ON��\0u�Z#�v�{v\rk�FW�oݥ�ZD]Η7?�ōE�R)��]��a��hk���R��^�H��q�\n��#��	�����*lf¸p:Gc8%9 @T��^���>�թ��?�vY�ga����������sψ��ƙ\n��Y������,�Wr4\\��8|�����(��_|\r�ݥ��0Ƃ:l\"��(��<�y�T+�fQ�����e��5&hQ�R��EVBO>N�%}oX2g��F���\r�X1a@Ǩj��z���mk��ϒ��tFCgx��+�E:���M|Q���\r*vH!=��SH�����8O�4�tL�7��&\\}��|��{e+~�MF_��9��mp��\'�(����<�eo��\"+�rBk9�#�h�2\nBP�d<�\'l��������Z�	b�/�6�W���3UtZ�@��o=��p��pDgm��2^��+��\n��E_Ŏy���ps��uF c��@s�tBT�3P�w��\Z��>I�N7H��T��F��(ˉg��x�l:�Ө�\n�B�<Ro0��*��g<KI+e�o�������%���Q����7�u?[�gS�ȳ\nP������/y�;����_������t6^�p����r��M��k���3���Ko;��DMՔ��*��F��D��H��\"�6YmT�k	��6�Ɍ�����@a�	|^�\n�,��Q QL%��@�\"�X���oQ������!�i,E	�߻��û���@YZ�@Fe��Bu����B��� �z�;�/�D��x��d���/�bg�\0��֒$ul�1qR#c���j%&-�jĚ{�F-�\Zj�r4J9�<m�XchY�N�g��/(�RXW�Bh#��\Z������5z�_����9��c:��t�DXZ;σ/n��lxDTo!eff�T��bu���K�@�qv�ď��S�c1T0@(Pq*B-26=���0KYZ�r�^����{���XZ貜��U#�ͧ��Tx����_|Σ�{���&��b��3�\"���t6%��\0xr�6��:W{�ƕ�����gګ�t_x���⽒�Kd-,?��F�pf\r#8Y%\"��,Ε��Z�X�	�F����*����q�\rt눤Zj��V!v�W�U*�w(B\\��D!6��z���������B�q��|�@�{�w8>D	�������\"[�28�;s�j�6�V���\Z���G�4OTbDS�5U�&�]r7�22�#����6�X�ln0�E��T����M�F����R��\Z���6V \n-�Vk\r���N�]a��8�m���Ð�dR\"\0��p��&�}�����_�d�2�U��s�_W��aL��ce}��O~Bx�UF���\'Cz7~@Ql15kXۦ��He�A�q,� 	-m�K�S�M�~2ޗ��z�ɴO1>&�*��g��.�]g\\x�9�X�(J64��b1�%WcQ��9�徢\r�4e0j�0��I��*/_����\'3~��x��U�[���ݿ�G����o�ƛ?��gﳸ~�(�|���͆I8��!Q���dDԼD(`uʠ8G��ю�L���hl�&Y>��y�n�(KI|��s�d9>�З)5-H����sx��F���!�c�P��r�;��c*��B���i��N�Kq���^��np�/?g����F(=���c�Xh�i�\Z\\��2n�\Z&�ۋ�>aqe��7�7z�\\�]p�zɧDIB�� Ř�	I�Wz��FҧR���.ZaߍQ���U�;Kj4^eZY\'2��Z� �Ji_���<\"�!�ǪG�����c4˹�yĝԒT�Da���/��%���c�����?�{|����}G1�f�=�f�lr�f�n��ѣ�$�����$f���0QLX_Dj�#�\0_]��2ǳ����}��8%J�X�*a��%@Dׯ��Q\\Ì�g���`�\0CX��#QT���D�%�4������f����\\�F�:���ƈ�_��Q���ۏ��o������q�=�������{B����kLc�\nQP�9T�;D�\n��3�X �\'�$,b\\��.�/��*��ŋElP�6BT�9��S-�S��ԽU���=`T�{�@�\nk�*+�\n�o\\\'whW˽��ZY\"�ǩz�s�;�B�Q_`�����	�1�⽧P��pFh��� �\Z�5��jʛ�(�+�r2��{\\�RLgv��[T���!r��}��+��ck\r��lR�s�*�V�(���s��봘���y@h&8�$Q�W�\\�A�\0A�do�jk�l�0�~m[L�BlK�I��u�1�<5SO���g�$�?�F���=|a��uY�!�\\��r��T����K7ۄ��B�]�׌\rgw�Q�����,-��y����^��L���<���x��y<����)��s耮I��\0\0\0\0IEND�B`�'),('2','Printer.Ticket2',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n    #foreach ($paymentline in $ticket.payments)      \n     #if ($paymentline.name == \"cash\")\n    <opendrawer/>\n     #end\n     #if ($paymentline.name == \"cashrefund\")\n    <opendrawer/>\n     #end  \n    #end\n</output>'),('20','banknote.10euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\nEiCCPICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ���������5��\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�\n0:�+�\0\0�IDATh��Ysd�q�y�]j/\0t�n�:ݳ�gg��)��=P�vءP��Y��b)�`[z�\n-˴D��ᦙ�س������Z�vN��^z�B>\0�©{�ɓ������N��N��N��N���a�$�TAPUTD�s�H���u��}�O��B`k�׈ b@�k�B/ByAD��F@Fdv�+�n}���S=��H�pށ*�������*���)?s��}������K��o~��P ��i�[� 8����_\0��Ɛ�?�\0U0�)o(���i��E�	�h��1�%H��>^c/��h�!�K�������Ǹ �����y�A0(bL���]���i�\'$\0�|O1�zT���\"��x���F9W��VJ �\'�����F�\\��2�yt��ӏ�e.ޡ�&���������[O���)���N���As$\n��C��`0����쀆H�!�\"�*��^q�h�#a�l~���|��^~�S��\n��]>���`��1g^x�k��_�\nW:�����,�	ٴr�*�j:�ۿ���Rl�P{�*ޗ�;z�3�\'��ΰ;ֺO؝��P]8E���	,*�(�9�p��t\nly���)#N�sW����\Z�a?`��ky��?��o����|�.���Eʥ��b������;�����l���c��>q�⥕%;�����G��Ծ�Mj��&�d����o�UũA*��c�ω��(��`��iÙe���£\Z�*&�A�`-�c\Zu$�q�n����\r�+��c6>�_~Lw�\">�H�}�3\\���k�����=^����֙g��?��L*��Xr�u�2�|�M��ǳ��a��O���O�^x�������U�\Z��&���1b��)���!ӧ��>�{�������\\.�\Z1��[��0-b$�0�lͳ��5����}��<��!b-{돰ְ���J�PK﹗p�~�έ/H[M�߽I2�p��*\Z�06D\"O	��8�\"��BR���\"a�s�w��*����+�!�,��+�W�\Z�F3���S�(d���v���CԚ\n���8���F�b:H�C��f��kL��C	�֒���j��T�A����/o}N���������p����t;�U=f%��	4�cέt8����t��O4�f�ɏ�`���R�H:�IH�3�\Z�@�LJ/���a�j1R�!����q��\n����V_d���+䵐H����\"#j�!E^ \"\\��<�����q£��\\{�2��W%�%�u��U��\nO	lG�u�T�;�1�`\0l�,�����-�q�&���=�NڡQ�\"�E��QG��BT<��S�\'�$�`����:�<�C��V�����$�;Ͻ\nF�b�Z����9�y�	X^n3�^���A𫛧\n�r�Ͼ�W\\�V�D��a��e�Sk606@�~r��^@�Y�C�aY��(�h�~���:.��]�\"���A3�Nq�1>{���g�:��y2ܥH&kh�Y�x�������[�����)\"�~�\n�Z�^#�]\n�9c�c;f�G�%�#���,]}	,�N\\\n�	!��$GM0������/���)>���-���Ӿ��� ;����Fk�x<qe~�4��������r��H�e�l��XX[`�hSOϢ�<��\n�j�G�xD��\r�#�W�2�+�RU4j��Z\0��]4c�+H����E�6A��*ţ��hLᕡS�A�V�_��a�BrÜ�ś�<]�5)�c����9�q�����i�Y�Vo��t�5\"�.Z^y���R�^F��1|�	ǜT�3|�:��qβb�����Hs	�=~��9�b�I�{�>��HԀ�w��|}\0����+����9���[<��nn��n`��gzpH�< �Bz].����$�w�r��f�T��3N����]�z@o�J���{_��jy�����\Zy&\n�9�GN�ǈN@\r4��y�1���AYߧ���9tz޳�l�}R�L\nG�$).O��E5v�1�Sz�9��/��;d<��[4Ҕ���Am��=��_��|�����ݝrx`�v��TU�Z�&C�:W9GTf��s~ư��ݲ����`��-2�54������E���s�\\@Ui!���hRx�:O;/x�g�C:a��N��OiF�Y\"�}�Q�\"O������XT�VL�<���<�Kg�5C�ӌ��e��.����m�q��@!��;��vE�t�� ����l�I��$M�HRظlm�B2��c�Y-�OF�\"\'�ۦ��2���������1KKdw���E��R\nc�M|2�L�H��7Gt�LKUe0q��\r����N�_X+S�̕#:{��%�+_KeV	�����=�)bÒ�i�N�������1���M� &d��ck�g!/pӄ��:s]Vi�)�}F�Lh0�c�{L7/����h�i�g�[>��&#zL������g ?��e\npL~*p��Ϡ��T\0�<⏢AP��2��O��iH|��ϋK��tJ�|\r���Е��Ɉ� &�ݡ�;E~��y�XC�$�0�Ԛ�d1��v	�E:gc$��n=%�b\\Q�R\Z10Ny��y��i���/�Ϭ����T.E��Wv^����ǡ������L3e8Zg��D:��`ZK��B$��x2��j����v��?ƈC��=~����h��Lm�4^�l���@��f:< �i�Z�1n<��%e�*{yƟ����B���5�3�o�h�щ���Z��\Zk���53.�+|��\07�~ɍ�>d��M~򋟕Q�^FG���k���.D1}o��<))qs��Έ|k��3O�f�\r)}�<���+t׮И��읦�x���ב�\"�F����E�j	�U�B\\�1I��������c6�q�c�/�cJ�����W\\��۬)냘\n�ND��<\\ʫ�|�f��x<d�y\\�FM�L��\\���x��6/^�\Z��H���=.I��}�Т�c�CLH}�4�g�,�\r%�P��c�u�tJ6�F�Y�1�������h�xn�Q����.c��1�#0T�J\0)##,E��Eƽ�_`����Ū�+q$KS>��Ο]�7�f0��g�u��ju�����Z��4!��S�o���Ӥ$T�bØⰏt��3��4g��._09�#E�h������vEx��G#4Z � M3�s�*�\n)K6+_i�=Zn�S���g��/�{K����/ZED��^\\;O�Ѥ���ͻw�Eƕ�_�EEa����`�[��9�9�S��F����Dz+�U�d\\����(�6��s=�0 lϑ�wP�ӫ���l|��4�����I�Ý6��9v67q�Q�@�h%HE\"�j�!+����luPU��WYZ>�_�ş�iA������K�|p�O?~�3Kg8-u�_ka��\nP���nB�A�pkB���C�R%8�7��&Q����8�#���F�l��&��F�d��sBO��/4��;os�x�~�=E�	�����mo<��ݛ�q���������[Z�(\n\\Q �ҝ[ I&�a\\�$7�¥�����\'.V1�>�``@\n�5Oa�;��)jKh�E��YV�f��TS�A�J@>�`�g��V#hFn_�=�%6��N5��&�G��c|U����E���MԌ��5�+�bP�2��&y΃[_���7�1��V�^�����kҾ�F+���\"��-\\���bl�zXRLQ�%��>�\r0�t8D}N֡�B�I)Z���k�εK�3��l������m�ф�Z�/�j��)Fh6HL�G����?�a��r�*�Pb�s���3����ap��{����.?������_����{DQ�;o��S�dDZ�E�i�0q����t�=d�W��`�N�O!���)E��I���\'r�	�c-R��l��=�\Z\\Q���1<��6+b�ˋ\\���\\{�y.\\Zc��5��:\"�ELm��>ߞ_�|��l��p�`����������o�6�ߧ��H�������,�7���}lr���RL!��x����	�����&�˿��C4jR�S�F��D1�L1~B��avg��Gd�\"`.��yJ�f�:��\n�ZװAXJ�\n)nZ���j�\r#F0�y�o�F�}�G�⽿�i����\Z�f��#�Ⲕ�(B�l`Z�^Jۓ��\Z4OW3@`�ǜ�>��˩��!��Zlަ6�[�>�+�\\@n�xWP�<�J}{�sNs����,HH>��������Oo���=��)W��Ln�EӬ��v�t��\r:A̅w����������������.f0&�t	�^\"�ݣ���S�t� ��c�=�u�FLD��!��=:|������p���>�c�a���F6�&�x#�|:d0��\\+c��8���x�hc���>a`����{$�똼����.���������Fc��|����T\Z�/���/����>a��oS$)F@�w4���7a�\0��(&��!��W	�7���n��9&�k��a�װ�.>!�y����������+\n�sW������v�ac�����sO��ۏi.�!�u�y:FGC�	�hD\\o ���4d��_*����\rj���\\=���������Ϩ-,0��#\\X�ؒ�l�:�;�4����kqD��}�����\"���ޭ��	�yΙ�<��y@0��.�s�(�Vr�!�.�-<q�����������^��oӌ\Z���\Z���$�ǈ���������?��Yhv->l-̕�}8\Z�T\\�xF�U�P��Pd�D�m�S�oC��\r���鑈p4JWE�!^K�(����Sq*��Zr&���ಙ0q4֞]���f�U��E��g*r��_����)�-�ko��������1�q��n�L����L�/<�e����AlI��ՓTQ�,_��Q�e��*=�W(�����o���!bmU���n���Σ걅+u��$k�:�P�)�Z@�ݮ�t�\r�;�;�;�;����\0�\'�A����\0\0\0\0IEND�B`�'),('21','banknote.5euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\nEiCCPICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ���������5��\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�(�;n�\0\0�IDATh��ɚ\\�q�qΝr���U\0\n�I�e�6mK䯵�G�xٛ~�~�~��y�?��n�mٲLK\"%\n\"A� \n@�C�w<C/nV���z��ͺyo�\'���GD]ٕ]ٕ]ٕ]ٕ��49\\��t���_��\'�s����|�=���\0�`��ց��y��?���1����������{2_Oh��7Y��Y����� �3&Y��y�����x��]!���t2��n/OYZ��ރ�#xpx�������y����R��h��v{�,�RV���5F�<7:��	Zk�F���P:$�bDJ)���(�ss_x�;���9xW;Z)�@��\\�5���m� D�v�6�ecp�)��}�ԥ~��O������G@������!\r�ѐ���l�i��������%�\"�-�LF��A@F��PJ�>�4��OH�b5��xB\'\\�q��*p����ިA)������=�*s��4\Z	A��,q|��ݻ�d�����Oy�����m�gC��창����D)�wJ/N�:�8O7a��$m��:��4qJ�\0QB7�!K��Vp{g\r���%���Xiq��{�����]��Lh%��e���NǄQ�8��,�{ΰ�ŧ�\'c�5Xc���DIBUVx��\nUQprt�����]�$��󻜝���V��i�_H�{ￋMi\r�\'�����:�)��fP1#�*�ӈ(t�X\0��(�)�IX�u�ҚI�3�V �K������/�V7w�n�_^b<�RU���C���c���4�A���M&�I���c�5�;]B��G�vn�ݺ��V�����P-�-��#J���?���� R�����f눴��%c�ˈ�F�Fi��%�k���Q�!�5^�(4�{�N3zK1A��J8<P�ZI�xZ̈́v��V���#�Ͼ$i4���\"��3��D!i���t{+T����mN?d�lrr���8�`�Qz�Sv��H��g���7��(<��I��om�l\rBJ*\n��M���2Gf���CD�sP:��tb��!����&�<q3\"/J�*�2�3��8cAj��e��/x�ɿ1Ns�0�9��7�AB�?A+�s���c�V�`48���B6����mV��d2�����2���w���\0A�s�����}k������!���ޓ��\'\'5P�Z��iODH��F#\"�\nc\r�(�b8E��jF���]�ӕB)\rs���r��3�8�Ӫ�Y��l������RB3i�k4�7[�e��xL\',/�5[��q�����F����G-z����\0u���u/,.��J�\"�m��5�o���|�l��L\Z��s�7�+��c�q�xG�vp�Q�~��ك8=|�t2@�����\n3���>c6<#�\"�V�P��!Ka��r��*�UI��pv����OQJ�q}o\r�1u�_b�b���Xh_���/x�2��YcQ����	A(�͍)���y��\Z���L�����\0���o}@6����#��,ol�EQL/X���=f�6���o��ci�O�e��AO)���рi�O���dpN:����s^4��[��~���{��_�� s\\���s�@�£�P�,5�m�g�u��%�\nMD��B��Jp�r~������.��m�� V���֬�N>�꿃��(g3�Vh$��@�e�}���|�{���H:c��!�f,��9��&<߸ ��\n%�0j�`J)LU���YK�:�\r� �� �bl�D�TU{.m-�$��!i��olG!�� \n��w�P���4BM.ht۴VV�#a@>ʉ�]�����ݷ�A���nY��qg��RD;�Q_�8/����\"�:�������Q\08�j��(�ь1��W-�`F�OT���}q�XA:>c:�M��Ơ��d6�X�W�\'ϟ��,�n2NC�s��	��b:M�Z��g{\04�-�u����I��,�����ը���e��\"d�u�������=�p��9�0��&�U�6���T%�΃q�\0ae�-f�Ύ��O.ȳ���AY���ko��-rL��bq_>:#�rf�):�j\r�����uD�bG)ŝ���\ZQ�h�	�^{q��7��%\nxe�(�R5�[k��1Q�(�v;(Qh�d�+�86@b���8�d:���h�T�Q\Z�$O�9���W9K�קL��幱�1�\r1�}-����u@�$T��G����7�Y^^!�\Z �v��؆z5��k��\nx�1��Xk���^�G#Nh��xI@E�h�O<A9�SM���?}�׊F�%N��D�.�(�b0�0$�i�R�V�.x��g���\'MZ�+�ln�DkM��Xcp�b����G���_��-��R�N�^<f��^�\0�����!AX��f�ڟUUa�s�s4��_bz>`6�ۺE~�߻��|���M��l��ZD�L��T�OI��(l�Y}\rg��xD�� \'4\Z\r��xW��\"/�v��z�g��v�[=��Z�P�)~~��+!��JE��L�x�����{�+�u���be�+�g\'l��ū1������xQ�0E�R��(�b�c<�0\\�z����b����k�&\r�\Z���q�bLED���΢�F)E%�bZk�}���z��b3�kB�[��eI�_Z}��֚P+F�{�~�9���:Jk\"]�hw�\r�ф.��їO�UI���$��%�t�xH�V�I�Ѡ���M:���.�^A��0QR�t��k����;�~�C~��O8;`�=�UUw��W���i�	Q�NЊ$I~���n�u�g�>%�;ƛ���6�ϟ0>\Zs��	�k7�1�Yf�!�\'GTeA��fs`�֚s(�	����Vx<UY \"�Z�sx����+\n�a�������s�|� ����4�%EQ���ZK���!y:a������Ai�^{�.����r�J�t��Sq�\0S\"j^Z���\r�$2{hwB8�T�&������9Ga-$�����f��5Q��M��dE�k4X^��_h��\0P�g����������2�a�Ghv{$����O� ll�����O��)�G�s�O�@u�n�z����l�Ϩ�����#\\��@g-yY�#�bxzDh&���$�&�9����SN��,�\r�������}�?&�~��?��w�Ƿ����=&T�wk*Vo��x�)�����p��J�|�?WM���l`=T~��gm}�\"�=��-3� �cl�3U�&�.e9$M3&�!�N�X�-s��m6����W�8?g<\Z�l6%����:g�y^,6�H�<O�����h�O� Bou}Ꮥ�k$I��k鮬Q̦� �;��#vｇ�P�zF�vЁ�yM�p��V�(��loϑ�V�����TG�l��ƫUx�3�}N�����.{�)�c4\Z���3&��v�8.����e�ň������hV�׋���c?����\n�f���]��Vg� �\\��}�g_|����,e��u\n�%�90�j�3Q������\n�h��<g�6��%8��u�x��!�Q̈�B��d���O�	�#��<�{�p0?o�h�ӈ)�-��p13����o��f8�!��	Z�y���o�Ǐ�����W��Y������}\r�5�����������q��{`*����\"��Y@)GV�X_R�ó��:@�}����\n��,�S��}���4�x�8M����0�����I�0��X_۠�n��-���ѧ\\���IX��̻��CY<|�_>��ݝ�\"�������2�Ҕ(\niw{L��Oظ����>Z}�)��Q#�उ���ec,�{�����K\n�9�4��k��vX^ߡۼ�y	��ӈ � P��2(&��Z��7��V��&�y���ݍ��k�iF1��)�^{���%��{�������~�3��}��A��)�[�<y�)���3n� EI��q��?��]�9����z��i�\'ޗS,�A��p��!��?�Y|�Z/dZ}�`0b<\Z29����1���v.��<I�������*��|�Ӽb�,��d�Ӌ6U�t2A	ه�4{��\\i}��v%��7w���!�2Hg�͘�>��S\"q����4/�=}Be6����\"�g�sT#\nrT�F�$����6���}f�w�吙}DQ5�L��<E~L�JO��\Z�������\Z[7N�u���\n�H3�hazn�Ċ7���ŘY:!�+�,���<��	eYpvzLY���=����ju	[]��!�F�ɤ �bD�8�֐��|�8�2���J�x�Q�wX�*��9=+(��oRVqE!��(�YSG�|�\Z�\0%���p�� D��$V��7����ߥ�;������>g����\Z_\rG�R�ml���);�^���G��4;K�z�h]���\"#\"�))�e4���\n=D�|�\'J�\\�_a�(Ee����3�7��I��1���,�,�y����E��:�U���L��zB����n��v��8I�.���_5� �PIŧ�O���鴢�ipss�k��/	�n�G���R�1�e͋�z�\"(�\'BJTM��^�y���`��{yAn	\",N��C��R��_�>����H�΢�0����joi1�1�=y£�s*м�C�h�CUya6�h�W�o=����U���aXCt�y!���óf��j�Z�u%��T}����1�7+��˲���a����Z�!\"��Y�2E��z��,�<��+��+��+��+��+�wj�\0��#�m�\0\0\0\0IEND�B`�'),('22','coin.2euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�\'!G7�\0\0\ZGIDATh�͛Y�d�y���,Uuj��z��f�ѐ�!).�6J�d%��H��D\n�Cp��@� �� �E\'�@0J��֍$;�hIIII�ې�g���}����,���S=�.x��.��n����[������/c���J��2:c���ƌ\nA�\"WIe�B��dҹ�tS�\\�y�����B���(ޥ�(�?-��sJ���|?}pp�ҭ[lom�n����X�C�X$�y��E�+\n�\")��q�n\"�x6㥿�H&�cYV��<\0Z�#J�h����Au��K\\��@��R,821���(�B�L&��(���\r��*[{Uz���*�#��?���\0�Dr�M&�w.����8��\00��T�!��ʕ+W�?���؎��S����ñm�Ƕp�ؖ�e	��/���ض����_�L��fjj���i,�=Hy�W˥�B���0����Q���͛7O���S,�9{�} �$	7@2���m�&�ظn!�`\0�1���k��Bi���\ZW���dzf˲�(��E&������\0`�q�H��v��o��ѓ����Z�K\"�)������d�)�T�����6�p0B�}\0\0�A��c4�v��(��u���\Z+��9}\Z/���r��4\\��B�V���\\��H��7n|��>#Μy�@Qo��!JS�g�,/� �J��� ��`0ڀ0� ���-�Bk�����\\]cvz���1^{�\"�L���� ��ɤ���h�����w����ol���a���F�a�pl��ulJER���K�^c��E��M�^G��D2I&W [�00N:�#�ZSo4��x���9:76��9{�,�k�,-,=k~M*9��c�d�����1�3�<���>�6���tCI�K��ui7����Xe�#��=���4�o�����&ǆ(��$�-��$�eQ=��\rDr�a�<ʵ�W	Ð�J���5\n�<�C#t:\r�(bem���IJ�ҏ&��>�L&z�\n\0���?{��������4�vPZ�����S;63͑�!v6n���<��	�d��,�t��� 0Z�wa�(��%�n��4�GO���KK�ԩ�Ϧ�Uw)��d��[ˌ��sd��׆�츶z7\0���_��7����\"e�QD��DiE�P`v|-{�-�@s�\n��a�2H>�&�/Q\Zǲ],K`��}XSB�5�A��h��j�Q��5������T�u�J�*#l�l㥒l��������96Z��?﹬?��������W/�n�<�,a��t�t�(�)���LQ�[���,��k�C9z��,�H���M���$�r���r���l�p�,��	,��mpm��\\y�\n����ebl�T&˥˗i5��$�R�@F����o/�����E�1ƓR>������?��Gi�z�K�Q�uxI��GX_z��L/_�!�H,�!��bu�Nmw��y�m�omZ�~���|�\ZZK\Z�.	7����K�<������\n%�BS��w�(\r������}?��}���މ��O��C��9�/\r�0�٬cY�l��3S�x�Fʒt�#�-��.���rx��\\��\'&����Ο�#,0�M�_�2����w�V�d&�`b���!ZZ���`s}�ݝm2i�R1����C�b�Ko;�1�Z���ۻ{�0Xch�Z��4�R���#�,_��dKuX]�D��iC$#��]ڍ ���J��O|�\'�z�M�����ݏѧ�Z�8j�1�+q��k,����\"`w����\Z�n�%�T�0��<���񛯞��vy�����s��#CZA�6�������m\n�]+I�V�#�\\�����\"�x�<w��$w�h�^m�v�L:��?�(0`��h���l�Ьo��dRJ\'�l��A����{)�l���h*��\\Y����շA$�ݽ�[�.N\"E(�n۶)�d�.�k/2<R!춸�^�\\����s|��o~�#|�c����z���\rFi��=���/b���[�8TJ����N�����y�:�r�j�A.Rv����!�n���E�TԪ�U*��m~�g�?�%\0� |��kWO�;A/�PڐN�(岌��l�^b|$K}�7��x߇>���iT��.�Zf����-o+?/�e{���b �� ��7\Z�B��0B��~���u�O���G���Z��p����n\"A�4;J��V��Py�}o	\0m��77����:��)岌��2B5��q�&K+U��ཤ�mM#��&���Mx}�k�^�I1�ݖ�q�a�D����7��՗^�X�#�±\n�4�t�Nu�v�gfj���a\"m0�&��K���\0ߏ���O�Fk���d�$�L��籽���>`jz��ϝ�K$�,,+�²���u���B�ڵ���x-ch�{�� �}�۠�PJ���b�n���\0��j^>�r!���2����J+�R�U���>����\'��גw�1���N��� �8d�iҩ��p�y���2�\"n\"�p�X�X����ZpXݭX��l�3=Y��_)����\\_���2Z�Oa�6��\0k���)\Z�\0Z봫;��N056��ʫqKʀ�� I\'Sԛ���w������LOO��6�D��mۢݬcG5�+���m�v�X���@)����qMj�)�v�*o�v�����6[��h�e�Q�v�\0����Ad��\Z�.�GϐL%ɤ=��%���DiM��\"�:䊥����RJl�F˲qlKvoQ*q�$���eRi�/�Kc��� Z+.\\��������W���?x��[��%Z��-�h��&�v�D�*�����FFXݬ�p,B@��M�7I$\\��}�APo6�T���={G\0D2:�er��cmo���&�S3o�;}Z��:y��+)�B�F��^���mʃ�(�0���n�p]r�4�^DE�D����6�����y��?#c��=?���ZI,�ed�C���)~04P��랸#\0��&���,�¶c�ζ,��>^&��6\Z�����_p{$Rkt�ű��gO�ȣ��FJ�{[,,�dn\"K:7���\nG�x��ec�6F8��ٟ���N���F�B(#T���F�-%��	��u�tz�w@��I7nk��B����l6��F�m�~�3���1(m0���8؎�O_����$�FId��\\��#�8>��?y�N/����L�P��|��Xݮ��p��%�0�X�uA}	�m\\&�L�y�2 �-�Q2V�ƐI%\03xGT��i�����02�&��c��KW����PZ!���Mf��3�*�LL���)�X	j�J��M��������vyKn���8:���*�MCvp��/����y�[ec�J��#�xI�B.õ���drh��#؎�-t��ڠ֖��%�&� �e�|���;1Z�eD)t��N����18��������D�i�#�z�T�ˋu�w�Y[���F����6I;�21���63ӓ\\�v�#�Gi�\"�.�B��_z���	�g�Hڂ��=���Zw@*��o�t_� (s����2�#�;a�����_b�R`~n��s(x� *ҬUy�7X[ݤ�n0<�gdh���&�����cq��.�� ���Rx)�����Sll�/� �r99?���*�n�^���Q\n\n����3�_�ߴ�\"�1Q\\��Ʋ�~	��R`�������3��S\\q���Ɛr\r����ri��o��ht$\r�0�p���\\��c�z��r�ae�F�{�Wb�V��t!���լ�� �a�\"�M$6�\n���yc�ڊ={�Z��� T�F�-��\'����a�2s���7R)��$����Z�ݚO*W&�6��C��ɤ����8���f{��C��H�Ӥ��pr~� ���z����j��t}���o\\���c�\Z-*�C�w�RK�F�>��(�n,2ھ�1a���H	�Zt��?{�\'|�S�q��;���M��Ԫ\\_ڥUoPo�iu$�o���p�|!C�٢�6V���\n��77x����O��)^y}�r��՛;�N%趷H�!�x�	��0R����Ny``��\"@ؗV߉��������,�քa����\\���3/��}�T*3��<Aa9.J�ZZ�22L���rҌU\n����D�L&�q��X�#�����s�;\n��NQ�ߢ�R���YҶ���(\r�00<�ؑ��Z�Ie\'���rm��3���\0˶^<~�8+++}�n\r��~�A�R\Z˄\\�������#Bz���4(l�SH��z\r���P~��FD:��m�R>�Pe�7._e��>xn������Ǹt��$����J�S\'N39w����3g	�u�fg)d=,�F*I�u0F���(�>?55վp�����~�8z\"9����q\'�?6���k��\"\n{�(D�>�mŖ�%I:���	(��c	/��[��>����CɈ��o��������=�����ʕ��\r(9�/_&�d�6�{F�jԉ��V/�2Pb�Zc�RiK��w�d���3� ����/���ȗ\'�v}˲}~`;������yi2�^:�}�x����?y�vH�<\n�,[�m&�=&+9�6د6IfJ�RPe��r�՗�=�~��,]�@�0@�ݡ2w/��ةw���E��&\n|FGG�x�2s���d2��E�´��oM��rqq���9qѳ,�l6O=�J����\ZaFFD2D+��i�\n�[]\\~����~�9����h\n�4�J\nHl��_\"��N�͉�㜶a?��O���%\Z�K��Ӓ8i�B��͋�����K�J$i��\r���N����ɤ����t�G?zr`nnc7o-�����Q��Wq�m� B�~ŷ0��Mvll��G�CI,!�쯜��v�Z��@~�`;�%��9ia�Tr�����x��\\�5M��%�o������.33�d��8:3]�z��ߒ-��~�V�����?��ۣT.13=����(�h5��V���P���J,ێ���h�=���B�  \n��$5\n�UL��AF-��q�E0V����cm�*R���E2Sfhv�(�l��r��<��0�D���#|�ۏ�ɿ����;���#�t��N?�^Z\\��J��\"R�)�C�d����\n)�h���,cZ),�²-�m�^&��^Di(�`c�\0�4������RJ��g1�6Tۂ�h�n/��l�\\�����2^��љ��Py����d(�t܄����Q6������g�c��tg8���f�*�b�$Hk�B���0$�}\ZUd��ū�<���R�&�� �\"�@d!ÈT���u��� ɝ|�V(Èv���Hsmy��r�r����˜����?>b�m�����LNNm��lEJ)dG�! cG��g`s;��y1\r�%!�QH��	����R�8LVr���o�`XB`Tl��A�\'ZB���^8N2] �J��t��#STF�,3}d�\'~�4z���r��;��x�q��t���S�K��꫇r�5J�:@E������qm�F��$�5��.:\n1J!�^�\"Q�������!B�XJk��u!�²2\nZQRT��;d��v�,,,������������E��:6;�[�����~@:��Q6�����,/_�`P��q(�IgL���#l�6�Mz��N�^�C�Q���(��(���n�}���H�PJ���Ց��G�N���j�x��+�;w�GHer���-Í[+|���133�G�蒔B\Zc��� �޸����c�H!�Ĳbݠ��h�8�\0at��K�B�:e/\"���5&^�9;L}�i����Ǫ�!���4�|���븶�Iy�Z^adx��b�ɉ	��;�����ꅣG�~�N���hIJ)}l�������p��bzz� cc���B�Bţm����Z����6���M/A����$4)�� ����y,�#��.8�~��s/��|��xq���Fp0��ٟ�����3�O=⸉�wuQRk}n{o������������a| -B��(�^�PF�jRB�hu:�bW7�J��`\0�aDId`,W�����������ɹ)��pd|�f�����ү}~�����m�~�]��,�U��ǌ6Er�ڵ�LNL�H&�*\"2Q\\�t�@���T%c&�h+�FH�eH��J����֙1���`px��[�L��R*���ʅ���������\Z��eٯ�E��NVj_���|�Q�	ǲ\Z�B�P2n�~����H�QJ��4�hl�A+E�����`Q$���������#C�~�?�3���o}��犅��B��e-Kg{�޿[Y��J�VMuZ-��bi�^���A@���H�����8:�%��\nk���a�m�s	���\"��2����;��}�?w�ٯ�n�?!�o�o{]��%��{��y���[͆@kr�x��J���!��Z����QD�q��XVK��F��<��	�b{w���U��&�{�A�����\\(��5����G?0a��֟��?�WK�n�^��$|���ʅ�S���m�X�:f�Q`��q:��o���I�X摇�3���f������N��;��c�|����Õ���.��{Ճj�E����`x�D*����v�F���nы$�|�ӧO��ё�S���/���������Bj�J=���ث��jN��&RqQL��T�l6���,��������S��;�����O���C\\��\0\0\0\0IEND�B`�'),('23','coin.1euro',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�)���\0\0\Z�IDATh�՛yt\\g���]jSmRi��M�lyK�8v�8q���FB2���4���	�0�3�L=L��O���>M��2��$@�N�w˲%[��K%�r�ֽ����㖝t73Fu�N�TR�����<�{��ֺت���)79���Jy��2d��m%l�qE!�͍\'�r��ƣ�x�~`�b�>?�N����87z�����Ji��2?*���c~ �-L/\0�u�}I%x~T\'�������mݏ�S��S`�JPJu���?����\'[��2��p��(�&9�?�\0J�\nR�i��јMԄ��[�^����W�If\Z��P�1b��˻�~{���B������L\r�4u�#�?��J���w��x�J`��{=������L��t2�%B�A@5P���\\���N�<Kܐ\\�c[�n��+�:���]��G�7\\�B���8\0Zk�y#�_�ck�������q�o�K��Ȼo��U��\Zt���@��Z�V`X�Vh\rZ��h����+{O���ì��r�M[p����7]r����p]2��B�F\0�Z�#�C��}47�y�?a��1���۵��\0)}�\Z!Dh�ր�4m�\n���\\�����F!4�Zrfh�\'�|�\r+����͜\Z��޼w����Ww���������?v��W��F߻��g��7��w^�{��h%��}��>R\0\Z�R>\rh�Rh�0�J!L�:4g�8�C��iv�~�{�؆0L�|z/�~�c;o���B���\0O����߫�^��/���>��ɲ�*�*\0�#Lӌ��Ĵ\"�B�L�W�R��$bDm�DH��a�@I��Y�\\}������q\\�g^<NwG+:�y��~�ˮ�����>3bN��\0� �?|�)N����~�Lk;��c�!ah�r��S&�Lc�&���\"�df����n�Ɗ� ��xR)d�}�Je[��&}:����c�N�s��i�o]�[��knfb�,�Mi�� ��vu��+G2W�xϽ�w���\0��־ޗ��d�������h_��Cހ!%��)<��0Ѻ�x�h]�щ<��̐�t��{#---��R�Z�+F����3�N���0����[tH�3�\Za��&L�к��g){\Z�\\emg3�<{P�ܶG���>(�ޮ]��������å�����K۪.~�Ft�Q,, ��T\Z+� ��ǑO�8LCۥ��fR�Zk���Jb	�Ah�@�tX�Ig���=�r&��12�c66Y$\"^�gl*O��	�qX�������y�u�F�g������rTk��o�:�-\0�9v�������&�k��߂P���)�E��MCK+\'��7�}�ݤQ)�2@�7X�j5��-�מ07(�	h�@k�R������P��Dcq��8ѨI`D�Z�$�e���Qn����=�ا�in��vl3��7�?z�nyv��\'����?}�VL���J�*B�x~@\"��G��\"�[���k�KD�Z5P�X4J$\Zũ�456��#j}�&|\\x~!85A[�z��k��Vu�3pz����t�A�ʎ&&H�Z��ڎ�s?��_=�W�+�16�Q[��|�+������%O��\"P����,�T��W�W��-M��\n��bY&�e�F0M!J��eZ5���H�����0@@Sc3���U�4��#��!�6(q�4��*Ҿ����dϡW��_\Z������z�����n�e�Yю|����P�̒Jgy�Cl�y*�r�L?�CgY(�M�0@��|�C+�F��DS���a��yB�0tLU�ʱ�,���KضE~v��G�`p�\"����gصm}�/��_j��\0z�ߙY���0��f��&,����x�1���>r��l���6��4SS����#���MM�H����\n�T��V1����O�Ĵl��:E:����\Z��LN�Ғ��2?�R\n[�qJeږ-璕���}�=��?8�\\�\Zy�����7m#�Ck�6l��Of�qH�]��V�R$	Z[Z�\\��-=����5��;t��oD+�.�Q�5�ת��!L�� L*���&��$۷P(k�(A�9�w�Z���H7�е����G<~�L��d_�\r��_u�� ��r%ð�L�T:��7jг���Ect-�)ѵ��a�FFii�a⢵�-�O+�кV$Zi��GT����V��d�)ꛗ���h��.p~�Hq����4��Ҷ��Ƥ��\'?y�_�t<ρ=����kH���I*\Z�5���ٴy�?��B���*���<�x,F��R\n	(!@J��H���όX&�N�)Yӹ�r�D}6C�T�E�3):\Zc8N�ה��4u�duG�8{���E00<���eox��^n���FH_Ma��Z2���P�}k��QKl02|�ֶ�y�U����N�r(�\n�G�a2R�,C�#�Ri��\\ӊ�?V!\Z����u�]���8�D�����s���HbQ\0���?�iL�ǦY���bF�3���Y�r3�v�F�y�-^ �a�l��3tw��Tau�f�&��??B�XB)��\n�(�S�Pp*�X�����r~v�SC#\\�q-3��h��%T<���ny�X2M}\\5|����Y\0Wmj�:5:f56f��E��ɄӤ�������]��������\n�!������	)%�!@��\Z�4q�K:���azn�5R����8LNN�XLNO�ͤ�1M;\ZEG����R�hEqz��%m���[غ(\0bqo�@�i��X�0�`�F#����R^H�5\04Z�W�0�ŎFk^�\0�V]�|�I���,]���sC��R�9CsK-���035�L�6m����m�V������i\Z�:XҖa`���E�~y�k��(�V/��5w.�J44-CՒ���aH�Z�SJ3::Lkk{�0k�A\0�m3��#�����j�\Z�Aj�-���q�s�9v�ƶ����;H4#\rZ�T|�i��B>O4\'�H��Z\0Ŋ�17W\"���frS\n�4���ϡ��Z���O���s��\\����02:�K/��˷leb|�|�H.�f.��4\r�g|b���dذ��rq��(��W0�/ȐN�~@��EA���/;����Pu]r�u�.�@)\r����1>���5z���`�GG�y͎��X�R�����%y���A�LMOS��248���AL+B�� bI����e\Z�����}��F��51:6ͺL/������|0,,��0Eâ\0�#F<Ђ�e��U:�VT\\��0CWF���a��\0T %�ia\0A��0MU#9Z+��h��J#��+�&�02z�ރ��UH�;;;9?z���,A[�SbiK#G��Ɗ�q�UR�8]�.aϾ�;�tT�¾��W��E��<����a��E׎El�е.�&{^x�Cc)C6+c�,[�%e\r4��Rئ���y���˹s�X(9LMOSr*46����Ar��L�O��ԓMg�γ�s%�G��\\��=��(LO���|E\'�C\0\"U/X\\#�W�J4b�/T@�0j\n��}��P���B�����/&@\r��?E�ҥa{{�Z��D)���0���F�\"Z��H�R,��`jr����ҵ����	��:&��X�b9���O����h������\n|:�:ɗ}�3G��(\0˚kk�0>Y\n�m�@��{\"�p����P��Ț����(�����1WV�Z�Ra\Z�\Z,����� �Js���E���	4���	�r9�9���ш������Cä2Yl[Ru=��G,�w]���I�X&����Ⱥ�&�\'&�4@�a|��)�g�PJ�1�\n�B�y՚Ǆ%��zĢ��x%QRbE,��ؿ���!�(�N��������u]]�\\�a�\r\r��f���$�1��짱��5�VR.�(.̑L�0M�՗n������B29>E*a�,*	��,��\\ޱ��{w�a����U3\Zaa�V�V� ���aB�\Z<_�FPJ1��\"�N��w�L\n�10���\'��s#�9~�j����%���f����}O������tm������8���Q��351Ήr����j㹗23:�u;��T(svh����/\n\0׳��ڒ�����UL�sA�Fk2u�J�R�BG���P4��	N��Yұ,�� @j����b�L}=�D�\\��x,J�u�֣ߥ��\rðظ~-���S���2�����;���$[�#��cE���S��f8���l���eL��,��đE����f���2X֒b��X���P� �9�蹓�\n�ft*eC �ɉ���/�\0�2�2�����L�l:ɑC�<�������d�����[���g���^�����«�ioH��4qY�=��X��`Ӷ�T�>&�%��2�w�D��Vc�����=�����m��g���!P��R>�T�j�4�!0D����0,��0±w{��S����ZȀ��),;B %ʥ�c����w���ܣ�>�V�k��`��$��25:Lխ���?c>����&$Ւ�[�8Շ�I7d��\Z9;0B�s�ǟ�]\0��:��j���u�9v�m��QX�B+EײgN�Ruq=!�e!j^!jBg��n�8{��	N��a��星�ezj��<�<;�݅֒�㠴���0U�J\"j���KH�9?:���)rm�Pң-g�8���J��/�����|�S��+v��֥΢#�~�w΍Lݳ~e����i����`h������O���;�����*��L/��J�P�Jb�1\"\r\\�}��Zuq����7`G\"H���2H\rem�ns�t���������E�����܉C<xs;��f}���2Kbl޶���{��BAE\Z�����N�M>���ݹ�^���N��>�a�����{�9&��fdM.nAP��\n� �|$2��\0��\\>��M������@,g��M̌0[��\\��t&xu�7�g�k���H��-l��>����)�3x�s=k֮+-Z\\�feɮ_���S.�s6���@�f\r2���ְyy��0Lah��01j�H��>�2@K\"��e�I��6q�R)����$~`��6_���)�8��i*�/�f����%\"d�	��[n��=/����n�����v.�}鎯�V��\\��G��<� ̋#+Ӳ���,Ks��( �8�m3T�������:��3����g�:�RgR)!���\"�ŒCS�J�9���Q��1xf���ť�w`GM�z�\\ݺ�֯�R���wn_��_x�Ǉ���=|��j{��IĊЖ���>��û�M�F����zJI���A���5�7�kn披��a���Ri� �T*��WEa���!�Y���bۖnf����+�nM;[n�����w�G-2mk�p��w��ҳ�%k�}�c�����\"A1Oo�H�脁\0�e�\r���:.m���?�);(�=��Q2�U\\���#�ư�T�QA�F��Jk\n����YǡR̓�d�}��<��y�x�5�%��m�ќ��}��s����Y����~�W~%����+wm��c�*��W����01W4A��F���m�*���1|6H�\n��m�\Za�\n�ma B058n���s3s��J�03���I���t�����7����W�b��-�[@I����c<Tn�����\\~e�W�!�������[�����x�ك��]��qDm�����<|��RP-��,�D�m47�R�TB�_I�\ng\0�T�2�\Z��K�Xd~>OVM� G@h\ZR1�\rK��;��\'H&\"��r$u�w�}\'�6���Y��	�o��S������ĢVd���׾�\'����?t�x������5��en� ���\nA �՚���̕�q�T�D2`�1�:l�\"P��wо�i5Eyf�R!��м��R~��\'�204M���\rД�q���c�f���/h�����=�����_��Lm�H)�|��g���>��;y��C\\~Y7�W4\"e�i�h;��*Ra�O.#�;ȠH�X�-+�X��i�xn��|���q�>шɂ�\"O?�*�����4��е���ｇtK#��Ϣ,�t�K���Z��\0�4����\r���}�k?��������$�a#����|��E�P�\0x�B�b�Ɨ\n��\r\Z&J�\'�W�&׀�$f\"�m�ȪC&�ioIs��=���3��?��a�|����O��{#�Ȣ6�\r\0@$��Z�Y�L}�K_��{W�j��_���cӦ5t�\'A�p��b�62��}aD�Q*�B��Z1�aPq���oG��%�I������%i��i>�����r9��ڣ����h[����w>���>��[�|�lo��?y䋟�������Ns.N޵�Z������,~ �J�6QJ�yU���,4;\Z��T(��\n�j��DP�OC}���6�f�VFN��}ܪ$�]��y�C������UٷV��������|�Ǿ�VP徻��k�rf�d��[�gb��22�	��s��*\0�D�4q�33s_�KgiX��LS;�N���<���<�K;h]������\r�\r��e��.��>������/?�s�s�\\���n�J���\0� �j�},���X�D\"�aG	<bu�%SX���<{^��ɧ���\"�Ȱ��kgoyϽ���\\�۱.��n�8t���^���_x�閁�A�4D�Z��Εml\\�F4�\"���44�0YX(��bf&��L�ޣg87	Zc�6����\\��ɝ����M�6��a�}7L��[fJ�����}��z�wo��3���xn�X�@)�e�H�)p<MSC�����ި׭���asϾmW]�h�.���-3�70���Rኾ�S�N�ꜙ�m�|/�Ҷ����B.�8���k`ݺ��d��v���\n��E@I@:\0\0\0\0IEND�B`�'),('24','coin.50cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�+����\0\0\ZnIDATh�͛Y�dY}���qc_r�*���k���n��l�\Z�bd	1#ЀF2�ߐ慱_�3�x����M�𰺁n�^����������}��=�.�y�Q��\Z�P@c\"B��q�w��;������/�uiu��Q{�hʓ�zawwʖ#�v#���VQ�T�2PZUڻ��;3�����1!D���?�V|h���_}ვ�Îh>����Ίh7�\\�_a��2�)h�C��6��6A��!�M�kf�sul\r���m9�����_�lg��Fm{��Z�t�Y���/Q����Vk��069���\0C�e\n9C(�6h4:lol������:A��i�<�����=����#�ѿu+w�yyh|������b}���i����ܳ�{�k�����Q�:F�!°B��$B�Fk	Z��\0aZ�T�8�kח������G��\Z�\Z��]��ϊ�;�\0\\9��{<����������)������\r�34jMl#\"\n��0M�X��iY�B��V�D+�0�P(s��*gO�ah(��C��t)W�����}��W��i����\\�(>s����V�<�·�Yݡ��Bj؎���X��e[���e����0L�1J)ЪgZŀ@k��W��p��y{�}�����_�̾�s)?�F8w���늿����O�����#Ю.�m����.Z;U:�-l��M�H�)l�ƴ]l��4]�0��Ph���+��\n�FkE�\\�p\rK���+i~�����#�Ԏa��?�}���}3������7�c��wy��^[g����}t{�8�vm�6P����d&!� L�<���7�F�V	\0���<0M�T��ժa�ڇ�;�~s��K�o9\0g��z!�6��Y8��7��[����Qʹ�_}%{�2���Ӣ����h��:� �X��e���0-D�Gk����o�AN�Z�9��ˌ�\Z������pP���?)�e\0�,\\�3�������3�{���c��6�F����{�3�ڕ3m�|#U&b<�$��x>��`����\r�����h���� !J�L�grv�jS㙍G��ŕ���[���|V�[�����?|��6����0m�R̝z����v�8��ԁ{H�;�\0Ce\Z�6��`Z�!��\'=}s�Z����k�M�7��Ĩ��\Z.�=��Տ�c���0�]��\'�����O|�5i5Z��Ous�J�L�V�Cej���ㄡD�����µUL��0-�N��a\"����\n���A��s[%�_\Z�$J*l��1%�)���v�;��\0�\\<���/������>���,�n���i�l�1	����:x~\Z�͡����=ǝ�<NX[�s�-���\0��(2��r`�	!�g^�_\"↱胢��(AE(��_*+-�K_\\�~���\0Ъ���q�ȹ��}�.j�����S>�V��SB�8�M:��O[\\��®�\"���_��K�ǰS3B�Mba�?f�s��_*��J����/d�g�2L�[+G�ƙO��\0,͝,\n��+_O���P�ULu�:�O���,L�&�Na6�m���Iue�q@��±��W���w��7g>Q�V]`�A���Hf�O��0�(���ZId!�6)G��Qk�/��V������mp������ �|���\rl�!�����#�F��L�2@h�����00�0bܔ�;��8��U�����5��us�B�[��^cd���<\ZM���R�u��0옠���ʏ�헪���-���O~����}�	����}D�fk�N3(����i���GuV\nA\"f�M@&jO8h��c4�B�N���6��-��U�;uj�۴�mڭ�S�^��f�F���!(�@��X)֖7Y]ZG����Kv`���O._���R\0\\?�^ck�26F!�A˘�V���a�P�F����������ڜ�Nei��`�J�~��57��҉v���a�\Z\"�a�-ToC��Q�k��3�V	xB�n	-�T׷x����Jy����gN�j4	Z\r��\"2��u�\'~)\0�e�#g^y^<�����Ģ\Z�͡��ӭ^�Z�)�L`(��x=፱��byq\r?�C�ݟ���:�F�ML���2��<�����q�El�OxO�8^2���`�ǈ�Uj�W9w~���\nۍ�R)�C��?8M �D�#t���-s��m;������}:;�nc��	����3�����yC�6���6�)�iW{�����C34�-�l�P�@���[�5<��u,�Vx~\n!6׶��3��`ë�ٜC!8{q��ݻ��/�Ү7Q�ӳ#�q�\n��R��>�����^Y�l�N�F�p\\�z�n�Y-M�ch��=,�dp0Eel���R�!b)1-���0~֧X�P(�R]^cyi�t$�{C�)���ND��������E���X�b������,�b!��������Wٷ��T�R�8�0� bz� /.��8��e;�����}K�oڽ��y1:3�ꫭ|�X^�>D�Z#\\.��cx�Di���&�i��پ�<��!ΝZdlj\Z��\0�2R\n��x�\Z��$r9��*��%#\Z;]��v%#z=�-r����c�w�I�ӥ2:D��%Btܥ���G�^���m���s�9���$��y�=�͈f��E403]&���{��]�m�xի��T����2Z+�R		\n\Z����0-P��]���M���F��v�^����r����K��U�6X�v��RaZA$�qL��$]\Z���r�H0[p�l.-32:ܷ�Fr3}��ȃ�;�\0��@uי;��C9{�U6Wֱ�W.-�����;@\"]e��l�m102Z!�0��{���0�R%���4�v/��!J&�Z��j5QӦ��,dv\ZT�f	�`�-�nv�1ML;��C`Z6������\Z��\"��p��4�֙ؿ���� ���*\n�͈He\"T�&�IӮWi�Tilo�j���[;U����y�]Zdb��T\n%�M�\Z�V�ޗ�\nׂX*Ⰷ���6\Z�@˲e���F\'��H�0l��\n�_�Ieq3��t�-*C�x)�Zu������ə�����o�^I����%�͈��`��q����T/�x��run��JG	���0�v�8�K+�V�*\n��n�Y�%��e��$���$`b\Z*nb�~bF���\0�Ӵ��J\\>{�n����X?�K�T�P�a�R1��(3C�\n�=����욪�����q\Z�&)��%\Z�F�1,�N��,�as}�b!C�H��p��n	\0m\ny��D�\n�MZ[K(��}^?�\Z��bpd�L����&#cS��Eu}���G�N �� &�s������l\Z�2�#I��ch��F`��S�,.lṖ��vl�ޘgp���-�nPR�4��+d�)����+�L�n\ZG��ukBHi��a��0QJŰ<w���<R6P�:ScYb�c���Nq��;���$�4Y_^�G���,O�����B�<�;�#c}�2:�*�fCH�T/��\\̳�4��v1-��W�����R(J%v��rl����@�2X^�`�{QR�aE!Ahwo��ٖa���ıg_b��Q�����$�TƦ8��}�L�c7�쁽�Z�p��Acs�Ko����Y��Ob�8^�\\e�\r�(@k��A���vlӠ��b�Rj��;�A��Q��N��� �%��D�ab�&�go��6�[K���\n�H%	�\0�&��B)	f���ǟ}�{��a@G`���v�Z�\nZ��~�KW��$�|u���$\Z�V\nu�ST#L�NrC�q���0�h4Jʄ?����Z[��]����W8t`�(�(��|�����-P�ژ33%�6��;�~�m踅�.����`{�\"��1�@�V�2I犤�*%���5��:����6IrȨ�4>�JT_%6WK�A�T�X��i��:Ҟ�RIcDc��\"Ubk�\Z~�\'�bV����������5����-q�i��󣻸p�<~���՗^%[\ZĴ=.���{�� Z���iАr�]���\\�8ȹg_9���x�\'�����2��L�?�$�6l���ƲP�0��8��:�m!#��i,ˤ��!eL���ر��NWn*�X�q���o��7:/�ٳK_���eڸ���]�(�,\n~�G��X�EԬ�0:��Ҫ� A�ڠ����ᣄ!47�8{�%���)�a��1R%�`�9�����ܹ\rl���1� a~��d7?����d�i�;-����}8^\n�-b؎>���o	���GN�2]�L����8n�L.�i��}�D���\Z-�2@kE�A�͕r�<�W$jmb�}��Zb��^�Љ.z��ah~��SJY�\\��+(��֢(�tR�u�����\"��9�t���v-�\\��ۤX�{���@��FZx�O��?y�s��c{k���e��GE7��\"	8��G��a0{�]I�+@ôQB`\'Yk��*�Ы-b;\'_9C�^��8�<J	<�\"��8�=���9���+\'�ɓ�x7ctˀ��֮��29��\\e$��DH+�������N]d��)FG�K�3��`+�!��\Z-#���Q��F���W�!��Z�g����d����5�^���Ej;:8E��f{c�N�*��S8)���}쬭���ͫo�`�����)�T �l77�\n�z{K=�K��Gx�_Yʦ��V�C:�c�v_)�h%�}��a�\Z0�Q2�44*�Q2fjf����1ʃ%��Gػ{�0���[��_��뗨V�<8Ne����.�����ux��{Y_�R�����\rV�[�6S!�KaZN�L\'R��Iql���]�_:��~�u\0l�\r�����4�G|������}��ıBɐv�E}{��=�QZ�����e\"r�F�ck!L~�QV�]�g_�^k#�BX�9��ul�ԉ��)������x���n/�w����qh�2A+LS�g�/]c|r���A�<�mrS|�Og�_�/p�軿��s�_�Ngpk{a���:�4P�=��wr���J�D���	F���2	@�N:�A���!��(\0\rq��l::M��1Zq�M��%��x���U�V�fino!�����_�3T���׍����o}��T*�dp�%�����f��־��L���d�Q�������()�2e6�V���Iv���f�Tqie腒��,�d��RG���i�y6����ݷ�;¥W���������+\0����l{��6�����I�K}k���\r�и�t�\Zh���;h,ǧ�3�<���b��N�(���\"�s�8���f`l��vi�YZi\Z�?���8�F����Ӳq�q�s�{�����*<];򗿖�h�<ҙ�{ϧV���dmu�J��\\1Ϯ=S��I�ZG)M�$h0ndzh���O^���QHk|����qq��7�� �r�����6/������\Z�[�tz�f!��u,�Tҗ���F���Z�]�����;�\0�/�G_��?�	S4�~���b��)<�%��F}���5�Fʘ��\0:��ga�%�Vי�x���My���a�dʃ���4$����h��P��>�)�c` C�k1<RD�c���M*�+��ޏS����������������_�	�\'?��?]Xs�*|~��?���a�!4�b���!�2�v\"Z�:����`��N�Ɓ���H�\Z�!��q�,�.��m�XZ�S��J�����R�G���Z�ty���[4;��=��C���2������|����O��w��-9\"#��~�ӟZl>�/f��W���i��>���^�õKs�^�vW1�v�C*��]_��a����B���^R�flz�8h���bp|�f�Au�\n�=r?���]S��x��+��8ȉ�=Ea��s�=�)!D���;�{������\'�����E����$�k\rP�c���T��Zs}~�N�Eu��\\������_�d{�F�,ͯ�x��R\Z�E��21=��F�T������*CCv�b`|��� �^��Ӥ������w=921S{��	��x��>����j�VWg^��c��HZ�Ba�0:Z!�Oc\Z�N7��ɫ\\��I;�8��҅\ng^:ήۦ�u�v��`e�I*�R�d�r�4��G~p���mRi���\0�3{���+ۼ��o*����}G���������QY�����x�G��=�{��8p�A�3�������2�8F����b{���cR�4q,Y[�DJI�18�gy1����E^9~�Ç�pSi���x�=�E���?�FU���>����	!~�Ge�u������/����}{�p�&�ΒO�XVr�W�*��(L�a?�TE\n\'��K���\\�B�te\n�A.?���s�_�>��gf���wX�_TC�\'�}��N=��O����m����)�����q�EF:NBO%U��G�҉�7��n\Z\'��N��R%����/����S�iL��K��ğ	!~;����\'E�h���~�鳯����s�鉂)�/������f���B��4\n��V�V#`���V�X]�ғ���������-���{`��Vk��?x��^�|����s���b����6�:�04�aڴ\Z\r<?G��ba~�f������;�8����>������~]3��_�Q�J=��p����3�VW�w���a�ocۖ��㭦3�+c���9�0���CS��T�?�P\0\0\0\0IEND�B`�'),('25','coin.20cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�-\r�8��\0\0IDATh�՛y�^Wy����[�����[Kki��fْm,a�`�`�T�B255Ee*T��l�)RP3Y&�����&F��Xj[RkW����~����{�9���q�$�d���<�{��y�+x�/cL�V���ҽ�R��*X�Qa�YJ+e�r�\r,i�j%fl7>�p�Fk6^@X��3o��i��~a�]�<��rv|_)7[��,��Z���y� drr;�D\ZEcc�x\"NCc5��Fⱨ.�ڕ�_�F�w�ֽy�K��.�����5�V&~)7?������r}�����u�qh�OP�PK����#A@6[f5�ce!���*G����w�\03+���\'�{���w~)]���7�1&9v��\'�>[X���|�~N��owO���w�ܒFx1t��v�|�C�F�P~���3��7�G�����t�*��\"Sױ総��#�/�X�7���{dm��/Ύ_�),-N��&_����������ҁ�:���8Z��ҭ�ѥ%�*�B�e�谌A31��f?	[Ӿi�M���(W#�͟y��^��Q����������u��ĉWns��8ͭ�|�}<���r��<��qt�cPH!�� �\rB\"�D�q�*�J��hU�h�Q\n�BH�72�׿q��S~h����ͯ6����~s[���\n�1&�6���G.��s�~��>�O�ܻx���O40tm���m��IT#���8�j����#��<��	�K᠃<Fk@�U�Q*p\\ˋ2<<ɷ��}�Ȇ]}\\������_������_��s�/y���|���#���w�gq�z2#�\\��Dқ����8��.b�Z,۩,V�VaG*,�&,��Z�`4FWv_�\0�v�C�\n!@xq^8�\Z�	��G��ӯO?�i�{?�u�����G�χUX�2C���K\'?�+��+��h���T%b̍�$�}b�;�|u��{���.⹒B����2BVtb������1\Z����A��R���~���<HuSW_>P��˯}폯^��m\0hU�r��[��?�+���8��~��dyb���Q����2�ݾ��1z��8vl�����K�0������\n�`�%�V!1Z�UX����a����H�n����{����?����筷���ɏ.������3<����_�0+�c�2S�%�b\\���-���a|U��l���%�]Es]�Ba\rcB0\n�J�ɴ�Qe��+\0�\0��P�<BZ�ab�����a#��\nZۚI�7���<q|�g���~�������/l//\r���}��q������\'��7��>���L��AJC[k�x,I>S U�@$� 3?A��	׃��Y�0�0���~P\0TN��7Fct����묑�v�����ѡO,��f�N%�P��;�{_8�m�G��)Iy�\'�{����y��O���p}�:+e���Zjb�E�i����������Jǆn�����o����	}��\rZ�C�Bw)1@Wr�Hi��a9H\'�A������2G�x��.~��ɿ�?\0�ų?�4q������?Kq�\'�V$�J!��R�׊e�x�MX^#RUO6SD��hn:��Ԑr�J��Q�aY�K��	:@H��l� D�9f���DP~@Ǧ����ݏo=�G��?�CP\\LXz�s��W�C�q��^��sX^�b���e<K\"-�Ʋm�X��evl���Zt�gdj���~�M;� �SªT��v+lX�w˫BX�A�Q,ۭMR����V>�_��*��T�-|j�j�kk�{6�>��/�f�@�n|`����ύ�~���kC���8;��`�6���\"4�h��ښB��>����9���\r�ߢw�l�A�$k��� �����e�H�E:Q,�CX�B�U��&(�糤jR����;�r����\0�=#䧞�M�=���\r��g�����֬��r�\n��v]�Ŏ�	�X���!i��&���재g&,U�\0 ²AJ��!�\r�Z��6B:Xni�_9�htXĨ(�B�	��摖�����F�S/~�+�����fn�}��]>���Pʭ��21�XY�g���L��aǪ�R��	e\n���������� �H�߬\'AiU�1��\"�ͱ��edx���y�� �DZX땠�T�������W޼����1�5tX&���Ū�ٺy�_��P^�|p~jڶ��M��U��p��\r���nQ�N�\rHik����4BX�5[��Je\r����\"�x��F���%K��D�U�6��չ�|�UVVK�d�B� h�Py����~�Eμt���Z\Z����>C)�E��ټ��.e�?x�\0LMN��c�O�fӖ��XQ��\'�s��\r\Z;�ٴg?Swo���-���dx�U6����]� X������̯���Z���YY���lq�w��\'��<B�1F�U	�$-�Y��~��n�\'>v���#D���~�g�=GX�\"�*\Z{�`\\��S�������-KK�ŲF�\nC��vӼy�;wn�vk���F��\'�����QZ�j���FX�ɮ� lay�`t\0Bb�@�k��y�oNp��M��Ƹx�u���\0�e4?��\'_�@�� �N���JUܢ�����c[���P��U�2;�e�D܀�:������\0u[�Yb-���A::�B�+^x��}���.�)b�Z��Z\0�1Xܾp�TC+���2q�[Wo��e��}�Rܘ\0%.����zx��?̓�e��}>���4~1�ֆ����D�2F$X}7��Υ�toh\'T�-��r#�r96�����8��;-���\'.�/\0����d^x�\nO?��Db����g>���ϭ�_�:/�՟�y�Fqοr����0Ta��ܹ��F�k�@E�A���β��>jZ�AX��B`�!�jB��[	�6>��dv�M��131C2fa��(�A�!ŵ\"�@cs3�s��c��/�����r���� �m}��y\Z���ܷ,���zz�[Is[=�������9��I�;[�.�(2��uh\"L\rޣ����xi�1hU��G�O6�3Ba�#cU�0��D���l�gqz�Dmw/_�����\\\"(�9��¶�H�R�\';7AMM=�v��^���\0�$�W�����-@tE�\"�u�.(��)�� 3�&�������		A��S�h/�e[ F�+g��h��\nj�p���h��A#$�^�Φ�r��ēq����,h�_(��F��а����xh�	E�X�q=�H\'Q�q�`X�_XX��)���3X��A�`����P��KUc7Bk\Z��8�*�+�ر�9�����a��z�+�S���S�3�,,�b��e��5j�\r,�MS]����7iio ���?�	JE\n��Bi�d3y\\�F���8^�DT��\0���aH\"Ǌ�!�$�@#�`��*@#��b\'�h�j][{�.-p��E��R�p�̺^7;*����������%R\\9�:�[{����D�H�e��:-�� @�>*��(�Ss��N4����MU�P�,������r]i;��DS.�(�7��`qv��{�6Ý;S�J?�8��B���$�+Y���ǞaW��VT��~�t�����~	�H�r�޽I����8O��\nK�Ϭ�1�����\n7�f��]��Sx�Z�nR��c�.�C��?�{���\nl/R�����e���3������(�1��gt��h@�/32p?;K�՘����8-Q,�q�� �1�B��ҩ��� �.���o\'k�K$Sq�VWq]�V��{A�њH����;�5�b�����D��%E,���\0i�VW�(�!(|��Ӱ�A$!5\rM$�Sl���������أ��Y:� Z�F8a�@�[f�St�4!��\Z��\0\'�D93M(#��ڷ8�`/v$Jfa�h�#�H0|o��T�BT�QHU�eRu5���:i!�e!���ǋ�V����vw�2?5�Vk\\�6�Ċ��:��EzI���|�6��\"�� Y�_Ë��d�Է�s��݊^Kݝ���<�X�F��\"U(�@�����>ϑ�q�R:��kԤ�p�I���I��	�e b�2;�BSS�-]����l�Lc\0/a���\"�3{_\0�e9����ȽI,7���z�ǟxar�U�X^�3\'�P�\"9���*�ŉ`J>hEKG�����7�,A,f�H%p<T��a37v�׾�*�B4�\0i�u�X��<�X���,1�@j�Z�24p�޾nJ�dqt�T�G4ŋ\'�n�ss�b����\0\'zc׶Vf\'�WG��\'���29��R���{\\<ǎ�;���~KtlmE�{wm]HF-���(�HGO����\\��𭻕����s��~�7�\0:(�D䗗�B t���\n�0h��Ke�b+�Nqi���N��̫��m��X^aǙ�s�����������]J�T�x,\"�f���G.�aii����y�ӏ��r�*�ㄹy��V3��Z�ϖ=;��|A�ٲ��H4��o��<Z�9t�0J�RX��&��y���\\$_1�ƨ�0I�43vo��;�Y�hF�iOH/��%\Z�2D9�G.��D�%cU���e��m�%���a�CG��N�m�fb����5������m���	\neM�����+��h\r�Ϲ���.���#����Dbx�8U�[���ml)(D��*���ڞì��S���7��${�ՃD�1R�M��\r,��CAn󡟺t�(V����[��y�56l���b���4�Cwٸ��ՕE����+�����k�2�\r�ҭJ�K����tj��䗩k�%V]���:�ѡB%�eNL�+�Ԓ��-A>�!]\'_�Gmj[�Y����6ɋϝg{�C}kم	�h�hu#ҭfn�E��<r���y�� �С��vCc-�l���}h�]��=��TuѸ�0��aJ!*}Viyo�Ֆ4���2Q\n�	PE�h���F���d[(+ \Z��2$��1tw�\r-y_�>�{��^̓n�$ٺ��[�|��=RN��ZR{!RG$�Ku#��������B}\0���9<r��{��I���;��#Q���Qv��RX �!@���k�uɺ����f?�0Dc��� ��G��a�R��K%f�g8|����eN�γk[�7�2tg��Ϟ!�Vb�4�x��(������I�p��w��}8�������\'��6ߍ5��~_��寿���M�:7�0�0 �+0|�[v�Dj�K,���VeT`�!b���iA�J�?�Kb�)ʥ2˳+�%�b��Cl�9����H�\"%�_\Z �/��l�c��&��5J���.`	���`�63�#��~��uM�w \0�*�:��k�.���ӏ�˯�s������7��z�ҿC��E�(?��%Tࣃ ���E��\"�U�V\nǋ#l�֮\r�߹J*%�˓�J��,#l�r٧�����6��fpl���t�8���:Tץx��c�u��|����&ݾ�K���~��H���T��~���}{��w���݀V:$j��\n���i?�TV`�)+&G����H��)4Ҷ��C�ei)���\"���&��#[�bv�D��G�=��ߋ��J[���J�y6�x���>d|Ay���<�=���n>�Cu���w��s��v)ݐf�#�y���jv	����j���5<OS�X�V�<�PH� ,�@���.g���ͻ��}��X�������/�Y^^%��A�8C���V�y:�lemq�x`������-[�m:����;LKS}��u����u\\������\'\'�������8������Ʋ+�Pmc\r���h���)B���`�b����x\r��;�v����l��%�9�Je�$4�J�+�8��*�2w�-M	�;j�rV�G:�\'��*��cKƩ��H�a�c�x�Ϲy}ܨ��?����l@�����}���\Z�7�1��Ʃ����2���R�ٱ)2�+؞��	�)������wϲ��iU�Z��g��>����aff�,̯R�����2551����Tu��&8�c���#!�B/�Q��J�e+ҍr��Yffr�~�gn�l���?�	!���ݏ||ב��޸4�/�).�x\n�KX2ch��kc��b~f�r~�DC=F)�	�;F,_	\n1�Ƕ4��D<�΃����SS�H����*�e�HmB���IW�nn����t�N���V����f��z�ɏ!�#2B�7���7�3�X�ӽs7^=�甈Ƣ��2��U��b%�#)fg��k�s���[s?F)�H���s3�[������c���t�18Vfme�Dܦ����a�jim����LæCĚ�����ҙ�ly�Xг��_B���	!��~�=?�KAop��]����3,��\"e/YC��\nGZ�@�47���� �\"/�r�x�F�.�%�^�}}�}��;�����9��7q�~@P׵���16���nm���^�A��8u�l�s H5��U�v�\\Tfo�ŗ}�ce���wc�:��3��_���:������8�����\0�6ԧӸ�(�T�\'>�CwƸ~m�$�Ubq���Ql+���yjjS\\�:ȶM\r䊳���d�믟��:A��Ǩ�ray_y���<����\r��>+����IQi�����_�֟�V�i��\\���}�lـ�ܺx��\rM�\"h]�U���X�K<�B9�%3=FP*`��E\nA�:��EI4tIo+E17��g����Z���Z���3B���s���3+l�\0����W�`���+���G(���qZ�[��ԍ%~n�0(�K�J�BZDR�.O)����X��M�%�q��8��W�_\\f��Y��v�8�۟\Z�b�����?�iqcL�wo]�ğ���9]��=q�T���J��c�	����L|�ʌpim��Z���6��0Za9Q�X3�I ,���$�_y��g��~�{��A�������l�v�/ ��Z���y�ȉ��S+\\����iv�Iu]^�\Z!�x-ҫFX6�����U�Vt�y�D1�L�+&�\\��w^afl��G�Ł�?��;7�&��U��J����c�<j������G/_8�8�]f�.!P47&�ڲ\'^���SS�غn���8�l����#ݴ��C�dρùxU��?�SB����	`3�^�i�����gqf���!�g)\n�a��,R�\ZZ�[��좶����@Hy8|�a�������Şss�z\0\0\0\0IEND�B`�'),('26','coin.10cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�/]�8*\0\0IDATh�͛i�\\�y��s��ݷ����g�Y�+A$H��D�-˱Y�E%Nb)q�)�J�)��\'��\\�*[Qhˉ*��آ�0�\\�hR�Q�H� H�Ab\0�/=�3��]�9�q���e9�E)���}���}����}�ﻂ��c�ު��`�nթj��&��!�s��5���C����L�d3��m��S83�c�5)Ų\"�Q�F�#��V}�k��> t���tJ�l��Uce���\"�,-W�S�qi֚�#���n$6�����Ǿ261�!D�\'\Z\0c�hի����o�ꣶ�\Z����S�PYYE��ȗ��㥓[t:v�,os��:�ke���9rx�l6Õ���8�ct�;��y�T,\\B��(\0�0诮��	��o�˅�o^���/!�:�ā��q�$H���	;�!0�����uVʛ���uΞ~ǖ���3$�9n�f6������~���Lz��;\0�ѬWn�_�t:��y���Ⅷ�������Aҩ�|c�f!$�A�c ��hTP#��D�V�5���3\\z�*�~�D�Ǭo�/����}bj��?�i�GP�jdZ����k���������ȁû��=��K\'0ơ��Io�B�		Bt�`t�S�1h��#Fk�v��O|�����:[��;N��;�����g\Z?V\0�1���3�-�ԇ�󵧙�t��������^�ct�mT���l!%BZo�0���4��� \0Z���.TF��0wc��?u����0�ɪ�y�����!�֏���J��:�x&k��kO|I\r���ds�N�7Mc��߮��cq�\"{Π�\0\'�!-�o���]�QH��n8�1��V ��Ju��W��P1Es�inl�~�=��G��ۻq��#o�M?�ؾ��t�}����H����{�!��ߪ����L\r���A4�H|�gk3�����\Z���`�� ̭S�\0�H�EHi��FX	���s��!d2E\'��di�᧟��/��f�G�vm;57w�3�E�����x��s[+kl�+�V�N�C����HX!��4��6��^n^[@8�8օ \\�.�B&@8��;!1�V1N��,�����8v���Gq�i�zj�����Ϭ��So;\0�5��|�;���_�o�Y�sSS�˫�661���j�ˤ��I�d�Y\\�`LF�i	�!��B8qr�)���L �����KˉO�ew�H��9r���QvL\r���ƣ��3����FM��\0�t���ނ��g���bp���GS]]��K�Ӌ�B��9=�\n��G�M��w�i��T���i��ߊt�-@���B\0�����h�@#,�\"�Hs��4�����b��o����{����v�r��3�c���T���{��0&�I&SXR1{�U�C}8\n�E�o�qY�~�ޑ)PmvL�x�:�NtwРMƀQݔla��ӽq��ab�\Z�CL�	Q~�?���J��N��<v�⥞�\0��G������ŗy��f�R�V��T�467��\0^�CZn\"��`Y��J���2�~L�D�$~}����K\0-����Qiw��ݟ\'⼡#�\Z�(@G>Z��AG*���>��;94�8����Gh\0�n^�����|�/呣���Ӫ�F����|u�2�m��L	T�����aP��u��ğ0s�~��AT	X����`T��:�١��J�U�#0&b�\n0��%^F���ܜ}���\Z��\0�nl|T�����\r�y�}Da��D�+�\r\r�yi�e#,�AH�ĲmҞƐL�����%��1���I#d|�M�M�����\0h���G�?��Б�@��SH\"���hV����h��_�\r@�^�Ƈ�_=��79x�\0����Q&�4I��\nBXؖ�RqK)�B�PCj�1���tY�1*�A\"ts �Thl�Hr滧��� ��tK�\0����t\"��X��&B�������X����5��Vu���o��\n��>Z�z�^Ƣ4�e��D��Z�HE�N���`yn���P��bbߴ�Ǽ��q�vU����\\�Fuu)>���IOE��p{n�Z���J��R	e��?{\Z�`H%`pb���h�����Gn\0c�P\\���F�{H��Xv���\"�L��l�Α�y�\nKz��D�J���HS�Vb\r �7���[�ֆHC��i��M��k��%V��)���0�Z#m�!jm1w��}�$7�α�ћOq��<���@�\n��{��9huV_���~9��^����W��n����{_��:�݁p2��&���-�X���Ю�����&h�7in�Hz)\Z-��{[���@��W�W�?Ù�\"�\Z���C�H��h��J�݇�vC�`929Lc�2��^=�G~�^�d�D�kW�Coo/a�0����aR��؞�矹��?y����\0��v���ًor�;���\0�p�U�ַ�u�͕ױR#H���1���\Z�B�bd�l��C���QAlz����<�����n����X�4Rk��\Z���Hia��h��N�����e�82�H�Dc;I�3�&���ã���\n�{O0����׾6��\0�;C������\rY�5n&��ⵗ�r����u�\0���Nd�S}TV��V;�����d�Ξ������/�dG���V�&��QH�x�\"BZX�M)���B+�L�hU�im�i�[�juGn)H���-�m3:1Bc�W��M�0����T�;z[!PH�#+����3\Zl���=�9��{@i^y�����5?F��f�ڛ�=z��k�J�C{�z�[(`\'��F�  b�D�����Į���om�7X��qCCm�M�D�kז�x\Z�5Ji�qy�#-2�,\n	*DG���~2s��-\0z�nV�9�1x��͡�\'贚����E6�\"ǧ���?���f����\"���,N02�F �aNc��\0�/�cr&� {�ٚ����\"�fm}����o��bـ!��$����~D�4�F��\'蟯ﾭ*�t4�<�L���{�D�Ⱥ�UߠU����y��c�yZ�k����Dn?o�|�d.׵����O0\Z�ezF�q0Q���F�YZXg`t�$���Y�ul�י�$#�P���V���`����Q3GL@qxR��� �J+�Z���d��F]K��ɐ)M��gh\Z��g}y�B_?n2���7��������N>V�ku�T/B�#���D8IL�A&SH	2Q��r0��W�.195JD�&�]a�!����5</J�C��l�v�/�\0����$q��xǤ�6�(���,K�$=�7VP�%כ�u�X�b��,\\��ן|m�.Ս�\\��tlr����e;X����9��N�!b�iTpR�0���7��X�,~m!$ҲX[^�ԛ&Bt�0� ��������M:�aY�+FA��Y���jГ���+g(�/x؞Ec�A���7/�-x���޿V�i����;O�r	�Mb����n��ݏ����2F�^���:�R	c� \Z8^/�o��<�R\\�p��3�o�\Z�P�2�=&�%sm?�Q*��N������eR��	6�޳�24\Z��^<���Ԫڕ�4+��K%�������P��y���[jP��z˶1:���� ��*�H��r�T�[���}�5Q���N�	�۸^\Z�Y\'hu(���`4a���tڷ@�\'W�Z�:��,�\\�M��Ð��8��IR=��L���79�л\ZىD���?6F�����\"�`{��>�ev�	�\r,�AHI}k��R/B��N�����L\0���*�|�+�\rQ�$<�V8�+Kkd�	��h��e���E�Vn\0�^���V�`�_~���A�D�+R^)��</<�Ӈg �0F�����J�j�D~��F�nsk�˗�ѡ&�&�>��%l�q]�q)��)���Z#���,+K�F�Tʍ+T�B�ȖhTWq��U�����Ak�,�A���\nF&o�S�����X+s��9z���6��:�őq���,���#J������ߵ�F�!�4�+kl�+�l�*x�<�[��)�f�z!Y�_��������(D�6RJ|��t�[�e�8�~}\'�bs���tp۶R\"�N���eJu���	�y�A�)�	�=�\0󳳬�ը�;�?�c3�X��rb��ι��n���M��\0��Y|����������4/=�<�F����i@Q�7I%�����Dl���BM�m�\n�\"��A)�d�S8a�=�C �-��zY��U,�G��\0����FCk�v��x�M2�C��~�2�ã�S),�A�� 6�6�0X_\'R�Z�\\_��@�D�뎃$�Y�����vi7�\'�u�&l!�&FE��5�%H��a{�FZ�U���A>�Ų�.�ָ^�7.���������V�J��\r����W0Z102���8͎����A �W�[%Ө���xY/��BHZ6Y/��st�װ�`s�J_�Ak��7q��R(�\r�)$^O�H	t��\rgO]���(Z�]j�m[$�ܼ�\"�\\~.=z��m���k��S����ef_���7�2�.3�:�������9��q���	)�����5�d\n!%^:E��cU\'��&F\nB?$\n�|�(�8I�4M�|��ؼ��9zxi�X���$���$�(��خ��:������U!̙��/E�V�5M~��S;�͎����M�A�1\n\Z����Za�:�����?4��4W�a�M��F��YX�Qk�ԫU��u�׶�;�FY,����hn.Ш���7N�o*O:��M:t�E`a;�L�nn^x��@A��~��!�Ѕ����?s��gn���{��y���W�����8_��q��-cg�x�A mLH����Ϣ�6B\n�.�I�S��e�¸+\\_��rm����Z���Uf�O -������\Zk+e�c�T&�֊D*���,^|��\'�qf_�S�&}�������x���`)׺�������\n�7\Z��Ҋ��E.�}�Ht�-�\nQ��\Z��,�;<L��(�B�L!O�XB�J:a4��4�yd7�`���Ki^:�2���7޸B>cs���X��\nC�64���7�h����A��\\�N&��}�����>S��{g��}���;q����e>��\"S�L���ݸ�E~xg<��CP!(�l��PZ�IFv��1(@�ԩ��t�D�������U!�ɡULe�{���j�[]S5�&iL�;��;O�����/��;v-N��|�j���_~dmq����o�Bf�_Ŷ�D�t�#�k�4\Z��~�0N�����Ĩn���r]��\"v*s��H\'��\\���&���nG��[���W-�_��	S��u�h�����۱qn�&3v��|���Q틞O��|d��\r��|na�v�����h>�KJ�[��z�t&A��0�qp�YP��x�F#��N�1}��O=���N�xs���:�NR۬�&<�+er�\"&h��\\��z/���ݽ�v`���m�Xv܋�m�D*E������k��n���������Gd�?}�^��������ן=�?�׿��|2�16ח����̓L:�H���At�d�������!�6Sf0J37�JONҨ�Y�[��/K�lo5�1>��7���x�4�z�5��,��T�c� �c�؉7t���?�˗��Ρw��/|���60�k���wa�n���O<��ˀ\n�~�N�ɥ��ql�TO	i��a\'vҜ,��%֖瘜ً\n5JA>o!�^���4����K��f��iJ#�v�E�����-n��XEJ�tl܄M�8H�8��\'����>Cj��>��C�����R�8�3�\n)=���6�c��O��@	�L�����.�j��k��sil��r2,\\z�����.)$�\"��!j�6G�)5;&�\"��\\��B�f��ڵ���8�/�20�ǒn�%�t��!3v����(2o^�?���>��2o+\0\0=���O}��~=W�~�ܹ��e����B/Bh�0�����iڍ:sW���`�4�A�ܴb��j�t�,/�r�����S6��\'W��{lm,�ߗ����z�|O���>�^�Lq�x�W��Eզ\r?���~=_�k�ȦĤtkw��?�k��Ϟ{���;��g����Z�q�-�����,]���N�Z���R�v\'Ĳ�)��|�H[Xa���8N���&�-Cc������q�\'I&aHe<��G~d?��/~�)����g�{�I�ҵ۠�_}�?{�̳z��$˛d��<����,�Q�;��4	Q�r\\� ���oЬ5��iT�f��i��v���\n��1�fH��̃��W�t���Gn`���/��x����_�-�es}�����Q��{����%o9��f���[�����L:���`/�Z��cG8r���m<l\'��!BZ��$��ov\Z�Q_WQ���H8��\ZN��[���9�{Ԗ����M�߿����^O���;*��m���~����鋯�ܳoW�Jsm���w2�w���O�j��\Zi�qOCGD~�(h#� @�6Q��&�Y�tP2�L�s��o�ک�鄶�u��w?��\'��{~ఴ1F�C�ߖq�N����7>�~���.�P��=ȁ�x�<�mp�šzK�d�i��(�Pa��|���tn���$Y�t��o^`en�Lƥ�ڳ9���?����d���m�+�ɋ�������ыg�SJX�\Z�sh��H7����046I��*�l�4L��ƕs�9����<	�$m�=���������X�����&��Gf�g/��S����_<��p�TY[Ė��� ����z\"Z퀄-٪�m�.{��f�C�����w��������Gf~�CSZ�����C����kˋ�n\\�2Y�XJD۹�ղ�H�CCc������{G��\n��\n��3;\'w�&���?4��\\��!�\0\0\0\0IEND�B`�'),('27','coin.5cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�09Q�+\0\0�IDATh�͛y�\\�u��-��ڻ��zo�I6W��(S�em��E�#)����\n\'�\'�\'	�`f2���\0� �8�1^�)�bY�v�)R�����{WWu��[�?�I	����؎P��W�\nu���s�s�y��⡔@��r��(���k��R�ShFTJ�Dy����Z�ЦJ���Xk��h2u�B���?��jA���<��W�ώ�m�~�X_^��J��؎��\\Z�,�[#t�v߲\r_\"�T�5�^rN�z7?n%ڟ���?\r0�O��٨|�+��_|#y╗974A�j!�c[Hv���ǲ|��ԫ5J\r���<K�s�M��r�&B�x�N��X��e4+��}���kS?w\0(�I������#G���Z��{y����ڽD� H�\0�D��sJ��D(4�<��5��y��Q�C�y�5t���\\ד[��u��/ǣ���\0�z�n\Zկ�ǯm�������p���I�vz��Ϗ?ю��i���C)��c��P���0L��kGO052ʭ7�+c>]���w6������R*�\\�K�sG>��W�*P���C��$�Z;=�S�aF��{��mAt4���B偔(�n���]C)�+�#����w���|�.[��}w��\'B���\0�T���cO|�c����࿱�ݢ�0��$�c�%���[1�P�\0�\0Es���|��W�n2B�&+�:h>�碜�6B(2�?��g�閛q�P�E��7�#�M�Bş	\0��z��o>��?��mϼ1����a�\r\Z�����V�DO?z(���f�`���M�Х�tY��i����(��-�c�~\Z�CKG��9t]\'֒��/!\n����|�Ȟ�|tpK���ڣ]��W\"�O�ķ���C#����ܳ/�>=J1�����N0\Zk;Ï����H���[3��K5�!=5���<�����_��]f}i_$�#5VV2����_/\"�Ffm�^�C� \n0:�fOw�cO>����B���<�������\\����[�O����,��:ұ�?�i�TK�z����:�g��x)4\\���WY�����6�ыd��T�6����?��O��Y![�S�eIOL��H������CwG���ǵ=���?��k۶����B揇�}����Q��{��NR����w^��+�����Q��i���1��8�u�b��k�9y�p�6:z��u(�g���nh��3]G\'p*%ZQj�\n�l�OǩT�L�&��Q����qaf�e��a����G��ȟ�DPH/޲>r揾���h����S<�Jv��5��4~�I(`K�Iv�жi�����&H�,���E�(�.ӹi��� ڒ$��Ne-��Byu%t���Y�穖��<k�H-�ąa��^��+�u?�K~e�����y폞y�[~b\0���X@W_��_����?�L�E)�J�PE����(-ΐ�@ee��������JJP���9ں�@7Э0Hy����4�TT�\n+s��Q�V��_grlY/�5���7Q)�ܻ�޾.�Sw<�=���\r{�11<ƽ���z�_��k����\00�_�~������ՠ�˂tI�U-���td(�L���D݊�����JGOHE~i��dvf��t�����#1�KS$�Az��:�D���~�Kh���R�e0�-���6k��t����۶�\"bm\\wo8��s��o�����O\r�����8���ߠ49�S�P��i۱�	N�9OUXd��\\��l��,C#c�8�#ã�n�J�H�����79�μ�#�H+�o���&�k\r�ǆɌ���X]ZA)Xfnl�Ѡ,52��l�i#����K�����d�~�L�8��>���`��>��O��ط;o�诠V\'�R�&��,ˢR�I�u�c� J�!n$x^S�)���J��BHɾ��#���m`h (��߾�:h\ZH�m������{��Kk��;��ǩ�*x�y��7Q*p3�hok���I���Z����<�����]1��[	��ڧϏ����.�`&���PN���yzw�A)��O6���7\rP�)|.k~�E�up�\0�Dyx�t��yhJ�	!4t�\0��E9�A�It�c��(e2X~��]{X�}4�/�d�ДǇ���X�p��_����\n\0wΝ<�9��f�F�Z!��yx\nb��@�)d��$��Py4�������5B�\r\n�y�s���Ϟ{E\"hH�	�duv��!���<Amf�d���Pͳr����P[�����)n�-M���\0���+O�����^��n���-���N>�!��G#�D5�L#�n�_�\r}/@yMb\\a�ˆjZ�zMMGI��])���:5B4���P(�pV�	%Z�SdrUT!Þ���8���7hdW�u��nڏ�9����+�Z����eJUR�	�j	,���!й��b-t�Ĵ\"�#	��Y�bn����L����\n8l�D5���k�\n�J\ne�X�Dk�(Jfm��\'�#Z�IO�����k,�/��V��]�ʾ�wS\\�~�Ϝh�*\0$����hg���^���\Z@	�pw?��#kE���\r�`(B���$��:s�b�p���k��C��e�!6b�P\niY9OK{\n�\n���L\0+�H���-����\ZVF�H�lR�Q\\_���8����s��;�����Ǝoa`����mh~�`��R����0S��,-.\\Y1��\n����̎�P.PJ6�[�&�/����$��Ͳ��\r�b��1��aD��g���`Ebx�8��$;;PB��de�<�� ��!t�{�}�8n.�i����h���R�\Ze��\0���1���4~�IΝ>�?!�S�T9u�++�i���w1y�x��!D ��Xq�r�fV��!���t\\t�gF�޵� �^&h��$`}�,ɞަ��nbm�р�n�(��;��J���rmv����䥽W��t�|��T;�����[:����F h�.b� ���TKE�H���si<��&��K�\r] 6b����e�14�xG7Rih��\n2������iTQ¤I-� ���6��ԭ6�N&i�t�PS~T�L��$��^�r���1|�f��\nCH�ޤ�eFC:]��ʻr^�T\'��M���I�& B��@�Z�����N1Kei���\"�0�P�^&d�x��7Y=�:�dF @-����Ä��w�G����2�h�z��*\0�b���КB��<�4\\lB3@J���J6����-7�\\r#38���@�,D �µQ�2�\\�^A����A[P#\Zа9:{����XZ/144FA�(\\8F�5����!�G\'�����h�^��^\0� �&p�Q頄�|\ro�����s�f*SM�\\6�6�R(���͍�u�/�f��Q���Hzn\Z�<,CШ7��W�eW��W���:H)��Q�s��}؎���$`��f�Zr�3G�3؃��C�.>�@x^��t\0\Z�Tͨ���\"Ů6�ִ��^6|ce/7!D�Mgvf�M[�4A<��5�D�&H��s�R�L������a\Z������4\r	�^��³�ٳ���\"źG%���C�[M�9�ff�\\l%�N�U�u�C6�Գ+xv���i\\�֤�JzW��T�6���\\��@(�!�]�܈�f!]�3c�!Sǡ�8O�E����L4�ئ��z�yb	�n���\\��\'_}���?$��ߴ����:��8�:~�^�*\0��g1}(�!mV�֞~�.�m.�l�w� 4���]�x���׏����\\�JA$4��+��(��[�a�|�\rY/������h����M�X(��kH)��&4L+�]��G[�<��J���xضK]\"\0=���b�٫ �-$S)ҫ��{��0�tc�xq6bA�j�h���r9f&\'�:��J�{;N(�\rd��c�	YA�J�V���Hzv���Q.ѽi�H_4�S�m��#��oY��r��Krjr���8t���5������#\Z��\n��tvlp�v�/]j*�je����vֲ�+�\r%���p�`ui����Q>����<�ڨ|.�Ǆ�!4�n��-�F\r�Z�)��z�D-�gS(���3\Z��E<��.��(�aun�d��`(����,�����բ��J�<9��jn�\0(��;�lcil=hQ˭P+�A(:{z�\Z6�Je�PN�6Px������c<��9^��\0�H顄~%X���Q�U�n�_ ��W�+%*����()�g��K�s4�E���	��җP���5�j:G���	u�5mY\\�o`��U)����7��6���Y�k��v�36<B��\'�LG��*��.�b���)�������hM�P\n��t#B��>���|�]�-Є@S���	�mm�@�Z����4��.4����Ϭ��ބY���ؕ2`�:����k�*�c4\\��[~�\0Hvt��ڲe\Z��\\���۷o��JV�Y��P(c�����[��bM�o�!�fFp��_.��s6�j	PZS�L�095Gog��V����eB�*�j�F�DK{��Ϡ�8M~-�?�#�YG��<t�`<�����O?F<d-��������׏���_?�ҡ��{�/|��g��W~�9�t���>����Ԗ�8қ�+�ld�>�����K �X��S.�@\0%4�Fm#G�2Y��>+̾���7tj�ev������ݸ�D<�����\Z\'��H!_�^,��	��z�:���.\0�ΝC3����;֯�#4>���������4���D���u�:@y~������D,?�R.Kez��<tݩ�B���q�\0��2>S�)f1�~t+�W�RK/�d��.́+i�Hѿw�p�n��Hk�Z�Nny��姵����H_8A9������w�����:9}�=wr��6���N�[��Pu\0�)tt�勧�cD;7�Y���8I��]`ř��Ds�H5�HOb�ұQ�\0z0�f�Hס�:����\r���{6��憇8���X� J3Hh6SI�e�ޞ 9�-�ƫO<N�=9m���+\0~�)/�7������K�{�9�~��7]@Ӯ��<�c񭣴vvn�duf�Y������㯐�����IE�R���a��N���H�A�.(�Ᏽ`-\Z�X���<��-$���۶�r���U���[�$:�I�t/S/=�R��ʞ�k�}�w��zcd��~s�ԩ�?xO|����Fs�í�T3�{F��S�i߼	_$���~Z�����3��ݽ݊!�a����_Eh\Z�s��rsӬM\n)U�X��QG7B�,�B����QF��L\Z����M)��u/�-��ۏ�n��}��o��v�>p�u�k��,,���1<>�ѲnnZ����2�C��܅J�x�$!�$�h�Zk�>s�����M���٣/����hMu0��&��fj~�r0�k%��a���(�A�J*��Q.U�8�D�l#b�F.p��n��õ��B������@����y�=w��������Sc�oݰw;/��G8�k5����8�^}�dw?������v��D(Umr�g�ھ��Swa��k��ރ��SrM<�=�4]� ��\"�V��V�%��\'�4Ü���R����ܟ���������ܾ�������� }�u^z���[�n��7~b��8z������k=��3|��?�g7(e��-��҅�n�B��d�5\Z��ܼL?E�Oq�$�v������8D��͸R��cOӕ���ٽcss+lڻ�Rv\r�����s�[)�z��cL��ܶ����n��g��q��7fGOG�����Я~����ĉǿ�ǫ�N~q���ho}����0�a�ar��i8��y��\'?;A�\0�$W�4�h��E�:���2u����б�F~�#���8��T���t��!*9\Z�*~��ͅR�8q�4=����ٲ}���g�wm����\r]vl�������$~l\0<���+_?����/s��q>�+R^M�Gi��T*UF^��>��y,,�1V\'Hn�����^�[��%�B�(b�����܅]����ȱ�#�O/�+�P��fx��!����D���8ݛz��k���1�����jl�����ן6M����e�����Ύ�v�\\�>�O������o����/ �F�Za��9=}�D?ï>G{H\'�e+�`vvsm�xW7f�\"c���=MwG�Z!��z���ۺ�X\\�S�5ФD3M,]К�Zl��\Z�>��o��g(j~��|����Wc��\Z�[���8�ԣ��^:���9��9ny��t�}��*#cs�~�y~�O�b]�O���k�tv ���8r�x\"J}c�U�6���cS�6�e\n��6>S��3��&]=)���6:�z������?C�DH�w�㓏|�u`�U�ɽ�A�j~=z���������{�w� �VW�������e3���>b#��ܩ��q�G�G��d��W�!+�k;x�:�b��z�F�J����B �\"������}��~�=��-���	���Gٴ�O�6_��_���?J��l%�9*�����ˏ}��-[�<�\0玿A{�d�M��&�8�pj���\\f��<��S��ÿH�Zo���,N�&���Ri ��\n�4l���vR�;hݳ�s���2/�� �p�������7w��o��Ge�y�^�t��G���Ӈ_�~��q��;�p�Sg����T��I�-���c�xv�V�Q.Q���kD�&������.��v��:g_��N�$���ؼs����w�w_��7,��c-��6v���}��\'��Բw�>���C��V��M,%�aYf���.ғH��-x�������Iyv�s������O�w�������[o�r4���1.��ñ큗���ϝ:v��c/>�LD�ܸ�:n��&ں:�h(�GM��H\\!0�&~� h�Z���gnt�b�&���������߹��_�;�0~�n��?o�)U�-k3���+M�;s������0�:���D�d�\"�A�V�b��5�cәl%ؖR���l�ν��}ߝ��:;��Y��[f���Aozii�إ�﩯��ͮ�Ԫ�N\\\'j\nLWJ�\n���l�Z������{N�wu�Ln������,�\0\0\0\0IEND�B`�'),('28','coin.2cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�85�XW\0\0@IDATh�͛y��g}�?��^}��=��94�%K�%˶�.k�` Y\n��$�J�6�`CU*��e7�Z6��cc����B�eY�u���h43��{z�~�g�x[2�J�\"�wU�1=�����=����>������/G��\\�ImN�ͯeWR�|��2{qݩRv�H�R�\Z�eD�~�ri�x�uxy�=)���O��ڹ%�̜ܭ���V�+��k;gϏ2;�@aa	��FU�x�B�2\Z���\Z�I��c�\"����V/L����?�>8��P�<Rv�#�X��˗o9����G_EĢ�����M}k��t�@j�n)O5_��]e~j���)<Ǧ����ݒ�^��^�V�J=t����s@��\'�Ps���w��p������ai��]�|�7� �؂�4\Z��k���j����B���TJ�NMr湽,���]w(3�_��ܥ����o�7�J��p�?�/�~�������o��{H�l$(\\��(�!AP^�x�G)�5�xJ��Cy6�Щ�,p��O�_[gd�N��g�q�g�8�[u@i��4��v��?h�:w�����Û��<�4P����(���_�~m#�BI-0���|<ߩ�kSʮp�џ���ӳq���j�w��/=��ؠ��������o<���N����O�D}#B����o!E���f��R*�@Jĕ�P^�)R�!$f$FߖMh���ރ��>�����g���[�+cZ�X���������{�賴l�߮\"M�]�@j(!��!W\"@NQ����z>���x�R}�؅<N��/M*�,�C#,���I%\"x�����d`�O��_^X\\{����w�Z�ѯ�%��.����<·>�y]��9�3�Ja�J��v�inG*+4\n�9T*U�|�rviY�8���VV���� %��Sr�T��D�.�4(jq��U�$;�z����hi�ܟ��\0_|CS��\\���٣��{r���;=#��/�<y�m�P��Pc;F����9�FO���F���K�P wi��3�qC1L�\";z\n-^���\"���(�Mihb��I\\i2˓S^����\ZB)�}�dW�Z����N���N�}CR�/gn�.^������s�!��zVϿJ���2�N��ab�c uf/]��^���ݰ��sx�<��c޴!�R(`����[- }+�\"7?G����/Q�V,F1�A9Ut��2-4M\r%�`��0+�ҩ��;�����F#��Lw�j�}徆w|�㤆o�py\Z=ن�6��[D��0�0F\"�0B�$�LP���ء�h���1����t+�n\0=Ì�)�֘;}7��L��V�����X8}���\"��!���1d8F$��E�(��,�=MSW\'�B�Н�;nhn|�\'�&s��m��	k�&u-���n��4D�u7QY[�u%�� �0���؉��<���B�B ��N�U*�E�H��h�R!��s���[.��h�D�ؙ%��p�\n�x���M�\"aR�u�m�3��T9��\0-MX�z��ҭ�������7���]���O�{��?�Q���_�!�n\"�/1q�<�T���{h��b.��ŉ\Z��P����71q�e򋋘�,,���Bgu����� Ԑƈ%���%�b��MM���gi�Ѝ�\"�$��I\Z��X)\nVf���������\'��R�m�K��G�偿����h�$���T���S,grl{ۿ����d,L]}��n	�V�wR������s���y�z��{�:�\"�\\��3��05E)W$�����ì]�$5����%XY\\��K{�cF�pp/mM4��)-]&{a�P}#f\"I�g��:\Z�ƿ�G�Zm�H4�~����4� �m�IPX�`��;6#<�j8_7f�	t+@u��Q*U14���[)�Ks��h,Ni=KS�=(�����R���#\n�;�ދ�����2��+���8H�7Мu�R����(�>�Sc4m����[���Ͼ���?;��{>|���h��w��yW^�OD\r�i��$(;��\n�p�:��M�Fb�86�$\ZM��4�x<F4CI�2R�\n�ТIV��c�����ɓ�v�����7r�I�u�/Ӱy�Q�O_w\n(��%{�О�k���؂���~��T��5=@x��L�죱�A����k�YH|��]\'��B�f \"qʶ��Ƀ��l��.&�>GWg#F,�e��=�c����,gIto ِ��\'��{��\0��}�\'v���	6Wꁑ���BKϮ\"�*JH�r8��z��`B�`Qc��G��RMG�H�4C�sy�ghيmb�٧��i!�1��j���s�m�g��?����+Y*k+�uo���}�5;@�U��v.�=Ez�� 4��]*DC-�U	By���i���¹X�N��%X���R�_uB{�\0i\ZR7f��L���8�[���/<I�P��~�ǧ0�hln@8e�KLO�a����D�6������]ڵE�0[W.\\xK��	�.|t��^��Ԋ��P�E(����w@|�兇b��߇P*�\r�^��_�\0�(��$��:3��<K��-����/һi����c\'	�fh���h����4��2���w0�u�_���!��mqKk����?q(ڹiS\0���s�V�C)�*/4��j!���[��01JCC�Ρ�ׄϹg�Zc�� m��EX1�f.A9O��f\n��}�\r �=�=t��(Q�Ӈ�����D�����8�_=�Ay�����pmP�\'g�Fi�8~e��vU�R\"�kl^���s}� ��]��Ogχ>�4���B�<�jP�t��-TPL5�չY]P�7D�T�4u�t�d��KG_!mVH5����z�8��\n��4E.W���s$�M�D���R����V�%��V�56���Ѧ+�z�#�nP�����D8�@)4��� ���vB�$J��+\0�\ZJ�J�h\ZJh�� ���*�X�.�4�șÇA�	��!�}�i�NSw\'V��>C��q�{� ҹ��Ks�[:hN��5!�T4}�ƌƮ��@���%t@CH��g0�v�����1�y#�}Á���N��5�(H��%\r�r�J�Df�R�X�����V�dIsO����{8��iR����U׌Lw��O���jDq=��K���׉��ǌFB���6���/��~\r�H	B\\3�+���E�a��O���I��Դ��-5��#3���%q]C�����A]D�P%O����|��#F(J���[��@���S\'�p�(G~���:���x���̜;O�.���T*����i 4�� ��\0�^������L��\r�=��c1��߈�R��k-Dy�u����`\r-�V]���S]�c��)D�	w}������/hKLUϦ�������a��ǇiIhĚ[�:7r��A�;wnR\n�m��\0)����B��/i����*�\"�h_H^z��tlf�ͷQS��JjTm?\08B�RJ���@s���5�K�h�f\Z�{q/OR��%ɬ�=z��3�4l\"��\n[(��X:7ܺ��O ��8�̳4%�h��)�u�\\���\\#T�Q���j_1�JH�k�T�\"�8���;�dÎ��_w=W`��0������NE9�ZMp���XZ-Q\\/mm\'�Q�ks��p��yt�J&���w�T2�(d�]�0����������Ših#�n��zI%��u����1Q���bدAa\r�q�KDR)�^��7�v�;i��\r�J\r8�N��C/Q����@3Q��-��^�!T�Bz.n��m��k3�r��>Og��,�-��*�]A�B��(k�fضm3��^>��\'S,�g��YD86~M]@Gl[�T�ybѺ��B\ZT\n9�҈$��LOp����#��X,�r]����<���j�)��$���x��t*V���\\��\\d(�bf�����&fϏ���D�	*�K�x6�����f�R���N2bp��;\r��Y����^�\\�+���Hc�ե\Z3+�\"����K��r�?��ؔV)e�).NSZ��έ��e3u��C�%����O��ǔ�\\�yx�u\"����Kظ� Z��s]�M�H3��NR�^��n�택�=q�\\&���j@�%ɭ��)O]�<�����V�GA*J������f���wwa��4K��#Q,Mb�:�x��ӧ��4���ڡH�J��UL��h�zD]3�m��\Z���a�eP\n�ZF��AA+ʳ�VVi����eh�n��B�R��0L?�$;=��Ŀ}M�4�Mtu�&&p*et�°tD8��B�����+�E��2E���8�!J��M�!t#h�J��F>_\"�nAxҴ�4�����q��*!Ҝ�(i�B`ƓE��,Vsa�bY&�B�vY_/�U���	J�%�b���K��T�R�\r6�\"�Vx��ڜz�Y�(U]<�\n�q����$���Z�/xks�سU��B�)��HZ,g=�\Z��\"sg=7NOs��\r�d���%��I�Bf����7���V��4��]\"���+?������J��zc��59@J�)����ku�4���*�n��_���\n�� ��2�]�w\\�X�\\FH\rk���Oˆ!��)�@\Z�	U���U��Z�+lq�;� �P���M	��Kkd�I4�	%�X�٩1�.a�����IC��ŵ<��#-�,=��ġ�_��w͢�r*?������������H�0kUܯ�����О��C���OaZ!����`��mC��I1��%|��r�D���2-n�H,���D2�H5�^@(/΢�#<�W$ڻ�%��Y\\�1��BK*F�>A���b�Lie���Z���%�I3|���g_�V�ό�Jy�i��\ZOЌ\Z�6@�X>w����l�`my���!�6��@�����P^�	z�\nN>�)\\<�A�V$�(fќ����@3M�b?�F��<����UL�3>y���aS���SO��Ұ����މ׭\nW����{�g��H�۾�R�V��ڹ�^c�\ZJ7Y<}��)������<7I����C1.��<-mXV=V����U��!�Ҵz�ʵ���fX3�oWY����J���V*�U��\"�p�/.�m��hc##���E�Ե�����/�wv�/�a�O���8W�L�Uu�3��+�H��DۺY��ƹ<A��u�H�ɧ����p<�2C,M�\n�X0�]ūV�\"�u����J�4-m�:<�eif��29rv���Ɩ��Fv����֑>�\Z��ܯ�d�������=����xN	�V_��t���`�����tc����p��i޼�����#�\\�3Q�#\r���1�!(.��+�Rv�j�J�\\�)��A��e<���ؔ3+L�cr�N�R&J�x�齼��-�ndq�Hq�I��7~�߫_�lp�쑗����x��\'QRh��S-��0���IZ��\ZZ�#䮓�`+�����-���1*Jc��O�=ԇK��u,�>E(\ZCAfq�B.�勳�y7(�)��0a�gv���G}O?��X�o����-=���bn�ơ�����o7\r�����n)��RWk������.��[���3������3G3\\R=����e3^GYF�x�)z7\rjj����$�?�8v!G\"œ:�D�ɳ\\�^b~!K��B$A�������4=V�E����Ý���y�F������.�dd����Kݿ��_i��W�8����\'�X��+/����|\Z_����k�X���p���Ɏ2k%���cp�&�֑wt.<�8#;����)x!&�~�����k�2�は���J��az¬�:��aJ�2����q���?�&g���l�>D��;8s��\'����rӻz?�塩k\Z�:��_��f�_��Y�-w�I\"Հ��̝=ͩ��y�~��ㄪY\Z�;�V�L�a��/ؾ�c)Sf����tF,F��s�G��m���s<6�r\\�8a]õ]ʎ�ȆF23���Գ��>���Im����Y�=�4�;��w�}�+o���_�ӿlli���(�����8Es{z���r���0�u�P�	�Rb��)zG��Y�[f�Ճܰ\r���l���c�0��� *��q��.^�gfyC�ahĢa����l\"�\n�E���m�w�������/��o����ɽ��k����#����x�?ISs���!�E*��Z:УqVΝbh�fle079Ma�ûv���XɻL<�#7���h�s�\\�*���N�Ȑ��kͫb%SD��������sjx��+�}����\rw���O��\'�G��������o����6\r�(ϥ�~�aڻ�i�q7����ذ�&J�������_0|�\0����Pϻzb�^����\0e{.��R�݈o��>Du}��1��u��~+��g���p������6+���{?��8ks�R�(�b�r�\'�� �睘���ۿ�vnM�N�T`��k�T�k#<���e���m���OR�X�k���3������|{p���Z=}�\r�=���דjkc�ȫ��D4A(#����\'�!������v]�j<߮�|��Fj�@�53w~���_fe~����uް�/���ϞS�����z~����Ǿa�V�aC�����F��Rr��(1/O\"݈W.���Ȭ��E3���=�f\Z��F��fJ�\n��c�ȫ�]��;�\'��G>78��\\�ys����8?z��o�������T7ǜ����m�������!u�e�n�����.(�fX��c��Y�V��u�^\"u�g�o����I���~0��(J�g����3gO�]\\��jgfj�T�\"ciݲp]�B�	x���{\n_�1�;1-�pCg�����Go��B��2��F��D��s�4I��F��������b�����:�Yϟ�Z���������p�n_�SGoy��W������/|�֑��\0\0\0\0IEND�B`�'),('29','coin.1cent',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0w�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�9-��D+\0\0\Z�IDATh�՛w�dW���>�>��2���6j�V��C��H ��\0#f\"���X˚bgYf�e@�pB+��\rV#�|�ڨՒڨ�����lfUz�̽��K��fi����̊|�����{��w�^¯�~`��S����n��N\Z��:��r!\Z���BO�sa}�sWb}��5���x6�z��fav��������Gl���:��u%�|�\'m|�G�-@��-��Z,�Q-3U�l����������\0��X~�>8����(;zQ~�� �~�(G�9Duy��)��I�]i\"�$�!i�]*�\Z�v@���\Z�(��0�ٳ����?z�B�^p��;�Y>~�t�d��_�{�I�{�A�R�ݶ���\"�c��$F\"M M��\r(����*��*SS��-�`;6��>�>L���Ե�.���?�����\0P�>4��O��k��݃c��?�>KGs�K�<wN�(�0AZhi ,!¯�J��6BtE+t��n��Gu��ԳGX�_&5��}O�k-���3��x��k��Y��7���r����ޞ?������䪷\\��9���XQpRH�i!�)¯!M���V\n�b��o��eР�%�z��:�\\�����8���?�ο��O�|56���Ǿ�7��q�m�hg���|Q��ux]��I��D#��@t�Nt0��F��x��*�Gk0��H�2��͐�JR�>)�߹%��S��}�|w?��c�S\0~����z�e���F�y�[���w^�����=�����@h�G����!\Z�|����Ё�W��7�i��	|\r� ���Pf۫22�C���F���^8~�[��~�����N\0�����o����	���=����\'��G��F�a�+�Ҵ1b�ЫB��Z�/��0��M�BH�V�ԗ���x����j�,MM��Q�;�bU����3�\rv��J;��z��S?]���?��˯��/���k�=����J�X]3�4���0%��	�5ܖOee�xW~ۣU�3��q\n\'g�Wʔg�I�23C4�i��-�e��\\�P��=4��jb81�.�i�9$2i�!��,l�t������8��\0�O��[�M�Y*�Ƨ��憏~�lP+�Bb�a��QnmD0s#8=#`Y�:z���|O���!�/�����Ĳ=൱�I�I$G�\0�T ��F�\Zd��bu~���A�X���[5�weHD�����Kz�;�XXxM����lKvO��+�؝w���}�n�X�G[1D�<����Ol��ʃ[C�Y��&�X$���\"52N�+�F\"�\"��\"p]V���{>�T�������ۢ�hb&���K��\"��\0#��vz���(�I#��3�����c_���G���6��\\�����Ó�}���߇���S(+���k����Ͻ�T.�h�Q�*2����Xx���<���\\+�t!dHx\Z���\rM���bK������8�(�l���aҽ}􌍢M�Q��G,j�p#�����z���;���F���ǿ����������b�E��@s��t�8�8v,�v+̽�,SO>�v��DVh�(H&��&\"����\0�\\\Z�\n��ԗ�)/.`�{.B����?z3\ZÌ��,/��`\n�)��\ZM#���r�t��MW����G�8�������O��g�8z�M�ބ_����c�6V:K2�b켝���\nƶm����y�i`�S;B`E8��i*K4*֦^ �}*�ɭ�D��L�P�ݨ��4?��h��G���3?=��p��^C�XEW���l���t�=[��Us�޿��#�n���w�!/z�[����*,!\r,;�EZ҉ L�ŋ�D�6B\Z�z� �x���\0�\\�d*�[*�>�!�ji��G���Qðb�Ґ$�ݴVWP�2��a槎�ӝ@�&�F������y�0�;v2���u���>:_���l4��G�;��Q3��ٵm\'ny\r�B�F4��#��^#����\'��,#��vX9~�MW�Bk\ni��D��:��I$H����\nAT> сO��h��esD������@.�������R6;�yuJ���/�Ķm���B�W�ˏ�~E)p��{����w>���r�o�f#����0��3}�0� ��J}�D{ť�t�i|�C��QaS$��� @��3������}����N�&3���&+\'g�֚8��Tg���ƫl��_z�������ͦĘ9t��;��-0m�i#m!B+�4@�\0�6��Iu~�t>�}�:�+�c8g����@���v~[�`��S��A2����Kb�$eפ�8�H��K�bi���2��4c����?|�+��箛�>1|�VD4��=�i!-���H�a��@���vH�B����g` Ԇ���_�3�\Z���A�\0�! \Z�6KG���$�r���K_��I�XXk�-��I$B�U��rC}��/r�uo~�u�Yp����e��}r���2t\\�!�D���e���/wq�@�&��Y�!\0ZwZ`�ӄw�_H@��\n�Q2��hQ�>���ʎ3���D�{)�di�|O�vX+�Bq�\r�n�x����l��Ͽ�ֿ��\0�Dc;L�3s􎏠a��h<d{d���&�$�aw��kMR���Z�\n\r�oC��k���m���ӧ�;g�@2�o7}ýؙnVV�X��|RyN=��$�ˑݰ��G/��v\"��t��_?��\0X�����$���X\n!٘�i!D\'w1�p�\Zt��c�X �Na�! :x9�;)�\0J+Ǵ(V�-�2�a#mWQ<~����H���%l�N<C:1N�*�����+��P\\\\���\"����<�6�����g���\Z�z���F�V�-��~��Dǈ�Cxu�4�����LLv��˥�!�΋�!8�+���H;Fn|#ZZ���cc�,,�z�$na�X*��������,�T#�gm�H�z��wnDu�S��fb�v�e[g�ܶ�-/����0�3��\r��0��4P�2�@:V���x�%a�#4R�nG��3�Ak P�3�[^Dz\rWҮ�XQʅ\"�X��\"i��}�d<��@+����g�ND�7���3O�;�&30I>je�*Z�����i��])сw�l�q�4^*�(tN�v����*�t��P\',�Z��t8\n�^m��M�8�!,�F���J�8���+��{��h)8~d\Z�e�Cda�(+���it��cA<ǰ��g�������Ģa�֩��0�Hx�յi��/�يЬ��%�8�X�\Zy�:�r�<S�e<��@��aH�z4�V1��^�1cq|�Gj�!aÅ�������X2��g���鷚��a�Q���j�Y*I�0L3�İA��{:8������:��v�������,l�:3�B�z\0�2c�\"��Ъ���cX6~y/���+u���b�t_N<�\n�Ygd�$��c<p=��ٽ{�$ޕAj��haJ�!E��\0P����j�� mi�\n�7<2xg��6�ش)����p���2g�~Yv�5\Z+�a�5\rl�­������R+�#֝ǴL�D\ZL�-;���J�c=H>����a��<��2Nԙ>+\0��@,��Z���h����N	��@��D�Z��A�V%��vHNu���GKZڴ�k4���8&�k��V�Mku��դU��Փ#�Յ�ΐ����\n6n?���܇i��\n�Xn��R���*�h��Y�9\'�̞Fv�5̗�R����ӵ�²О�i���X��E�/���PiMku	-\r�h�n�4,/�Q(U1\"Q�z�DW�H*�[^\rɖ�(��+E���7]<ϣ={]�ei�Hlh����q�\0p++�h:��r!���\nM?��#�:\03BP<�0�N%D�IT�����|T�aH�RDR)�f���\n��A�Jw>�j�/�\Z�(F$�rG�	���plC�F825��,r�Do.��\r�v����\n�ݻ��׉�m�Uˡ�����sIP8�VF�!$Zi6��陙Ny�DO�j����*��Ɛ* ���a���=8Dw��Z&jK�� \0��j��\ZBJ�F�Ra�To?��%�7���y@�R{F4��6�ٝ�?+\0�*�.�y�or����� C���0�B�!�U1bq�ޱp8�F(���q���Z��`yf\Z����2�Z��a�7��v3�F5��(S��ð�F)��j�n�������\n����M2�4LV*�Nc����3�X\"sT��+�:+%���^S{�sϮ^p�\r�}�~������@P�=���=�B&A��! ���\Z�f4��l<7 5�\r�+�J!c	�F�x�F�]�E:*�U槎3<ڏp��kM�b��m�F��0-��{x����|���\\�C�\0��^#s�.�>�c�ë���������[���#����[��\ZXq�R��?:�Y���>��C���V�v���ؘN��ƴB�B#H�PZ��&�Q�������0�b��]�Y�\rO�|ᘘ���R/�)�̓��M�\" ��h���\Zgt�����En}EC���ۛ��̇�dR�f���0��zPZ��Fi^.�����)-,�n6�w穖ʔN�\"��â��@�Z#���\n��nt�����9�%ؙ<�e M�z�@$�BK�6ʴɤbn�N�\'�<�DҤ/ab%�̫$va:�9�O~���f�z\"�������?_���m<x�#�Bg���Ʈ��Jbpf�!L���i�[\'72J��Fu����hi��³��MwOT�D#�(�%�N##�0�\0�\\D5�!I�\r��*�\n�B���/�$hߧ\\�p���r��&��b���0�q�p�\'���x]�Q����ܯs��>|ݮ�/l`�\n��h{��a��	L�50Hei���)�6mF���&ӛ�Ie0L��Q�H��mbdz�V��aK-�V&�a[H�q�*K�4juF�lBJ�j[0�\\�[]!7I���T���mjOF>��F>��[���S�s��y��gQ�2�LI�w:=;���G�����~��i,��gx_HN�y���>��C��������W����ݟF�)�2�İt�xN:���\"���k5OK��\'��=Ox�mWr���������ګ`�ơ��eo��W�����|7{�ڏ*-� (�&�}�a��!��i�}����Au���!Z�dn�n�7L`Ǔ�<�;����X8\\1�pa�^���@sq�����(���l�V+����\n��*>�\\�{�ӭ31>@j���}��I�Z�?����~�{����g?���a���\'R��\r;ɭ�D�R�m�h����0#QV��U%?�Oݓ,:���(��)c,:�����r��}O�ۺ�T6Gyi	�h�E��լ��Ѡ�hRk�q�8g�m��~�}��߽w��,��x�{wp�M7,v_��a!���\"�Ӿ�7~���Zt{�w?���ZU\r����^�`QYZ\"n+�c�T=��G�0v�:�h���0��>F�nA�j#���~F&y`�}�c-T��)�G��27���ST�M��xZ2�~�Vq�o~�6�0͟��\n�=9b�/�������uK\r}�oc�Y�{����m��o7_�k����oz+�_<�乛�y&��\"�s�g�\\�83ͺM�ZQQQV�{�����Y�i�G0�n�\r~���yq~���پc\"� ߛK��H\'�ާ�C>w~�l�M�^D$�\"�����{���Q-�}k|�;��5�&��6��W���}�o{Å[D�\'ύ�v�bT���{q��/Ŵ,Z�E�zr`X4ڂ�20>\n��J%�}�8C��Q�OE�8���l<wť���$�\'�0,��l\ZaJ�JP.���-Ɔ�\\{��]q�i�z1���a6�Mm�N�b�=��_!��e���z��_��}�=�\\��X.�5�.!��FX[k�������31IP)�,����A8Q��M��i&\'<���P:�8��9�a��� ����Eʕ�J-}�4]�8B\n�z;�$��\\~��{�l0Btەˣ��!���QRk���/}�\'~p[�p��L>��n�\Z?\03p�\'c� Ry֦�?:L��Q/W��Kfp%,�K.��101J�yh��ׄDAGm\n�뢕�v��5�\'1:��p����4�;�.����$�8x���g��T��Z�7ug3?����paqY|�X��k/e��-ä\\��v�������M��e��7����bi���Q��}E���5�PJ����p���+�H���L�Z��;o�su|�gG���_��j��ֺg�}��r�g��M͹���s��u����Xԫu�=��u�m&�?Dɳ8��	6��z��D#�B��V8��\Zݬ���m�!>2��\'y����l�241��v��G�o��τ��,{��֢���?�������7�P_7۷m��62ғFI�6|�Z+����a���7x�\Z\n�j7��m���$�8�,�J��x��ɓl_�Od�����dF>�j�Ͽ&���;�{�������}���}6��ӗ㢝�ٴu=�t\n)����\"h�P�*A�	Z����b�3ᆨj�û�0ul���\"zҤ�]�F�|ӣ�;/��B���W���x����?���n}�\'?��F��d��l\Z3art��~r�4Ҳ���D$���2����.�6Z��&	4�\\���v���o89~ޅ���kyh�5?2����ڿ��ȯo��=��=?@me��e�qHF��6\Z_8h*J���E,����������.�Y<�u+p�k}Z�u=3���D+5Z*�|���g��5�9N��^�T\"I:�eˎml��R&�ٴ���|Gq����z>��ڻ������\0\0\0\0IEND�B`�'),('3','Printer.TicketPreview',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2007-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n<output>\r\n    <display>\r\n        <line>\r\n            <text align=\"left\" length=\"10\">Total.</text>\r\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\r\n        </line>\r\n        <line>\r\n           <text align=\"center\" length=\"20\">Merci.</text>\r\n        </line>\r\n    </display>\r\n    <ticket>\r\n        <image>Printer.Ticket.Logo</image>\r\n        <line></line>\r\n        #if (${ticket.ticketType} == 0)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Ticket :</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        #if (${ticket.ticketType} == 1)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Refund:</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Date :</text>\r\n            <text>${ticket.printDate()}</text>\r\n        </line>  \r\n         #if ($ticket.getCustomer())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Client :</text>\r\n            <text>${ticket.getCustomer().printName()}</text>\r\n        </line>      \r\n        <line>\r\n            <text align=\"left\" length=\"15\"></text>\r\n            <text>${ticket.getCustomer().printTaxid()}</text>\r\n        </line>  \r\n        #end\r\n        #if ($ticket.hasCustomersCount())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Convives :</text>\r\n            <text>${ticket.printCustomersCount()}</text>\r\n        </line>\r\n        #end\r\n        <line></line>    \r\n        <line>\r\n            <text align =\"left\" length=\"17\">Article</text>\r\n            <text align =\"right\" length=\"10\">Prix</text>\r\n            <text align =\"right\" length=\"5\"></text>\r\n            <text align =\"right\" length=\"10\">Total</text>\r\n        </line>      \r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        #foreach ($ticketline in $ticket.getLines())\r\n        <line>\r\n            #if ($ticketline.isProductCom()) \r\n                <text align =\"left\" length=\"17\">*${ticketline.printName()}</text>\r\n            #else\r\n                <text align =\"left\" length=\"17\">${ticketline.printName()}</text>\r\n            #end\r\n            <text align =\"right\" length=\"10\">${ticketline.printPriceTax()}</text>\r\n            <text align =\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\r\n            <text align =\"right\" length=\"10\">${ticketline.printValue()}</text>\r\n        </line> \r\n        #if ($ticketline.productAttSetInstId)\r\n        <line>\r\n	        <text align =\"left\" length=\"42\">    ${ticketline.productAttSetInstDesc}</text>\r\n        </line>\r\n        #end\r\n        #end\r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        <line>\r\n            <text>Nb d\'articles: </text>\r\n            <text align =\"right\" length=\"10\">${ticket.printArticlesCount()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line>\r\n            <text align =\"left\" length=\"16\">Sous-total.</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printSubTotal()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line size=\"1\">\r\n            <text align =\"left\" length=\"16\" bold=\"true\">Total.</text>\r\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotal()}</text>\r\n        </line>    \r\n        #foreach ($paymentline in $ticket.payments)      \r\n         #if ($paymentline.name == \"cash\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Espèce</text>\r\n        </line>  \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>     \r\n         #end\r\n         #if ($paymentline.name == \"cashrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Refund</text>\r\n         </line>\r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"magcard\")\r\n        <line></line>        \r\n        <line>\r\n            <text bold=\"true\">Carte bleue</text>\r\n        </line>   \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>  \r\n         #end  \r\n         #if ($paymentline.name == \"magcardrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Mag card refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"cheque\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Chèque</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"chequerefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Cheque refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperin\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Coupon</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperout\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Note Refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"free\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Offert</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"debt\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Dette</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end \r\n         #end \r\n        <line></line>  \r\n        <line>\r\n            <text align=\"left\" length=\"15\">Opérateur :</text>\r\n            <text>${ticket.printUser()}</text>\r\n        </line> \r\n        <line></line>            \r\n        <line>\r\n            <text align=\"center\" length=\"42\">Merci de votre visite.</text>\r\n        </line>    \r\n    </ticket>\r\n</output>\r\n'),('30','Printer.PartialCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">Caisse partielle</text>            \n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Paiements</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        #foreach ($line in $payments.getPaymentLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printType()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line> \n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        <line>\n            <text align =\"left\" length=\"32\">Paiements :</text>\n            <text align =\"right\" length=\"10\">${payments.printPayments()}</text>\n        </line>\n        #if ($payments.hasCustomersCount())\n        <line>\n            <text align =\"left\" length=\"32\">Couverts :</text>\n            <text align =\"right\" length=\"10\">${payments.printCustomersCount()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"32\">Moyenne :</text>\n            <text align =\"right\" length=\"10\">${payments.printSalesPerCustomer()}</text>\n        </line>\n        #end\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printPaymentsTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Taxes</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getSaleLines())\n        <line>\n            <text align =\"left\" length=\"22\">${line.printTaxName()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxBase()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxes()}</text>\n        </line> \n        #end        \n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Categories</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getCategoryLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printCategory()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line>\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text align =\"left\" length=\"32\">Ticket :</text>\n            <text align =\"right\" length=\"10\">${payments.printSales()}</text>\n        </line>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Sous-total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesBase()}</text>\n        </line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"22\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTaxes()}</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>  \n        <line>\n            <text length=\"18\">Clôture:</text>\n            <text length=\"24\" align=\"right\">${payments.printDateEnd()}</text>\n        </line>  \n    </ticket>\n</output>'),('31','Printer.OpenCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">Overture de caisse</text>            \n        </line>\n        <line></line>\n        #if ($payments.hasFunds())\n        <line>\n            <text align=\"left\" length=\"32\">Fonds de caisse :</text>\n            <text align=\"right\" length=\"10\">${payments.printOpenCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"22\">Détail :</text>\n        </line>\n        #foreach ($val in $payments.getCountedCoins())\n        <line>\n            <text align=\"right\" length=\"12\">${payments.printCoinValue($val)}:</text>\n            <text length=\"10\"></text>\n            <text align=\"right\" length=\"10\">${payments.printCoinCount($val)}</text>\n            <text align=\"right\" length=\"10\">${payments.printCoinTotal($val)}</text>\n        </line>\n        #end\n        <line></line>\n        #end\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>\n    </ticket>\n</output>'),('4','Printer.TicketTotal',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>   \n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\n        </line>\n        <line>\n           <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n</output>\n'),('5','Printer.OpenDrawer',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <opendrawer/>   \n</output>\n'),('6','Printer.Ticket.Logo',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0\0\0\0�(c�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0a\0\0a�?�i\0\0\0tIME�%�dF�\0\0\0tEXtComment\0Created with GIMPW�\0\0IDATx��[K� ���_��z�1��M�k���9�DI�Q�|�s&k\ZhZ�uPrqhKqB�9J����w�:�2?�[�P3�#�U�\r���Z�D�j�;*PD���;���ix�`-2���Yd xk�(V�ZG��\'������k9��у��v�Ʒ�wߢ����;\Z���OZN�����Tc��C$g�����(���n$\"��E��\0 ��9�������#���D�o�t���¨wq�H��U9�ڵv6\Z\"ʫ����N��1���W�ݹ�xo\'�������S}%�:=#|�σ�7<����K_�s*�d���rS*��)�A	� ��T+�P���|n�)��6X\r�2��Jrg:��k�H�uHq��\'ex�\'|C�;����TjX�j��Τ9i��%����r�h��vᙥz��Y<��k~��TV�Щ�G��ts�m<�U����f)������.fL�C�V=���Hg�V�����h��eeK.I[6xG;��U�~�t$-����ķ��l#Da�\'�\0\0\0\0IEND�B`�'),('7','Printer.TicketLine',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            #if ($ticketline.isProductCom()) \n                <text align=\"left\" length=\"15\">*${ticketline.printName()}</text>\n            #else\n                 <text align=\"left\" length=\"15\">${ticketline.printName()}</text>\n            #end\n            <text align=\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\n        </line>\n        <line>\n            <text align=\"right\" length=\"10\">${ticketline.printPrice()}</text>\n            <text align=\"right\" length=\"10\">${ticketline.printSubValue()}</text>\n        </line>\n    </display>\n</output>'),('8','Printer.CloseCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">Clôture de caisse</text>            \n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Paiements</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        #foreach ($line in $payments.getPaymentLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printType()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line> \n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        <line>\n            <text align =\"left\" length=\"32\">Paiements :</text>\n            <text align =\"right\" length=\"10\">${payments.printPayments()}</text>\n        </line>\n        #if ($payments.hasCustomersCount())\n        <line>\n            <text align =\"left\" length=\"32\">Couverts :</text>\n            <text align =\"right\" length=\"10\">${payments.printCustomersCount()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"32\">Moyenne :</text>\n            <text align =\"right\" length=\"10\">${payments.printSalesPerCustomer()}</text>\n        </line>\n        #end\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printPaymentsTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Taxes</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getSaleLines())\n        <line>\n            <text align =\"left\" length=\"22\">${line.printTaxName()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxBase()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxes()}</text>\n        </line> \n        #end        \n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Categories</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getCategoryLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printCategory()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line>\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text align =\"left\" length=\"32\">Tickets :</text>\n            <text align =\"right\" length=\"10\">${payments.printSales()}</text>\n        </line>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Sous-total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesBase()}</text>\n        </line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"22\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTaxes()}</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTotal()}</text>\n        </line>\n        <line></line>\n        #if ($payments.hasFunds())\n        <line>\n            <text align=\"left\" length=\"32\">Ouverture</text>\n            <text align=\"right\" length=\"10\">${payments.printOpenCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"32\">Côture</text>\n            <text align=\"right\" length=\"10\">${payments.printCloseCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"32\">Fonds attendus</text>\n            <text align=\"right\" length=\"10\">${payments.printExpectedCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"22\">Detail :</text>\n        </line>\n        #foreach ($val in $payments.getCountedCoins())\n        <line>\n            <text align=\"right\" length=\"12\">${payments.printCoinValue($val)}:</text>\n            <text length=\"10\"></text>\n            <text align=\"right\" length=\"10\">${payments.printCoinCount($val)}</text>\n            <text align=\"right\" length=\"10\">${payments.printCoinTotal($val)}</text>\n        </line>\n        #end\n        <line></line>\n        #end\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>  \n        <line>\n            <text length=\"18\">Clôture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateEnd()}</text>\n        </line>  \n    </ticket>\n</output>'),('9','Window.Logo',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�;���\0\0\0tEXtComment\0Created with GIMPW�\0\0EIDATXýW}lSU���^��ulX`��(u�cl�h\"B�QPQ�d�\"$d��ј1�O�>�2�\'n� c0�FȀ	QQ7�p@WX_����h��{��L8I����{���~��{������[.lVd9�p�L-��fO]��6�N�|��1\0`�(>��۷A�z�,�END�z%Ȋ\"��A��*�NA��1�����8��X�$I2$	93���N��v�L@�d)�\n����\Zq�H-�nm�(� \"���2�Aݫe������Av�d�?lC�Z~��u�߂�Վ;��3��(⻃���9I���ǥ�8�Ue9��9^I \'twx���[��Ą����ț��!�9tD�$>�����|�o����bNcD���!�f���@�>�ګ[TUUp���Z��܄0D��l¨�#�������P�p�V��(Z�rf<n��jǂ��~�\r��L�J��1�v�\nM�1L�46[E�\'��$dgM�L\"\"p�����jc��/�!)i ^�?O+8�ǐ�A��V�$����4�1��x�$:=7c]p�޳�P���4z\n%�(\nx��-x�����\n�nun�����E\\-��U���\Z�m�ǖ��۽\r\0v�\0<;w�\0TU���2\0�O��W	0Ɛ�<兡d.x//[���{l�Q[q,����|i�����))dYш-�����	(����8�D����;&�@\0{**5�::���x��^Q`��8P�-&f8u�J\n�`������-8}�Ng\Z\\�WQ�o?L&S\rPD�\r��5?`�xu�\r�ADJ��bђ�P[׈�u���PQ<�C\rk�A64ɐO�ٌ�]�bێbM���?)ކqc�D��qw/�\"~9Ӭ;�2&8��ꀪ���Żvcga�Fh��,.܌1��AD�\'*?l���r��S&��ܧg�������5	�����4\0`B��n��vsf�D]�q��qMwi�������� \0�����1\\�ځw�ۄ��&,���+y�#�_��gϵ��\0~h�� 8P���(\n2&8up�T����>��6��y�<���\r��4�����g��X��pߥ yDJAp0�sh:y\n�)�1\\W}����چC��S`�E�##}<J�*`����(�X���?�(����y\0`6��}g	�J�5����� �r�Nh�X�uG�>���g�#\"��]����C��V|\\X�Ҳ\nݜ�?C|��X�F�uuyѯ__<��88F�ԝ�7�n|]U��6�^���+�\0\0\'�Na��=eJ�t���h��hseY���	�����U�R�Pg��Ǉio�� ��~��\0\r<\\[[�(�(�^X��m�8�q��_�k�c}�\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `RESOURCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSIONS` mediumblob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROLES_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES ('0','Rôle administrateur','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.customers.CustomersPayment\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelCloseMoney\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.EditTicket\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <!-- <class name=\"sales.ChangeTaxOptions\"/> -->\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.debt\"/>\n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.BackOffice\"/>\n    <class name=\"fr.pasteque.pos.forms.MenuMaintenance\"/>\n    <class name=\"fr.pasteque.pos.admin.ResourcesPanel\"/>\n    <class name=\"fr.pasteque.possync.ProductsSyncCreate\"/>\n    <class name=\"fr.pasteque.possync.OrdersSyncCreate\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPrinter\"/>\n    <class name=\"fr.pasteque.pos.config.JPanelConfiguration\"/>\n    <class name=\"button.print\"/>\n    <class name=\"button.opendrawer\"/>\n    <class name=\"button.openmoney\"/>\n</permissions>\n'),('1','Rôle responsable','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.customers.CustomersPayment\"/>    \n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelCloseMoney\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.debt\"/>    \n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.BackOffice\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"button.print\"/>\n    <class name=\"button.opendrawer\"/>\n    <class name=\"button.openmoney\"/>\n</permissions>\n'),('2','Rôle employé','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"button.print\"/>\n</permissions>\n');
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHAREDTICKETLINES`
--

DROP TABLE IF EXISTS `SHAREDTICKETLINES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHAREDTICKETLINES` (
  `ID` varchar(255) NOT NULL,
  `SHAREDTICKET_ID` varchar(255) NOT NULL,
  `LINE` int(11) NOT NULL,
  `PRODUCT_ID` varchar(255) DEFAULT NULL,
  `TAX_ID` varchar(255) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `DISCOUNTRATE` double DEFAULT '0',
  `PRICE` double DEFAULT NULL,
  `ATTRIBUTES` mediumblob,
  PRIMARY KEY (`ID`),
  KEY `SHARED_TICKET_LINES_FK_1` (`SHAREDTICKET_ID`),
  KEY `SHARED_TICKET_LINES_FK_2` (`PRODUCT_ID`),
  KEY `SHARED_TICKET_LINES_FK_3` (`TAX_ID`),
  CONSTRAINT `SHARED_TICKET_LINES_FK_1` FOREIGN KEY (`SHAREDTICKET_ID`) REFERENCES `SHAREDTICKETS` (`ID`),
  CONSTRAINT `SHARED_TICKET_LINES_FK_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `SHARED_TICKET_LINES_FK_3` FOREIGN KEY (`TAX_ID`) REFERENCES `TAXES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHAREDTICKETLINES`
--

LOCK TABLES `SHAREDTICKETLINES` WRITE;
/*!40000 ALTER TABLE `SHAREDTICKETLINES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHAREDTICKETLINES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHAREDTICKETS`
--

DROP TABLE IF EXISTS `SHAREDTICKETS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHAREDTICKETS` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `CUSTCOUNT` int(11) DEFAULT NULL,
  `TARIFFAREA_ID` int(11) DEFAULT NULL,
  `DISCOUNTPROFILE_ID` int(11) DEFAULT NULL,
  `DISCOUNTRATE` double DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SHARED_TICKET_FK_1` (`CUSTOMER_ID`),
  KEY `SHARED_TICKET_FK_2` (`TARIFFAREA_ID`),
  KEY `SHARED_TICKET_FK_3` (`DISCOUNTPROFILE_ID`),
  CONSTRAINT `SHARED_TICKET_FK_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMERS` (`ID`),
  CONSTRAINT `SHARED_TICKET_FK_2` FOREIGN KEY (`TARIFFAREA_ID`) REFERENCES `TARIFFAREAS` (`ID`),
  CONSTRAINT `SHARED_TICKET_FK_3` FOREIGN KEY (`DISCOUNTPROFILE_ID`) REFERENCES `DISCOUNTPROFILES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHAREDTICKETS`
--

LOCK TABLES `SHAREDTICKETS` WRITE;
/*!40000 ALTER TABLE `SHAREDTICKETS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHAREDTICKETS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCKCURRENT`
--

DROP TABLE IF EXISTS `STOCKCURRENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCKCURRENT` (
  `LOCATION` varchar(255) NOT NULL,
  `PRODUCT` varchar(255) NOT NULL,
  `ATTRIBUTESETINSTANCE_ID` varchar(255) DEFAULT NULL,
  `UNITS` double NOT NULL,
  UNIQUE KEY `STOCKCURRENT_INX` (`LOCATION`,`PRODUCT`,`ATTRIBUTESETINSTANCE_ID`),
  KEY `STOCKCURRENT_FK_1` (`PRODUCT`),
  KEY `STOCKCURRENT_ATTSETINST` (`ATTRIBUTESETINSTANCE_ID`),
  CONSTRAINT `STOCKCURRENT_FK_1` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `STOCKCURRENT_ATTSETINST` FOREIGN KEY (`ATTRIBUTESETINSTANCE_ID`) REFERENCES `ATTRIBUTESETINSTANCE` (`ID`),
  CONSTRAINT `STOCKCURRENT_FK_2` FOREIGN KEY (`LOCATION`) REFERENCES `LOCATIONS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCKCURRENT`
--

LOCK TABLES `STOCKCURRENT` WRITE;
/*!40000 ALTER TABLE `STOCKCURRENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `STOCKCURRENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCKDIARY`
--

DROP TABLE IF EXISTS `STOCKDIARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCKDIARY` (
  `ID` varchar(255) NOT NULL,
  `DATENEW` datetime NOT NULL,
  `REASON` int(11) NOT NULL,
  `LOCATION` varchar(255) NOT NULL,
  `PRODUCT` varchar(255) NOT NULL,
  `ATTRIBUTESETINSTANCE_ID` varchar(255) DEFAULT NULL,
  `UNITS` double NOT NULL,
  `PRICE` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `STOCKDIARY_FK_1` (`PRODUCT`),
  KEY `STOCKDIARY_ATTSETINST` (`ATTRIBUTESETINSTANCE_ID`),
  KEY `STOCKDIARY_FK_2` (`LOCATION`),
  KEY `STOCKDIARY_INX_1` (`DATENEW`),
  CONSTRAINT `STOCKDIARY_FK_1` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `STOCKDIARY_ATTSETINST` FOREIGN KEY (`ATTRIBUTESETINSTANCE_ID`) REFERENCES `ATTRIBUTESETINSTANCE` (`ID`),
  CONSTRAINT `STOCKDIARY_FK_2` FOREIGN KEY (`LOCATION`) REFERENCES `LOCATIONS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCKDIARY`
--

LOCK TABLES `STOCKDIARY` WRITE;
/*!40000 ALTER TABLE `STOCKDIARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `STOCKDIARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCKLEVEL`
--

DROP TABLE IF EXISTS `STOCKLEVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCKLEVEL` (
  `ID` varchar(255) NOT NULL,
  `LOCATION` varchar(255) NOT NULL,
  `PRODUCT` varchar(255) NOT NULL,
  `STOCKSECURITY` double DEFAULT NULL,
  `STOCKMAXIMUM` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STOCKLEVEL_PRODUCT` (`PRODUCT`),
  KEY `STOCKLEVEL_LOCATION` (`LOCATION`),
  CONSTRAINT `STOCKLEVEL_PRODUCT` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `STOCKLEVEL_LOCATION` FOREIGN KEY (`LOCATION`) REFERENCES `LOCATIONS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCKLEVEL`
--

LOCK TABLES `STOCKLEVEL` WRITE;
/*!40000 ALTER TABLE `STOCKLEVEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `STOCKLEVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCK_INVENTORY`
--

DROP TABLE IF EXISTS `STOCK_INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_INVENTORY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` varchar(255) NOT NULL,
  `DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCK_INVENTORY`
--

LOCK TABLES `STOCK_INVENTORY` WRITE;
/*!40000 ALTER TABLE `STOCK_INVENTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `STOCK_INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCK_INVENTORYITEM`
--

DROP TABLE IF EXISTS `STOCK_INVENTORYITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK_INVENTORYITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INVENTORY_ID` int(11) NOT NULL,
  `PRODUCT_ID` varchar(255) NOT NULL,
  `ATTRSETINST_ID` varchar(255) DEFAULT NULL,
  `QTY` double NOT NULL,
  `LOSTQTY` double NOT NULL,
  `DEFECTQTY` double NOT NULL,
  `MISSINGQTY` double NOT NULL,
  `UNITVALUE` double NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `STOCK_INVENTORYITEM_INX` (`INVENTORY_ID`,`PRODUCT_ID`,`ATTRSETINST_ID`),
  KEY `STOCK_INVENTORYITEM_FK_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `STOCK_INVENTORYITEM_FK_INVENTORY` FOREIGN KEY (`INVENTORY_ID`) REFERENCES `STOCK_INVENTORY` (`ID`),
  CONSTRAINT `STOCK_INVENTORYITEM_FK_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCK_INVENTORYITEM`
--

LOCK TABLES `STOCK_INVENTORYITEM` WRITE;
/*!40000 ALTER TABLE `STOCK_INVENTORYITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `STOCK_INVENTORYITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBGROUPS`
--

DROP TABLE IF EXISTS `SUBGROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUBGROUPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPOSITION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `REQUIRED` bit(1) NOT NULL DEFAULT b'1',
  `IMAGE` mediumblob,
  `DISPORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SUBGROUPS_FK_1` (`COMPOSITION`),
  CONSTRAINT `SUBGROUPS_FK_1` FOREIGN KEY (`COMPOSITION`) REFERENCES `PRODUCTS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBGROUPS`
--

LOCK TABLES `SUBGROUPS` WRITE;
/*!40000 ALTER TABLE `SUBGROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUBGROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBGROUPS_PROD`
--

DROP TABLE IF EXISTS `SUBGROUPS_PROD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUBGROUPS_PROD` (
  `SUBGROUP` int(11) NOT NULL,
  `PRODUCT` varchar(255) NOT NULL,
  `DISPORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`SUBGROUP`,`PRODUCT`),
  KEY `SUBGROUPS_PROD_FK_2` (`PRODUCT`),
  CONSTRAINT `SUBGROUPS_PROD_FK_1` FOREIGN KEY (`SUBGROUP`) REFERENCES `SUBGROUPS` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `SUBGROUPS_PROD_FK_2` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBGROUPS_PROD`
--

LOCK TABLES `SUBGROUPS_PROD` WRITE;
/*!40000 ALTER TABLE `SUBGROUPS_PROD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUBGROUPS_PROD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARIFFAREAS`
--

DROP TABLE IF EXISTS `TARIFFAREAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARIFFAREAS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `TARIFFORDER` int(11) DEFAULT '0',
  `NOTES` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TARIFFAREAS_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARIFFAREAS`
--

LOCK TABLES `TARIFFAREAS` WRITE;
/*!40000 ALTER TABLE `TARIFFAREAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARIFFAREAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARIFFAREAS_PROD`
--

DROP TABLE IF EXISTS `TARIFFAREAS_PROD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARIFFAREAS_PROD` (
  `TARIFFID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCTID` varchar(255) NOT NULL,
  `PRICESELL` double NOT NULL,
  PRIMARY KEY (`TARIFFID`,`PRODUCTID`),
  KEY `TARIFFAREAS_PROD_FK_2` (`PRODUCTID`),
  CONSTRAINT `TARIFFAREAS_PROD_FK_1` FOREIGN KEY (`TARIFFID`) REFERENCES `TARIFFAREAS` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `TARIFFAREAS_PROD_FK_2` FOREIGN KEY (`PRODUCTID`) REFERENCES `PRODUCTS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARIFFAREAS_PROD`
--

LOCK TABLES `TARIFFAREAS_PROD` WRITE;
/*!40000 ALTER TABLE `TARIFFAREAS_PROD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARIFFAREAS_PROD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAXCATEGORIES`
--

DROP TABLE IF EXISTS `TAXCATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXCATEGORIES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TAXCAT_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAXCATEGORIES`
--

LOCK TABLES `TAXCATEGORIES` WRITE;
/*!40000 ALTER TABLE `TAXCATEGORIES` DISABLE KEYS */;
INSERT INTO `TAXCATEGORIES` VALUES ('000','Sans TVA'),('003','TVA 10%'),('001','TVA 2,1%'),('004','TVA 20%'),('002','TVA 5,5%');
/*!40000 ALTER TABLE `TAXCATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAXCUSTCATEGORIES`
--

DROP TABLE IF EXISTS `TAXCUSTCATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXCUSTCATEGORIES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TAXCUSTCAT_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAXCUSTCATEGORIES`
--

LOCK TABLES `TAXCUSTCATEGORIES` WRITE;
/*!40000 ALTER TABLE `TAXCUSTCATEGORIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAXCUSTCATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAXES`
--

DROP TABLE IF EXISTS `TAXES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXES` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALIDFROM` datetime NOT NULL DEFAULT '2001-01-01 00:00:00',
  `CATEGORY` varchar(255) NOT NULL,
  `CUSTCATEGORY` varchar(255) DEFAULT NULL,
  `PARENTID` varchar(255) DEFAULT NULL,
  `RATE` double NOT NULL,
  `RATECASCADE` bit(1) NOT NULL DEFAULT b'0',
  `RATEORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TAXES_NAME_INX` (`NAME`),
  KEY `TAXES_CAT_FK` (`CATEGORY`),
  KEY `TAXES_CUSTCAT_FK` (`CUSTCATEGORY`),
  KEY `TAXES_TAXES_FK` (`PARENTID`),
  CONSTRAINT `TAXES_CAT_FK` FOREIGN KEY (`CATEGORY`) REFERENCES `TAXCATEGORIES` (`ID`),
  CONSTRAINT `TAXES_CUSTCAT_FK` FOREIGN KEY (`CUSTCATEGORY`) REFERENCES `TAXCUSTCATEGORIES` (`ID`),
  CONSTRAINT `TAXES_TAXES_FK` FOREIGN KEY (`PARENTID`) REFERENCES `TAXES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAXES`
--

LOCK TABLES `TAXES` WRITE;
/*!40000 ALTER TABLE `TAXES` DISABLE KEYS */;
INSERT INTO `TAXES` VALUES ('000','Sans TVA','2001-01-01 00:00:00','000',NULL,NULL,0,'\0',NULL),('001','TVA 2,1%','2001-01-01 00:00:00','001',NULL,NULL,0.021,'\0',NULL),('002','TVA 5,5%','2001-01-01 00:00:00','002',NULL,NULL,0.055,'\0',NULL),('003','TVA 10%','2001-01-01 00:00:00','003',NULL,NULL,0.1,'\0',NULL),('004','TVA 20%','2001-01-01 00:00:00','004',NULL,NULL,0.2,'\0',NULL);
/*!40000 ALTER TABLE `TAXES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAXLINES`
--

DROP TABLE IF EXISTS `TAXLINES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXLINES` (
  `ID` varchar(255) NOT NULL,
  `RECEIPT` varchar(255) NOT NULL,
  `TAXID` varchar(255) NOT NULL,
  `BASE` double NOT NULL,
  `AMOUNT` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TAXLINES_TAX` (`TAXID`),
  KEY `TAXLINES_RECEIPT` (`RECEIPT`),
  CONSTRAINT `TAXLINES_TAX` FOREIGN KEY (`TAXID`) REFERENCES `TAXES` (`ID`),
  CONSTRAINT `TAXLINES_RECEIPT` FOREIGN KEY (`RECEIPT`) REFERENCES `RECEIPTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAXLINES`
--

LOCK TABLES `TAXLINES` WRITE;
/*!40000 ALTER TABLE `TAXLINES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAXLINES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THIRDPARTIES`
--

DROP TABLE IF EXISTS `THIRDPARTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `THIRDPARTIES` (
  `ID` varchar(255) NOT NULL,
  `CIF` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CONTACTCOMM` varchar(255) DEFAULT NULL,
  `CONTACTFACT` varchar(255) DEFAULT NULL,
  `PAYRULE` varchar(255) DEFAULT NULL,
  `FAXNUMBER` varchar(255) DEFAULT NULL,
  `PHONENUMBER` varchar(255) DEFAULT NULL,
  `MOBILENUMBER` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `WEBPAGE` varchar(255) DEFAULT NULL,
  `NOTES` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `THIRDPARTIES_CIF_INX` (`CIF`),
  UNIQUE KEY `THIRDPARTIES_NAME_INX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THIRDPARTIES`
--

LOCK TABLES `THIRDPARTIES` WRITE;
/*!40000 ALTER TABLE `THIRDPARTIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `THIRDPARTIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKETLINES`
--

DROP TABLE IF EXISTS `TICKETLINES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKETLINES` (
  `TICKET` varchar(255) NOT NULL,
  `LINE` int(11) NOT NULL,
  `PRODUCT` varchar(255) DEFAULT NULL,
  `ATTRIBUTESETINSTANCE_ID` varchar(255) DEFAULT NULL,
  `UNITS` double NOT NULL,
  `PRICE` double NOT NULL,
  `TAXID` varchar(255) NOT NULL,
  `DISCOUNTRATE` double NOT NULL DEFAULT '0',
  `ATTRIBUTES` mediumblob,
  PRIMARY KEY (`TICKET`,`LINE`),
  KEY `TICKETLINES_FK_2` (`PRODUCT`),
  KEY `TICKETLINES_ATTSETINST` (`ATTRIBUTESETINSTANCE_ID`),
  KEY `TICKETLINES_FK_3` (`TAXID`),
  CONSTRAINT `TICKETLINES_FK_TICKET` FOREIGN KEY (`TICKET`) REFERENCES `TICKETS` (`ID`),
  CONSTRAINT `TICKETLINES_FK_2` FOREIGN KEY (`PRODUCT`) REFERENCES `PRODUCTS` (`ID`),
  CONSTRAINT `TICKETLINES_ATTSETINST` FOREIGN KEY (`ATTRIBUTESETINSTANCE_ID`) REFERENCES `ATTRIBUTESETINSTANCE` (`ID`),
  CONSTRAINT `TICKETLINES_FK_3` FOREIGN KEY (`TAXID`) REFERENCES `TAXES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKETLINES`
--

LOCK TABLES `TICKETLINES` WRITE;
/*!40000 ALTER TABLE `TICKETLINES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TICKETLINES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKETS`
--

DROP TABLE IF EXISTS `TICKETS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKETS` (
  `ID` varchar(255) NOT NULL,
  `TICKETTYPE` int(11) NOT NULL DEFAULT '0',
  `TICKETID` int(11) NOT NULL,
  `PERSON` varchar(255) NOT NULL,
  `CUSTOMER` varchar(255) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0',
  `CUSTCOUNT` int(11) DEFAULT NULL,
  `TARIFFAREA` int(11) DEFAULT NULL,
  `DISCOUNTRATE` double NOT NULL DEFAULT '0',
  `DISCOUNTPROFILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TICKETS_FK_2` (`PERSON`),
  KEY `TICKETS_CUSTOMERS_FK` (`CUSTOMER`),
  KEY `TICKETS_TARIFFAREA_FK` (`TARIFFAREA`),
  KEY `TICKETS_DISCOUNTPROFILE` (`DISCOUNTPROFILE_ID`),
  KEY `TICKETS_TICKETID` (`TICKETTYPE`,`TICKETID`),
  CONSTRAINT `TICKETS_FK_ID` FOREIGN KEY (`ID`) REFERENCES `RECEIPTS` (`ID`),
  CONSTRAINT `TICKETS_FK_2` FOREIGN KEY (`PERSON`) REFERENCES `PEOPLE` (`ID`),
  CONSTRAINT `TICKETS_CUSTOMERS_FK` FOREIGN KEY (`CUSTOMER`) REFERENCES `CUSTOMERS` (`ID`),
  CONSTRAINT `TICKETS_TARIFFAREA_FK` FOREIGN KEY (`TARIFFAREA`) REFERENCES `TARIFFAREAS` (`ID`),
  CONSTRAINT `TICKETS_DISCOUNTPROFILE` FOREIGN KEY (`DISCOUNTPROFILE_ID`) REFERENCES `DISCOUNTPROFILES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKETS`
--

LOCK TABLES `TICKETS` WRITE;
/*!40000 ALTER TABLE `TICKETS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TICKETS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-07 15:03:06
