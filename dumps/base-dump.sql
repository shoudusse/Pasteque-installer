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
INSERT INTO `CATEGORIES` VALUES ('-1',NULL,'PrÃ©-paiement',NULL,NULL,NULL),('0',NULL,'Formules',NULL,NULL,NULL),('000',NULL,'CatÃ©gorie standard',NULL,NULL,NULL);
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
INSERT INTO `CURRENCIES` VALUES (1,'Euro','â‚¬',',',' ',1,'#,##0.00$','','');
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
INSERT INTO `FLOORS` VALUES ('0','Salle','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0€\0\0à\0\0\05ÑÜä\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0ĞIDATxÚì½	xÇu {\nûJ¬ÄF @ 	.¢Q¢(K¶äÈ›æ=ËÖxÆ(“ù2NŞOâñË7Ùl\'óÍ$™yy\'3­ÄÊD’ÇRl)-Y¤$’ vî Hp@+Abêİpq{©µ»ºo÷E•\rñŞÛµuuWŸ¿Ï9u\naŒA\'tÒI\'tÒI§¥“Òôè¤“N:é¤“N:i\0ÔI\'tÒI\'tÒI N:é¤“N:é¤“N\Z\0uÒI\'tÒI\'tÒ\0¨“N:é¤“N:é¤“@tÒI\'tÒI\'4\0ê¤“N:é¤“N:é¤P\'tÒI\'tÒI\'\r€:é¤“N:é¤“N:i\0ÔI\'tÒI\'tÒI N:é¤“N:é¤“N\Z\0uÒI\'tÒI\'tÒ\0¨“N:é¤“N:é¤“@tÒI\'tÒI\'\r€:é¤“N:é¤“N:i\0ÔI\'tÒI\'tÒ)S†—Â>ôê¤“N:%!ıø³X?ƒuÒ)âs8™Ik\0uÒI\'tÒI\'–XÒ\0¨“N:é¤“N:é´ÄRF2ÿíOÇôÍjÊ@„ßæ¾#{n’	Qk´çC”²ü|ä¼´œôŞøŸUF$\'ÏÄ„¤kÉ6äë“=U}S“°Ï…°d.Ì,„9õZÅX´<é&6‚‰-~Å˜Ú¦µ‰1§Vl­³êÃÎo˜ÔL.ƒíõáï’ËcJÿHÿÅ˜İGSôş™òbŞ¹`S6R^k»Ø1F´ñÁ´3tôÏ9&¶:1m¼äóÙÏÚGL:3Â¹ŠôŸrDûå¸¶˜uÑë”¹^ÌûO2/w.Yæ&Îm{~û=Ë/–©ˆ9Ï«%€NA€lß°MÄ.Œ&2Á1L*áıReìCYì¯tá¯já`zì¯R¿è¤“NQIÿ~Y‚N:‘ÓíØßğÂç[±¿ØßØ_oì¯ïî¿4f6\0aş?sÊ3¬ÍÇ¦W}l G5Oâ[\\S…çKRË,a\0Äƒ..\0øì¿YûPû«‹ı­®(Z™^VX%Pš_	•Å«æé/-*‹V\nèvÔk¿„K(¯yS¡	dç³&Ğkíî5uî%UèøIkª½âi1qôpR4l\r”]³d×ª(ÑB15’š4Ï\Z>\Z7åš@Eı\"jÍÄê¤öp½˜÷çœãß¦¦&ò\'&Fó_&§Æa|ü6ŒÀèèM¿oıÇÁØ¡Øß…Øßå»v|üÖ<&şëEË,Q\0ôcĞ·.öáØ_cíò¦¬Uåk¡®¼	ê–¯‹^UT;[ C%&¢©4¦@ ­%LAÒxĞúÇÊÏ*#2˜ƒ8^Ëóó¹«O¬ne½ÔNJìc!±¬æ‡ÖâË2?iuÑÊ“¾-¸‚Ø ŒüP%ü\Z{n Œ‰mØ@¢¯ÈÒ³VÛÛÿBÿÈõÆbs	»ÀX?£zÌÒ<˜Ê ¼X¯];R‹-™Î‘©Ù0´\Z˜.(?/ÔGªı@ıàäËG#´ğ/¶\\_ÖXbÛ}`ÖÙÇ4^¶ñ1õÍ/%ô|¬~‰æ#öá~1ÎÁÙÿÄSkş\Z8ó9®CkF¹ÄëEèáz1ï?Î9ÇófffÏıÑ^BÆ\'n—\rßØ>û»9ÒoûÉõØÏÄşŞ½kÇ#·‚‚À%€* ğŸıåå±o[\rğk¬ŞR°¥n7¬©ÚYÙà…;\r\Z5ªƒ@^]2‹€áĞ¢\Z*\0¹‡@ÓwÏH‚\'ZàÅ4Ÿ¿7$ƒ‚*$Ã²ÎA2¾î!0vHÁÆŒk \04hW˜1s²ó¡²\"/öW7÷}tt¸òFÿµÊ7®xëØçŒıİ¹ãá?!P ü£ç\\û§¥|YÍ†ÍµwÁ–Õ»  §D}SÁ’¸e‚‚@À$\rÑ…@  O8!0!\"\nF)¬\n?È\\\'A$;ã»ˆ€‚@XèŸ<º†(&Ú4i>A îhùÀZÆEkgÕº‡@Öõ@°i e Ğœ?/¯êò–Aíª\r04x}]oß•uƒƒ×áè±Å¿Á)wÜ2\Z\0%!ğû•¦ØÇÖª’ºÆİë?M5Ûæ/2¢–\"ª)£E1‰\rb@«!0x¤!”hóTvÓµ\',)À¹êİ@ 0µ‡HAP\"*àçÆ\0e>ge?€¨$B ³^ eº\rÚÁÎÆ¿—TBqq%LNAWwûşŞWöÇ@ğµX†#1œ”ƒ@ö0¹	aìB½F¡ÿŸş[@1ÿı›ÏıÊœÆoEYÃ†½>\r•Í¶lö%ŞBÄˆæÿÂ5eÄÆC¦¼Hü<Hª.7í»/»´†òJÕ%³0€´8Dfa­Eê\'Œ9õ›`±…!Öêi‹lß±àÂÓO¼Å$˜±ø…µ˜ƒY·¨Ó?añ‚£3ÆH2ô‹ã>`,t .¬°µí\"ÄŠÜ‚R¿öß6)1kÑ‚>n{ĞÏY]ˆ˜©éIèêj‡Ş—affúç1|<WXu’çøÿÓøòR×\0ò5f1ğËısOq~ùİ÷où¬«ÙF¬>ª4î5†Z”&Ğy.²Ø¥5Ahéu+Ô.h¤üÑ’új7?³ßıifS¶–@N¿1šï,hÙ€&€éç\'ë%¬	?ÚÂ9Ï…¨&¯Isj•\\jÒ|×’úÅï?PÆÖ‹&À5 jAúz¡	ŒŸ{fFÔÕn„êê5påÊéû{±1v¤mç½‡%5@ĞÎ/q\0dÃÒ7Ÿûr+Bißİô ì^ÿ0d¤g²)iHÒğ¥\n¸[T’tƒ]\Z½B  Rg\r|à¯6‡@(¸ƒ@º`&À\"8†(O¸‡@pµàCè‹`Ü@ »ë$\Zy²2³¡¡á¨¨¨]u¡ã½UGıSuìÀ«;v|lÜrÿƒ}5½U:b&1%u+8Ì1>Åàï²ÂÊ‡¿tÿ×a_ó£1øË ”ÀdM #&¶Îëƒx>º¹‰œO4/ËÆ†¥ŒmîËˆáD\r‹\"¿€d,]Ÿ—üö²Ø·ÚiHåg!ä\"Bby‘Èq$R–áÖ€œ¸GjÓñ+BÔ©ŸâÔ;ÿİŞ?r}ÈqFY…ÜCd9òQäì\"·‹H} ô-~C_¤Á:\'äè\'\'/2aä¥Q¢‡ä±!Ô‰eô·o|È^;\"´MÊGè#çÚ\"ËVYÈuÿ%µ=™k`;WjßLçël“œ—Û?Ûœ•¹ÿâÿ-((…-›ïšê5wÅ¾~êØ±Zç8¦;ZÀ„\0\0‰>2±¿o=÷«•±¿‡7®jİı…ı¿\rË‹VpÄ¼BÈ 4¦ÊöMC ä#a°ˆ \\C [»‡@PŒ’„@ä;‚KD>A xƒ@„|…@ğÁ5\nÁ8Íí‚[4åG(V­ZMëZ×edd>ƒÀ=Q„À´äwÁŠLßzî+w¤§eüêƒÛ>ÛúK;¾8ËÁ\rÛ¾y@L¨QC †@\ra…@1½`p!-„øB8ê’ˆƒ@…š4—Hƒ­Ô€@ÚÛu„üÅÅ°yÓ^ÈÏ/:ƒÀ‡Èõ#*j\04!SşîÎÏYö‰ÏïûMØÖ°×‘ƒî!„X2ˆC	XC †À@!…\n‘/ˆ|@¾â	arDJ!›W‘¿èJÃ‚\Z¾¤@ RyÌÊÊ…æ»`yùÊ»bøpì/ÓZ?0 Pà\\úös_¹gY^éƒŸÛ÷[P]ºšª­\'B(!ŸŸnÊi\\º¡‚@ğAQĞ.! 	H!\"IS¤ßˆÔiøò!%ˆ„Líî ©ƒ@¤‘gœ9”\r\r[¡ºª¡5öÓGbXLºà<üıÚşòeÕû?ïoAIÁràNŠø¦\"úUNC _ˆÜZÒÈÓØ¹„@ˆ\n‚7D~A HB @ä4sÔ:•A ¨ÕğY®¯!PlL„À$!‰úùÑÇ‘\Z„{¿¶vƒáh@à=1¬bA Ò&à9ø»¯ª¤öÏíû*æƒ˜¯]Ğ!€@ÁÅ/\Z—4ºz·” ÇÔƒ@P(¤ˆü†@ƒ@.Ø¹†@¯\0BêŸÏš4•\Z>\\ì\n/‚GD‚y™HX˜$sï×T¯úÕ›·Ç>¶&4Î{vÉk\0¿ıÜ¯ß]R°|ßc»¿9YùÒ\0æ\Z±JÄÊ!K-öĞ¨!PJçÅ¥R„A x„@o‹ø¢¨\n¢ D)€@ë9¸é?\n	\"A°s	–ûÏİ½_QQkh\rÜÃš¯K\0ïÈË.xğ31ø‹ı+WŠ TB X?d 4j9Šg:¢%\0(2Hğˆ¥õRH¶TB%àÎ‘²º\ZÑ®·xÿ7&¢,Bˆ 15•u†ğca…ÀdàêŒôÌO|z×—m>\"p}…ÿ!P6¬Œ†@\r\n E	a	@ ¤,‚kDÂ>frè¢Ä <@ ¿_nûï¸^I@Ñ¼,DÔ¹K»÷ëêš¡¤¤rG$Ï×¥	€-kù<T—ÖèÊ[>âÈ@ $eC¾$y%4F!ˆÔC B\n ôYC``ˆ¼ú£¤IóÈ;\"Îªeˆ”@ €Ï¢\'i4Lük¶AnnÁİ1ÜÁx¢,\0|pkı®MëWŞÉÀ7‚ˆC¢¦cª\níz‰3¨!PC e¶“ƒ@’_ <\"6\\J@ Øâ\n@]\nC (…@ÿ4iŞ ¼C å:¨€@Ùk š7y˜8§´´tXÛ¸İø÷có+ƒ==•#\r€;Ê–Uİ½ë§¿ªÖ/„C èy©†º !PT(§Ô¸t!Ğé_èebÊA (ƒ@ªĞ’‚@pÄĞŠ ¹Œë–¸Ân ÊÑ/Jœ½dC ÒŒ„s•¹^Äş	j\rÅ ¦(7·\0êj7\Z_[Ã³p°\0X”‘ù±Gw~bÿÒALC †@á¢ˆ}„@/¨¦!P‚)ˆ¿İœ ZÍØì]F¼@ Q»\'àeW×ºƒ@·š4ÑÕµÉ„@å1=B;ì¼A X¬Jcepiiõö£Ç^Ü\0ïŞµá!([VÉ±¤B —-á4†ÁGôŠj\Z5ú\r4p‘‡@H*¢€ \\B üÂ\n·š4D¾B R.€×ôê@‡ÀúÕ[ ##óV.¥@ĞëJ\nÊïjY{7D ·úWBJA ìşÁAA ÚÂ©©»°OˆR‘ˆB ò	A1\"Å.!Ğ-Ü¹€-å(Ø/¡}†ÃàffdÂÊ•ë-KIØ²ë§ =-\";m$yÛ´…!¤(]KıĞ¦Š­ƒ@•ÀD¾A ø\0 !Dˆ,[ÖÉ™\"­  úE\nİÃ«8{ˆä¿éºØ\'™*|8“\r•Ëk!/oYëÑc/n^\n\0xWCÕÆuõU©v\r\Z=\r\Zı„@ŞVêª <C häB Û€½ğBˆcNd¬\n3¯{—ˆ”­ævëçç\'\Z÷X}İ&ãKkª`\ZBiİ»å\\ÈÓE”-z[!,´\Zƒ‡@H1Dá†@¤ã«tiı”‡@i/ °İA GM\Zeƒ(û´~y@äbŸa¨&D‘óÜK!µ>îLe\0¼cmÍf(-\\.y\Z£jÊ¨‡@QL]€¡!pÉC òA\r\"Ÿ $!9ĞŒXF\n‘¬æF‘bt«IC”ñc´\"§¦÷I–€@H*ºÛZ®¨n4>$ÕĞo\0lÙÙt¿ä-%t‹\Z5j¤ëÑ|‚@H>²±P‘¤CÔ„ ¾˜C\rò\0j¾B+‰=iÒ\\B”ï® ù\0È7tvª 0?¿ŠŠ–×<ú4Ú˜Š\0¸¡®b]Meñ*“¤²¯ë]Úè^c¨!0ydÀh\r¢K\0A\ZéB\\B ÜC À®\rI‚@\0õ¨L“æ	‘/!¹¿œ˜‚a„À-`Ò|ıÀ–ÖuûP‚i\"Ş\rbŸV*B Naôºpè»4z…@¤!	dß9Pà‚ ¢B Š Ê.5i®!<B r\rŞB¿xé#bÈU@à²¢rÈÏ/ªôiT“J\0XZ\\P¾¦®bJ”A éˆŠ·+n´•2ù@Eó†y# !0è€Ñaƒ@ĞÈÖü¹†@v^oˆ”A ¢€€\"ß!PUe—š4\rŸ2üıYõ«ÁŠîò\"¢‹âß*+WÏ)ÌR	\0·n\\µ/I…@¹v­úFBÈ 4¦ÊöMC ä#a°ˆ|ƒ@¾v ÁBh!Ğ=D!7pGÈGİ…d‰A x„@‡»‚–—VCZZú>2S\0·l¬m¡ÃÖ¢B#Ìˆ¹µˆC -¢!PC †@z.(ŠéUC b·ë‘\'D!‡@Q“œ8\"(¨X%D	C \0Ü%‘(¾šÛÚÛ•Àôô,()®0>®M\0¬Z^´¢dY~)¶¬JÀğ@ <(ŠB HY(êë,bOèvÿ`\rK!tˆ”C ø|MÁ%¢€ $!q!Œ”mÜøZ¨`!ĞÜàÕ…ô±¯¤÷â±\'ËJç\\\0_\rì\0®k¨Ş dC Ü\nâ  PÄl¡„@~~/0§!PC`¸!’	(\nŞ ù å ,Tw`^ıí‘O(P§(‚Ja,.®4ú¸éÑ§QPÛóÎ¥ê¬_µ¼qA¡…ÿÂâw+¾,œşÜ!ëqÓQ“H3×„	d~›Î’Œ~QòrÌA BÄ²û(ÚOr}Ä¾PKÒú„Ş`Šè”©›6~¬sWQÕOö/öôíç¿öDïpOƒ—	Ñ¼êÎ#¹Y¹cmûô‰Ò‚òq™öùˆ\\uÏsX¶¥ÀóÇÚşÖ¹Ÿ()(ëúŸø“§pİ‰œÆ”ÃX ±nÛqK&k	VMó¿ ùg¶>ú/Hó¿b;bLl11æö£±Z,íÙëE¶R‰ş9Ø{´ğ‹iPìçd‹åHÀØ‘ÇùİÜs»æo¦ü¦lä8øîO¶¿ßqüÀ²¼¢®/=ôÕ§,Ô™h…R·e¬y-ç¸¼±vç»?B\ZWZÿlu.´i®Ç:’Ö¾ÑÛ›Œ±sìmç€Æsò%®/#_î0­ÿæû–ÓS>f¿„¯û\\÷_¬N„Ÿ-Á¬9¿nÎ{/~4#=\nò‹aäÖàŠØOW¢\n€™é™õ5¥uÂ@æO\Zİ€†@uéä•·wÿ¶]8r eÍîƒïı•#Q…@Ó	‘ã{—Vÿ¸í‡ºİ_í¾î¨@ Şd!VO²!ĞQÎG<{åıêCï½øñ‘Ñájò8’„¶&¬*´s÷ l¨ƒ@ƒ(A‚;|‹ã‡Ü@ °ı€@vßøf¨gäeBàê`ëTìó²eå\0Ö	€ªÕÕ•Å+c4›É0ª0óëäÇş™ƒí]/úÀ ºuœŒ9K-öĞæ`•É€ÀÿùÊŸPÛ~°æ`\0o&ágŞúŞc$ø3g“js0)¿so–9˜V‚äšƒåæ`äİû{éÄ?<f…?4ß¹ÕæfeªùÅ/	ÆÿC,s*ˆ›S‘ 9•kæEÜ|–:¥ûOîÏ,½ë	·oˆy½ˆ÷ˆP^Úı—8¾¬°Ìø§Lª5€õ«*\Z´Y^5n4}dMœµfEš@XxkA*4bı°¾½òu@ä~kM WÅ5¾euëajŒMæ¼òÎnšFğ¥wŸïzğOZRš@Ir«ß¦	¤o5Í[Êiš=	M ûFR§	´kíxš@0ë«híıT“ÆÔğ™Úé—#_B.`jÿÍ÷‡Xÿ×K‰&}½œ÷æ¥İó¿\0öu†à?‹g£€+ªJVQ  ÊTStØ P<_ nnS‚I™™cï}òˆ ã|şèßnıôËØó=ÿÚ+\0.!T^?Ş\"\n\0ˆòà\0¥è@ Y÷GÍ:<×„!ÄL‘PQ\rQÁ@ ¿_~A c¼”C \\^\Z¦§gBnn!ŒŞ\\;r=\0Tm®,_VÍ0ª6[ët×&©f7[ÇQú¦ÌLkÅK>•æ`Ù¸É0‹”P»:ø“;?w\"zÏØóİ¨~ïÒ±jpÕ¾š¾©„4?“Úıƒı2S¯Bæ`¢AØfN%õ]ÄÌ\n¤9˜Ğ6È˜ƒ\n¬sÂÌZ•ÌŒ)ˆVı:ò±Í¤^Ì©\"ı²ôÑÖ/O±Mfoä¢ÿë%²òš{\rìæ{ÕË”{OôşËË]f|¬€€’J\r`VfFVQa^GsäŸ&Ğ}›\"š@ö¢”Äqp¶mÒí<İx¡ëBË­±Û5SÓ“…’”•‘5’Ÿ[Ğµ¶¦©mcİ¦v¶&PV³‡!XM x-‰èÊÄµmŞñ‰Sï\\|«£w¸Û²š¸ãú¹š­«wt«×ÕiM ¿š@ ”§¬ã%hÁ¹h‹Cä5`YCÕè	h­/‰n5À_èÁÑò PFhµëø¯	$j³d%Äòuõ\\iìéëi™˜¯™™ìHOOÉÊÊê*+-m«¨XŞîZ¸µJÛª	îÊkák`|ÃS5åz‘4‹$`ÓòŠhós¡`y°hY^‰\" ‹2’ÛË~óä‘==-gã!…L/x–ïxNO;F\0ãóbŞ4I™/ßŠÓôyq@‘C\0xz¬ğÖäHS[g_Ó•—ÛölÚw0?\'BÔ	\"˜ÃÃFµX[Şà\0À±ÉÛ9|]³ş¾şİ—û:\ZìõieYı©ªâš®Ç÷~ùˆ|şèSÛ»/W·÷œŞn?føAÆÀõpİò5İ{Ö?Ğ!iF}¯Ÿ~éÒ1ã<~óûŸÿİø÷ûÑoüy}EÓ şÃ±§¶ÆÆñıKÇöLÍLÇÓÃSRP>ø‰Ö\'NÈ@àßşËİ\':Xì|åÁ¯ÿùêŠuƒ´òùò·é¸~Æ2f_~ğwbe\Zí˜…Áÿøç?•;»X®|YUÇ®¦û¼qö•İ}7­aˆê+›Nlª½óÔ]ëîë C`\"|Ê?øûíÆ}vòòÛ±ñ™\"OÓÊ-GJòK?zçc\'¨PiZÏ¿õÔî÷/_›²ÂŠ¯<üõ§^ûğ§;{Ûbû¦ºdå©•Ëë;>²í“\'D ğŸßùñö¶ó‡‰÷ÌÀÈ†?~æ·ï™Çïû•?_Q^7(D°“€À¹—ù\0!prr<ûLÇéC7C*;PáôdZSWÿí¦á›7ÛV×ÕÌÈÌœğA\"üó\Z\0ğVË\\/ØÉäÍÊÎ›c©(`I\05ÚÛ~ëÔû]ÁßâÄ´şfÍ‹©Ç­ˆxîk†´ôHËŞÁK-GNÂìG¶ì§j¡.ÜHÇB£*òIÛ–¨a¢^~„•ûjÿÅÆß{—ïùxëgŸ1šHßŸùç†Ÿ¾óÜ#£·JhåĞj»pø@ì^ùà…î\'îùÊ3\r•óÀ”&ğ¥w´ñç¾ğq\Zô™S<ÏÛoì~ğO¿°»é@‡Jj¹€ 	¤èüæÒğíš<ş·Oê»Åâ¼ÒAX4MàÏßÿÉÆ×O½ôq\Zô™ÓÙ«ïÏÏ{ïŞ¿åáv¬İ×Áƒ@{2î—?ûÇß}òæèuuw÷àÕÆß‡—NìşhËcÏlXµ¥›[0NbWC\\èçx‚@€0 ğìÅ3û]Á_dÇèàLKg\'Ì66®ù©wM ØÂá¸Á8ïQ&N&˜““?ÇRA JÀ‚¼œBÛc·ƒ‡\nŸ@Ù]C‚ò	Lü÷½öw7w÷wï Ikø\nœ˜hˆöVFšìñ{Ò:i‘İ5	aâ¶÷>£x\Zzn]ÙñNû‰fÖù©İ?XO ú01¢ F?Ò3t­ÆşÅÏşèüÙ!íGo}ÿ‰çş`»h¯ß½t´ú¹XüÙ“Îå;/ûÉëgK€‰ÂêÒÓ‡¿³ûå÷~ô˜üÙ!å…¶§»Ø{®ÀÙ[¡~#úˆ[3‘<İxçvÿÖGOĞ|Ÿ}ã{»}ğÂc\"ğgÓH—¼üÎó]¾q¡„êcH9Û±ÉÑüÙóş´í™Ç†oæPı]ŞD2>ÖÈâ³fS{ŞD6~(§?šù¿l´‹W;6DJvÜšŞÑİİÓìÉ\'pñR~ÇmHjß×‹yÿqü8ãß²2ç¦lA5€¹9Yyí—š@ªS®M\0v÷šÀK=—ZÒ\0™üé“–¬’§¼é™ëF6§#Şg_ğƒH/‚‹=í­Û\Z·ŸäkÌÂ¥	”+ëNw(cX½xı\\ÉÕşK}Ë\n+Ej5â’L±qó¦±ËÈĞíR\Zó²óÇ¼ãÓ§xøÓw=@:ŞXµáDq~Ù\\_cm4Ûcø°+»û×úúNİØ|j¨\\×Œƒs/D6sm^vÁàÆ•w,šg‹òJÇh}5‚HÚGÒ±5¦~ÆúXr0F»?{÷Ùİ¿ú‘ßyAV“gz–ÛŞG­åÙúÂ…	ˆ1,Ö¬üÁõ+·œ8sõ}Ãœ[b˜‡KòËÆImpùíêw/¾EŸúÊu\'ŠòJæÆgxt°$v_Æg*ç•^Øı¯÷ÿÆ|s0Cdå\r®­i>1>5–{îÚ‡»IøÚ‡?ÛşK;?B\nùb´³jy}×øäØÜ=;÷=Ó& ÉšÁ5Õëï™Â¼â1ïš@¶Ò©	„í’€éØ¡Y¢„“±i‹nô_¤ìl­®®>IÕÌ	k› µàÆvÒG½&\\¯ñ[fÆ\\åÜh`f\n¼™)Ëb&±:ÅÛäÀ§›«t>çm*vû[—ÍÃáA›ø`8ğµS‰	œø7-ÃíñÛUâ°”šèN˜¨gàV_Îßüâÿ{ÌËğ£kmÜÛÁ«Í€Ç¸	Óœæwù²=Í†¦Ğ‚¯ŸşçŞñ©S¬ó7ÀÊîSh€Ù—öõ©¸yw!ùÙ»?ÚøÒ»?²œ“ÑæÀ­K–“ pëêİÆŸñùÔÕw·›° §pĞr.Œ?rö Z*Šª;~ùÀ¿ÆÜv|<şëßxÌ0‰[M‘W\Zhx&ÀÃ†@àm_²˜V”Öúõ}ã™…œG^h{z{yaÕ m)ÊÑs¯:Æ§|YeÇöÿÆ3Åy¥ã¶g×ßùÙ7ë\Z¸lŸëƒ×\Zh\0DÓX.\n”ôÌñİîÿÉ¾M=·Ä^NÿğÕï<Ö?Òk÷ÎŞvÃÂp„÷oÃª­İëWmé6¾^è>½İ€±—šÁïü?`»½“°ø¦oÈÒL†S‘”SSSUæñÊøzƒ@\0¹-ò‚YÈã32²@•&àôô´4¢	”l”ß;bªˆ™{yÇåv‘7ÏÌÎd[-ê|7ß\rgWQÂ†š†ı6›ª4cÆ7q3l²ÌÁGÎløáëßİı‡ÏşÖ×Œ/ö[W·.-(çÕôÓwsÀŸV†\0sé+ıÎ†VĞnú4üYgÓ3tÍaöİ»á#mğ7—ŠÁdËš=í¿k½k1uef5AÃÍvH¥Àß\\úê#¿ÿŒ‘Ç>ô†§âab¸5 NÌÉØKÂçîùÊOÌÈõHËgOÜÕt_‡s×ùOWû:šíÚCşæ4†ÈiÒıòC¿ıŒ‘Çª»]Â2…²Îô;>ñÌ¾M;e.Wœ_:şø½_~Æ€Cs^«É¼9Ø†!šÙZn×†Ä®HÜÔ\'N!ª9˜d2œ¤ì0ú-fæ¥™ƒ‘€9˜0vÜİQ\'œ=¤õqi¦†»AiğèÓ(=j\ZÀŒù-àXš·³öòeiİFL˜¸ºX©ï(òİ˜{#2ı_/\Z,Z½&PMš@+<Ü.ù­¿şW¿ëe¢Äb÷gƒIÓÛ3´‡và1´]Î\0ÒÖô¥û¿zğkO}É¢e»Ø{Ş€³2ÆíSWŞi~hNsèLw¯»Ïñ{UñŠA¦ÖK	…ŒÕÇæïeƒe1øcÕ__±î”C‹Êì¯Ç¢áfèuZ4”ÂÆµ.)(§\Z_»† ØT»ı°ùNñ`Ü\\l^lKukNYXâì6y³{R*[VÑÑºno´\\./ªêè¸bÑ6^í»X²²¼¼z×†6Êâ¸@Ö\0™5XÌ!¦¹Ñ‚ë=zR\",;d| œX\ZãmŸd«&Î…XZ\\èeÅ/m¥szZ:LÏÌ\Z05%\0¤BPàHÈï/ÄxáZGİµ×\ZGë÷±‰±*¼x÷“•–\n¾–	ìÍw#~\0›Tnßù¯¨°{á¼ìüãEµ´°ìâªåuíëV®ïLuô’æÌ•ü_ÏˆœË©«ïÖØl«¿ë„H+‹Wt˜MŸ×‡®5°ÎoWbå¿ùüÿıDmùšÏÙ4†f0öwÄ#ÏIz|YóÉª?\'+oŒ˜Ÿbó”¶*Škºè°C†ÀÏìúÒ²¾ÜÜW+ædæq{Šø¸¢tuG\\±B2uæ\rvö¹·›È6p¤å)2Ô½j ˜¦Èk½Wêú{Gnßœ““U0[éAÙqâí·i²geeÆäšÍÍÍ¹¸¬hY{YYi§ˆ¼C Ëtë?ÈîBƒ|_Bç#\0b¦ÈM\rœ˜šÊ8~úøî¾îÖé™é<éRí»aÑ©‚\'ßÄ_â.kÅøâos`Öü¡ñé©jãóµ›7W\\¸´çØÙ7FW–×ß½qïá¬Ìœi\r	­ßæÚí\'>±óó\'€qWšÓå¦ã—Ş}ş±ØŸtûH\Z\ZÅÒE’µ=Ã?//û{ƒvó¨áhü/âñÿŒÅ+4Í`(’ÕÓ«·„¶DÜ$ P\0Vè¡£­©¶lM7[ãE×ò>½òÁoİ(¡-!n%g@gZY^×m…*+’@Ó€­b\Z€\rœ¼ıƒç!€»uW\085=™qºãƒ=}C7ZgfgòäïµÊšqªÜ˜™“#ãã+nŞ\ZŞsíj×è²e…ÇW­Zq8==}\Z³Ë(†Àù˜‚ŞBúÈ.öà…Š$\0‚e}”Ê¼@ 0Ì²<‚`~ëÃ·ö\\êî¼ß¬ˆ€ï˜î–Éov–Ï±ÒioPY³€2ç|Vò:û/ì»ôó}kª×¾rÏæı‡£\rÖd@Ğ–Õ-sºĞs¦™äëg¤¯æ?›æ£FºkıÒ>ßÈM\0 óü»û_?óıWÿÛ“,ˆŒ¯ÀÖÜêàš’ÚîOî|â„2yà,GúááïÌ™.0;öÅÂı[!€ät¬1)È)C;† ğÙ7ş×Üø\\î®é\ZèÜ({n4$¥üìÂ1°\0˜¹wQpÒSé`~ØşÎî¾k÷»¸‘•ârÇäÆğ­¡}Cï+))y¥®nåaQ3¯R´r®!·Ç\rF\0% MÊÜB Ûöì8:p³¿è½óì¹>`[’/3‡ím41qò|7°s’cûÛé³¹ÌâV:xn‚_¸~îşÑ‰Ñ¢–µ;—-N¸[YìL™™cŸİûËG»¹yéİØøóşÉœøŸÿßˆ•ùyÛ7ï}R£·GsZÀOİuó©ŸqAÇ“±ò7ömGvğxÇÂ*__’‰!nİÈù»#ß¥†ÆqC•‚‹rûcÙ¹e\ns‹Ç)¸Ç„À¡Ûı9Ï¾ù½M;‹x\'dYâ…€F€…¹Eãö³µB m<McA@Ö€z…@Ë&&ğ\n7o\r»|fÏÀp_‹§+QÙáVnÜ?}aª¨ººêpn^î°,‚Dèq×«¹ÁÑ&Yk‡Àˆ ¯G?¿W;Zn4+bñIÀğİ\09ß\rd«Ÿ5y¾¶I‰×ş™0Éã£—¡gèjË›g&s›Vl8¾nå†Îä@ ±ä‹¤[4öü5|é~ıüK3\ZŸßb%!Ğ™âqÿÜÜ~Eù¥c¼32v‰ıı¹aB½Ú©†‚ÆXœÓŞßõcPSò?ıW©`Õ~@ –‚@çúVÙıGD!ğÒö’§^ıïO,®äU32àØ÷‰iä¡ŠÛ©%û‹B YË#¤…W¯_®»ÚÛÙ:|k¨YÕ½5ÙáEnÜº=ÒrõêlnYYÉñRÃ?PíÚ]5è>¤Ë·‘”7\0Ğdùúƒ#ƒ…jáØÑ­ï€¤ï†y‚ÒßÒìy0eBUıñvbÿïém>{\r ¬hù@YaùH*CàÖÕ­İ·Æo>ó£·zÂn>}öÍ¿~lYnÑSõ„Ğ*¢½hY³ë$\"½i­ÏÇ\rãï ±=œáx¹ïqÿáx2IÇ\0ğ)?Xÿû¿bj\'çy~Ñ‡±Bø#±ó0ÌÄ\'(Á£ÕC ¬ş8HôÖ÷aÁß†•[d/øâ•”îßòñSÆÎ!ÎàÑó¯…aYŸU® Q&É8/àÇGnß,TÈ4%#,;ÜÊ±ñÛÍıı\0yy¹9¹¹#áƒ@_Í-Ñ@kØ— !pn0±Yí¾½÷Î½wøÊ[ã»IóÛv`Àæ•\\$ÿ\rû¤§ªúMUôİ¼Ñ|üì[cµ<ò¢¨îEw¯¿¿£óÆ…ƒ\'.¼qÀª)»]ò÷oü¯G¾öÉo=Åj\'^gd~ƒ\'¯¼ÓÀ@¯æcgù¹ı„ç÷[ûGŸÚ~¦ëıvdÁ¡ŠD\nV=Å{ÒVi|r4—?9Mz9&\"&Ş.q4\r—µ¾ßÙVİw³Ç1>Ûêï>ø™]_<b>Góê`c·1”ã{ä± ıfŒ9I„@\01®ù_Îv¼G™æ/Ò²Ã»Ümîêê[³¦şEYŸ@\'uÕ¯;”é#\n¦4ªÅ6M í;ˆ²ûóÛ{óƒ£{¯ô¶(™¼ñzİún&-Ñ·ƒmI¼]™ı4\0Yv3Àö‰(â¿A}Ã3}¥îk-¯½ÿÊ^ş=Ãºş¬{Éş„’-ÇkO¼çï}òHEQ•c§Şá¹\0Ñ¼vŒ£Æöiöß]4Üôˆ—¾õü¿â7ÿú‰ßÿûüï~í©/~–÷;Ÿ8ñÛŸü“§Œ6öcæ=U\'~í¿íİğà,ø3ÒµÎÉÉJ}ï\Z¼\\ÂÚÿwèv\r[“\'P9q5¤Üg®½ç8Ï]M÷¿ğØ\"üYj]üŞ=p¹˜ú<±³á\nŸ-\0q¿U\Z8:Ç‰¹0X÷ğååg¶÷{I9ÿöŞ~>¶Ó‹°ìP#7FFnµtv^ÙË‚@34yO`Ä¯S\"¸·=\09=u¤0Ú8>9–u¹çò~uğŞ|7\0è¾œ	,ç»a{[óßp¼í™a!OGOûş±ÉÑ,ÿ!Ğ¯r¬~Zù»¾ø‚±jØ~äıKm{Œ-ŞxílY½£Û^ŞĞ\"şğõ¿äúåıŞ3¿ñdèæÿXù—/«¶h\r“µaúe@…­ŒhÊÊÈgÊ;‰tÇêÌíôó¯}ïb#]ì=[Â´„]¾Ñ^MÒ\ZéÇÇÿf»}¿È±Mu-´ÿ\Z«„‡GãÓÙ×^âòtªdÌÌÈ\ZGDj!pbz2«»ïªB¹#-;TÊÁÁ¡ıÓÓ3YˆqŸøuŠB ğ!0Â\0È½è@à‰3ïîR6‰‰êz…¾Èïfún$ü1\\ùo`[û¶.¾uúÈ.Ñmã¢õ•kïZ·Ï±eš	ó‹ï<&ÒÎ–Õ­3m8|æ Îşâgß|Ä’feY=3n_ÓŠÍ2V+nIùÅg»>´h#\rXm`ø7&\00Ë²erz2\\>şŞ<÷ó´BüµQ}ÿø“×ğ!´9}í½íF<E{oßï<V}ôÜ«˜5*‡@şˆoÿÅFç¶qóßøsúşÙ…¤Ê!7ˆ¨h.»·Æls(y…@ƒ@ÄÀSï)•A¤e‡j¹qõêµ]ö-×ÂbÚ=2¯ÿóEmœEW¯_İ§d(Ì[÷P|7Wß\r»†‘~ºÎ7,bŒ&’ ÈûoØ¾›Ó¥ëû&g¦Ò—~bçã\'V–­vÀ—hó¦`v;mûÔ	cã{ûï?zëO gAC3ø{Ïü»\'IáQîßüÈaÖ™ìY ƒ´gîùÉ7üáëß±hïßyùÛOÚµ]M5›N¸™&††ÎĞ6\Z°ù·±º)Ği vÂğáñ³?|Ä¬Ñ3Àï÷ı\'Yğwst(‡\'‰[ïq@±1&úâ7|ù½mœ×$/ùŞÏÿôÀS¯ı÷\'©Ú?AäsmßìåŞéxóÀ_ıóŸ<b¬6kışøù¯=ùşŒ426œ#HYåŒ}„ÛÎi¸y{ çşp÷ğíÁ¿!8‹1êéïR+7RFv¨‘CCÃûbò9İ¢@ <@ ¨Æ\\eJB³K¦ı˜ú…!–\Z1p†œ¿r¾QÉ[œãÙIöİ€°ùnP|\0İúoĞØæì•Ó\r›Vo9/ºmıúÓËˆ/ğğ²„l\Zà÷ıÚOşøù¯7ØÁX$r÷º{OÕW®¤µjnşÌİÿê™¼úÿ:4/ÄáÛƒAf[Öì>È^82ŸH \rà1@Š§I3àñ“;Ÿ8,2bËr‹{‡­İyî­ï?ñ|ôŒFì·±2ùõÓ/;v+1Æà¿ıô÷¥bŞ]ºfÔÁ#x÷šª\r\'ì;‰í¿üŞóÅş$Õ:¤İGdBÁX<Ø?°åÑSoyepÔ¶\n¸ãúÙíß}ùÛRãÓ;ÔUµÛ»Ûe™EgYÆâ‚şºadòÎ%\nr—\röôZÊ¾ôöxéíùÏ%ùeƒ{7=xÊâ\\/º0¬Ûã1óÛ¶Ä‹½Ô}Á¹iÙ¡^nô÷\r4,¯(?oÃhÿgİæÍy½Å¶ƒC‹DáıÂÚë™Ô7ZLA‘-#¦´ê×°¶/<šÀşë\'q¼!Ç[„ÀwQ|7“@‰ÿ)uõ_mäköXš@±2j4\"HÿÅ€¸û6ô\'¤’	S0½UŞ>u×O‘ü	yÉ€¿Ç÷şÊ‘32ÚÙ»á#/È¶aÀŸ¬İNlí0ÍÑ1A_B£Ùq ™¿¯\\ªüÿs÷“‹óË„}-ÿD Ğ/Mà\'vşKéñYQZçŸ®Á+5NM‰wM [	H×n\\uÇ)¹Hš—€4}C½êåFÄe‡rãæÍ‘ÆÅ«Ä5|Îë-¦	´æU¥	´ÖIÒF\0-²™\rfa„À[£·k<Obbvšïöä»!4iºÄ	¨¼^ü7œ&œá\Zöõ$ŞPœkœl¤—7‚DóMÁôVw¯?Ğñï?ùÍ?k^µíˆô¬>õ…{ı»óğ\'~FÆ¶n_¸÷ß~—´Â—˜{şÁg¿óçÆ.\"¢ãe„•1ÊÉéÎâğ¸³;vN?éŸ~ŸÚù…§~ó‘ßÆnŞ¾Ø{n£È#×€Úo|æÏ¾kÄdå3 kOïÛôÈAQM ØóŞi³cAàæºÖîÇv}éË—UqÇÇ\0¿·>şÔW>úŸÉÍ²ºtö¶ot ’¹^2ˆ¸Ø²vOÇ–Õ­¹u$	GÇ}fP‹ ìğCnLLLÔX®‡;çºq5ˆ”@ J\n*5›·8±dæpæ³÷Ë<19QêíM4‰Ãw<ùnP\'°Kjzlzó¢GsWã¿aOã“c¥À¸rä»K&îŸ\ZspSÍ¦Sµåõr³€Ü’a\nşÙ;Ï;B»8}Ûèæà/Şÿï!xğÈ™ƒ\r—ot8VoÆùø\'w~ş„hÿhšÀØß\\@g»ÿ_üÆ‹hÇVÂ®¢æóÏíıò‘nûô‰Ÿ¾óœÃ4iÔm¿Í±\r·.œ&÷àñXıæB{×ä`ÿ­ŞšüåÁë÷ÿflÜñÁ8öÔöÑÉÛ9f®]ŞØ½»é@ÇX–loØm•â<ó,6#çÂ×†ÊõEùeƒæ\')­\\âÙl@àæº–¹ñùû7şŠ8>1H<Ÿ´Fñ»›ö¼Õg[™no-ôpm\\ûƒæGNQ^ÉÉd\ZWj­(_½X&–Í•Y¬¬7ÑGïúÜ‘}›?zâÕşÉqÏ¬­iî šw0OL©—(.F#+;ÔËéééR°_\rÎ¾»‹f^ Åâ3[¯>i\'ÒÓ\0B¦j[Ş Â\Z|ôiËE{øŞ;~©usı+É\"Ò[ŞjõîdÅ“\"S3»-klëñg>ÿcc’îê--@ŒmâÉ4H/œNLì4 ~6ô±Î	…}7op˜¢¾ŸuúnàYóçùgnf@ú²X¿gMågİûoX†¡™/<ğoş€¾\Z	é„Üççk%Ø9‘À\r.ÛË#_Ÿ—ü^ú¦òÓ¿BX2fâé©mÚb,Z“_º1©B¿bÌÑ±b¾ÅÆRfÕGX(ˆÙVluL#×áhÑÜL±aâ92ëıÿÅ7¤\\n²av<Â²£`Ú¹qÇ[ÿ€x/`Òu\'çs^oÛõÅöR¤{ÁšÚdŞ×>Ó3Sßúñgñ8øœ|ñ´˜2s0~@y1»ÄñÊKöm=¾\0bû4(õß°Êœø8«2ïmöºBÎ$ìº‡^êöŠK~¼Ç\"Ÿ!É\\l3.ïÕÄ†ïH´¼˜9˜üâLù!Îká(â¿¤‹šƒ‰¦V[^¶¿•˜yÙÌÁ¬øƒ²æ`_ä†éyMÙáÜ Ş\"æ`Óuõ¾ê—#’_\'µo\'åq\0IoSî!zşúJObŠ\nŸìbß\r‚‡*ÿ\ryØÒÈËçu\r\ZÃ\rd@s\0v_F…è‡Üˆ¸ìğOn0 L\n‘:tN&èëVpŞ!za@Ö$Ço\nÀwƒ»\Z³	yÉ>¨õß…@™ÂAB ÚX©ªA0å!i”ƒ@¤‘KôGnDYvø+7T@ ˆA 7°4mSø!Ğ÷­à°³B‰ş>R’‘¢ÀÙ&#€DÌ&ì>fb6Y“gŸ ˜\ZÙ<Åm¢ö”8Î² “òĞµ´!Ğm`êA X˜1D!ù\nH1‚BWè‡Ü@‘—şÈ\r\'şûd¸óâÛF\0Yà6$·—–6!÷ìgøo¢¹ó}7À½ïÍqWÆwƒÍÔøo˜SzZú„,ùü2\Z5ª€@^ U!|…@H	4ÿ4êóÌƒÜ@8Ú²Ã¹À	3¯{—È\n\'>T®ÄŠ!P|u\Z&êí¢·]vVö€ğ$æùoÄ}7\0‚ñİ\0ğè»AzÓóÇï/\'+w\0+Û\nÎ\rÊ–	\nE‡ˆœ™†ÀpA ¤¢pC R	‹š>bìLä†Y‹AÙá‡ÜÈÌÈƒ;Zü?ä‘‹}†Ã>­V \rîë3R~n~Ø3_Äïl¼ á»©RÈ?ß\r°îõà›ß_anaù^	\nÕ”Q¢˜$º\0CCà’‡@ä‚\ZD>A HB 2iqeH˜—ãƒÜH	Ù¡Vndggõğ5|Èä;Æ‚Oy\0ƒ@¬±—Å¶ãUe•ç¸ÏyQÿ\rÓ[œ¼ïPÕ÷‰ún8¶îAì7=Pë¿aN+ÊW£ß+\Z5.DÒuIB $ÙX(HÒ0à“•ÅÕêåF\Z´ìğCn,[Vt¤á.Ü%QÈ!Ğ\0Ä‚Ê B`ÃÊÕüç» ÿÁĞ±1w¾\0|ß\rÛæß*ı7Ì©iÕúöõÓ¨±ë¹¬!Ğ?„%\0 \rôEàY àç?×U­Q.7P*ÉEr£byE	îTA ò¬U¿2y\r`ø Ö—‘1³²¢æ5ê$–ñß ø\0\"d}óC(d¾·5•ñşæS]eıkÆ8óµÆQ€@·+‹“nÀ\Z½B ÒÈ„@ò» Áœÿl<ÏjÊVª•6ÀèÉµr£¤¸äµô´´ À8º[ğÁ‡@p	(i¨\0qˆ!$ pkÓæ7ÉÏb9ÿ\rdcÛC`ôTß\rZ4÷xSÊâıìhÚù&whOŠ°B ±40:l\ZÙš?×ÈÂë\r‘467lS+7R@v¨”µ«jß$ï–…@9¸³ç@Ê!ĞZg„5€8Òÿ57;gbUÕÊC¶g¼ÿÅL\rØ)ë»±ø†%è»1KØI‰Ün5€ÿ\r#ÕW­9”—“?áì4Feû¦!Ğò‘0XD¾A _»‡@†ÀÜ¬¼‰ËkÕÉ\r„#-;TÊ²Ò²CÙYYÔñ7C B¾B ø‘@Õˆ>Lê!ĞüëÎMÛ_¯(]ŞæÉƒ¶²K•ïx‹Ù¤­zˆ¯j&quiMÛŞ-û^÷v\Z5F\rQ (¦T\rˆİ®äJ–FBàöuw¿^^\\©Dn ÊÂÈÈErcYá²¶5õk^Ÿ(d×Óa+xD‘„@ß|\0Õ@ ôü…À-k›QRXrrî=Éÿ†i›Tß\r”<ß\r ­öuşåEå\'·­m9L¾.ÁC Ö¨!00„ĞA RàŠ	J\ZBàØ¼zë/ŠóK½ËˆËr#?¿àdíŠÚÃÒp8‚KD„ÕïÁA ¯[ÁE‹‹F\ZVÔ/)ŒMfòş=Ówƒ9m“J¹ï¢¬Úò~3\Zğ·vEÓñØ¿Ãôë,òóó ĞM9\r\ZÃLDQ@ä\n‹JFêªÖ/Î/ó&7Ì&à(Ê© •åÇc8ì\nîÀ¼úÛ+\"Ÿ (LÊğ·z<çc€,·%\"±[¸Ù1²¼Ñêbl‹pÜøoıŠºÎ}Ğ~j¬w¨·¥/`³€ÿbúqØ~ùn˜\'0°|7¦\0¹º´ºÍĞü™á~]œ×~dóºÉOº—èßÔ”cõ“ı‹H=¢=ƒ8äéÙ Ş7uˆeaÕY9çÆùˆuÛ[2YK°jBñg	Â¶uˆğ‚4ÿ+¶C ÆÄcn?\Z«ÅÒ½^d+•èŸóˆ½G¿˜Å~şh§p1väq~7÷ÃÜ®ùÛ|ÎÕU\rEÅC§.½?Öw³ÇÜ úGDvxE…Em«VÔ.ÈÏË0ôÂ½‡í×È–/q}ùâpGÉg½oã¥È÷¡9³_sˆæ:ƒK>¬÷Õ‹Š&°dYñğ=wîz±¶²ö<•x\Z\'&bmÚ£á»	æ·)ö<ô@ËC/&àsõÄî48Iš@¿ÊiM š@WïØH¼PêiIùå4´z$Wè(GÕ‚kM`IAéğ®M÷¾¸²lµ{¹‘aÙá2•—–ÚØÔübÁœæ£IÑğ	äs®$føè94H±&0Â\Z@»nMDh=õpj_w4ßyxËÚMÇŞ=óŞ®şë­30±£™x^…ŸäM»3gç&?J·iE\'°é€ï¾Wme¤gŒ®(_y|Ç†oädåNŠé²Ä5@ÌKÓgiM ÖzRìI×4FEèÔàÅŸÖ–—7†&VO²5rM 84{²š@ã¿w6İu¸¹~ë±.¼½ëúPOë,L‰É\rãcÆÒéié£ÅEÅÇj×¼‘‘™1×ğaĞ¤q5|°HÑ\\\rŸh>‹&Ğ|½Å5	ş±j#€Ø:z…@2Pª€Àœ¬¬É»¶ìx5öñÕ‹×.Õu÷õ4Ü¬åK«¦ÌÌP&¤UMDÄïOüŠçåäwAJ\nK/®\\¾²}íÊ¦NàâA 5jŠgµA uî…	Ğ•rH‡:YÌ½·¬ß5\'7:¯wÔ]èj¾=ToèøÆFF«YwI*Êì¬ìîØ?³ùyK‹JÚ+–WuZBÒœÊ„@Ó•w	¹€B õn1C`„5€N1ªï5óÅ¯KÆ¿×¯Xİiü9Ô·„= ~ñöáö\ruíÈ(™òî»!ğV&³Él\n°æ©.«>¶ûŸò\rQˆ`@Èæ%_Be‚ƒ@Ş(kŒ<:àMC Ğ´q„@¼06u•\rÆ¦º0a“÷†£§t0B²£¤¨ôØæ¦­?pFõµ}ÆVä“Õ¤ùü~©„À “¯[Á‘CgÈøêQüôFcÆJ¯!b˜Á©	¯ò­·*O¯i›êÉ†ÙÑtÀ³È½ï°ßÊ°ıÍLÈw#ÑVUiUÛ]ï>än†¿ß—ú°aa_72±ÿXyeC¾$Ã\'P¤„ö	tÃs~R»°_>ï;!Ÿ@ëfV‹ˆŸ@–ÿa>„¶ÁEˆ˜øØ€@~Ó¾È[·*hÈ’e%mMõ!Ç8ò}å¨ÁAÂ§éëgê»­_ô-û…8q	ı·æEZ}\\ì£&0~c\"^;Áh‰z©¹C‰ã¹9¹÷lßóâùËÎ^ºv©åVÿí“ÓÓ’”™‘y+?\'ÿÚšmëk×·\'ŞD‘u¸«qù\Z$¯š@\01ÿA–&PV³‡!XM x-iM Ö²4@)OYÇKĞ‚s-0ĞVÛ5i|M X\"©\Z=M õ%Ñ­&øš=&ìz“Ó\'SshøbÃí(obgó/v·Ÿ½z½³e´/&;fÂ#;ÒÓÓoåfç^«*¯i[Qµª=1–ç\"©IŠ†Ï?M yì]jã+u0½_âšÀH ¶=hX(ê«—\Zh¤µµkÚ×Õ6¶óßîÉQÕyæXÄÑ? Z´vj‰0A \ryd Ğ\rÔ	\"˜ÃÃÆ0@ kıš†@ÅE&ÈÒ…•\n´’¤–\r%ˆçªGÒ´<.!Ğ(U_İØnüYÁÖlyÂD‹¶9blÏE¨Ìşh˜tÔ¬b´Õ†g©dÁÎƒù•%ˆÜ/²|ö7)7;ÍmªÌ´˜|Óº6ÛofÓ³à9ñÌÁ¼Ğ\'îÚ$Õ,vEÄ\\Šmzû´\Z;¢ùDÏ‹u~\0à{~\0÷æ`^Y‘¢æ`ìº‡â ÊËjs°¸9xA\n–3Ó…9LŒœ9ØÙa·æ`gY»9X`K.$fŞµš±Ù»Œ¸5;s˜}ÏÌ‹‹Ù»^Ä?#{ÿÉf\\vèkÿT˜y­ù«`Ëds°3Ÿ¥N‘ş/°»~|1;uAê5tŞ5<mŸ?šÀó—Û/^ël­™š*‹\Z?3#s$?\'¿«aÅš90qáÃIM €øâ¨hİkîèù¼i½êë´&P•&0.—´&Ğ®	$kéÜh­\Z*¶Ğ…&ğRW{ã•ë—ZF\'Fk¦gÂ#;2Ò3Fr²sºğÊªÚvçXšt¢\n5@¢,\ZlÙ\\¹&£Eûa\0Ä Ğì¹‘j86>–}ìä‰½7Z/Âˆµg$ÓÓ.ndû¼˜7\r7\Zwl1˜¸’O£ÂÛ“·šŞíhêºq­í®æ»æçäM¤*Ò¯iò!@e˜˜Ô‡@ÕïÏ©‰‘r†›‘…@p-‚ÃçÏMïH0Gr plr,ûİóÇô\rõ†VvLLŞnêè½ÙÔ?Ô×¶¾¡ù`vVÖ„ŠÕµÎñ…;qØBÉ†@°ç.ù°\n˜eÊ”0\n®ÚÅæc®ÌÁb}&£µe_õŒáøÉ·÷»‚?ãÔmƒ˜ŸííÚËg`HËÌêq¸1{¥å­Soí§®Åö=_¢iÛ5$(s°\\YåùùÂlöZ;\r«ü,¬9˜W—Œ9ˆÛ—Èšƒµm¯æ` šB9‘m,h&TÓwspBCEë1’2¿w¾m¿+øK‚ì¸™v½åìÅ“û¹¦uas0i¼DÍ¼Èj*g˜]ÃŒ<™ƒiıG„{0ø@|\r‚KÄJ!^ß‡Nm¾>Ğ»ƒôL¶>Ûœû#ÑmƒÀùÆ&½}P\\-\\<\r½·®íxÿÂûÍ<\rÜüü2\Z5ª€@7Qx 4:ZB64şw¦óÃÍ7†®GJv÷í¸tõB³ÿ(	w.!¤!	@ P!0È¤Ôì\\hÁ6­\nùÏÙŒ<lîÂ1As0{‹:RŸañ×K×:ëºû®7×Šöñ‰ñ*Œ±ø3™Â’0&-Y%OyÓ3×l±$·J/‚;>øŒñG<…X¹Ù¹=±Ñ›-),¹¸bnµÚì¼gÅÊ°úÅ\ZÙò\"¶9„ÎE¾neUûFËœÈKÏ\"0šoC–=LŒ¸9Ø\Z0šd[_eÌÁ‰şÅWÑz7›W.”Âòæà‹=êz®5ßœÛ	d|b¬\nCjÉK]?cüQNgge÷Ä>Ìä;”µW-¯îdšƒê§®æ5óº4³Vı\"Lõc/ƒúXÅVÊÉ@§ĞUĞ£ÓÖqŞ Ğ¼oßÔÔTÆÛ§ßßs½¿·uzf&Ï›ZÁ¦b·¿uÙ|0ş´‰ö‡ƒ€V‡°}PZæ¼ÿHVÕx\"è,˜>#41=Um|»9²âÚÀ•=\'Î¶Ö”¯8~×Æ»gefM/mTSF=Šb’è\ra†@òìWÄXª ÔWI´…RQ\nZ;œœ™Èxçü±==ƒ]­33ÓK^vL/ÈÁÑÑ7oìé¸Ü>ZRTz|íê¦ÃéÓÖˆ€ÚûE\nıâ£€8,hß?Ø};ñ£\'N¾»çr÷µû•Ø”ún ¾Né`Šün8›\'-aÏH”¶0ÆY³€2cÙggó®ô_Úwùçûê«^Ù½yÏa·®`QC †@\rlKMÀ€A`\"n¢{4k„ÚÎ¾±çrïE-;²ÇdGÿHï¾¾wnì«(«|¥©aıa×å;’úÅ‡@0Å dõ?Ò\ZÀÄ¢ÜÔ€ÀÁ›CE\'ÛÏî¹1Ğ×¢F’`¥¾ Èwƒ¸}€Ü‘0ïlLî‹×/Ü?61V´mí¶ÃeEåÃ²(‹$ \rÉ@|€iô\nÎ ÏKIĞÇ†@\0òâØ‚\r†Fú‹>¼ôÎŞ¡-;$dGï`Ïı“g\'‹V¯¬?\\˜_8<:5|âbf^fÿƒKş,Áfñì¼e¼-±çXÑ‹İµséÚåº÷Îœ|@	ü!ÛDRå»a™ÀŞ|7‡ÛTû¼=#í{M\ZM¦c¸>ÔÕrìÌÑÚ¯¯ÆÕ÷¶€„X›–—eş]â¥Œ—ıƒ±«_@2OòöÆtÀè°-‰ó“H^/û-!î¬ja©¯œ… @XqŒö¶L6}\'ö†¼ğÅöºw.{@	ü-AÙ1|k åBçùznt×9Wö‚ØÂ\nâ‚û¢R>pæC¼ÀŞî|8¥LWˆ¡E‚…À¡‘›…1\0l¼9Ô¬Nbøà»±XÔ»ï†cRš~Ç”ÉLTóÇ±ÿŒô5Ÿ¿v®u`d 0<(š7È¥²}ÓèùH>×ˆLÏgqŒÁKáÅó­ƒ#ıZvx·Æn6Ç\0°õÖè­BˆY¸“@„|…À “¿a`¤!Ğşkhíã‡çOß3xs¸YÙDÁwLæÓd´¾±YßÚ¨j~SSı7û›ß>Ûví:«Ù^NAC †@\r. PL/,\"ÈÜ ¬E ğı‹oßãş´ì˜û:2:Ò|ñJÇ=î5iî!º]\nA b\0$Äğ5’ëjûğİ½7ú•©îgÌ^e›àún`¢b–î»A}»3}¥–Ãïÿb¯³7^ö5óXC †À@!…\n‘/ˆØíº„@ğÖïGÏ¼¾·w¨[Ë…²cèæ`Ë™§÷ÊB”;€»‚@_LÀÑ@g‰‰É‰¬«=İûÕI‚oÅâ^Ö4ß\róİ@¶úY˜ç»asÌöİp¼é™a!Ï¥KûÇ\'Ç²ø€\'\nJäççA ›r\Z—.B¨ |@)&>MÄmWz/jÙáƒì¸1Ğ»rj*K%z‚»…|ÈŒ4\0ÊB ¾wæÔ.eØ¼j‹ôÖEğ×på»±Ø¦¨ï²½¡q¥–ùMOØwÛÚ³uéØéc»Ä\0Û½T…@¿Êiô‘ÛgÄ’…@¬y€@”|§ı¨–>Êçw¹Ñ¤ù¦á[¸GÕ@ JÊN işU-\n|Ğ\ngfgQWoÏ>5R;œtoeŒï¦\rkü\r¬Ø¹’ä|7lßÍéòõÎ}Ó3Óéîıı‚†@¬!PC ?Ú@	rL=%Hİê-`œÅ³èj_§–>Ê¾ÁûfggÒE Šu•jø p±_ˆ¤û6Ò\0è\'b_ °ãJg£*u\01@±[ß\rÂ¤%úv\0­ms7l¾€,±¿°}Rzğİ IÙsWÎ5\0GóÆ‡@¬±Ôb\r\Z@ D!\r¬“í×NiÙ€ìèîíjƒ(5\n Ğª\rÌE\0äkéÄ!s5?âÈõ=\\ø©·¿¯ÑóvLXÛóÅï\0İwƒ3å|7Àæ‡áİwƒ8‰û»\ZÕ¬üU !PC` Pv…p4!E\n{»´ì@vŞl×¤	@ R’p‡Øñÿ‚D@å\Z@)Ä<-\Zt%Càí±Ñ\ZÏ˜°dñùå‡ïrç»9¾ß¾ö42:RC¿şA (ÜhÔfÏjƒ@%„HAà­±-;cã2ÚÌ¼ Á#¢¤hÿ|\0@Q=kèï°@àÄäd©·§>%^Ğ\'4òê»á|n9\'°}Øão[Ä}\ZÉ~^|7ìi|r¼Ô¦!T([ĞoÄB=×a„d@ Rù\0ÈNLiÙ€ì˜šš*ED(C„«ˆ«kƒ†@$\04ôm\'©EB(ºuœ{œÍvı¤G¤}VÁÉî»aóİ`úq¸÷İ0§™Ù™l³é=è~ë8>ÊÆıó½ÄÔ¨!Ğ\r‚$ùÊC âÔ*ö]CæŸiZvø-;f±!£M£Äá.9Òq\0ôA±<bœîşaMÛªÇ¶ÍNÒ}7Åwƒ0A”ùnXú·8Îa‚@Pªv\rñEµrºA\rK\"ĞŒG”‰(»†@{N-;‚–î!©€@DÖğE\r}1‡ÁºšÀÌ­zLÏÊFİ^|7„&0ÍQ—8¡i“Ö›ïóI)tuá†@wĞÆ¾)¼C VôœÒè	Lå!¢¨eGP²HÜ]DF\01Lµ‘ƒ@Î>æ‡$Åq×‹ïuÛe%AMMoa´hîª|7øèeK8\rá„@ğ½¢š†@\rÉ†@-;ÜO	[ü?ÅH×ğ‰C Š\0°\nØ…¿^’ !4#u²|7Ì“ ¾¦c˜Ås£¹ËûnXŸ×Æ8\n¥Êîª]!œú˜ºûûh‰B –Êp½°ÙläîàN,¸„ÀH jß?˜<@LKK›{~2|7ìoraòİ\0 ún`ì”|*|7Ì)=-}‚\nH)R”‡®¥\r~hSÅ‡ˆA ÀJ`\"_!ŞÃx¦iÙá¿ìHC†Œ\r±Âƒ@÷pg]¤£€n!P|ÿ`wÌÎÊ\ZÀ<ß\rÂfÛ‘ğİ ùqØŞ\n½úıådå0	cMš†@,TFC †@ˆ8õª‚@ğà+³3sµì@vdff\rÈÅÙó­yİC J•@¼\Zå˜ï˜ø–—›Û#öÜäûnØÕïøn8ö`ºï¦ønĞü8,otŞnÒ‚Ü‚. a,\0QKeËŞVk3BŠA R\n¹…Zv ;r³c2š»“†*”„;—˜,íŸ\ZÀ(A`âxEYÙ9î³RÔw#>ÓœKùÙ¾Ø½ïHøn\0}7Kù½øn˜Suyõ9!@Ò(Œ#á€@Ñƒ\rXª.\r)\rÈ/5¸ĞÅê’UZv ;ÊŠËÏY!Š±Ã‡\"BÊC ïa`ÜA N\nÖ­XÙÁ®	ún˜Høn€{ß\rÓ[œkß\rJ4w¯¾æ´våÚá`Ê>@ ;XÔŠŸ‹†ÀdC —€Ñb¡£“l,œïßÚšõZv ;VT¬ê\nıbÊGÓğ!Ëê¥>¬öÑ_ÏgÌHO›©®¨x:e|7~øn\0xôİ ¼éŠxó©¶²öµŒôŒ:zøî5†\Z“AŒÖ(\n°  0##sfÕòz-;|”¥•¯¥§§ÏHÇÿsÜŒ00¾C âB`¤h82¸iİº7ÉÏ39ß\r‹ß€ß\rL}zûç»Ö½Íü…ÕÜœÛÖm{“a‚@œÂèuÿà !Ğ\rviô\nHC 0ŞÙx—–>ÊuuëßtZ‘ï¡‚@Wc†ØKbÆªÒDM9ÙÙ+*+YŸ‚.|7X½B¾Ôçó!ë5fíMÔùn©®ªîP^NŞ+Æ£<bŸ!$!P4o 7\Zƒ6\r\\Œÿ–—]0QW±FËdGeYõ¡ì¬œ	OA  <C Š¦ùY¹Šš{dµo­éÎM›^//-móä»aœÄ	Áûn\0ğ}7lA@UùnT–V¶íÚ¼ëuŞ½!¼ë4‚†À”‚@Ù¾iô|$‘\0šKíÚ¸ÿõÊ’\Z-;ÊÒ¢²¶Ík·¾®$ô‹‰¨İB 4ÜÉ@ J¡00<Ä.-ÜØØø‹âÂe\'çŞ‹Üøn˜óm›Ş\n™ïiÅ–×	¼¬ôäk·»70áµÀ-bU¥\Z5j¤çBB ˜^08¸mÍ]¿(-X®e‡Ù±¬ èdãª¦Ã`ÙH4|”|®àÌpG[”|òa/`2ÒÅR8!°¨°p¤®¦æxqaÑÉ¹d}7ÑÜío~lËü“é»Áˆæîş\ZW®9ûwXìŞy‰…@ÒU–@Q_¿`!kÔBè ùH–”4Ö¬?^ZP¡e‡Gø[YQ{<öï°¶8É‡@ê>Ã^\Z’ªµxñô°ínÄs>Èr[\"â‘ø1ó­m Å’‹~È^¹~r=¼6jW¬è\\VX8túÂ…±¾¡ş”¾€Ì¾–c\0Ô(î|7áWĞwc–°Ó¹;Ín“aöİºvËáÒeeÃÖf]SrR¹#D¼Ú@¨K.­¯”¾PKÒÛËë&?iüÌç.ÊÑÆM¤Ÿì_Dêí¡Ä!OÏ8ñ¾©@ìc!ñ¬‰œÆ”ÃX ±nÛqK&k	VM(şÜCØÆ>ˆğ’Føuá$H-ÒÚ5„7lé¯µŞDù5Õë;c 8ônÇ±±ëÃ×´ìU•·­]Õt8f²0`9l\Z-<W,~EâùÌ×%qµ?/Ü„æz¬wÁÂ1B>g{Æ8`Û}DhÛ¸ù\"«äk\\’¡	Ä4ÅË–\rß½mÛ‹++ª_ÁSi€§qR\"V°NğÉw¼Ålr¼õ¹×;8R]Uí¡û¶ßûâ¼æOÄÌšM ˆï „RÈÏïE£§5aÓ\"7…RX\\M OcGÒZu2ä£ÈÑ_ZùÒÂåÃû·>üâêåkµìHUå+µlØùbQAñ°ŠíÙ”ÄÿÒŠkøbµY\r ˆÆ%hM ¿ë1²Ör[sóák×ûàìÙ]½ıı­³0±ü™x^}Ÿô`ñvÌê~°½İ‰N`Ó•¾öÏØ…ËHÏ­.¯:¾}ıoädåLò5lÉÖ’û¬&½	BÈÓWiM`˜4®´HœHSOhÕå¹ÑÒê™«‰ißîŞpßámkvk;ÿÆ®î+­30¥e‡-¥§¥–—TßX¿éÌÌìÉxçiZ4»†¥™›[D\rŸœ&®;«=¾†oñÄ¤ö¢\n€§\0Òûš•5Ù²yó«±c¯^¾v­îz__ãğ­‘zC“:62^-ò0fún0\'°Mq¥Üw‘#·3R^N^wìŸÙ’Ââ‹5Ë«ÛV4t’Æ50\\x\nª@àöCé*~¬!PC ?(QHœ£6\r~\0˜“•7¹§ùşWc_^½Ğ}¦îZÿ•ÆÁ[ı1ÙÓFGn/9Ù‘“•ÛË6»,¯èâò’ÊöU•uØÔQlº!‚€ÀÅ6eØvİ 0ÿm\r Iffü¾\ZşÆÙ`5\\üø•—7i¾æ	,ß\r‚) –şÅŸşO@7¾Tÿ<;Òè+‚Àø„Sbı€Ea‚„àkÔbÏjƒ@*„	ºÀ\0 0\"† ñçtJqº¤üï×¾YÙñğ®Oı\'LsÃN÷+‹?ÁìÍ§\0-×¹@\0¢Ÿ!’‡À “[Á‘4AûbÓ?ôxs˜ë&ÖWçQk\riii€£á»Mæ‚X¿\'±«•µb+où>¼X”¾ajŸT#¿Ÿ^ó‰ï\ZâŞ\'P6¬Oï£}ÕõMúYHíÖqÉö	¤å·gD-ºñ	DÄ6,_²ø/éiéÑ”(m’¤AÄ±¦øïÙn¢_Ş\"Úk ×	HÀ×/eÔ|æë.{r–±A()~€>m—lóëNÒ!0\';ûú¢ğâ3!¤¾¦N&^àA [\r\\”\rù’,ä_i\r\Zå!y†@d‡@„@ kŠ8æfåERväf²ƒ²€# D´qu”:}Àˆ qT Ğ;°Ò pEeUÛÌPft|7Ú­­ZyœZLP	qÈ!ĞışÁî5{AC —8ƒ\Z5ò Pfë82ÊÄ\n”‡@Ä©Uã9k+\Z\");j–¯:Nq‚RäÃ*Œ8\0B¯(@ì3‚$baÜ°fíeùËMÙzŸ¹óİx+‹Ùdšğ¶¶*K+5¯ÙpRHÛ\n„C èy©†º !PT(§½î¬!P:å¡7_!”A`<çæúíTä­Š”ìX^\\y¬©¶ù$B° \nd‰@ Š\"¯˜\n\Z@õ!ƒ@‚À;6n<T’^Ñ6Õ“\r³£é€g‘{ß\r`¿•aû›™ïF¢­ŠÒåm­Íw\"yvkÔ¨\ZİAækC<a—†À0@ h„Ö¦=‡ÊÓj#!;Ê‹+ÚîXÛrÈ|n\\í ‚gäûŞ©€@†@”Z;´iõ.F5¶cõîb-ˆº‡²å‰ág©ÏÇòA”p%ì6ì}¥ï>b?–›3±kÛö;®\\>{¹««e´olÅäÌt„$e¤gÜÊÏÍ»¶º¦®mmíšv‹J	®ÀŞyÅ9V¼kOo[dõì\"èê`úš_Ñp2´ó£µ§2?«ŒHN¯+„E×ÏÒóy[ì¶ŒXÙ%±:ì«zù8­9ÃÍP÷ë\0âŞ¶ÕÁq+ºkÈü*MZÛ„6mvÖj]/\Zï©¾üì‚‰{·<ôâ¹«\'Ï^ì9ßr«o$&;¦B%;òr\n®­ªXİÖP³¶İJÎÕ·Ö³7­éµ¬Ä¦¬ä]Ø_cF¬>êN ²ñøœıKÜ”İEVı¢…1!­\\F‘!\\°ù+†@Áz ĞJİŞ ˆçáìAÃªÚö†Uuí·\rD{¯ä¿MÒßHÙo«¼p.‹=_„@\0k¨\0iÚ82ÚU\n°¢( @<LL 2LLêC €ZLy´hœR\r@ñœëV6·À\"ZÖ(ì´L‘÷Q²ZìÈ6 Ó1Égß	¸t4oÍ&ÀÏ«­ı‡@pÀhÃ ’O«€970poB–Ÿ¼¿Hlç¦\rÖy°Ç;ì“2fg±>“‰¹¼:ÅÛä%€:s0XâOñ¶i³9˜yÌŞûk–+«¢<?_˜ÍÁ^k§a•Ÿ…‚7‹­3„ƒ¡ıŠu)Š\Zs0PM¡ÎœÈ6ˆñJŸP2PcÍ”¤L¦±ûh\\æ6j–½ïxæ`di›·mŒlèK>k=ìñ“ßÒ.²\0¨ABH!\\B ¬¯$È0sÜT…@ĞÈÍÏ/£!PC \nä‰?U!4:ZBˆ¼ŠÙ\r.Bœ092ˆc”DŒ4\0J„pYÈ7!P¸4.%”-z[!,´\Zƒ‡@H1DŞ!ùH%ÆhĞú), cC ;¯;dÄ…@DÑœ2´”×\0j”k˜8†•A ó|Ü×§!p)A š2ê!P“°ğÓICà‡@ä‚w!$!YôsÔ2l´Æ°AH5‚È€;f>[)Œ(\0Ò*lˆC ùc¯!Ğt‹\Z5j¤ëÑ|‚@H>\"…ˆ@ İìÉ5rüüa]‚„@¡p2’Hƒ»0C {ËC AC °·qóx‰C 8,b\r¡À w\rÑHò,r© \rt—H>ê!Ô˜€-uŠ 0Ò\0Èƒ@& º†@¬!Ğ%‚è¶=êŠí¤A P•É)^÷İ`—†@/\Z¹HöåÂˆ”A ÅÏ.”(áë\'H#€Nı†¨Ï-B »Ò¨E¹×@º=Gñvå Ğ­¶ÒOÍä€†À w\rYÊÈGÂğA ¸†@c]·Ê ¼{‡8\"ß!\\B Àî\"!À4«wØE<4·ÈjßoÛNÏ½f.ì(×®õğj¶—“@Ğ˜R(Û7\rn!PL/,\"È\'l¤\ZBh!w<Œ4\0ºgË¥\0±k@‹²@/xÄ\"\nÊke Plc\r\Z5Òr¡PA ò9»;¹„@ğ(äˆ”C RÈ_Œ4\0\nÃ•gÄA/«%Œ\Zò@/X´Ô\"t§-…@‘>² PÔ×/XÄ ĞM9\rK!T¾@ „Á%¢€ $!q!Œ&ø”Û]$š¨\0%áÊ%bIàñ±†À@ Ü\nâ  PÄwB	üü^`NC`Ø ¹)¤!ĞDQ€@ğÈ/….!ĞEèG¾k\0ƒ€@\ròëÑòwĞ(ÚO?!Ppñ‹†À%\r®ôä˜šÈÓØñ!\ZÛ/Éˆü†@ƒ@.Øy‚@ù=zí¨$şßâø¥ĞN \ZIÇ¼õué@ |›K±”ŸŸ†@\r\n P¢PêA x†@)BÈ <B ¢hÛ¸À( I×=r\0ˆ]€OêA Üîì¾r}¥ ‡e! BÄ*!+…@Ğ¨!0(0:’ˆ–\0¢È@ CkÇ@ä&\\ 0ª\0(»%[ªB ¿\r/\Z:1”Ûp@ MŸÈVkŠ TB X?Hè®!PC`T!P<«\rQ” –\0BÊB ¸†@_?àC`„5€^!G±éŸA `Àh\r4¬\n/B¨ P6¬Œßˆ…z®!0Â)ù\0HC`Àˆ¸ã#Î:#€Ş \"Vm ½÷U!5!Ğ]›\")î·ãC lÜ?¿ ĞKœA\r\ZİB ò$¿@yDœZÅ!¿8BC A)ÒÎÅÿ”áWÅxîd°éÄí¿XaË©›s™ØJclºÉ¼Ô”~bÛd¤Ôcğ\0Â¶‹gïÉü/^¹Úxµ«§et|¼fzzºB’232FòròºjkV¶5ÖÖ·ÛÏ”v>ô+Î»ù‹g9îlOE›ìkOo›Ô7p¶Qüò3ÛwöÜúítç©Æ]ç[nİ®™šÍ=‘•‘5’Ÿ[Øµ¶¦©­¹nK;íªĞf¿È7ñr¼²*ÊóóˆŸ‹|İñôAçÛg»NÆî‡›5“Ó!º²G\nr—u5Õ4·m®ÛŞÎd6A\"ËšÈ5÷‰ZÈ–s|nîb;ìÊ“¾¡ùgvB óå95„?ÆÄ6ë·=}õƒÆ=g[n„ê9‘™‘9’—]ĞµºrMÛšëÛ­g\'ë( …§¢%gìÚ&.\n)ÿâò›Ë\"Ó‹¯)ïB}ö1MäXødº±¬y­í¢X£óİK´‹ĞßÅëË©ÓrHLœğ U<\0à¼C X!\r{…@¬ªÀ±‰‰ì÷O=Ğ70ØâxÁ2Ê!Ó§å;ÓÓ\Z7ŞÜwÛçÅ¼i_ãÇ‘)ïâË,›ïê|O§Qáèäí¦“—‡šzúzÛ¶7o=˜›3A‚ã¥	”¶=@àèøhö‘èèé=1Vxkr¤©­óFÓ•m{7í?˜Ÿ“?5ihóÉÚ¢˜`Ï~õÃ—\\¸ÚûadòfÓÑÎëM—ot´İ»é¡ØıP8U4ñ@y1¤à\'¸ıÆéCz¯…XvÜjú «¿©{àjÛöu»b²#oL/ÎØ\0˜p–Ş!v8ÿB.ù\Z†lòÉ\\‹½ÖïÌkı¯@=spşö»‚?ãÎ¼˜zÜ:8ç¾f`HËÌêq˜ínyûä{ûYãB>ÆÛØIšƒİ·É¾ö¼{ŒÛ6v·È\'ìwI¸\'zg/µ>ùóı¬«Â°Ç_<§×Å!¢æ`ìº‡²ÏH#½vòåı®à/	÷CÏì…–×N¾´ŸËl‚)Yæ`›å‘S^ÌL7å¹3¿yæçû]Á_î‹~¸Òrâü›ûçb.ÄŞjÎ‹9ØšCÎœÈæÖL0ãº2G\0åVöúX1\nÖC€À³.nÁßÒsÈúğÁ‰{\nÑŞÊH“=~Y\'­cõÂ@{f™{œQ<\r}·{wœ¾p®9y¨ÂQ<ø¶7i|çüÛ›»û»\"uOôÜº¼ãöcÍÉ‚@µ+„±ğ3-<~şÈæ«ı‘ººn]ÜÑÖ~¤9e …ßí8º¹{àj´dÇèµ§;ßk–ƒ@ä#\"…ÈÚ	\\B J\Zª×\0â°@ $ãG»¯÷¶8æ7‚EÖ¤%«ä)ozæº‘Í9…7ãÙñüÑôâ)¸rıZ+o\\¼A ¶u@¬Nñ6!´x©çR$ï‰­ÉZ\"]ÑÀ=g\"y?´÷œiUDvI‚@±Å!b(°˜ö/õ¶GSvÜ¸ÔJ]L‚hãà‚$\"Ë–urÛÁY!P4ô‹½Ñ@\"âB (ĞğûÉŠ8>1Yéœ6»ı­ËæƒáğÇ M|°?¶–á:’ë÷øx•È¸xÑÊaÊêåT€@Ö6mc£‘¼\'nßªb£†@7x{âvÄï‡0C /Òš*Ïhoq,¢÷EìùVE2õª€@D1Ëªƒ@Ó7n 0ò\0è€@‚@8‚2ÎÎÎf[ï	u¾Èƒï†s8PâB¤a˜‰÷[\ZíÇÃÛ¤²òÌÌÎDôXè·kÄŒoÉ„@oab¼BàÌìtDï‡élÅdçBd!0úÏ	¯¸ E´À3ò¸v)„@ä\ZQªìâ¸+¤ S# 0q…±Rß\rPä»1§¾·\\:$]bÛ¸i¤É¨Şn PMõ(\nnlÄRu¥âı !pä*M`ÔïQäÄ\n”@$\0v cC ;¯;äÄô9!Œİ?¨}ÚÒÑ‡wlÙÛÚ´z£sb0W:!Æ$EŒ‰\"QâßŒ¤Ol ¸Úu½îFß`ãÍ[·ë\r˜˜¨Â˜ól‰ûnŞØÒl*û4ûçø’}N9°½ı±&°Íwcqw<ÿÛäÕúéÄ\ZËÉÎé‰•œ-*\\v±º¼²}õŠÚNV0QŞu´ªéE®ƒøqÄ-ˆsœ~™¿µ_»PwíÆÕÆÁ‘Áú8¦MŒÅî	¼¤î‰¼ìüCé]VX~qÕòºö¦•;EE<Ïc‹~md°¹úEOŒ£g®~X×yãbcÿHïÜ3âöÄ­%w?ägÄî»–_¬[ŞĞ¾~å–NY>Æ’¹0·ÓYua¡K.[#g»>¬»Úw©qàV_ì¾Ài£·—Ö}†ìÈÉ4[TPr±ª´¦}uUc\'y‹U§âÆÎ,˜¨Â¦÷pºâ	;”Uœ¼Ø|„œ7Ñ?’R‹Ô¦9†¿{õ[09=ş­G\0÷´®[İL~+@¤ùSÓ3\'Ïtìéël™™Í“~ó\rAÌ&ç¶©ïñÂ\\ìßÉk9U3>7¡çn“Y0}FFü§ùÏ“isŸÓ!c´²¬âø¶ÎÌÌœ^\n895™qìôÑ=]}]­Ó3ÓúpÜ™£+ËëïŞ¸ïpvfötªCàÄÔDÆë§î¹Òw)v?LéûÁq?dÖ–×ß»ñÃÙ9ÓK\'c÷Ågí¹Úß©ïÂ}‘{NT•ÔßÖ¸ãpfFÖ4\0œû†İAàÓ¯~30\0ô%´9.÷âícœ(	ôœ8FŸKÛ„^Ç\\øÅÿŸ½7n#ÙÓı2àRIqE\n)±¥Ş@õ9jJ<‡ê9gNŸqŒoÜ{ğõÓõ“Ãáğ›·Ç<øŞ‰°ı`ûÉ¾áëÇyò2q­é3gZìV‹İ:-²W‰7‘Wp	‚ÄF\0i€kU¡2+³*«PEf…,UY…Ì/«~ùÏ/3”™hU¯à\'şùÕìàjxó¡án;{7ÀÙÔÒ:­àÒ×ù#]Ç!{r\0–z«V\"+CËOV‡®¶´?ö¿?\n\0ÃdÚÊoMğ-­HzW)€b’jÕï‹÷øæå×ƒoWß\nMhh\"´5;ôö‹7C×[n<ºıp´øÄøéÙÉo=MãÊÖøª!_¼øÃàìê¤ĞQÉªù­©¡¹/¦‡zZn>şõ;ŸÒ2ëdÑ h’gü¾Z«†È\'f™,\Z€§ÿ8ø&,tAÒ*<;vBCËZê¸ríqğÆ½QìĞ\0Ïí¬6©³|‚g­}Õ\'dÖØ÷Xhì{8aô…[	¤´(Ô(Ò×Ñİıº™7ƒ‘íİ ¡P«Ò»A\Z¥¨à–z7~xiŠ×ÒıOz0\n“‚*÷ÂÚâÃd*Y×¸9z¹öR”\'’ôB†@%êƒÀÈn¤î§™ŸÃ‘°Ğƒ&Ş¬M=L¤âuÁFê®DA öYÑõº±™ÑÁåÈ¢ĞƒfÖ^=Œ§öëîöÜm¬mò†À“<-nî®Õ¿ùfpUè‚I‹›ó“éü³ãÚ»£—jüQ½([ÄScöÀcf)áJ eæ%m>ê(>\\^Ùè\\^YÈC`?ŸwI¥€0gmKO¾—¦OªÀJï\0ï(ª”òJ«|­RÁOrÒ0îlœÌTvµuü8ÄEåøC Ú74xv…o–ßtÎ.Íä!PhB‡&VwƒßL¦+{ÛnÉıÎ„À‚ÏorùåÀFtMèA‡VvBÁÑ¼n¶İëk»r2É»éåS+yºĞ¡‹ÍİÕàO³•×š¯u6_é@õ%Üè!à–xã’}‹–´fã¾H1ª|‡Œì¥IFö\"Åİ@=X,î[âŠI6‰‘vÎ&Y,KzÚ9›äÆ]\\+MºÂTfÕ0ÿÉ9òvö¶ûç—C;±¨OÏ„Ñ¤ÑÁ$½à5£}NõéØmû¸Àß×ÄVl­jùõÀVlÓGºĞ¨Õ;Ç ú÷´£ƒ·b>.ğwÁõ°[í½üb`3¶îcÉ.–½ ¤ÛÒ|	ç9Öø»èÏøfÿÛğ›èŞOz±Å£ƒ•e„M|¶/$ïµFçB‰ Æt.°ºˆ|~B‹çæ?\rrMœ]x°Ë+ò0­2`wá¸ë¤‚yF`|Åæ—œf;¶ÓÿræÕRjA |±Ò@àÓ?<àù»àšØÜ]ï›zö€æìßN=}À-òwÁõ°±îÿvúÉV6¢ÈPË!p|öén‘¿‹şìØßêùö‡ÚSÄ°B àšûÒ@ óçd„@„l…¿/&fïõüßx7T*­ª·¾—gˆÂ» ¬K)+¢–wÛº“¼Ïoë‘ÍàØËïïë…@ºõƒÍÀÂßo^<»¿Yšà¨‰•ÈRğËŸ?¿Ïzæä#?ÿá¾QÏŸĞƒ\\Ë‘…àÈ‹G÷ùB °¿|ù‡û+B\\u±±M}}Ÿ\n¡™9B Öüƒ@&ÀV˜NxÂk‘a.Xz>#Ş\r\0ğŞ\r\nÌæİP´Ö\0ƒw£¨¥\'É„ã}ÃËÃ©tÊã4L¦“P8$4a‚&æÂ3Ã‰tÂÃæÌ‡ÀD:îyz0A³áÉáÄAÜãD,èxnMèÂ],m„†SI&3!0B $@ °šºRYL\"Ë pr:t[–ÌÜnšwêón ¢wCáÇ`ñn Å¹—÷ãä‹{d(³~7ùĞ„‰šxöúé=¾0g.~ıú¡õğõëÇ÷\0¤§;»@à³)¡3uñÓ›ñ{ZP§5ÁN7]x\"€äeÃØ!X¹‚ëëÛC\\²@Ú\ZST8ˆ©Ìº¼í³x7\0Î»Qäã\0ìŞ\rÅ{é¶¼¾:”É¸­‡@¥fèÎ™ËåàâÚ¢Ğ„‰šx»öfè@¢	;C`.—…ók³B&êanmúLÈ¼tGÌ¡,|»>#taæ³csa(“Ë¸yC 0EKÒ9¹ Ëšºóğ×”I¸ÆÅÅµ\0—T_ÇQÍ»ìæİPñqèõnà³óK¡nöµ|B ]šÊï§§…&,ĞÄäâD7˜ã/~z°@¯êÖâÓĞ8¾ZüQèÂŠgÇêl÷ÙBQö€@ùÚm&ÖÅÓ‘FÌ5nmïWà“4ÕFYÙÂ»1Ş\r•J	Œ{7Ô¶µ­Í€vÙÚÃ[a¡	4±¼µ ò°.m-=X ‡¥­·d§q\\Ş\n	]X ‹õÕ€ôÂ@€ö†@D¼ÆD<Õj¸«,Ûsª/Uï2äİ`_¨S)Õ¼Ò ï†rÛOì·Ò•­ù¨uÎX|OhÂMÄâÑVí)_JgûìÆw„,ĞCT-Ÿm»	¡k±V¨ ×ó@ûB  B`úàÀo¬‡Y³¼Àw[•Ï/•0=’´¼È³¹ón(·d:åØ2±µÎ™*ºV¡	34‘H\'üä26é¢\'×)ô`¶â~dg9\n]X£‹ÔAÒ/ƒ©s	ç\0\0­€@Äs9äÕİ‚ƒjKH•5Kèİ|GµNcQè_¿wCºår9/ûhİÒ@`6—š°@Ò|.\rÒE³¹ŒĞƒ%z ä³\r!PèÂÊû„¦$¨Ä0È¡\Z¸QB ´)š:\rOdñóé…ÀüyÜºÃ÷ x8>T„ñmãİ\0€nF\0¸y7åé>ËwZ}”…&¬Õ„İ!Pè¡4z°;\n]X­(É\ZéÂDÿ8@ jt:\0Yüvtˆ[:Î<ÔUqá{…‘×Ş\rl¥5æİ kÆŞ(4a•&X—+U$PèÁÊ{„“\"Bæëª¾*Bèø•@èıvt,…@}™T%Ï\nïFÑüK\0ïİ@ï†ªÃ¸wƒ\rºÌ€@Òäâ¼!Ph‚_‚uÈõ¾ ôÀIç….ô:;B“ èƒ@Í}	€¬ˆ8@ âÂ,Óİ„äİVP\0¼H¿w0x7ŠBùø™İyx7dWyšÏfC R|E—¦ô{¡	«5Q:¤9Vè¡zp\0\n]X¬V6‚@(;÷¹\\	„¾«Õ(jG\Zi!Ğå‚)¶ûÁ»¡2”ŸÎ»ô{7TÍ·€Í»¡œÍğñnÈDçr¥øEñ\rY)ë„@·Ë-4a&ŠóÙ8jÃnW™Ğƒ%z Ìg[@ º(É}‚BBœ7OÁj­ókäŞÌÄ­<\"ßÓS^¡®ÀZŞ\r¥×\nï\0½Å-=3<=^\'‚4\"oäïuƒÃ(z=^¡	4Qé©ŒĞGöHÈzª_§Ğ=TE˜*R^¯Ğ…ñgGyEBò”/lxÒ-«¾+*‡ØMÌ$CæÉ»ŠJo˜î¾ íİP7òïÂŞ­Ìón\0ùZ\0˜âé©®¬\n“µ¡eĞÒ?¬©¬š°@5•µaÚÈ+Ğñ„@_eĞƒz¨Íç³®JB=;*|áb`Ó€@(‹Ïaa‚@hƒ•@´¢lö…@êı¾iÍ{­wã¤RºT*5•w`Ã÷EetÎ&\\K\0nŞ\réÖTß8ÍmXu™Í\rÍBh¢­¡cšİãg=v4\\z°@\r]Óºã!%€ÀúkBè¢Ùß6}ÆVÅ ……-Ú	£‰ˆÑËÏEÈÖ@k[ıœö=€Ò»!ıNµ’ë½\0h{7“€òònH·kíWç˜¡M¥ü´5ÂÊ£¯·w	MX ‰Ş›säÑ×ö€À¾w„,ĞÃ­wçtğœe¨œ°·¯ı]¡tq½¥wN1ø†8å‹~Ôìa*:\08Å–Av@·Û•ml¬{‚­À,Ş\rŒByËB›y70­5^syµ^i~R–Ïg]Ğè#wz!Pyt™»,ÛŞÔ&4a¢&®5u?)w—gñåY\nT?®p]M¡õĞİtãTv…@ €ÀC]\\¹!ta¢.Ú:ŸîÇE^9S PB äN\0:{zÚ©×}6ï†lî& ŞÚƒ@>Ó{I½¸ÙÜß¹¼Şéí{Œ@#jÎIïßxWhÂDMôşò¹¡ˆ?î½ƒB&êá^ï¯ä¹’@à/z‡„.LÔÅ{×ï>SÃ<6„Ü °x	7z„„}€šˆl^oyª©éÒˆ¼e¥Ã»ÊOœ°“Õ»qÊ0”ŞœÊ„˜™ÛåŸñ	ß·7·ŒTz+Røi[øC à\0••©«ÍB&h¢»ùúHuEU\nh”œ °º¢&u½ù†Ğƒ	z4÷åõàKqà9Ë!°ÚëËë¢OèÂ]\\½Ò=Rå­NæÑC àÀ\0\":\0‹ĞˆàÈ/k ğÖ­Î§—/×ŒònH[zÀ$ï06gP[ª7}¼Á\nÜè¯ÿğ;OÕKÒ&HX:î·ï>mò_šà¨‰Ûøƒ;ÃOq‰Ù}ç7O[ıíBõĞæ¿:şğÎïŸrä9“!Aà¯ßù4¯‹«BuÑt¹eü}COå@mĞhÂ(`µ0;â—c€@DŸ†òß@ õ«Z_ÕÄÑj€İ»!İOq#Àz7`é¼@m¶vµ íRmİÄ­ëQy:ö‚@šõƒïÜ¸ı•ßwYh‚ƒ&\Zê\Z\'>ì%–Ô^Æ<ùËqõ~üUcí¡zh¬kø¨çş¨	<g\"Uü¨çÁW¾f¡ºğû\Z&îtG$¢B‹ 0B ,	Z3\nX?èu@àá©õA`MMe¬¥Å?Vë«8üÕ»¡Æ\ZŞ\rbVT*îŞ\r¨>jËàV€¿ÎÖ¶±ºÚºèY3Ó~( ğ²ïR¬»½kÌïóM„¿¶Ş±†º†¨h±B öş$d;ÎïkŒõ¶õ5Ö6	=„¿›m·ÇòÿGMâ9K!°Şw%¯‹üïñµ]„¿ë-½ùûmcT9MŠ~Æ šüòe+3+at*XxJ>—ş`tèE€’#Ê7ÒïĞ©{\"\r„$óûÓ8»jZ[ëCyÜ™›[MlGcAè>Ff\nï†ì;\0JçİV`@òn¨tß7øıã·®÷Œ^:„?Iî\"(kİ\"Yõ@˜2ÕÒ†²lúSı´øûÓÑÉ\rX~¾î¶®Ğ%ß¥3/k;kBŒ[‹¿uüƒÑ<FÕËHzˆ¿Ÿ¨Ümˆ÷cHïHÇõ¶÷‡ê};c3ß$Vv…·B·o!òÇ\n è	Âxâ½ëÙ…rík»}¤‹ÙÑ¼.BBŒ[ÓåÖñBä/Ñ3hBGÌ£¤9.ùUğ¬)_€ÀS;ş˜Ã!:´J—½“ì_( „ŠöPîÓ<;fßãô ²lœD”‘@RÄ‡6È¢OCúommUô½÷®?jjô?F.€2PµRBÒ‚İ®ã(¾¼HÙ] ÷ÆŞÔ<rïı]ª­ªæ·ƒ#şÚËÑ¡ï?êlêš`Øºš¯ü&øé£üYP‚Åçg¿H`Cİ•è§ÁÿQ ©Oèa+øø‹à?¤şE!ıAz#µÍÑO?øgy]Üº`Ø:¯\\ùõß=ÊtT™¿Z‘À¢h›‘@@	T.G	´nƒr0bÛşòoe—ûûo4¸vC¥@ŠÃ³¸ÂÃ-ë¢–yØôIi@ú4”ÿ¦ÓÏôôÒ½H$6Ù*X–Ï»rtHú°U`EKï`«”]>\0.oN5¼Oåİ x3?ËI_KBö9¨ºŸZZFGm¹İîø•úú±Û½}ßx=4U™A|	Ó–¿Ú‘ä²%ß@Š+\'ş|ÉtÊóıä÷Â›kYp 4¡ìbp—ÅÛ\Z:Æ>ºùËo*=•iÒ#ïÄ’Óz\\kßZ!õ;­ãé¸ç›×_İ[Üåõz(ÒCyüjC×ØÇ7~Så©J›~0ç Ä¸×ÉãõP“#÷·æ….0÷‰ÇX0p/ÿì(Ü\'(,_ˆÜ G\ZC&ès)EÚû#„\rTÉöGÊ³`öÍ§÷oÿ· IşÍßıJ:\0ï\\¿Ö‹¡rë!wó×òW++‘Î­­İÀŞ^¢+_z®d*İBµæ+pysêÌ»	ß‡Ğ!Ö!ßçä¯O÷Í)Ëá½HÑU µUVT¬R¬­©™onh˜½ÚÖÒUfÌì\'ÛÜò|çÊF8°Ûé*y<¿pš¨®¨Îkæü>ÿ|{cÇlO{oHíÎ/l“K¯:7æ[±Í®ü-ŞµŸÜ»pz¨©ğê¡Ş×8ßÙØ=Û×~\'d(rçDT4¹ü¢sqs.¯‹õ¼.@^±§‹*oÍjş1œ»\\S?ßZuözK_H_˜;çøo?ÿo,À23ªŸšïä\'CUO |_}@¥çGîç£ó’ÒïÛÚê<‚´ òÃO3¿‹îDîZs†½£±èælÂWàÿåç½ÿîgôÀ¤îÅ£*3$¥ìÓÃ¥UüVÙjŸ‹Æ(=_ÁXøK–…íÉ÷O~·±³ìM´Ô·>ÿäÃß|¦lpOP×iOõ²Öë	TÇèõJßõµß\nõµ÷‡h»?ûîÿı]xgÎ1zh¯ï|şé‡ÿô3–®Qí’âÕĞÜ}\n·™ä ‚?°ğ‹Šíßÿ_ÒE‹¿ıùÃwÿâ³S¬!Ú}¤ŸI½xJÇT©í	,:Næ	T~k¾\'ğ0ÊKã	´p3i\"hJ?Ÿ@õÏõzµ®ß¸Õ×9Rçº<~ö‚\\Ü}^×íİ\0äÑXH9\"‹Ê»qv®zÿåñ;·zGÊDÍty¡³ÌÍyğiáZŠø²Õ> œ\"—&éœ·î4¸Û¡‰fËø½şGÈuô£İ§\'uŞ?>@úãäû<èÿd¤Éİå=oõÿf„GÌÌŒ‡×Æ‰éŞïÿ­ctÑ|¹}ü—}¿‘5¡²wĞÓ\"óâ)óÖÏÕã	T97°‰\'Ğ¢Í„.àÄÌÂ\n)²d÷î`’wMy‹‹ë•ğf0‘H·e³Ù\Z`“­ÌíŞ«¬¬Xnomïêh›5#/¨ËÒœÇŞİÁ,çœ^˜Ì/¿\rî%÷Ú2™Œm4Q^V¾WSY³|½50~³óÖ,ùñGÛÍ±¿´{Bm3w­G?ÔüE4Àğ2ôc`zåU0–Øm;È¤m¤Ï¯²n¹·µüvç³¼	ë\"v†&ÊÄÂ÷y]Lé\"k#]¸÷‰ÚåëÍ}ã7;îÌ\"\\3i7Ö•]¦Ø\0Zğ©;˜²{—Ğ¬ú¯Îî`éÿÇçÿµ“=€=ú\0Î†ˆKßâ[\ZúÓ§ÿ­Øt +4ñ‚33!Pıší	šh`‰Æ3‹³›ğ´AH@ /Ôwn= ¥»Œ š€@#XÜ“E{<&zÔÎ@Á\'®¸UzTÇAcHÜ‡Z	€.s*šnRÄ§«/@rw0Kw#k¨æÊ#ÈhúZ¿•\"ÄÚ}Ê«›©—îî`íkÆéÀÌî`ıç$—½–Æ4ÏèÎ¯õ@Áç\0í~´¿KëñföşZ|í’bÅ	}]ÊH÷š„TTÇŠî`­¦‰ú:ÄÚÇc\Z„¶y¦ò)d	Jw•â\Z®4İÁjyw0n8¨hÿjwïBE†4	µ‘î`rƒ×œû íAÊ½ô!¤Á40D’ù„ôOô^ãQğV0™L·f2Y°ÉVVV«¬ğ®´·6wu´ÏâK”n©\\ÔrJuĞÎé!,ç¡»fõï´ÏE70\0À0å¤x?¹ßz9°&ÊË<±šÊê•Bp_çÍY•áT@ÿ€ÜpµôC\0 ‚/c­ıIÇ®‹æØBğé•×Á½Änk:“¶<eŞ¼|+g]ÀĞğS‚<…vBÜïøÓ“.à½d,¯‹”tá‰UWøVº€ß˜©—Ï~7”EÉ°<NAI}`Hñ±Ò!Ê+À\r)$Oèqú)D§ébbùsŸ?şñ€@ù¼Şú \0õQÀ„¼‰˜Jx_½}²½5˜ iÍHt§=]*Hñúlş(¤ºĞxÑC˜iPú’éıŞ©…XïúfdüÎ­ŸWz+R< Pèv:ª4¥ßÇ“Iïó‰çŸ¬EÖmª‰„o/ëı>´Õ»´±4~ï?¯ª¨NÙñù_Z¤9v?¹ç}òòóOV\"‹¶ÕC,½Ûûmh½wac~üWïüöóüƒ?eÒíq1 0ÊëbâòºX°÷}bi£wi+4şñÍáÏ«¼Õ)¾«eğ€À³ßdOÖ qš¶ˆ¡nÒ\"3\'§®VškDlİÍ´¿óõdhXüAPô=vÙ âkåyî¸2\\•YPŞ’;¹à‹W3Ãúº×Õ:rh»Øåi!CİÁt×¬şî\\Ê2V¿>­4O^½\ZÖ%ĞÄFn!ølâëa\'tãó§ÒõiıZúî`­c¿šø|Xü•@áÜ›à“‰?›ÙL·;Ï™yİÁ_åóYü•â>æƒßL~1Ì¿;×ÍÅw+À{Î!Å¸|w°ô=¾;J2Q«;Ø¡\0è$D¨ tss«·#‘Ø]µú-¯ÒÅ¾q­2 ¾l(n±1/t¾”‘ı­»3s¡şRB Ğ	¬^I2°QNoÃ/f_Şo­9Jk{Ëwšı±ÿâB \"¼3ã3Ïn/o-:J+{ówÇg¿éh¿ùæör$ä¬ûÄ~èîOóÏû	\'½†ØßXzä:\nøƒÛÁ¢i`Ô²—qªß@|á\Zy‹•yÎ “-¼²İ¹µ;\\	$Ÿ…®tú !†º»©ÔZl.EŞ¥|­¾lPî€îåƒr	8XóâBşâ½^o®â›¿ÒP?{µ­%Ä4’–²ÌdßQf5m,½“oç–ßv®nV‰vå3Ò•H%óš@HUy«Â…]/Ÿ®r#TÊÑÁøòÆ•#Ícœî˜©¥Wo‘ã•@â©ı§‡joÍ¡ê}WW¹Ò‹M¼‹¥\Z<¹üs^…•@6u±wátQé©­Ò0ßVß98\\	„(j8!ÖÑÁø€PÑ{¤=\'±r’kÍÅØĞò}ÿÍ?şW I8o\Z˜÷ó\0P™æ¼@`&“-›\\ŒDö²Ù\\•¡æ§\r¼Åøx‡ÂÿYR+ÀÓœÄ®YXÜüğuúh¡s(‹_©÷İ¾Ù7Z^V–áÊ`ÚŒB`úà ìû×?†·Ö2Ù¬Ğ„BnPokhûÅ­G=åŒ¾©dœ©ƒtÙ×¯¾\\Ü\\Èëá@è¡HÃµ€ïßúdÔ[^‘¹(˜:H–=}ıy]Ì]`î­ş«cõ>õ”y38èÓG\0fJ>Òg¯ÿÍ?ş—– I£€i	Ğ§£-ÕÒ—»Ä\rQ^ÁØ¯20dêÕòàÚÚÎC.}½Ğ€w£¸ŞHf~/Ü ¤•¶h	¡üŞ®ãeÜ<9\0Ë‹‡çªÂ‘õ¡Õ\'CmÍMßë¿5ª9ˆ‚²Ìd¥‡ ÕÀÒy´õ¡Şó‰ïV…&šÈå5±°5?úâíPwËõÇß~0Ê>€D}ßÒ\rQ?æ«ŸÎ®N=õ¬šßš\Zšûbz¨§åæã_ßşİ( êA«dáì6{`ÈÈË¿ÏëâµĞ…Æ}bqûÍĞÂèÜPWSÏã{7‡G‹‡†¿Ç\r Pº8ÜãtLn`ˆâıñÅÃFTFC@·t<YQ©ìaıbpef$ªGöj@ îÁmc±DİüÜúàÎö~SÌ•«wpòn¨.\0Ûš‘àÈ\\¨ÜËëá‡©tº®÷z÷èåÚÚ¨!`4ÙÖ½œ}5¸Ùš`ĞÄÜÚìÃx*^÷AOp´¡®!J†@µŸ=!p3º^7>ó§Á•È’ĞƒfÖ^åõ°_w·gp´±®9zŞ pc7\\÷|æéà²t\0‡Ğ…¦.æ7¦&Òñº÷º?\Z­÷5FÙ P®ôB |ı`ie¨!ğä7«C ÃPú\0¥…/Ò¹Í…ÀÕÕíÎğÊÎ@û¹Üe”½—-±³¼VKOâİ¦OªÀ\nïÆiT)BûZkF*×š,œÒÀÖN$81•­ìhm»ÚÖ\Z‚ƒ@µ”ç—Cù¿Û»;B:4±¶³üvòYeO[ïØC ş‘®w8\0PíË§–&:§–_ä!PèA‡VvBÁÑÉtåÍ¶Ûcgş@í™\0íŸßë¥yºĞsŸˆ.Ç¦Ó•Ö›c–›!5”¢ŞÊ§×ÎdÎBıèø >øR¶ú	i ó!0¶—òq?ÙMBbW¶ºŒ\"?†ZÅ—Eª€Ü»A(¹wCZ!-:0ª„ö%†ÃYt/ÚV¸T[©õÕÄœ;±]ø»àšˆÄ6úg–¨¯«Ôûêc| væAàVlÓÇş.¸6c«ı¯ózh¨kŠ4ø®Äh1Ï®¸[÷q¿‹~ŸØ_ïŸ]Éß\'|‘Ë5\r±¢ÈŸÛ¨!Hæ\nä	Çïœ§ÁM±A;5ii7E\Zˆ}z–ë˜³ş€KäO¾·³wHÂè’Ê(o±É[mØ0¿äT;±XÿëÙÙ¸¼Ö3­,-â1tÓÑœëÅÌÄ.‘?¡	°µ»ÙÿİÔØš9õ´–ØÃ•¾¾}Õt¡şùØÔ³\\\"B…îÒşo§¾z@Svôßêc.£};ıä—ÈŸĞØÚÛèÿşÍŸ\0ÕR•A{°x!8õ®UåÒq\ZSÄœ@ ê·øŠšKÍA­ët\0jåÚ¼´i è ‚O¾›|µrŸ‹çO6Ï’âœÊG¥ón UÆ{7°­;ÉûB«8²üáåÄ}k zú pìå÷÷×#›B5¬Ÿşüä~qyĞÎÿg-J÷ÿòçÏïsñü	=œê¡à•ùùïï;G^<ºÏÅó\'tqvŸØ^~ıêñ}†!–\r€d€LˆhÒĞ	¸kL§<ë»Ãüî\"*ŞŠm`½€Í»é“*°–wCaÌ¥önµô$™p¼ÏÊÚúp*ò˜Z Ç©tÒ³^š0AoÃsÃÉtÂC3at©!ğä“D:î™Ï=˜ ‡Ùğäp!‰ƒ¸§pıB&Ü\'ÖgïÖA Ğ	ĞQè2+atC öü=¸k|3³~[–ÚRku©ø5ty7NÏIëİ€Š\ZP©%méQ{7â|ŠKš˜š¹G_æö€À\'_\nM˜¨‰ç¯ÿt„gvƒÀg¯Ÿ\n=˜¨‡¯_ÜÓƒyf@ Ë#ùë×….LÔÅØÌè=€E9»@ 0ĞéKÁ!;@ Ğ(—ƒ›±!>wTdÒ-j•k¼H=[ÏZl@^‹Gr6ï†â½t[]ßÊd³îâ27¶ÔŸY˜Ëkby}UhÂDM„ÖŞæ5‘v[HôğvmNèÁD=Ì­MdÜv€@Ú¸L.—……ëº0OsC™œTÖC 4D…À•å\0¯f£êD¶z½*•VÕÛpç–^†Â»¤ïå­³³¿>ïîn¼°¼Ò­^‚öƒÀÙÅy¡	41½8Õ­îß4ˆi°yßW/„,ĞÃëÅŸºõb^) ğåÂBèbfùu·bq`K!X\0@äpÜìøÜ%Ô[Xº½\0à½\Z˜Í»¡íãŞ\rµmc+À?vé!PSWL¨ÖúÖ†Ğ„šXÙZ	ñN?¸¼µ(ô`–¶Bê®&@àÒÖ[¡t±º½€Ek7„@îÓÀ8“‰ƒVÃXeÈ~q¸£wêón \rïF‘7Ã€wC¹Å‰V@|ìê°A,Ğ½D\\hÂMÄâ»­ÚÈ¦4ûñ‚ÀX<*ô`¢ñVšç] îz….Œß\'êŸ½!„@Ç`i!„Àƒƒ¬ßØİ3_ÀWhhÔ»Q¬ïâ\n,Ï$ùÂİ¸\nª:™\'ĞåİPn©ôŸ<\'£	ˆhÎSœV*š°@ÉtÒO‡lèßÏ8&Ò	¡ôHÇı´Ï;@ ıõ\n]ºOœÕ?u„Š’‚­@e¤3ä7:Fö2B`.—óê¾#@µõ@ÑüKJï°›wƒèãĞïİn\'ùL’3}(4a&²¹¬×Ü!¬Ğ8\"Åu\n=˜¯‡Œ—åySjd»^¡c÷	2A<v©‚UŒizØM_	)`L?ÒEñŒ@`~W·ş;n©Å2;%÷n@ŒwC¥‚ÀÍ»!»>„ÜúËY\nÒkš°B¼!p€@‰^„,¿G8….¬Ô…Jg/\'Ä]xnº€õA ²ê¬ÀÄ¥z$¢À,ÔmÄ»AUqF]Õ\n«´Æ¼$°•9°…&¬Ò„Ÿõ(ô`µœ	º0_êĞf%Bíåæ(!PŞ}º€5æHÏÚ¼,ˆ,†@u\ZÏ\"ÃXã®ï¶+³D%L$­0Ülî¼¼¥…@¤…&¬Ó„öºÀv€@¡kïç….Œåy© P%’§\n:<XjT¨–~^;Y&’¼ÒJ	€=¼’ïaw¤9›;»wC–ufyA }ôNÊ¯UhÂlMØ…JqàÜW\rº°\\ü š\0Ğ\0:\0íêé»\\®[“àİP¶äìäİ\0\0ëİ@¨øÉÃ»!]>Ÿùø@Õ\"Àtˆ(!PhÂ\ZM¸]înUp;AàÑu\n=˜¯‡²”1LCö`½^¡kt9G	¦z\0Y!Yêé——»#ÔXË»¡²Ø¶#¼j>E«Ğ¨§Çã)—–µ(!ĞëñMX ‰\nOEWúv‚À\nO¥Ğƒz¨ôTEŒcšuxv½B¦Ş\'ÊOêß9†@çG\0õA (1z+ËÂt­8mï†2ün‰w£h\rF€÷n ŒwçãµèŒ‰´ª¢\"|vC0i—#C`ue•Ğ„š¨©ô…Iıv@_e­Ğƒz¨­¬óÁ4k P~½Bfé¢PÿÔÁ	ıh[B ´Ï2pÜP÷È^›@àeÕ´fÖ»qR]ÅCùÉŞ\r¤ß»¼E¡|üÌî<¼Ò­±şò´4\rs 0B R…À¦ú¡	4ÑÚĞ:\r°õŞ>ØÖĞ!ô`:\Z®MóÃ4ó!°£¡KèÂŠûDıÕi5Ä\"¾ÒĞ$ö‚@FëôóÙ\0¯´úæ4Ã÷´Ş\réw\00x7€~ï†¤§Û»™Íİ¨wCº]mkSÄ(=Uìl¿*4a&ntÜ˜Ã=–i!P,²A`oGŸĞƒz¸Ùqg/¦™·:Şº°@½mïÌÉ£tú!Œ…l9@ ,š4\n˜7D!Ğíveë«Ÿ`+0‹w£ÈÇaw\0ƒŞ\rLKğ›Ë«ùJı—Û-NÜX–¿ÖÖ+ÍB&jâjSç·»,‹ƒ6ZÔ1¤‡ÀrwyöZS—Ğƒ‰zènêyRÈgş˜f®·»é†Ğ…‰ºè¼rıIÙ‰.8@ `†@ˆ…@ ÉNF‡ ]ÈÒİL\rùs_Ô?SoÅ±y7d¾\r\0tx7ÀÕ`ó¼@¾Ö£´H8ÍåÕ×ÓıLuĞ†!ğŞ>¡	5ñaoğşŞ`\"İ8ĞûK¡õğËŞ_=3/VgŞÃ]·Ğ]Üí”ç¯‰U!p‡@\0ÏY0Íƒ–‘ÁôéaÀãq§\Z®ÔŒÈ[S:¼$c/•w`Ã÷EML£s6áZz€Ÿw£°µ45Tx=©âœ7ıå•^oª½¹EhÂM\\k¾6Rå­LáâùæA `„À³Ï«+ªSİÍ×…LĞC ¹w¤º¢&ÅòœÑ÷Œâ?atu…/hîº0A]M7ò÷	_ªè÷˜@7BIW¼ı!ó ³ p‚@º4zn6>­»\\9nÈ»!­œªXïİ\0@Û»¡˜”—w£şrİø»ı=Oñ`½È )øá;w6úë…&8j¢Ùß<şñíÁ§ÊúNŠê–åŸ?¸3ü´Åß&ôÀQmşñá;Ÿ>åÍ3r¼ÔŞùıÓ6ÿU¡ºh¹Ü>ş ÿ7OÕaMBÓ Pò‰ntp°tˆ¨Ò§…ÀÎnÿW55Ş‰ãBØ½Òı€¢KZÚÌ»¡6bË`®«­™è¹Ş9ª\rhö†Àş_]òÕ	MpĞD}mıÄ{=ïÊ-¢¢‰~J½}ÕPÛ(ôÀAuMw{GÙ²ş¢wè«ÆÚf¡ºh¨mšøàú½Q2¬á †À BCmœ•\'<z_]ã‰]iñÕÔTL­Ø¼*³¹+[~(†ù—Ò»A˜Íİ(üµ·^««­Òš}!°ÎW»ÖÖ>vÉwIhÂ ü]oŒùkıÑâ[\r’ï5ÚH;ê—~_}ìF[ßXCí¡ƒğ××v{,ÿTvÙ|Wb7¿§¶EèÂ üİhíÏçcSñ}‚\niA  B •[ÿ$On‘\'ÙN ’|\n$ßIÿ•ß’÷FH–ñòt¤é+ÓÁ§ßCB\ZM-¾Pwæ·Ñh<İÇÈLáİ}\0vwCŞSH¢ônäT&ìTÎÜŠ»ônşËuã7®_ÍC`”©¼O¾;ı¶¼YÎA§MYŠù|élkÕù|;¯fg;›BŒ[¡Û÷İ÷FóUÏ÷ã“BõšY|¯Š}\0A@µ|qêÀïw–âö¾Pw¾›K¬î,	=0n…nßÁÑü)ïĞl~(ÖıÙgMıfûPw¾yšXŞ		]0n-y]|ØıËÑ†cøƒ‡5©\0–âÓBæ¡£_%‡J?S|SA¸tU‡è´w_şòŠ?\'‘ÑâëP~êà FTÇH$PV@|\"øk<û·ÆçŞºÓü¨±Ñ÷¸\0Ê@ÕJ	I“u“¼ÀØœME­>ÕÎú¦†‘àû7ÕGşt—6ˆJ	¼T[½÷AğQGS›ĞÃÖÙÜ92üáğ£zEäO5ú¦;¨¥­{$°¡®1úÛà§®7õ=0l×›{G>\rşÓGg‘?º.{§Dëš£üçzšn	]0lİM7F~ûş?yÔP\'üAÌò&¬‘@ìÜ~°´‘ÀR¸\0!Bú+Í_ş­ì‚çö®ÎnB‘3I3UT®6[5´\nğK¼à¯Qşşà ç™ŸÙ¼·‰ä@®\n–åó®†ïa9:«ÀŠ–^zÕ<­ÉãÏ%Ş\rµP¿V€èÍ8ü,\'}-iµå ê~jiË°¹İ®xCı¥±›7®}ãñ”§iÊ›º< ¾tğáõ\n®­MyA¥ÒiÏÏ“¯ï­mmä5‘šPv1¸Ëâ-\r-cÁ¾o*=i\\¾Ü\r’\rİ€Pãµõ€OÎAJ1‘Nx¾}ıõ½¥ÍÅ,8z(ÒCy¼£áÚØÇ7×CUš§\"æ;ĞŠr{,rO=‘{F_?¾·°9Ÿ×EZèBEíõc¿èıÕ©.Jà‡¾aÖˆDZze*H;` ˜B¤(µÆíÿú‡ÿ¤2‰¿ù»¿BI³Ğ¤.`®=Iæ¨wíwÇÉÒ@|»ƒñ×(ß·¼Ü•¾Ñßôeşå—ë«±Îí­ıÀş^º+¿‹+Ë´ĞÜ5ˆŞ\rbV¿¸{7 úÌí„­¢Â³Z¨ê¾šêùÆ†K³m­!ÀØÅj¬;X C©Mrw0^›gİÁ…¼OzàÎ»yMÀ/CË‹áÍ@4¶ÛU¸•\'bÉ§‰ªŠªCM\\ö]okl›½Şv=¤Õ™\n0%rv‡R	\0ºî`õ{‘šJŒvKS¬ôT¦õî\'‡÷ˆé¥ÉÎÅ…@$¶u¨‡ıØŞ…ÓCu…oµĞXïkœ¿ÚØ5Û×şNˆı)âìîà#]T¥ÿìİïP¯—~î\\Ø˜lÆ6òº@®½XìÂêÂ_Ó8ßÑĞ5{£­ Tô³‘¤»µèó¢®VtºƒqévØÂÒu[½q@À\"œ=!ğÄŸt¥Å*xÉ‘¥£W_9óß•Ì»!­À€äİPé\nÈoıá_ŸE¯!EtİgÇµÏATºBP¶ÌSg[G¨ğRD¸şŸÏÿŞ±šøÿì?økR$ôèÔ‚/,x!^Hwg\ríıp)ü…¿Z¶ôÂöşñs¬ş“ßüçMYÕZÎ‡À“­à,üÅ‚›dûßÿø?9Vÿò“ÿâ¯U—+† 6T.ÄÍ¤¥à´B´ú§w)•\'MoN³ñÑ+—¦\0r†wIºò×–Îyfæò@’ÿH~=-İµRéJ&QòÈTiZn—Ë¡šp¥µ<yZ~<RÙa:sTºZğç\'uûÏbd?ü\"s@£éHn‡êÁÆç\n¢~Z\0†œc}}’™•:!Ø\'ÑE™ƒu¡œ€ÿKIöˆù¡xC‡rGHqF=@hš\'ĞÁ\0ÈX¬\0W\n Ğã-[;5\0Ÿj‡Ñ»\0÷9›€šwCâñz]¼Š_XRÒf,\Z¿Vj]1B`…·Â‘š8îâÆ T|Vå­v¤j*jVµJZ@ ~¬v¬.|«ª E\rĞ0B%BÈéÆ\'ƒ@§ ²‘LÙF!™\rWjÆ³;åÎñnŸ·¹É?¦šQêr¶…ÀöæGj¢³ùêí|| ÙiG“ ®æëÔÃõæc€¢¤êƒÀëÍ}ÎÔESï´`q$M	µ ÒÚQtA Ö`5z„jv±B ÿ …(?2†IØÙUÿ¢¶ªæy¦P‘¥¥¬×»AÑ*£›³IÚ ßÇï÷=ïê*Ìf_ü°+¥õFfÍ„@d	Ş¼~ãECõGi¢¹¾éù;×û\'h~?6‡@ÚßEF™{^4×\\u”Úê;øÅîw±C›Ùhtı`ë!p gğEkM—³táï|şÁõ{€ßƒø¸§¦B àÅÇC cÉŒvƒ@Ä‘nìé»2âsùÆÂ^‹»‡Õëön\0r«)[fTŞ³s]¾ì¿Ù×9Bz@Ÿ_ŒˆtCàûı·Güî&Gh¢Ée|àVp„XVC ‘Õ@ìƒıC#WÜĞC«¿cüAÿ\'#Úy ‘IhÕJCı¿ivw;DWëö@b\\ó”Ã–¹ÎxûÛ×:¯©û|j™„/ Å\'PÏüsæŒƒÚi¬,íÖÃ»Ád\"Ó–Íæj€M6·ÛµWYé]niöwt4Î§Z>Bš2e©t:ÊRÎáGu¼ş¨uéÎófám`ae)¸ŸH´e²Ûh¢¬¬l¯¦¢zùZÛµñW{fIu˜ôû´Ê^+OI7fíz§y[§x„°Œv†Ô{âï¡—™•©à^b·í s`=”—yö|•¾å­·Æßé|o–Œ-Ú%I‡?4ßèyh\ZyĞBÓR&Áå‹Ğw©•‰`,Íë\"m]¸º¨Ëë¢ü«Ìj5ÉŠ0Æ»FÃÑ6ÓÔç\nd›\'h,O«8B¤ôŠ%ÿËgÿ©eó\0š€ê`@û@w:’Óg|˜é\Z![>òš ÙnhH7º(Æ P¸ê2¨¼,ê4éÏ©•—É°D·¿öèAHı/Ä]l4‘É!Æ½ñ D‘.)-T¥HA PôV!ğşC\0¬@Ó–‚ÓßEhNw0¾S‰ó¨VDNßøÈXÂ5\"Ê.k³Fï\"@Q¦ˆ«G“~é8=ç`Ñ¦<-¤st0Ë5ãn(êçÂ”bK“şœZy©şhĞ×,¿Áb÷q@w0ñ7¯u­G¾Ñî\\İÁ´ø Ìë6š:7 „¼w%\rè`kšĞ¦jÂ@úÕ|pİÁ4«]+Kw°²JßÓä@\0Dœ Ã ¤\r6çM!ß@`S:!Õ+I2Ê‘Íç€@Íıiâ3\Z‡@­Ñ­ö@`t4\0ò‚@mxˆ8@ ÂDM’!P;?ô@ û€ÒtFÚÀ% ğ\"A ë1VA ±Âô@+ ĞzÖC 4¡q„ö@Î\0ˆØ\"S àÎ-hÒ5ZÈb¤Ë\0´FÇ³C ÛJ\'ò=†?Òbí(\\v†@Èœ#3!PA íìÜ#€HëaÏ\0ÎÆˆlÈl€jç½€@3 P,\n( rçt4\0R=ì-…@Ä\rv“\"}iº 	,\"#é!¶ÈãE@zXDmV®\Z\" P}’gtèø.`;B ĞÜ»I w>Q7ê‰Ìò‡@V˜²Àõé.\rêU–ıÀ9‡@½#‹Kz°Ë(Z;a´İ Ô„@¨\nÖG]æ&¯aœ·\r\"ƒé3¤q =Š§Rçƒ.Ô±2‰C P³¸A ŞßH^6Ô­4i÷µjåÀE‡@Ökhµ‘Ğ~lœ—‚Óñd€@®p„Œwqêî&Eì#{í@7ê™ûQ	{zM/²äo¤kéÌÙÙÎ«®}Ègy9\nÔtqAk!\Z†@‡F\0C ŞoÇ=BÆtëÕR§Ø‹Œì\n€	M»N[C 	ô¬‡@$#\"û@ {´¬1L¿\"•ˆ\n´¡­ š\Z«;é„@ ‡$¢I§”˜ Ñ¤¡Y¢•XDÆ#<!1F½Î/jµ(¯+ö@}ÑBZ¤¹FÒ/´jï¯zxq!Ø\n)Ì@\'G\0ÉÓò‚@Ä_º!Ğèyf#Ä?lKH@ M m±Hã<hÖqÍ‚@¨ç \rZ°f\0!:\Z\0\r>Ğ© \0SºIm€R¦Œw{Ÿ?ÔNG@ 5¨ıà¶\Zi¯ÓL¤ü\" ğBC .¨` Çó€b\'x¶!š¾H© Pw„ìÜ@ C\ZÈ¼ßyq ĞØµ^d?§©ˆxB âˆi°‡€@ á ¤3êƒ@‡G\0íÚ²‹ˆ+r¸F‡@ ÛêäkÕ,3&D6‡@VÈ£+NxB İu°@ ( ĞÈ<a´#!;´`°!]H\\!Ó5ÚÍº¾Æ!ªÌT 5oíz\"}4på|¤…íô»* :	Eèè 	ˆÌ‚@`Dç\Z‘C IŠŞFH9a´“ Pß9i!Pk®@û@ °²Î-h6\"ª+è`¥€@È!ä\0çh)8®J	HW\Z†¯ñ\\A pF4~­ÔevÎ Pÿ9i PB ²9ê_:NYçı3Ì3( P@ ²,Çj¾@v$¯löVfúAÉ+$ùáÊOäß!ÙÏ—îuüÍéGÒt\"c¥éÈ¿“Ÿ|HZd(9\rù5¥^Š6Â{ÁT*ÛšÍä|À&[Y™+æ­ğ¬47_\Zok÷Ï ğl#ËTv›;N!Ie4’> ”N3’t\n<\0‘¢R\ZÉ ª¹Å…ÀâÊJ0‘L¶d2¶ÑDyYy¬ª¢råZëÕñÀÕë³juJ–wG…G¨s4y¨•@³ìñçV^æÜÙísşâ£i®S{¿W¡‰ÀìÊtp?±×šÎ¤m£O™\'VSé[éiíïï|wVû·“ò]+?ÈÇêsÓíƒ˜Óc¹~ÀåÚ^„¾L­Lc‰İ¼.R6Ò…7VSQ»ÒÛÖ?~ûê‡³\'e£\r¯g{¾Â¤ØOãûÃº‹hW{îa¨‹_°øÓÊ[P[åœ°è‚€f8½9[²Oˆ0×röÉA*ë}3ùdw;,j  J\Z,²÷è0NÿCPôút_×Ñgğä˜ãã¡äõi¾Á³óŸ^iúÒéDïüR¼wk+6ŞÛ×ú¹×[ÂA PÉGc¨R¦È(jA¹Õ(?K2•ôşğêÕ\'›‘ˆm5Oïõ¾XØé]İ\\ö¿ÿy•·2% ĞŒ\'÷¼_¿|úÉjdÅ¦zHøbéXïXh£wq#4~ÿáÏ«+jR¥€@}Ğ†ˆ±$ã¨;¾F<ß~2æıòå>Y,ØX»½ß†Öz6æÆÕÿçy]øR¥‚Àcã\nÜs<r^Øì®Cy7İÁ²OnÆ£×sS‘a]ğAÑ÷Åû\"ì÷ò\nT+ğáÛ2\\•YPŞ’1´œ\\>úÉlùÈ½»»L\Z£f°åD‘bí>¥ë¦ıñÕ«a]ğWMlåV‚ã?ŸÏî`Ì¹‘‘%á´¯B¹ß×£Ãºà¯zXËÍG\'¾¦ûí¤|§=–æDı¤Ò{…FÒÖ{ì“‰Ö%ĞE8÷&øäÕ?&æß|tÇÓuÀ¶j[w0Ğ\Z\Zm\0´šé•ÓKó;·£ÛÉ»jz•—9:SÄµÊÔ*û‰æä•¶h”D\0§mé/)»”ÑxìîÛùş“ßl&@ e:ˆrúJxyıæÍíHÄQšØÜ_»ûêÍd¿1äáC¤Ÿ|ÛË ğ‡™ïn¯n-;J«{¡»ßÏ>ï7\n|GŸ/›½½´r”.Vöæï¿ùºß6Z€Zp…(—uÓÀv¸µ•4”x	•V=$iéIÓ†\nƒV>Ù}ë¾t\06Ö£Ò!ËÈŞÒA ¿ˆñõƒñçXY[s¤&×–È@„·5äÑC VÄßyø6<çH=Ì…gØÁÉ(Ä]|t¤.fÃ“x¼²éFÓA ÅH`\r„,èt\0,~kF´ì-†@D€—ƒt¶©¸„!ve«KáÁ(òcà*>PŞ(ntHñóÖ‘rR©ƒfå…,#{Kü¢ĞÀDL¦RÔD\"™h¦‰ÊáFïŸ¤_Úã©¸#õ°ŸÜkÆGô\Z…ÀıÔş¹Ğ…9¨µ|\Z/†!0@à¹\0@¶‡´Á¨3jÃ+ærÈ++gŞ\rhÀ»Q\\,ğìîBg×­q+ÌårÔDöäº)Vç8¯L€Àl.ëP=®[Ï´2VA ±ibèÖÌæ2ÕÅñu›\n4å$t¸ĞØ`ƒtîˆ¸A \\ˆ«wpòn†ïeœñùˆxÌÁwÑ!Ğ¹š`.l‘@gëÁHa´óñY\rçå>q šÖG!20ôø/ÿVv±¿¿õÎÍ«WÛ§Ö‚ÊUP,PHÒÂ„Œe»µÔ6WÑH*ßËt@:Ê6kjğÄ»¡Öbs)Bö.åë“!û\ZÇEëTŞÓ¥ĞĞÑgé¥\nRC^Oy8ÿ®¦¦b¾¾Ş7ÛÒê±æ£¡²€Æ4£v-äÊ¨rxöÍâòjçúf$°»·×U(µT*ÕŒĞÅÑÌŸ¬Ò[.½/ùêæ[\Zšg»Ú®…d9i»Aè¾\';h´×Ù„„ó-P»gvi¦sic)°‹Ş#â©x^èBé¡Ê[Î™óû\Zæ¯6vÍö¶ß\nÑb›;\nêú„OŒ=¨™\\zÑÚ˜lÅÖu±ŸÚ»pº¨öÖäï0WïkÌë¢{¶¯íNˆ\n½‘L\'¥…¨\Z ¸•ÂğÍ9•O	âÂ«ÿñïÿ%HÄÿæïş\n%€}y\0ìÜÍ@Í‡½I˜Ë ²Ğtl0º\ZÈeQsİ·ÁœMÅX¾GÇ-¸üÿéå\nàiMVèC™ä€ä5,Ìwô:í:|íî¸ß_3v£¯m´¬Ì¡‡@¤Ù2™²—“3ƒ[ÛÙlVhB¡	7(‹7×7}póıQo¹\'ƒƒ@-s\n¦Òezõlpesy “Í=éÁïh¸:öñ­_çõàÍ8éA0u,{úêóÁ…Í·y]]¨ê¢kìşÍ?Ëë¢\"s‘!ğ°\0M[	ähŞdÊÉvú„­H27ÓDÏ†\'.¾–·“±ÁÈzò¡áğ½½\0œæ¹´…‡N+¸ôuşH×ñ„¹€åù—¹\\ÕævthãéîPSÓ¥Ç}·ÚG‰=SMĞŸ,\ZÈÊšBŒ“wk­|ñÓ«©Á•ğºĞA¹¼&–#ËCKOV†®¶t<ş¨?8ª\\Ñww ›,\Z(Ö|¡¿çĞœn ˜€o^ŒÎ¯Î	=õ¬z»5;4ÿÅ›¡@Kïã¡ÛŸŒŸKBëÙÃú	M:@C¤í‹œY}-t¡©‹©¡ù/§óº¸ùø×ï|:*\'`ÒJJZ¦_5D>ñ4ËdÑ\'¤\\5„~²h€æÕ:\0ùB ıj@\'ŒÇ2uËóûƒ±tĞP¨Uéİ ÆRTpK½\nß´´Åkéş\'=…IA•{mcûaúÇL]WwÓhmmUÔ(Ê#5SÖ,Hº2FwcuÓoBƒ[Û;BšXX[x˜L%ënúGıµ—£| \rÚñ ¡·v#u?Î|?„…ô0»6ù0Ú¯öür´±îJ”±œÑµºç3£ƒ²Iœ….(tñêa\"¯‹û£µÍQUhg\0Tƒ@ ;úÆ¼|—T‹ |~›áä@û¹d‰´Ò@˜³‰¶¥\'	ßKÓ\'U`¥wã$’-iI+¥¼Ò*_«Tğ“t#°gf²•--ş±V‰?Pó2~fA (ŠB/®¬u.­„¢»{B:4±±³ü~2SÙİvm¬»à,²W®ˆ³Ïf—g;g—f¶v·„tèaug1øl2]ÙÛÖ?&÷:>¿×Ë/ò(t¡C+;¡à×¯Ó•}í·ÇÎü¥@ ‰„¼!Ğ±\0ˆh¬–\'ŠˆOb/ëãPrIE•è›³Iö¤lM;g“Ü¸‹k¥I÷A˜Ê¬\Zæ?9GşÏŞ^¼u\0_meÄWSÓİ¥…@isYÂw±Øü]pMììEúç–ğ×^Š\\ò]ŠEì\nêÑÂíXÄÇş.¸6cyHÊë¡¡®1RïkŒ97cë>.ğwÑu±·Ú?¹@cms^Wb@\rÉ,€@º¸ O´n3y)8I»©A¢ÖT ¤5\\}:ŠõdÕÓ‘²<·ÿ€[ä`ZeÀ\ZïÂ±ùIò\nŒÀø8Š+<6Ì/9M,–èŸ›\r? Ÿ\"FY¦Ó» úU`X§¡™š}û€[äï‚kb;¶İÿÓÌËlëë™‚iŞ¡´µ¡¾Ï÷Óß?àù»àzØØ]ï>õÍ ™ï¤€ƒV@Âì)bŞ};õô·ÈßE×E,Üÿíô“ê™rÆOäÌ„Ø\Zİ1¤”dSRs›\"Æ¡\0È	4!ğíäŞıØÎAOÅ•¤­×»¡RiU½˜ğ½<[Ş\r\0e­¤¬ˆZŞ\rlëNò¾ğÀßŞ¾~µx¿T¨½V4˜¾¿µšà¨‰õÈFğÛ—c÷Kls	Ê÷ùúÅ×÷zş„äzX‰,¿üù÷#?vß¨çOèB®‹B~¼xtßÎ8B ãPOdx S@`&õl¯§†¹T`iÚF¼\0à½\Z˜Í»¡h­ïFQKO’	Çû¬¯E‡ÓéŒ§ˆmL§<«k›B&hb1¼4œL\'=¥€@m˜P‡ÀÂõ†Âo…LĞÃ›ğÌp\"÷8ãùë\rO	]˜¢‹IŒ.œZSTY&\0 e7.7d| k@àÒlü·\n,™¹İ4ïÔçİ@Dï†ÂÁâİ@Šs+.ovzå¦6l¯¦ç…&LÔÄ“?İ“•Í!p|rLèÁD=<{ıÕ=\Z\0³~ıú¡uñõäã{špgktèü %¼©B Ÿå»ô@`a6öÍô—,¶Æb*³.ï†D],Ş\r€ónù8\0»wCñ^ºmlìe³97]t·ô˜Ë!¸¶¾%4a¢&–ÖW†2ÙŒ[’zøC`.—ƒkB&êa~íÍĞAöÀí$Ìå²p~mFèÂT]Ltát,\rš°°Q%ƒÀåd€KNÍKñn\0»y7T|z½¸{éÊòV7]™’ºø­À…¥°Ğ„š˜[zÛ]TT¨òÔŸn48µ8%ô`&_v³?iJ/~º°@¯—~ê¦‚;?ÌXšX ç rJ6±íLÀp>9Ú(+[x7 Æ»¡R)qï†Ú¶½½àS¦æCàVdGhÂM¬m­TËÀ2T¸ºµ*ô`–·d3\nZG°AàÒVHèÂ],m½\rPf$€@@ Å\0xrÕo¥‚@ÉG©D¶ÕpVY¶çTªŞ\rdÈ»Á¾P7¦Rªy;¤-@Ş\rå–ˆ§[ù•)øÑ»Æ!0H\nMX ‰½Ä^+Æt@ 2	÷â{Bèa7mÕ1#Hs}\Z»ñ¡KtA“Ï¥†@h€à­Ä˜9@~c­8Ìš€äİ\0†¼Ø\n¬ä#•0=’´¼È³¹ón(·ƒƒŒß’2ÅA ¢O?>š°@©tÊOô}2B 0	“é¤ĞƒzH¤~:Ó‚@¶.a½(¿^¡ót÷ÓíiBM$Ô‚ÀRq™™8¼¡’C Ê!¯îT›e¨¬ÁXBï†ä;ªu\Z‹Bÿú½Ò-—ËyÂ—)2ŞBJÌ	MX¢‰l^\0lv‚Àl.+ô`‰2^úˆQˆÓÂFDu½BÖè‚>nf21 „hê40lğJy1ºu‡ïAñp|¨ãÛÆ»\0İ:\0pónÈ®õ8ŸÈâç3@æ¯QhÂM 7Õê%†@¡ëô@ƒvfA Û¹Å}Âj]”Á9‚@Ó§qê®À¸ğ½ÂÈëï¶Ò\ZónhĞ>ˆ4€@hÂlMƒ@Ö¹õ@ ĞƒÕ÷§@ Ğ…ÅÏv@#4Mƒ@d’*°¤âYáİ(š	à½ãİPõq÷no¶¶@À	…&Œh‚\ré \riVz0_| ï41<!Pè‚\'K[¤éfX!ğÜ\ray˜SLüËˆzáb`È—E–Iu$ï†´‚Ààİ@ú½€Á»QÊÇÏìÎÃ»¡h9eµ!Ù!„B–hfé€Şçøû‘Ğƒ•zĞ;Ê×(Ä±/taõ}¢”¨•‚’B i]ÀtA Ë9ğÀ ii¹`ŠMGï†ÊP~:ïĞïİP5ß6ï†r6wÀÇ»!Ë•Bš‘@`t	MX¢	w^€Ø”ÃÔq‹!Ğír=X¢‡²”vDÏ>xv½BÖèÂ\nÔš¨Åùhâ(`¾ˆ\rAàÙ7eå0B­-ï†Òˆk…w\0ƒŞâ–Şòrw[ˆmd¯úœoü Ğã)š°@^7¢İõZz<ºN¡³õPé©Œ\0lØNˆT®WèÂ<]TEèğ‚sÜ=€fA °\0=®0~´½êF^Ààİ@XU›çİ\0òµ0Å»QQé	Ë\08ÎXYáš°@Õ•Uaí{Hé!°¦²FèÁ=ø*kÃZÏ{@àÑ\'µ•uBè‚&Ÿ–\0‘m é‚@ße÷´¦fh½\'•Ò¥R©©¼\0¾/º(£s6áZz\0pónH·ËşêiÍòàÈÖ××\nMX ‰¦ú+ÓTƒ?J-\rÍBè¡­¡cšÈìí\rBè¢£¡kš\rïøC ‘UC¨ Ğ¹@»@ öÃ^­ëĞßR>§­Jï†ô;ÕJ¬÷n\0 íİPLÊË»!İZZëæ¨ôÁ.<Y+º½íŠĞ„šèj¿:\'o¾ñ…@Ä	í¡ôĞ×qkÈì\07;n]X ‹›ïÎÑî«!¤ß÷<@ )@§@ ò_—fë\ZÊ`Ë•Å»ñq@(oùAh3ï¦µÆcÎ¦ÂÖĞè{âr»²Ôú°\0Iß¹]®ì•+—…&LÔDÛ•–\'eî²,õôP: è†@ùƒenw¶£©CèÁD=\\kê~Rî.Ïê›óOë#ëã!°p½]M¡uÑİtãH”uìu‘ ĞÄµ€	-İÏÔË•Í»!›»	¨·ö Ïô^Rïn6wÀwÎ¦®@ã3f}p„@öy*è\rtM˜¨‰;½ıÏX Œ4”?óş÷„LÔÃİŞŸé‰êÑÏßiş²÷Ğ…‰ºøeï¯é¡$;C Ôóƒì\r€,­xÈg\0@¹¦.5–(K‰Ù»ÊOœ°“Õ»qú¬£ônäT&ìÄÌÜ.ÿŒOø¾ñŠoÄë-ãGìúàz&+÷xËSÍM~¡	4ÑŞÜ:Ráõ¦Ø#s¥ƒÀªŠÊTgóU¡ôĞİ©®¨N±EõìÕ5©ëÍ7„.LĞE ¹/¯_Jo¨Ì®H“’#€æ@ \"B `„@„†¾Š§5—Üã†¼Ò–0É»ŒÍÙÔ–êÁMo°_º\\5Ş{«å)m¹Ú\rûou=õ_ö	MpÔD£¿a|à÷Ÿêƒ2m”·\rùBà/oÿâi“¿Iè£ZümãCw>Uş.ä ¾óçOÛüBuÑæ¿:>|ç÷O\r#Â|G#+}nŞ,zfDlîªøª²Æ=q¼B»wCºŸâF€õnÀÒy7€ÚlíjÁU[¯b¢³»~1ÊÅB Ò9²× í_Õúª…&8hârmİD wÔ”éY:¾wãÎW~Ÿ_è‡7¸®q\"ØóÑ(	®ôC ŞõƒõAàG½ƒ_5Ö6	]pĞEc]óÄİû£Èq×RB ƒ#€ò‡3ëCØ`7®jk_VÖÀ˜¿¹l¬²¦lâh\r(ÀæİPã\rï±+²‰»wªÚ2¸Õø¼Í­µcyŒjÓ¼%€@_MU¬µ¥a¬ÖW#4aş®µ]Ëÿå3P£4xÉw9v½½{Ìï«z0½m7ÇòÿGµàÊ˜ã~_c¬¯­¬±¶YèÂ üİl»=–ÿ?Ê‘ìJ¶23-<œ¡,ÇĞ©|áiŞ‚¡äé÷øïĞ©{ŸãìŠt”×tö‰¿¹<TYíŞ	¿‰½İLº‘™Â»!û€Òy7¤¼*]Ã÷u—+Ç;»F}>o(Ê]^\"är=ÛS‘†Lg”Ú êOû\ZÛZB¾šÊ7sË‰HtWh‚õ¦î¯¿è½\\{)\nTë|qm%×WµO	e\\toĞs¾³oºÛºC—}—v~šy‘XÛ	=0n…nß`ÏİÑ†º+QuŒ*Ÿ Â£RY¶øw|Sÿ¾·ıP½¯qglæ›ÄòÎ‚ĞãVèöı¨ç~^ğ§¤\'D·+¢NôØ¢ØO5mÅ÷² 0*µKĞx$O[$ĞçŠvİ®|t©Áó¸\0Ê@ÕJ	Iv»£øğn ewŞVı•š‘şw[Õø<Qö‘·¤²£´a0X[[}ÿ½Z\Zë…&¶öæ–‘?¸ûè$òG5¥‹­\"êû\\®õGıáĞ£kM×„¶Â€ßÿ¨ş0ò‡¨#lN‰6Ô5E?\rş“G¦›B[aÀÇ_ÿù£BäOWjën%‰ZµA„ô“ç_ş­ì¢ßÛ} ıj‹üPİª¾¸\n$D¡†mªŸª…Y!{:ù-“•7É{±íì\0¹*X–Ï»rt¾‡åè¬+Zz[å ìòpysªá}*ïÁ›qøYNúZ²ÏAÕıÔÒ2:jËå†ñËşª±î†oÊ=î4¾üx”$èŒ¾L^ãAúÀ39³xok+:Y¡	Åæv»ãMõcïöİúÆëñ¤YòV­Ö“ËV«|)BšóÑ¥yòo2ô|7ùÃ½ÕÍÕ,8zPv9¹Ëâí\rcİüø›JOUš”ËZk¨ùàÔ;Ûš‘YÚÔ¯3‘{¾~ıå½ÅÍP^i¡‹\"]”Ç¯6t\rŞ|X¤İÁDÄ{WI£QîGó½bıùıÿıÇ yÿ›¿û+”t \06k<œ\r\'¯\"áƒÎX$Hìåº\nÕö •k!ÂQ¾—7§Î¼˜ğ}qbı²ğ}Nşútßœâ¸Ş»]Z›Ç[¶Z8CUgşr}ÕlS‹/tÒDâXN€@xÜ4\\^ÙèÜÜŒb{ñCM$“é§‰ÊŠŠÕBŠu5µóÍ³mí!\Zˆ:OxòşÍò\\çÊÆJ`;¶}¨‡x2~áôP]Q×Ìù}õóWgo´÷…´aë|BàÉ6¹ô²saãm`+¶Ñ•ÏF×~2vátQSá;ÔEƒ¯qşjc÷ìÍö;!<g\rÒÿúÿû–`™9É’¼ZgßŸı+­\"z=x/ÔôıP¦#y_ğş’¡ô,ä?÷bïwñÜİBkÎ°wƒb4İœMø\n\\w¹âyß+ŸááóĞDGıê~,6¿vyĞzéÊTı\Z{1éçÏİÖÚ*ü¥…Ìï~œüİÎÎ–c4Ñè÷?ÿÅû|Æî§ÙDöéáòV­Ö[ï	¤KSùıõ¶îPá/m÷‹ï¿øİÆÎ’côĞRßöüÏ>üóÏ eçš:X«¹íp;’\'Pc\'`èk\'TøK×íÁß÷ÿ.¼3ç]´×w>ÿôÃöïNM]N9†ƒèv%yùûéNÇÜÍe^Ò$¯ÖÙ÷êœ¬å	ÔáûÒôıĞúÇè¯U:!mÇª‘JX1~ö‚\\Ü}^×íİ\0äÑXH9\"‹Ê»qv®ÚËã]½…‰uzåm~ñ(@eªÚŠcK¿ÿf÷HËïM4øıãïİº5¢«ÌMàÓR+ë=ò4õ“¬­n}4Òàns„Zü­ã÷¨ç”z(QúüÈ?Òrn,éÓÄ}´32Ï mÌ	¡şßŒ4»»¡‹Âà¡şßèØ1ÇVù¤gı`üAF<Ölœ»€»Ú=€ØHdé®Ñ×mDìZ6¡;X«e/n,§‘p:˜NæÚrYTl²¹İpÏ[Q¶ÜĞ\\=ŞÜ^3Ë¥›ô\\ucÊw->ıĞb8°²ºL$Rm™lÖ6š(s»÷ª*+—;Z[Æ»:®Î’;Å(ò\Z«×¤|\'Õ{ò­Xw°şs’µ5µ0˜[î\'÷Û2¶ÑCyYù^MeÍr õÆøÍÎşYšøzw(]¯öä¸¼ö×zúBÍ_ÄŠì“@ğ2ôC`je\"Kìæu‘¶‘.<{¾ÊºåŞÖşñÛÎr6&´æP©ºƒÛ¿úwÿÂ©À\06kßà/$’À€äƒät^˜«³ —~)!ĞèoÅ¦Y¡‰œ™	ê×| x‰ç†€êüt0)¡G@ ¹HŞÏøŒrFP\rš–òEƒ@+ĞÔ¥àè¦îĞÚ__·qº’tÿ«Úf|•\nÍëDz&KféÊÅ¤8¤ÁÔŒd:cÉGcİÁ*×‚8i†â·bÓA¬İ§¼ºi1+éîÖ¾fR}\"ß‚õwë?\'¹ìµ4¦ynDw~\\Š@3h÷£ı]¤ßGz²Ú¡;˜sŠ¬X¢/=ÃHEu¬è¦ï¶r+3/é“›ÆPOröŸ–’½M¢–Š2Íåd ²v<HåZ³ä6ÙÜe®˜×ë^ih®’uëÿ­Hu`PÉKª4ô–G!½nıÎ¢tĞ‘·’5¼°¸\ZX^İ&“©ÖL&kM”••Åª**V:Z›»€µê	U~èB§R½7>0¨¦ÉvN\0´&ÂŸZ˜>én=ÈØFåeXMeõJ µç¸X}‚l¤\ZßSÀ¨†\0@?8_ÆZû“!]Í±¸< ?ş¨øUp/kMgR¶Ñ…§Ì›×Eí\n®Ÿ_| ğ<q0\0Ò¯ôÁÊ´¬‡@PôJ‹óA\ny§Ÿìíd‚EĞIkF¢Ã8íéRAŠ×góG!Õ…Æ‹–ÂL#€2Ğwvõ.-§zw\"ÉñîŞËŸ{¼e)¾€ú^Ä§a”ïL¥¼¯æ?‰lïÚV‰ô~ïë…İŞµÍ­Â Ï+¼ŞÔY2›3 ğøWŞ\0UšôçÄß×É¸÷Oß~²Y³©¾½t¬÷»ĞVïÒÆâøÇïÜÿ¼ª¢:eâó·´È\nqzßOîyŸ¼üã\'Ë‘EÛê\"–Şíı6´Ö»°17ş«wşüóê\n_Š>–*Èµ˜ª‹E¹\'2Ğ]£§J¹7¦Ë‡î¤ë‘ï¹8“Ö}]6ˆøZy^…‹ªWe”·$Á>ÚÎMms5‹\0 u7ëîj¥¹FÄÖİl^wğÙŞ¯^Ïë‚¿hb;·üéÕëa}uQÈPw°ÚF»ƒ1çCliÒŸS}Ÿo_=Ö%ĞÃzn!øõÄè°úoQ/5Ü¾´İÁøüÅéŸĞ,úî`¶cÙ2ñÃºà¯ºçŞŸLüÃ0`ÎãhæAü»ƒ¡şë¶+\0Ú\"düx`@ ü6u{o;sWMòñ0ÒÅ¾q­2 ¾l(n±1/t¾”{ñÄİ¥·»ıÎ„@D€\n¹^£äë7sK··\"»ÒÄÖşæİ©¹¹~²öµóè„@V¯¤ZIªk”}q;¼v”Öö–îş8ûC¿ó!Ş•›ùæöòÖ‚£t±²7w|öë~Z•¹¾Ñßu<\n˜ôó£!ût£•)`¾ƒôçØg:c‘l yºjfÒ<îÎPk±¹ax—òµú²A@¹/\0º—Ê%\\à`ÍK¬¿¯;\\ØµºÆ3©¾röJKMˆzÔ,$•‰‘·4ú€<Ò/Ncee«ss+\ZØÛKtåóÓ•J§›º8šÈ×_Táõj¢®Æ7ßÔĞ0{µ­-D…Ì6:˜mÔ´±ôH×§u¾Â6¿<ß¹²±\ZØíŞ#©D^èBé¡Ê[>Z	Ä?ß~¸HoˆôH¥¬ıødÌçR*\'ÛäÒDçâÆ|`+¶y¸H<µwátQí­9ÔE½¯q¾“r%ö ”9ñ\\Ü¤ùWÿî?ræ40G\0ØÄnJ,~ĞÚ³T¶2s0¸·ÈeA•¡fŠ\r¼Åøx‡ÂÿYR+ÀÓœÄ®YXÜüğuúh¡s˜¿—]òWuİ¨-/se.f3Ù²ÉÉÅÁ­Èî@6›šPhÂÊâWêëÇŞ»y+¯‰ò±^s€@íò3Óé²ñ×?†7Ã™lFèA¡7(·5tŒİ»õñ¨§Ü›¹(˜:H•¾\Z,¬œÉ]éÂs¸ğƒ[6ê-¯È\\T,lÿ½…\0húRpÄAjû£“Ô‘–3ºò»¢ó}·4u0]Ï>ä£æèİ€¼ÅJ–Ìü^¸AH+mÑBù½]Ç<9\0Ë‹‡çª¶·÷‡\"_Ç‡\Zšªú\ZF‹ËP:0œÂÁ\r ØÌÍZ®ªú\rÑ—ş«W¡Áµµm¡	\rM„#kCŸ=YjonyüAÿ;£Øz-1M;ŒµŞHO1pEÚv/|ÿíË±ÁĞê‚ĞA¹¼¶æ†B_Ìu·ß¿=4jŸ!|Q~òå‹?Î®N	]u‘¬šßš\Zšûbz¨§åæãáÛŸ\ZÍ.çÑ}ÅvÀó‰X®nımfp\'äsåêİ\0œ¼ªËÀ¶f$82*÷æÆŞÃt:[wµëòhÏ%B ®L7²·”Ûİ¯››noï	M0hbi}åa2ª»u½gôRmm´TïGZÙİ®{131¸Yz`ĞÃÜÚÌÃD*^÷AOp´¡îJÔù(ı­G×ëÆg¾\\‰,	]0èbfíÕÃxj¿î£û£uÍÑó‡·A g\0Dç\nwÖ2;áÜ@ûW^•^.Š–ØYH^«¥\'ñnHÓ\'U`…wãä„¡}­5#•kMNéF Mçgr•M-¾±# °3 pue»se52ÛMèĞÄÖÎVğç©LegkûXg[[¨¨ç~„ƒÀ¹åPçüÒü@…tè!¼³üvò ²§­wìF{_¨ÕºXí\ngßO-MtN-OlD×….tèbe\'|:™®¼Ùv{Ìˆ?ĞnxøNäyÓ-%&÷€og5;ØCı†+¯t$aQÅS„ÙI~µŠ/‹h\0¹wƒ„éHÁìj•Rò9ÂTfÕ0ÿÉ!ÿ\'¾Ÿê_[ Úç‰T×xbú!P}ÎE+!po/á[YİÊÃ_BhÂ€&¢{ÑşĞ\n\0—jk#u>_Ì€Æ¼„…âŞü]p=lÅò´@C]CÄïkˆÑ}!0ÿ{|\\àï‚ëb3¶Úÿ:¯‹ÆºæHƒïJìâ@ u›)KÁ!S$à§ˆQîÏ’–ş)bÖßf†?µğ½½Ç-<y‹MŞjÃ†ù%§ÚßK÷‡æ¶¨—¡¢LûyTsÎiéƒbŠ˜7³á†áOhâğíNl·bvú±^§ˆ¡›šGïıHm/ez?M¿|À%ò\'ô\06w7úÇ§?`›öÅì)bôó|ê›\\\"B`c7Üÿ§©\'xQÍ<êØ–z@`ÚZÀ¸›.íÃy¬¥«ËS™û\\<²y–ç„¤P>*wa²\ZçİÀ¶î$ïóÛîv28ózã>°aÄ¯l_½Z¸ÏÅó\'4qª‰ÍH$øİË÷é!zÖBàŸ^İ_l=pÔÃjd%øÕÏ_Ş·\ZGüòç?Şçâùº8ÕÅrd!øøçG÷ÏBÛ@ 	\0Hx°kDİ´ <a4âÎsp€<»¹aÀMm*ŞŠ“Ê…õn\06ïT¤OªÀZŞ\r…1—Ú»QÔÒ“dÂñ>[ëñát:ãA4aÄğuB ’§Q¸æõµ¨Ğ„	šX^§Òij5˜L§<‹á%¡ô0~3œH\'<VB öşZxô.‘{Ş„g„.LĞÅlxr¸¿çm Ğ¤ Ë•Äbµko²÷¸U`é¨-µV—Š_C—wãôœ´Ş\r¨h¡Õ‘ZÒ–µw)Î§¸¤·³Û÷ğQ<-D 2\r‰Îf§W„&LÔÄÏS¯ïiŞ?l?Nş$ô`¢¾}ıì;¨•Ş={ı•Ğ…‰º}ıØxşÅà.6š´°]!ü°(ÌÆÛÌ\rqÉi`ZeÀ\ZïÂeÿI‹\rÈ+pñH.ÀæİP¼—n‘øP6‹Üú p€@†4\nÑÀ‚»B&jbu}}è ›q;s¹\\Z_z0Q¡µù¡LöÀ­QI ° ‹ùµ7B&êbnm:Ÿ8póâ]y§]ZäD†Àí•\\€Wóªİ8ôz7T*­ª·àÎ-½…wHßË[gg!~}Ş\rÜ}t}%ÖM‚/;AàÒÒ–Ğ„š-/uSY‰!pfqNèÁ=L-Nvk\Zb\Zìa.N,ü,ta.^-şÔÍ“XÌì¦çÅÒA )@§Bàş6\nğQ“zK·w\0¼wC£³y7¡}`Ü»¡¶E·“-ø**?ßì	MX ‰­#Ğ&æÑˆ+®m­=X ‡å­å€¨AàòÖ¢Ğ…ºXÚzk´-„@ú]KÓlšĞ2´ä¯´H\'A«a©Ù/×sôn@}Ş\r¤áİ(òfğn(·d\"ÓŠ×Ki!Pùo\"‘š°@û‰D+S™ÉÒTº;éÊ_î\'ö…,ĞC,¾ÛŠ(@Í\ZÔ>f7º°@ÑøN«Óç]Tt™—4Ò7Å2í‚¤O+{€üÆT„™¯	à+44êİ\0@µ§åİ\08ïÆÇaÄ»¡Ü²~úé]%f1]«Ğ„ÙšH¥Ó~]e†hê<?L¥SBè!™NøÕÑÎld÷ïdpBèÂ]$Òq¿VlV@ -\0Üt@ Í¨M½iårÀ«[9Pm^zP4ÿ’Ò»ìæİ ú8ô{7d—“C^C#{-„À\\.\'4a&ÎòÙŞ˜z°DÙ\\Ö‹G;„‰Ø±B ¯	£Qşz3B–èâ,ŸÏ/:\Z\0}|Œ8B`Ñw¸õ>n©Å2;%÷n@ŒwC¥‚ÀÍ»!/§£|6pVA Ğ„Eš@n`¤Ì,‚@ùu\n=X¥Dõ¬a…@íÈíşB¥Ğ…€@[ BN‡@…N\\ªGfÇ,ÔmÄ»AUqF]Õ\n«´Æ¼¸,À¡’B Ğ„5š ‡3ÌJ@º!<W¤¡‡Ğƒ{\rÚÙ….J¡¶Š\0–Q‰ PcÆ“İ°Ş\r`È»­ÀÊ¬Q	Ó#I+7›;/ï†1œ é€@¡	+5¡\'BgMh=pºGœgºàÆí\0€Èb$-ÇV¾D²L¥GònH+%\0öğnH¾C„YÜ‘ælîìŞ\rYÖÉò™\"Ìº”i`\0\0\nMX¤	˜•–Òu0¥×)ô`¶eÈº~°ò•Ğ…õ÷	€áU%Œ\0J!P×Ü~Œ‹²óƒÀ|f¸@Š­ÔŞ\reKÎNŞ\r\0°Ş\r„Škï†,û\\0Eß­O`†@y\Z.—KhÂMç³>D&C [èÁ=¸]îş`ş¨ı\'C ÛU&ta‰.´óY@`IPŞwºËA„º´´¼*‹m;Â»¡æãP´\nz7ÊË]òô+¥„@ùÑåån¡	4áõ”Gh§Ò7v¤·Ôëñ\n=X ‡\nOe„üH·VÊ®WèÂ,]Tzşöîõ¹ã:ø¼ß ^Ä%A€’\"%J–MÊeÇkW\\±¼µ©­Tmø…À~ßûa+)Yv*ŸSI*û¬d½[G	¨Öt„!ÑK ²e	K‰â||€\0ñ~½âŞ‹;Óçt÷ÌôÌ=§\nÜÛÓs§gæ7gzº&)oÆ\nÀd\"°ºÆi[Kİw£8ıIß]s0‚ß\rôé»á×£àŠÎ¬¹ÖÖWû!Í5ÖÕWK›ˆ M4Ô×«÷k$m3R¯o¬oöA{hªo\ZWŸÒİA`s}³´‹ÚEK}ë8•x‚ÀÈˆ‘![^·ÿ×Øæ]Un!jßí±b÷£üÁ}7P¿ï0únìJåûìn£ïF~´¶Õ^\rBšKlko”6A›èêh¿ª‡3Ñ\Zsíîè’öA{èéì¹JÚ\röt”vA»èíì»Ê! 0â F„@ĞF ÇÿÖŞPobßü¿0ún€~ß¼«8í¾>£¹›öİÈ½ûoìŞ‚n\"0³¿UÚDmâ`Ïşú8##, 0}J{ˆ =í=v£Ô <®\"ğXï	i´‹ã½¯Şà/iL4\0õ¨\Z›ËÁ^%¬5wÂ{¾ÓwcW?ún\0öİğ¹Ò{c6µuÕ½çUz>O#1Ûk¨(£²²b­³«YÚDˆmbßŞ®÷ª*+×Ì2tÑ °ª²j­gï>i!¶‡Cİ}ÙöP½æ„÷C Æ†Àêl}ûº_vb»x¡ûè{ÕÏÛ… ĞY\0Ò¨Ñ±;dvöÃ¥Ò×w£ ß€Fß\rôm8áõİ€Â¹ó?/Kc6õn¹ä·mvìƒæY<„¢±i™Æü2úº¤M„Ø&N=|‰–ıu\'öb{8uìô%5Ã8sGƒÀ×ı†´‹ÛÅ×}ë’	ñ°T%?§lôt_ˆ¬ª…¥æ.,¼šÒè»Ô±—Ôw|Ó÷»Z”é˜M~Wz`¯ïF.Ú÷Ö\rÖÔîïà?a¬7.X[[µÔµ·YÚDmb÷ŞÁÚÚÚ%¿1>Ùûu¬¯­[:Ù/í!„öĞ—él¨kXÃl úZ5ë\Z—^ÈH»¡]d^l¬k^RñI0S!Ğè\0oˆÀÌ1¸Ø°FŒúnäïœ%wxˆ¾ï€ºïFÑ  ¶ún4ï©yáÅ=©Ó²qH,#ˆÀc\'ö]ÜÓÖ mÂb›èhß3ò¥—_<NÄ‚@õEÆé—_»ØÕŞ)íÁb{È´ïùW¯|ó¢aa ¬\"ğ[¯üÖÅ}í=Ò.,¶‹öƒ#ß~åß\\äDsĞ3;ûàıºFİ¸.Òé»‘ÿ:(Úó®=Ï±¾¥Ø2Üc\Z›«G{ú›†°b4\"	æ%ûw½ßÔT\'mÂB›hmi}ñpÿé8	ƒş(ı·—¿­y´í¡£µsôµ#¯\r!¨¦[s§}íıÎ–½Ò.,´‹®ÖÌèëG¾1dâA`D\0Ô™©ıÅø¬mÂ™–×5z£âöİ(1š{ñ•ŸEùÇÙw#`4wSüufê‡³ß§¶`	hŒÀÆ¦š™ÌşÖá¦¦zi†øëİŸÎ~Ÿ&\'BG °¸§¹e¦¯§w¸­¹MÚƒ!şôÎ~ŸVß–B µ¯_¸ìhîœ9Ös|¸³¥[Ú…şºG÷œÎ\"pÚ4	%,Uöó~¹^ÑÇìåı‹Ö\Z7šWø*ÿ	å=ÿ-£¬­½ÄóvşÚšÁ±Ú&oêÉ-oaşò*·ÈLè»Qğ7\0ßQÜún<®†Øwc½Ä€Å#·ãîÛº‘»íÛÓß8ÔØ\\3]r ¬láÖ	ÚÎşÛ·~öTeä–íQÚIáßº÷µŒ55ÕNİºñxajzNÚ÷dß¶gäØá¾¡ÖÖæéİÛ÷]­ıšr<B¯`¨¿²Jı­¯çàXksËÔèµÏM=’öÀŒL{fäµ#_ÚÄ_©m]Ø6ü_Sj{ù“ü^WºDŞk7ÿzôÀñ±öæ©‘/şïÂƒ©»Ò.˜‘»í›Ëüe8m*’ O-ÌÓYu/Æ‘Œ\'h/c°Ù®kÂé—áæNïŸp¥pÕ+¹SzAƒuBH}7ÀlÌ¦]W}/IÚöÖyeÏ;\rÍÕÓ¨Ê²¡İL ™@T–±™Õ¬~ùÕïìíj•6Áˆ}İ]ƒ¯¿öò;™?>V$)ØÖ²gú_şê;½İ¤=0¢/Ó7ø[§¾óNGkÇ4=ËGÉÅ…•	DV&°³uïô¿>õoß9Ü}LÚ#2ÇûÔï¾³ƒ?SE›	Ôú$¼x²UaœÔLà6ó3¹¿gzC]ıpùÑuïësO+OgKh€ªìûªq3}_	şƒun/#?İEWwÔ8ÿã²Øw£øÿ¨±WTTzó-m5Ã½MV×T,«21Y6´›	ôËâgƒ2>»3Gg†úw]¾şÅÃ¯?œ;½kÒ&Š¢²²r¾«cÏğ‰£‡?¬©©Y.Ø¦Ï¿•>VĞökÌĞE•	ÌıíÔK_\Z:yäøå?ıúÄ“‡§×`UÚCñ	§²j~çşáÓÇ¿úa]Mİréı.(Ï†‘d¡äkK‚3¹ßóä·‡NûÚå_\\¹øõ»ogÛÅŠ´‹]í¢zş`gßğoÿö‡õ5\rËösuÑfµ{#°*ÌÂÓ†ÀÊjo9ó\"\\ÈşöÂôxÅ¡¹IXœƒşœ}Vg`eÃöİÜ‹.D­÷İğJÜÕµr7ê›ªn¶¶×\\ëØW7´k¥Õ5•Ë/¾´ïBöÇãš|2;07»ÔŸ-³bifµìÚD]]ÍƒìëÖ[š\Zovu¶]ëİŸÜB i8ËÏ¶+w—U[S»üú+_Şhc÷îzğxb`zæYö¯3e×\Zê\Z²Ço½­¹ífO×k=cÅ§–\"›>ı_«‡Àúšúåß|õvqõî•Cw\rLÎ<Şhs3³e×.šêš³Ç	XïhŞ{óPWÿµœ3E\\j˜l\0î>I¦	Û¥äú¶f¼±âÍí•Øs?ZûıØúnäïÀÔw£Ä­€l¼úÍ=on×Ì+y‰âwˆô•“|nÿ%³¯e,³¯u¬pë{»ÚCîß÷/\\Il›xãÛ_}³ørÕóy°=:pHjW%>Hñ++‡zzÇr}ı.ñóKı›wšØöpö;gß,}ğGŠÏÚ~d+@ ¼Î6·#×?0÷å)S>üŸÿibÛÅ¿ã?¼IKtqØ%´!\rc>Ÿo¸}iƒ	o#Ğ´,¯–\0“Ñwóndë»\\zı¶…ş“½qõ	Dß>Š:‚Y+*¼D¶‰l½—K¯«n½¼\n£Ş@ğÜ9£IÛ¬`×~2Õ¯,Î±¯²¢\"¡í¡bygM‘y(Üßíÿ‚¤>ô×Ñg\ráÌì)|EeEeBÛEå2G&¾0õ‰íÒÕàM=\0ãG Õ“š•UUÏ;\0?Oá;Úw#o§šºŠ¥O‚Q #A Ä„ÀšÚªD¶‰ºÚÚÜ‡-XmˆvökÊ6‹uµu‰lu¨ëšêO§F`pê¢8\ZjÙ.6oñr %L\0Õ\\væNº´ˆÀíß´ty#kSÕÉé»±µÜ=]ÕÃş\'ÁğXj¬@}j\0.vímMd›Èt·óÇç´@H{3=‰l‡2‡ÕX*õY ÃKä¼¾ô2_È$²]dó¡%LA•îk!£A XDàö¿‡¼Oêë+/¯æväüV ÛwƒpUF³)ÿV@ákšÚª.wªÅ‚{Ñ ¬\"Pp!#°¯¿ó“Ö†æDµ‰ö–Ë‡_80Êß]@ ga#°ôßO~ñ“ÎÆîDµ‡LGæòÉÃ\'GiX¢dÊÒ†@U6Pıú¯ùê\'ûš&ª]ôt¼ü•¯êAK&T+o†ÖĞ¾hK03G¼ÁZ¯zde¼Öç+×=ı¾|U†ÅWf¤¾;ËjÚS5Ò{¤np×Z8‰@´€@´€@>T¼¸o°¹¢5m¢½­eäÄñşAjvM?3‰@´ˆ@u7Nö/}i°£2“ˆöĞİŞ=òú‰×yX¢\"Ğd6ô!ğ/ıæ`we_\"ÚEO{ïÈ·^úÎ jf4¥Zù\"ĞCÔ_½ßùQÁjüöá=§3;\nV3øiŸà¿û=Y¸ó`®¥ò4êWøt0½¬§÷q`zN­,bÏú\Z49s%PéÍÖÔy÷ÚºkFºzj®•\\ç]—Ô§ƒƒ¶ƒçû	îúç·¥GÜ.Û7ÿ/…2ÖóŞİ§ãS§VzÖÖÖi•••³õõ5÷öïë9ØÛ}Í›}¶‡ô”1wşÛ…Ü®<åĞêœ‹ë·oÜºçÔÜÂ|ÏêÚª3í¡ªªj¶©®é^OÿÈ±ƒG¯ÑñÁŸƒÿñCµß½»ôëTO)û¿º^A¯\r:íï=Û1:öë/îvjfáYÏÊêŠ3í¢ºªf¶¹¾åŞ±ı\'F^>ôÚ5şè?lƒV^¨¥SqùÖ¹³°¸2ÿ‡çÎâbÂw’<š¡(ïÕ¥rtNè¤“`š\\>\ršuôxŸ£TKÔÑ³ÔfhÔn´÷Åxè·¿ª@äùÔOU&}™üc® ĞiTòX„á¡Ëôı‚@£`E¸«²ù» ‡+toßîÜ‘óvppy¼ÛÁÅeiÜ‚*~5RÊÉ/‘ZÂ­=Òí°ğoûßT2H ğvppùæOÆÔy·›Ö³T‘ÚfìõÑÄû»Q»ÑŞËB£ÛÁ´:í÷¥öê’ËC^™ôeò¹ªÏÁÙPp;8xš6·o®c`í¹¯zOP½(ïµñ~õë\\¾lZz Œ\r€şO?é#«|Fä,Cû„®…@u \Z6ÉE $Z­#ê´a}B,¤ÎÌG ·¯d0ÈˆÇ·”!%Û‚ÿOq\"Â$A`Ü´şHĞÁVÍ—¡}Bg#P—òF XB`uL=iŸ‡ùÌ ò¢Z(´õû¤2)È*K;\0Ó‚@nyA4{ZV #­#CA p‚@íLcrˆ#­!Ã:^\n}q§‡EA`T¤¯‹ Ğ\0ªà?©x¢fYQ P}r£İÆ*QW«d\0Îa¢óÄ G XC ú³ÚF ~ÆP£0:z&€Ä±\"G Q=B*¨U×Hˆˆf}åvî¿³ÀáA(Œ\rFw:—y¤¿u×1™Ä#P÷¡’8¨Ã.A`„À¸ˆEä<‘\'4Iä-†r›4Å¢6u2³öÈŞ¯@ ÎñH…@İå™®£}êd+9¯&©¯uªO@Ç€Ñ	`”äÍ,¨@«8BK·8uÊ@ş“½®!ŸÅÓE Hş´ˆzûu¨ÜÖ¨»ôåòH9ÇD‰@¦\nÜº•\01PÍúD~™¨;,C\ZöC\n@B`$24¿Å©}›ù€s	 @4nÃ¨\r4]\Z¶o#ÒöGıÌœë¤.Wu«šƒ@Õx´‚@A`ù!0„a`‚wvãN9e¢Íş>š\'4É>è@‹LbŒğ6)´u%—a˜¡ÕÓiA/z^ºƒ@>©¤Ô1Ô¾~Ñ\"‚@—\0¸}@1G ¥¡-,P5V îÓ¸Ä(ÁQÒ×}VÈÉVú\"Í36ˆÌ¬Wz¨‚^´,ÜW¢E ï	bWN\"PızuŞ\'LÃé˜\ZÚ;Yl£ìô³]¢M2êCF ÚG ÚE h#ĞtŠ<ÒB ÿÉ6¢õıZÈG úÄ)õL#ÃzŸ 0	ï!A erO >\'bkdÖuÖÙÒmR\'–H,Ío{§êr´/r	G µa\"øğ‹ Pè.\0Qè!•ÔÎ¥Œ20¼õ,š×5½TOU+Ñ&Ñ:8{‰Ê\0\n“‰@;Ów…‰@u†¬|ˆVh¡	A ZD }îlÊ~#Py\\YB ØD ­‚ P˜6\0¢ö§rŒ+y´U–-BJˆe‰@°Š@KuŒ˜÷?(·®¤mVĞD‰c÷¥êÏ3‰¤â&|r‡•–­Œ@ıç“ƒ@æÉm••@bXgˆ©F &\0…Ù@g@0:IÔ[&ª£İA Ä‚@î/q!P=?Œ 0‘\0ÜnøDg¨q¢=w²0h¸®š·IS…@à!0®iÙD;ûu\"P™è8õçÖÏìE@“q	`¼dgî4¨›1 uØ7,‹9%V9!°pqâº&\n‹êb†cT\"÷ø£ª+g‚Àh#º^¶Q%©Ù@^n0zšÎì6C8‚.1\Z‚Eêœ,O”±!E \Z®kÀmÒ˜È)ßz¦ÎôuàuÀ\nãG Ú‚¡f†@Sª¹ÀŠp‹ÈTÅˆ@ŞŒQ Ëà(ÁÁ-ß²v\n	åÄŠ@´ˆ@uù4™Nè&Aè\0;{L\'4uœIY. C@`˜²¸è7Œ‹f;jA „€@b9H¾…@Ô:F˜ Vg»¤M›É[&2ñº„T!;pT´û„púC\Z†±³[@ õ>|¨9¶ŸÉÕ\\2lLÒ§*ÓE *C–d—¯İßNè(íe¡Íç¶µ/_â¸ÀÒõS•I_&ÿ˜kôYMÜC 8Š@>ºÊqd­g\0µF~g!Ğ²—™j‚9ËĞ>¡k!ĞB†Ñ·–î#P³ÈË4Æƒ@{]ÀQ‚&¹Ò`a`V.­T%\Z”÷Ã}o\0>u¯^:D4_†ö	İê°!z„Ô!- Ğô–u¹\":u`Œ@Íã› °È}OT4{B˜Út#Ğú@ĞÆÄô#[^Í”P#R‡@\"àR‹@°€Àê˜zÒ>\0ÕÓñ|ïÇ7A`Êhç=öH…õŒòD M\0.­­®›#Ò@Ú‰¹Q³¬¨È˜——xBGëd\0Nh€@Ô+#r¢Ãä\\™]”\nÃA åŒÀÅ•y8w“À5\\G;™@\"Ÿh³†À al\"G úä¦ıôd¤DkÔè4A9Azw&(Ä2G ~ÆP£œ5¤ğ½kë«ß’˜\\X]Y3ÌØñH?ˆ„@İ‚@ğï?F¨k\\S‰È¹İLF ò3IA` µ¨“™êTÔ]éÉD ¦¦óG‰@ÔÙAàüòÌ†¥’À¹•å5Br5É:Nh^¥²©Î \rËgÔ1ägñtHËÌ†‹@Ôëë+´p§/—@l%çuÀD õµ. Põ	s_óKÏ6,•D\0Î,/­(“«î#0À© 0oùa÷O#ZÅšßâÔî+‡ü\'{]B h#-·aĞthØ¾G rÄŠ@ŞrKíAşÔ8w…Š@¦\n\0Ó7,•D\0>]š_!N\r¤@õèDœrî¨;6WÚAöM‰@ÿaI¬gÈX$ÎÍkŒ@ĞB &`Æõt\ZAc÷ÙG Pˆ6–&	ÓÚ‘¨ºe-5÷pã[\"3€+K«{„65U;»î´C¶È?Àk,°t†Ã6Ñ*i0¢#P•ñ‰`	hŒ@N¶ÒhšñŒ¡aÕYª =yóG‡@>©¤Ô1èGíë-Ñºó—/ŸÎOä¾M%€ëÙıd|anYyàp–„F´t²@Õ€Ñ¼~vì(tÙC ÚG ÚG RÊÀnµRËpê¹¢q bD ï	â(H9“T¿Şs‚Àâ˜˜Ûø–D\0æb|şÙáÀ¡Ş‘ËöN»OÎ&ei\"m\"QÔYgK·I-#´h:O2£‡è‰h}¿ò¨>qG@j=ÃD ñáA`¬|0usÃQIà½ÙéÖ•‰ 0©ô9[C ³>¨!s`Œ2Ğ¼ïcú¨.Gû\"§¬È_f9#Yıü® ğéÜÌ,>}zî,Î&€7ŸM.0\Z\ZeGFA “&íÌÜ&Õ2A \ræë™òfß®+}ÚDÊ~#‹<æ¹Ãhh L$o>\ZÍ}ƒÃ6\0/Î-?[^\\ÕB`ĞkIG @´Š@uL\0ÕË0ÉĞÑÈılİ@ N¦yî0A ØD ­¥è.Lo<úõ†“À\rÁÎ<]ğı¸hÃÄè\"Ğş´Cî!q²@[e%&Ñ	bÄ«´TÇØˆyßB q¬@A úÜá\ZÁ)r‡•	Hª¹‹ÜÊ\0ŞJ:\0o>›œW^Å„ƒ@³i‡\\A Õ“Ú*Kó6n\\„0N R@L\0³j¢ıš²ÍRˆ@½eR‚@%¹ãşÅ@Ê;ÜCà“Ù05ÿhòÜYœN:\0¯<˜ƒuäîlq\"vÀegî4¨›1 õÕ2,KˆÀ,\Z®«æmÒT!x´2M áğDÈ=ş9Ô_¦M¢ãÔŸ?X?³5M›vŸŞı0÷íÿAÄ\0VWÖ®ÏLÎkìln#tˆÑ ,\"Pçd8ş^™ °pqâº&\n‹êbŒ@İÌl˜¤â,lê}˜6‚ãäœom¢.JRĞ¥):~n¾gô^z\0˜‹O<˜!nB3¢cä\r–\\ˆ\"\r×5à6)†p«•@Îçhıvmè$”cÀD ZD ºÎ‚À|šÌ\"zhÎ8š!àñÌ]¸÷ôúãsgñ~Z\08:9>k«kš;›ßÎØÙcB 8‰@,s‚£TeÙ4`äÑ2‰åÄ†@°ˆ@ZÃE í[Ğa\"R…@»óÛC İ\'„©h—oş<÷í_ †€+ëkxéÑİg;›_“Òà4uœIY. C@`˜·IãF ß0.·ZIûŸ+„Øhç\"ÇºÀô!V&o™È<ÆÁQòÑå&—Wá£[ƒ¹ÿş*M\0ÌÅğÄØàó§A¢F gœ®àÊúƒ¨9¶ŸÉÕ\\2lLÒç«ÕE D@ŒÁå›?ËA :Š@{Yhóùƒmí‹Å—8®!Ğg ¯Lú2ùÇ\\[¤O† ,\'ßø9,,Ï^:wÒÀÉåÅÕßŸQìl:ı>˜;;ö¸ÌT#ŒÈY†ö	]ê@5l’‹@$ €‚@«uD6¬@p ‰@n†4dÄã[Ê¨J4”\'1à§8höpµ>kë«0ôÅO71EEÈåŒßš*<ç™Œ¼	©W¯‚@D4_†ö	İÊ°!‚@Òö@;·› qb†@şmrT^T¶ŞcÔl`0UëòË±ğláÉGçÎâdZxqnù“Ü!ÜF\Z1ıä–„@³%ÔX\02S²Oè\n‰€jg\Z“ƒ@Œ´Ï#ïòË\Z1¬ã¥ ĞwzXF…À uÉeÿŞÿüí$Ä,cøîÕ\'°¾¶î†@ãÎÌ¡!z€×A j–Õ\'7íóVÈ\0œÃDçˆzeDŠ@p`\rêÏ^húCA`ÜºúÓÜì¿ˆcè—¨x{yqõƒû×\'‰Ó\rÒ\"Q ?Ç¨!Ôªk¤D4|²õéA(Œ\rFw:—y¤¿u×1™DA #|¶ğ.|ö×¹.AÌQÑr.MÃÒü² Ğ÷àEÔèØ-ÔIä-Z¿MºÓ	3•¢6u2³öÈŞ¯@ ÎñH…@İå™®£}êd+9¯ƒ”#Ğdşàhø³Oş\"7üËàÎüm¤óşÆ	ÀE\\ÇócWƒnÇÖt\"7° 0¢£DÃòe¤\0ü,.i™Sòç …@ÔÛ¯€@å6°†@İu¤/—‡@sWè¤¾Öª>7xãÑ(||ûâ­œyû}YC’\nÀtçôãù6‡N\nmpŠü2QwX†4\"0ì‡ÀVq„æ·8µo“\"x—ÚDã6ŒÚ@ÓE aû6B mÔÏÌ¹@ŞrK·=ÚTšƒ@ZD`nĞç·Gş8÷ßXüˆ€+~û³\'°8·bˆ@Oñ–F *Éq^ë@ˆ6ûûh,\"B oÖÂ¼¿ÖèßßÎz†Œ…@âÜ¼Ô2,îvuÀB`hõt\ZAĞ‹…×†î PkŒ[2MfáOº±ÌøÓ_şgx:7ñÁ÷Ï¼ıiü¹¿x\0x}mıg×>‡õ54@ „†@°‚@KB#Z:Y`ñ01\Z“(ƒÊ‰ôuE_Àr²•¾DóŒ§Mª§	,ª -ióG@í»X$Rê´†î!PızuŞÿåæ»ğ«±÷>Êâï9%¤\r€¹øÅÂÌò¥›£± ĞöN›Ç(;ıì@hŒúˆöˆvÚ4\"4‡è‰h}¿ê!7ŒL¤œ‹ÒˆÀ°Şgw\'¿€øÕËıàÌ­ß8˜‹ó“f‡ï\\}Õ;² 0JrO >\'bkdÖuÖÙÒmR\'–H,Ío{§êrÑ P‰¨H­g˜$>üRf|2;?üà°²¶üwß?óv¬cş¹À\\üÓøÍ©á‡w…€@;² 0FB*¨!K\re`xëY>4«kù ¿ÌPˆ6ˆÖˆÀyØ£|8·ôşçĞ[¹ïç¿æo~Fœ\0\\Ì¥Do_yOÎÅˆ@¦v¦ï\nêYù\"­\"ĞB‚@ŞìÁu¥ÏMÙ¯Ñqr‘Ç<w˜ l\"VA¨üÍÊÚ2üğƒ?Èe\0ßËâïm9å@8õÆÙãìÿºşñLN„@$—_\nö§rŒ+y´U–-BJˆe‰@°Š@KutÊ©+í ´ÍJ ûÙº@LóÜ‘PR3\\á#;¬Œ\\\\™‡?¿ø½\\ß¿KYüı3°–SF\0ÜBà5\\ÇŞøx6Ç4C m¬@ê8Ÿ2Oh«¬\"ÃB 8ƒ@L51!ÌŸ*Ò!ŒNõ–IE j¬@w± ;äK\\~ÇìâSøïïıŒ=¾2”Åßy*&Ë€[¼=Îş—[£>\Z¿5¥l˜ü)zâD ÷€>ÑYjœèãB DÀ0\Z®«æmÒT!‚@`\"íì×”m–2ê/“‚@ \"G şÔqú™½¨¨7ÎàÔücø¯ş<˜ºùÏYü½ËÍ(–-\0·˜{BfèÎçO†sSÆá:‚É‰ID ;s§‰@İŒ­Ã¾aYÌ)±Ê	…‹Ã×U¸+\'„¶¦	4£¹ÇU]©8Fƒ@pœó­MÔE‰@j6p\'n?¹\n6øs}şŞış™Ÿ¼gcÚ¸²à\'³ßşÏÃÛÓ¿ølø>,/®úîàiD è\"£A XD ÎÉ\"ğDÑQ¢áº&dêŒH_×h!Pw\0lA  0>~põï7nûÎ.Nıí[g~2äZ–ÏY\0–Jyg¸~ê»‡6;µøîè‡w`êÑ|¬DÇÈ›1#\nb™#E XB Z@ İ[Öˆ¼Ï1\\b$”+Ñ\"Õuæ#ĞdJ8A Mææöıßş!üì×1¼¶¾úGYü}Ì[vüáí>iÓãw~ä-ü+oôoV\"ïßšy0rşúÑœ	»µ=p¤**+v¿në½^ÑÏªW¿Îó}¯çÿwÏ¯lÏ÷İô:ÿİo™g¹<úyIYAõR}®[¯öLÊ	ªkÀ:oÿëqË±TOÏ#nKëêì§Au$•¡»=<Şçh´¥>GÒ†	mÆ¤ÍöÍi›>íÊ£-‡wÌTï÷äuòxeÒ—É?æª>‡Àó‡§ZgjıÎÔ×qÎ·~¯õ[^Pí¹¯zOP½Jÿt}â×pî£ÜÜ¾?xëÌ_ÿ#÷ıÛq²úß•o0ğj\'ÓSß}ájö?›şàÓînem]qù]WP®øhãtigM2w¨9¶ŸÉÕuñ+Ñ¤¬è3HœÖM?¨Ê¹	E&Ğ¿|­şvÔ:\"/Ó^&mÆ^Ú|ş`[ûbqÎÒ$H«³Y&°tıTeÒ—É?æêg!5™Ààsd|™@¿÷.,ÏÂÛ#~ñ­ëYüıxô÷K°D0ğJ`+›³\rlíl8Ú{´ê›kµ®dìeUWá2Œ™»E\Z3AY­àL wÑe-eÈ<uùádƒË×Î²±3êÏ1L ½,tÉ¿9	,ø›gáøaœ	¨{Ê2Á™4ÉÒŞãÿ¾ÜÀÎ—¯ÿ.\\ùInœ¿÷³ğ´‘IŒ;è\0UÌE‚§slënìŞ¸\ZvAP(Ìûmh$œl–°=<;È‚Ñç=\ro‚À”#Ğü=9ø\rgáwñó¿ËMé–›Ñc8‹¿I«È¿)s\0öÑAÑ‰<Á¯d¿ÎB0“ékƒ¦=uñ#ğù¹ ½¤˜idŸäËÀ	©E Åã¥ PX\"–çà—·.Áï¯&´<:€œFàíŞ|Ãç¯¿šËÖ5Öôvìo†ÎìWM]• Ğ9ª®äãF úäÆ=¡?ÿ› 0a”KôY†3ä\\éá P‹ÉDà:®ÃÕÁÇ·/Âg÷G`m}u~ßËƒı¡\ZOVÿ®\0Ğ°	ÁÎì·W²__jéhhiíl€=]PßXã$C¿²ÕF Æ^¨®kd,zµ\0çé!3ÉÜ½­IF îñO˜ææí½õè\n\\ø	|zçÃ\\¶ïóì¯sÃ¹|ş½3?^Ó}º—Š@ N#ğ‚‘6|şÚáì·ì×‘êÚÊÎæ¶hi¯‡ÆÖ:¨­¯‚ªêª2G ÷@\'4IÈÍ4’ËğvÚ° 0ŒãQ84_Çä!P}uÓw`jîÜ}z\rn>…;O®.f=–ıºı\ZÍ¢o·,3Æ\rÀª8»>\Z¿ßı~ãÇßÿïôw®omĞóY6MÏôe¿eîÉ~µUUWÖ×6TCãÖ$^…Wâa*¹%xG£Ô€¶Ï·jFÃõ^ë±Ëâ]©}³œ ú—â1Ö[QG©kĞ!’³¾ê­F=éxÄ÷!Ór<ÆçJÏ@¨÷&°mÈû ÔÏÖc‹¼Rß,ï‹ÁŸ\r¯q¶·j?àî¥hÒ–èÇW~~‰št±sîâ¢ÇNRÈc¼Êc•1¿ô¦lüfq\n&g\'àÑ³»Ì~Me¿îe¿n¾yæ/ïĞ>ŸBƒı¤\'2àæhA^(Ü,g³ß>ÍşîÓíß^>ÿEıêôZûÜôbfëW•Ù¯nHzä2yÓ[ÿÏ`òÍ3?zT\n~vˆqG¬·€%$$$$ôâÜY”c°„DÂ÷á8£B6„„„„„„„Dy…\0PBBBBBBB¢ÌÂè°„„„„„„„„DòB2€@									 „„„„„„„„„\0PBBBBBBBBB\0(!!!!!!!!!\0”\0JHHHHHHHH\0%$$$$$$$$€@									 „„„„„„„„„\0PBBBBBBBBB\0(!!!!!!!!!\0”\0JHHHHHHHH”Iü\0#˜a…68ÿ\0\0\0\0IEND®B`‚');
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
INSERT INTO `PAYMENTMODES` VALUES (1,'cash','EspÃ¨ces','Rendu',0,'','\0',0,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEÖ~.ş\0\0\0tEXtComment\0Created with The GIMPïd%n\0\0IDATxÚ½—iŒ^UÇçœ»½û;3ït¦Li;]\nCYD[Bˆ(DLMº ‰˜h4Æ’&îøcBı€1šˆ‚\0‘-²1`RÙJ»M™vÚé,ïşŞåÜ{¦4(X*‚çä|»¹Ïï<Ûù?‚`İóÊ½ãy7øV˜Ä?Ş´vÃ}+>LÃl{°æõÃ±¡±¯äkÎ¾¹=ñdãà÷\n‹î¸jÅ§³ e-/M>«¦ë‡o­­øÑŠÚh­vPBQõû8Ú9ÊŞ¹=m†õ›ÖoüÇ‡ }µ :on6¢pîòÆ¡å‹Ï_«D:¦/è£ì•PBÌvgØ=¿·w¨yèÛ+J+ï¼pô‚ì˜^ûÖÕ7œsÎÀRKŒ±†·rWâäN£š«àá#…D¢P(zIm5\ZL4ü©§Û_^¿fÓŞÿ\Z ÛuÉÙÖ©ı”ÜšËEû9D´TS¾+ûˆKAéR”P6³Lw¦™j\"#ciß©Ä™fßüşöLgæÖ/\ZûÕI˜ı7×L¼ïû¢tÑ×ˆvKÑz!ó ÊÇNœŞ©„¢Š¨­\'5†VØ¤“té$m7`Iu	[“4â&}¹>ş>±u‹z?ãéŞãÆ4_ù³/³¿2Ú†p* ÊXYF¨2ÂÃqĞõ§0ùs8H!.QÉUØ3¿+,‹JCìŸİOG‡Ë|ÇcŞïêW_ûêÄp\r›!TTT	Td¡Š ªŒ ²:¹ÂZrÓ?¡¢4Ã¥a´Ñì˜ÙI5W%ï9TŸD‰ceã==Ğ°3œ~İY×äJùÇFWŒ~!.Î¾m{X<r\ZÂ	6D¨Ò1TN	!K *@B \nç#ê÷s4‘L†	ËªK™íÍêQ\Z“÷æ»ŞğÀë÷îm¸ûÔ%#·ÕújI¢ñr>•¥kÙşÚ<ƒ%ƒW\\È: JÇ@*Çr¡²ŒpÊ }DñäÚÏQÎ×ØÕjã)P÷PÒA\0sİùmÇ“ğÑ¤{ëàPms­¿–£c,¥ DŞ- „Bf0ñ·­¬öfxÉ\Zd¼!ËÇC€SAÈÊq «ªXá°÷Àİ4KŸÅØ”)ø9ÚQ‡ÉúÁÛ#i“g¶ış:™“[V®5YF³İ$çå¨+xÒGXV •`õ…Ÿdrû0­÷ğ±3.@¦s „*ƒ\\ğ‚U¥…Ät†°6Á’¢„¤“„®±–Ø$Á”:ãº±ÛNY~ÊÏûúÚ6&Í¨*”‚R:d:ãàáI\ZíKŞÏÓ¿hÈgâg\ZBºC•{Gª5Œµ&©†;¨‹SAX7 «C”tÃÎR	9S¯×ÑqŒïy8ÊÅs<„H`br?Ó³ÓtÃ.Ín‹F»…’Á‘!Ÿ/½Ö%lïÆ8Ã ËXU!µ¤QHÒA÷fñ”Gbòn$KÀ\n~-²¥RâÍ Ùn‡1¾çÓh7I3Hú*ı(¥p„Â‘\n)ŠÕ#®ãÏ»jÌ¿õEtœ#éÎ£;Ó$#$á,q\ZãI°DiBàúôâÒà;]	‚\"Zk\\©˜››eñàbZİå\\™¡ş!ªù\nI¸å\\u¡;\ZÃ|·N”†Œ_|=»_ü5ã}ûIÍ0&‹1:$K{Ó&RAÁ§§»8B’dÚL·f¾{Şòónw,f,JÒ,Åu<¦¦§©-!Š\"p¡”+R	JH$BHtšÒèÖFÊ#4ºuº&ÂÄ-´–d:$KCL\Z!mYQkÑ&CZ“ó“_Ú8¾ñQ\0DGë” Hâ×sPÒaz~š¾bÆZ½6}¹*RH¢8¤¶ğUÀ`as“¤Y‚\nÎ‘D	Y\Zb“)cò¦’Ú¤û7§>wãø¦mo—¿ƒSiª\0%:Íğ]Ÿ8Š	£Q2T¦ÑmàI—$I(ú%*~™í‡ß$ïˆtˆ’Š,nwzØc·Ïtˆ£R„ñh\'í?èD¯¿q|ÓÑw6>Ç1¢ë8išâ¹.I¬1Öà¹.±NÈù9ÎN²¼6J¤#ª…~\\¯|¢_\\ÈjÖ\ZÒ°…îd˜,ÂèY\Za]ƒê5óŠ¯»vìòäß;¯“I{ºï$IÊÁQ\n­5y/O”†d™Áq<&N°lp‰Ù;wp¡T„iHÁ-Ò4š4j¢»²4Âè“E,+™š7óàªÑw_\00)‰q\\—$ÕäÜ€8NHMŠçú$:¦è12åHıÈ±4øGœD¸ÒEI	Ò¸AÒ­cÒ¤aÙiÕNy s“;öüCÿéÅ•—]ú^«wÆ$‹1×uÑZãH$©ÆwsÄYLœ&xN@–e$F¸9t–àH‡4n“ÆM\\O±z¼| :Ğû”;öÇ‡NôäËÑÂ\n6œ¹aKs¦y…±v*NôÂèl¡iè4ApåBˆ”RDYŒïø€!N\nlJ±VbÕ8Oçú—\\ ÆııÏqA²ñœM/$Íø<Ç/Æ:Ás=´ÖH¡J‘è„À\rŸ$Õ`ÁWa\ZáH…6)ı#»òLçgŞĞç?ã,¿ëèÉÈ½QDëÎúâá¢-]Şj¶ïL³Ô¾mØw=t¦±, ÓÏ\rÈlJf™Íºqæ?[ÊïŞà¬zêjè›ÙÉ\nİ÷¥óéOn{r}m`Ñ/­¡Pôód™ÁX‹²! ïèÄ2“Mn¹~ãø†­d¾8¡*¾ï•ûÖT*åG<Ç_UŠô¢ è“˜nÜúK·ß°îì¦?è€ó¾²üá7®àroµX½Ö“Â\nR“1Û¹«êæ¿~Åêk¢ÿe´;©¹`ëá—ÕÎÙ}›Oéş´Ø©æ‘Í­¸dË²üÿ×õÛ­¿¹òŞWï¾êÃüç?~c(l,y¥\0\0\0\0IEND®B`‚'),(2,'cheque','ChÃ¨que','',0,'','\0',7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0gAMA\0\0¯È7Šé\0\0ÄIDATxœ½–{på‡Ÿo/gÏ%	ç$!9¹\'0Ü…ˆ B¸Ô´\nS/SµŠ­­µãhG[«íØv:m­Ó©ã´ÖVG¼TŠZkµ1Š@\nB¢\\Š’`HB$ärr’“sÛİ³»_ÿ8é(œZÁß?»³ûíû>ïíûVåÌHí¼¯ñş¥sÎûB*ÖŸ{oØê:C~N®/Íçbçıó¥´ÈLÏç—_YñkÀøÌ\0ÚÖ°A#åµRú¹<¾öY¦±è3q¾|çºää!!åËHù‡jy_³Ğp²õÊé¸éJ¾¥”¨\Z#p*;à±İæsÀ™ïƒy5LÎî$ew‰”¯VJùÜùÄe‘#À¬S}£N€¯_¢~Ó?©¬€Ã>pCX1•G_}x÷Œ\0,ùÁ‹‘â9K/w=®[ÿ-×®Ş¸šT)Ø€[Bëî¡×ä_\0ï´\\ôÛC+\r5 ­;¦Õú§‡‚>¦U.ù|dêˆ‡@\Zx£:lëkö|œ­Opáïv]V<¹îÎ†\"¹°n‚‚\0Ìl‚Åå[ADóÑaç®É–NûÆŸ|j€U·Oò‡Ëgå\\m\ZEP¡Rchp=e“,È„	Y?ë^~»Õ…¶S˜S/Ë)n¼ñ§Á¹/­òTgvÚJ4Fêı×Õ;õU‚H°PÈ‡Ï§áØ.SœĞK`Ìdx Ë®â+²ğLêC&T Rº\0ó”\0ÁÂàİ_0ùæ‚ \rTé‚\0Ûñ°s¦å2êèn&–&Á)/¦ÆŞÄDfİrç—ã‘Y}İÏÿøGP§€^\n¦F4Ğˆ–C¯z2ç—ü¹g…/\\zóÅs¢ÕáBÓ²±‰e{8‡çÉ|@ŠòUL€\"ÒG3<ØİŒVR-\ZfÌm\Zqk¦z}/¤ ƒà†æ	\0«{cŞÌ+n½Á¼©÷|®±*êÄL,2ğ<‰!Æs9~/5=ˆßˆ‚ê[aãk&¯8Ëé?>Š_šLmœsÖ˜/:c¤c×v¼±$} 2i\ràš\r½SÅÑïV„´¯5UœT®€Á¬Ÿx\"Kñ„ vÎŠŞøT™CZY0fà1…×_â°Ûˆ³QPx¯×¢¢Ä£yåªåš/ôHû_qf÷{–@\n0Õo´İU^yxy½ïs5 GC`:ÍANÓÉ¦©xRŒGŸï\'¡„t‰Ş‹0üôíÛG\"4)gs¤«Ÿcd f‘³\\Îmj¬ÊEçŸ×x[Ùxà\0¨Íß»wëuÓµ`c,Yr.8.¸ÆLˆp\r<ÏO¿@ ĞT…ö¶íxkS—¢—M\" {DC’=c¤¼ªfKê$Ó’¦…ÓÊ¼ò%µ¿Ñæe¨³®ºı†Ú2cB•r2_™œ9/µ„“LQ6ˆ´«@É&(›½˜`´M¸HOP-$¨¸ì>îÃQ a0fÑ7eñ‚újV\\2Ôİñ/7q¤KíŞŞ²¤jQs¤6:¡.\0RB:öxrÆ²’rÍ!4RæP€”’ÂÚi—bè\n€À‡î3˜ÙPDï±ïôkH/¿vhÈâ`g’æ%µzÕÒKûŞŞòªš<rdÛ†Ãe—ÖÔ–4€\" iPŠ4:\"›¦:làÊñüÏŞ\"=ùÒ@şçIŸÎ´\n7ß¡oÌG6ëà**ÍŠ¸uUÉœîßñÊ\0s¤¯­õgWİüì–öá]ÃĞ l€#Áõ@\nÁQK#cZhš:ÇRQ>]#Ô™PèÃo¨L®\r³r†‡me©¨qßí5<~Kï*l}+†&“¹Š\Z¬zÑŠŸüéÑkVÍ«9»&Ë7¦e¹,\nqVM˜œ#Q(Š\0)H\\Ç%‘¶ˆ\'²‹e8Ø“â@oAí”r®XQC,¿i˜M/¶ôÅw>ô÷\\ÿÎ?ÚUh‘Ê¦e?üãÚÕW6O›_\ni:G aÃD7Éå\rEUËØŒ$MG‡²t\rÙôÆ:Œ)„hšæ‚ùa„0X¿#Å†Zã½ÛÚàİô$ùƒÊü/\0\0ôÈìEw®]wõêËÎYX	fÚ‡!eJêä£)›®¾ú’Î©˜NÊR1mH8À¼AÎ4P€ìÎÑÒòÏÔá-o¶Úÿ¶Ü­@òƒ9:¥ŒÉg{ÍÚ«¯¿~YS\rØNâı$S.vÚ\"ç€eIL[4&Wû˜Y§¡)°§İcsë^ûà¦G·§ö?½\\ú öQ/\0@åôë~õğ•7İñÅe“òñnº\\Ì¬‹m»tA´D£¢TCW¡«v´µ{oo|üÍá·Ö>Avø ïTNz\Z~HÉØ¾MÆ*_Ã²9õ%\ná\0ùmYBU©Ni©ß¯0‡mmÇhybÍşw¹íşLÇKwãd78İÿ\0€9zhÇ¦®ŞX‘¨k^P7Qg~µ (¤Ğ¤3pğPœÍÏ>Õ¹kİmkF÷>}—´F×#ÿƒíO$½dÁ5w¯~:æµ—ò7{¤¼ü±~yÖ\rOõë›\0Îã4ÿæŸL\"2{å÷Ï¿÷`röOöªÏ¹XÎ´ã Pf 	ğ}Zcÿ /mQ\r¦Nò\0\0\0\0IEND®B`‚'),(3,'magcard','CB','',0,'','\0',4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0	wIDATxÚbüÿÿ?C~~şEEEyÕ¿~ıeøÏÀ\0c\01¡4ˆú‡Äg’Œğ•õŸSî?ÔD ¶ÿ?yzuêÔ©\0ÄÂ\0df/Èádøş¨\nd0ÄÂŸŸÁ–1üıâÒ¿˜Ùâ~ƒ˜Fø+ ÉSÖÂbÜ™00¼İ\r´OŠáÛ+†G;ÄìD­ì``\0ÒŸ10|¼t\0Ğò³3XH´xÿS€\Z€\0bA‘ıv—áÏkˆïDL¾¿a`¸·è{a†ëËx¥Xy^\\„XÎL¢@¡ÊÄ\0J\0 ¨	@	6 á²Àğù‰†ÿÌ@‡|:è\'Ğ\"i`h0£†‰™á¿¼;nc€$•ÿÿáqÿÂş1–”şÁT\0˜™˜9E`Š\0É@&Q¡u20A1Hü÷?°pVr 4e‚Øé†ñ/Ü<€\0b)\"*¡Ò3Ô¿şf¸õò+ƒ‚ÃŸßÿá¾CrÄ ş¢98àfI‘Iôÿ>}şÉpêöO†]7ÿ1œzÊÌpæ5?Ë?†ét¤™¾ÿÅ\"0\\€Áıä˜¿ !\0rò¿(f±É÷Í»ŸÇ®aØwëÃ‰g,Ïşp1|eú„‰á Ã³Wÿ6œ}Ë #\'\0ô!0«~ùÎÀğ˜­YØşó\0åØrôĞ œøóûÃ­§?€–~e¸ğôÃõ·ÌßØ¸˜¸9Øå™$€Ñø˜YŞ¼g`øõä5&†cÀÜõşâ)ş·À\\òöã÷3ÿY¥¾™Ofc5`qò˜†™Qì üæ€w¿0ºúáÒóÿïÿ²1p\nğ3ğˆ°2h-ı,‡Ş\03Æ;`‘ñèÁO¾~‚FĞÓO>±1¼:\\Ç (u™¨˜ëãg?olbø+\\ÌÀŒC&&&\0Š\næ½dxó‡AMAˆÁÄ”	hèG`|¾Zø	X(~úäˆ/@şãGPË¡Ù€è±Üü§­ÔE®30¼fßWÀ`âdÆÒ†ïß0°	òÓjé	@L°Äõ¨öìc&†x/aSm6fæ?=b`¼±›AôÚr†Ÿß1|¦Ÿï@<|´ü#Âr`ÑÀÀL<œW¿Y2üy\0,ª]÷ä?VNÆû2ügb;\0Ù\0ÄË-,@C”EÎÜûÏğëÖA…‹üØö0¤ê¿fHV=Ç ød+Ã ÚçÀ‚òı;H>d„`Pz”\rhÚ+Fc†GO„ %F ¥ÌœßØßeøûŸ#­J„X«°0¿øšAáów^u ã¾ía`ş¸•A—ı0ÃG §¿B*‘ş@°\0°Z1•c`È´f`p7e8ÿÏ\\Ÿ1°]Æ\nd0ÿgàüwáïçO‰ €PÒ€«Ã¬“ÿîÉğ3(?˜\röÇ¿\'\\ò?lÙ0´Ÿ}Éğıƒ8Ø×ÀœÅ`©´P“ÁDò/ƒÏ/†¯À¬\' \"ÄpPÎX‘n``gú„ÿÿdà`¹Åğå#0îDtQ\0@(P’æ`PàÿÌpè½ƒ—ô4N†×¿¾1œ}¡Ê°å©+Ã_‚æKM¥ÿ0°\0ëŠ[Ş1Ü½şaıƒï~01„¸ò1°Iè0|úÀÂ Êô­\0°‘sc`ùùŠõñ^†ªF Bn\'@\0¡•lä¿3¬¸mÀ°òu*ÃÇ§ìş;1ğ\n*3Xr2¤úÿgøøöÃï–ŸûÊ &ÌÅpıéo+)`Pÿ|Ïğâñy©_‡D¬sø€–qk\0KB`[Bä-û“•ÿ¾\0S//7ÜF€\0BqÀŸ_ì5™ÖßøÍÀ¬\\Ê`\r¬´51TÕ«÷?Vœy¬XŒtåT$™¬4ß3¼{ršáïëWÂ<ŒF*Âu_\0ÌU`êÿxŠá°ğIc`Òcøò	˜ˆxávŠşşcdPädWÉ¢\"ÄÀÉš`øù8,uqùšı÷m†÷>0ˆ²0h«ğ0üe`¼}\rØx¹	2	X(\0mK ëqÆÌÊğïå†ÏŸ•—Š™\0„RşR<¬Â¬/e¿‚$Ã·Ÿÿ^}øÅpóÎ†÷0ğËŠ0èIğ0HH¨0pòKu³Ú`Ásh-0jÅ£¦°í ,0¾0üùôáûÛ×ßşşeø	Tû_ÕAˆ_¥5	@,¨µ#¸Áh¨ÂÇpôòk†Kw˜>ıÔğ—A†ó7ƒùïu–=Àì¥„št¤€Ajl²±p1üZøõú†o¬œ„$˜DÔØ„xYXX™XYà¡\nv@\0a8àÏßÿÊÒÜœÀêõåë·º2lÀ4ÃÎÀÄÉÏÀùÃR\n‰+AªØÏoş?}Àğóõ3`ı‡á\'ÇO†ÿbŠ+Ní\ZÆ,÷¢¶@å°øùó\'¨f×Ë\0„á\0pZ\0:BRŒ‡A\\˜-LŒÌŒllŒêÎÿ®cø÷èÃï~+¯ßbŒ²Z,\"R¼À†;3Ğbæ½I‰‰œœœ(Õ/ĞŒ·oß2ÔÕÕ½œ5kVğÌ™3\0gur#¨…5«~ÿbø/£Êğ›\rØzÆ-ƒ¬&°rcàÖnLŒ ^PÍ?hkèÿx™Ã Ÿüø‘¡¾¾şå´iÓì€ÆŞÙ@XC\0³%Ä«¯XÄex˜ñ?Ä²ÿÿÿÂ;Èjıú¯zA!ñæÍdËoÁÌ &Ò{ÿı…Zş«cAâşü;âåË—X-€\0B	&pî?	mDÌƒùú÷ïß`Ÿƒâ¼½½«å \0@,4¬¬¬?f\0Zü\nˆí±Y\0Ä‚œ\'™™™©b90Ï_»víÏ²eËÍ™3Ç—å \0@Œ  ÏÉÉ¹,##£Ìš)µ-ß¾}cxñâÅc åÀr˜á\rî~Æ€\0;\0¨	Ø„aĞ€¶sşSêHeÀpˆßáïèüg\00\0Kçoº  ˆ\0\0\0\0IEND®B`‚'),(4,'paperin','Coupon','',0,'','\0',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0\n*IDATxÚbøÿÿ?Ã@b€\0bh\0Ã¯ë©ÿT1ü¿[Îğÿ^ß¯ÄÄ uÈøa52æıÿ¢ÖâÿãÚ–ÿOë·şÓfûÿÇ$ %3şÿâïPüe.ÃÿK¾~ÛÆ\0D©ØìÿãšÚ?Oê]=Vûéï»öÿÿ?vşÿÿ©çåÿŸ“½ÿÿÃï\0€\0\"Ç<@l´¸şÿ“ºãÿ_4ıùÿ¦õÿÿ¯İÿ÷ínı¿w_0d§şÿÿgúÿÿÿf|:ÀŸ\0ˆÕUƒøèÿçŸş¿nùÿÿĞ²Ï=ÿÿëÿÿÿïd …Óÿ>Ú÷ÿÀÁŞÿşÎòg2óĞª¸\0@øÀÄ&@¹êÿj\0-ıñÿ5Ğ§ï;Á–şşÜÿÿÏ¯I@K¦|úÿí; ı68ÔûËÖnÿ/Ğ?gZ.øÿ¦\0›ŒW\0-=üÿYÃ‡ÿ¯€>}ŠW _>ı±ôÃûiÿwíéùïŞÔÿLıßÑÓøÿàá^¨#fı÷vúÿÇúş¿tØO`h|›¹öÿ—™<è\0 †?7RAqj´¸¯‡ñúıÿËfˆ¥º –~Zúk\nĞ7 _Î\0[ğêÕôÿ—tü¯mløÿúõôÿGõÿïîkşëÖ”ÿçÏL\0;äÉƒ)ÿ¿¼¦…ïÀPø\nÄŸgî\0:@\nÙ\0ÄğòTzïÿ×MÀ–¾iƒXúè“ïÿÿÿ\r´ôÿt¨¥3Áÿâ/Ÿ§ÿ_²´ãÿ¶íİÿ=œúÿäÉ‰ÿ?šñó¦ÿ“\'·ü¿q˜şÌ†øl1ş2ÈÄ®ıÿµÂóÇ¯]Lß~ía\0 †Òj¼Zú½L@—ÿœµtÖÿ×Àà{ñj\Z˜ıéÃôÿ/NıäHØÒû÷¦ü?d_¾8ñÿÛ7óş¯ZÙÿÿè¡Iÿ~›Œ& ş:aé÷@³CqĞ¬Íÿÿü\\õëÑí^û«\0ˆáò:çK»*ÿÿ?\ZÄ³şß»?åÿ¬¹mÿ/_øÿî]P(ÌıÿòùÔÿ{w÷ü?°·÷ÿ™SÀìãGúÿ9Ğûÿ÷eÿ~_ñÿë %?C,ûÄ?–\0ù@üg5ĞŒ­ÀD»öÿ›…ÿïÔøc5kÖ“µ\0Äp|£ææŞèw¯Ì\0[Š»ù‹ÚşÏ™×öŞ‚öÿmMÿŸ}ş\r”§NôÿßLİç€q|äógSÁÁüïëz ½èC½H¯FĞÒ¿@şÿ@¯ûÿşNÁÿ‡[Uş]™ÏğûØ†ÿkjÙNÌ/äà †éSS…Ûrœv_^ôÉRpŞ}ıbÚÿOÀÄóáÃŒÿ“§´şŸ2¥åÿr`œ/^Ôşÿã`T<\0Zük$˜¿ƒ÷×. …û€x\'Ğ·;€–îâƒ@öæÿŸïı¸MõßÉ)750ş™Çñ§?‰û2Ï‘Ié|<\0Ä°li|”iÌ²FÿwO\0ÓÁ`ı†Æ/`Âù\rôİŸYÿïÆõ¹	@60a}Åñ| Å!Aşÿ}{\n¨÷ŸÿÿïÇ†ÿodü¿±FñÿV†ÿóó™ÿMLááÿÓ2¹şOÍàø?3O`ßÂ\n.€\0b¸}c*gA‘»nYºåÜ]Sÿ~ôÑo Ï>Ï\0e E³şÿş2ûÿ§×@‹¿-:\0d)0¤~.:rĞb`ÿ¿Äşÿû²îÿË3‘ÿOÌÿ¿¼”áÿÔ4ÎÿÓ„–	ÿ_X\"ğ~‘Àÿ9|ÿ\'Ågå	í[P&Å@¯_.dìí‰“Š7ò›ZîyíìÚ¢ÿ¿-ø:šm >ı½j)0%ÿÄíÿÿÀìoÏzÿßÚæñ[;Ğg™Œÿ\'$óşŸ–#öq™ÄÿåUâÿ•‰!öJ†ğÿ‰)ÿ\'§ıÏóÙî¡Ì@—/N`˜5#ƒ;!ÁN/-Ö¢~cOÔß‡gš€†}ö”’–ş^	ôé¨¥ûÁqûóeïÿ§\'Ãş™%÷I	ãÿII¬ÿ\'¤\nıŸU õI¥ìÿ¥Õ\nÿç•(üŸ–-ûRºÄÿ¾$‘ÿ]Iâ?jbåÏFx*Nàôğñ³ã\0\0~ÿ\0µ´|\0š™hkiHST4BŒvN¿Á›]ÿöè‘ÿÿÿ¸ÿÿÿ¹ÿşÿ¾ÿıö®ÿøç‡ÿèÉNÿÎ£ÿ®}ÿ–fÿ`ÿ‘gÿšpÿŸw ÿŸv%ÿ™q%ÿ“iÿdÿŠ`ûƒ`àva\'¬d\\/xEF+P!\"\Z;\'++%\0\0~ÿ\0mlK\0onL\0fdE``?/e^9p®bóÔ±Yÿıò™ÿöåˆÿíÌHÿÙ¬ÿ¼Š\0ÿŸn\0ÿbÿcÿ’i\Zÿ˜p ÿœt%ÿœs\'ÿ—n#ÿ‘eÿaÿ…`ì|c#Âoe.Š_]1cMN/L>>(B21 02/!\0ˆÁÏ×”Á×Ç”ÁÃİ5!ÎA>,ÌÌ¡§2`ãşÙ9ÿïlRıX­ÖUSÒØ€ÁÈÿBšèÿ)ÙRÿgæËÿŸU¬öF>Ğ·²ÿ{Åş·Ç‰}©O?_š¢5\'3Å8?&Æ$ÌÛGÏÓÚZİF__ASSCZTOOÅÌL•A^N˜ATDˆ €„yø¹ädE˜€à2×MŒ±HŞ9+ÿÃúÿ}	ÌÀ ø?5K˜°Dƒ,—Æ­0AIüïŒıß\'}¯<Isu^šQeJ’yDD¤©Ÿ¯³“½¶™¢’¬¬¨7//Ğ&&*@û \0 8`dd”—csvÖ“ñõ70›Ğ¾|û¤ˆÿ“SÙşOÏâZt@–èÿÉébÀûß/ù¢\"^yWN¢AĞÒÈès7??#[{{Mc33U--1))!nNN6 á`+°9\0 €;;+“†º4¯³³Zj’]Ä†‰‘/§gğüŸ”*¹ÿw&ˆ«W<U 3%%Á,1\"ÂÌÍÇ×ÈÚÅIÇÔÜTUC]]ZJ\\\\€ŸŸŸ‹ƒ……™…‘ì/&&& fÄê\0€\0b@L@E¬ÚZ²âÎ.ºš.S&¥Işlˆ“½^š 7/3Ñ<#:ÆÒ= ĞÔÚÉIÇÈÈHICMURFFZXˆ—‹‹••…dÔË K!–ãv\0@\01`@GprjhÈÊ¸;i9$GšdÅÅØ¹††Z›¹ºê™™ªêhjÈ(JK‹\npó±±±°}	²˜f1Ü \"\0@Ø\02„è~ %RÚºŠÒ&&ªŠÚZr\n22Â’|@q ¥œÀEö-#ºåÄ:\0 €p\0& ¯ØXY™ùøø8yø¸¸9¸€±A}ÊŒÔ8\r!Â\0„K/#Ô`\nf`E³I\r¥\0 Bf0b±˜h@Œ\0hÀ;§\04à\00\0ŠˆÓt8ÿ\0\0\0\0IEND®B`‚'),(5,'credit_note','Avoir','Ce ticket donne un avoir de                       ',0,'','\0',3,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0\n*IDATxÚbøÿÿ?Ã@b€\0bh\0Ã¯ë©ÿT1ü¿[Îğÿ^ß¯ÄÄ uÈøa52æıÿ¢ÖâÿãÚ–ÿOë·şÓfûÿÇ$ %3şÿâïPüe.ÃÿK¾~ÛÆ\0D©ØìÿãšÚ?Oê]=Vûéï»öÿÿ?vşÿÿ©çåÿŸ“½ÿÿÃï\0€\0\"Ç<@l´¸şÿ“ºãÿ_4ıùÿ¦õÿÿ¯İÿ÷ínı¿w_0d§şÿÿgúÿÿÿf|:ÀŸ\0ˆÕUƒøèÿçŸş¿nùÿÿĞ²Ï=ÿÿëÿÿÿïd …Óÿ>Ú÷ÿÀÁŞÿşÎòg2óĞª¸\0@øÀÄ&@¹êÿj\0-ıñÿ5Ğ§ï;Á–şşÜÿÿÏ¯I@K¦|úÿí; ı68ÔûËÖnÿ/Ğ?gZ.øÿ¦\0›ŒW\0-=üÿYÃ‡ÿ¯€>}ŠW _>ı±ôÃûiÿwíéùïŞÔÿLıßÑÓøÿàá^¨#fı÷vúÿÇúş¿tØO`h|›¹öÿ—™<è\0 †?7RAqj´¸¯‡ñúıÿËfˆ¥º –~Zúk\nĞ7 _Î\0[ğêÕôÿ—tü¯mløÿúõôÿGõÿïîkşëÖ”ÿçÏL\0;äÉƒ)ÿ¿¼¦…ïÀPø\nÄŸgî\0:@\nÙ\0ÄğòTzïÿ×MÀ–¾iƒXúè“ïÿÿÿ\r´ôÿt¨¥3Áÿâ/Ÿ§ÿ_²´ãÿ¶íİÿ=œúÿäÉ‰ÿ?šñó¦ÿ“\'·ü¿q˜şÌ†øl1ş2ÈÄ®ıÿµÂóÇ¯]Lß~ía\0 †Òj¼Zú½L@—ÿœµtÖÿ×Àà{ñj\Z˜ıéÃôÿ/NıäHØÒû÷¦ü?d_¾8ñÿÛ7óş¯ZÙÿÿè¡Iÿ~›Œ& ş:aé÷@³CqĞ¬Íÿÿü\\õëÑí^û«\0ˆáò:çK»*ÿÿ?\ZÄ³şß»?åÿ¬¹mÿ/_øÿî]P(ÌıÿòùÔÿ{w÷ü?°·÷ÿ™SÀìãGúÿ9Ğûÿ÷eÿ~_ñÿë %?C,ûÄ?–\0ù@üg5ĞŒ­ÀD»öÿ›…ÿïÔøc5kÖ“µ\0Äp|£ææŞèw¯Ì\0[Š»ù‹ÚşÏ™×öŞ‚öÿmMÿŸ}ş\r”§NôÿßLİç€q|äógSÁÁüïëz ½èC½H¯FĞÒ¿@şÿ@¯ûÿşNÁÿ‡[Uş]™ÏğûØ†ÿkjÙNÌ/äà †éSS…Ûrœv_^ôÉRpŞ}ıbÚÿOÀÄóáÃŒÿ“§´şŸ2¥åÿr`œ/^Ôşÿã`T<\0Zük$˜¿ƒ÷×. …û€x\'Ğ·;€–îâƒ@öæÿŸïı¸MõßÉ)750ş™Çñ§?‰û2Ï‘Ié|<\0Ä°li|”iÌ²FÿwO\0ÓÁ`ı†Æ/`Âù\rôİŸYÿïÆõ¹	@60a}Åñ| Å!Aşÿ}{\n¨÷ŸÿÿïÇ†ÿodü¿±FñÿV†ÿóó™ÿMLááÿÓ2¹şOÍàø?3O`ßÂ\n.€\0b¸}c*gA‘»nYºåÜ]Sÿ~ôÑo Ï>Ï\0e E³şÿş2ûÿ§×@‹¿-:\0d)0¤~.:rĞb`ÿ¿Äşÿû²îÿË3‘ÿOÌÿ¿¼”áÿÔ4ÎÿÓ„–	ÿ_X\"ğ~‘Àÿ9|ÿ\'Ågå	í[P&Å@¯_.dìí‰“Š7ò›ZîyíìÚ¢ÿ¿-ø:šm >ı½j)0%ÿÄíÿÿÀìoÏzÿßÚæñ[;Ğg™Œÿ\'$óşŸ–#öq™ÄÿåUâÿ•‰!öJ†ğÿ‰)ÿ\'§ıÏóÙî¡Ì@—/N`˜5#ƒ;!ÁN/-Ö¢~cOÔß‡gš€†}ö”’–ş^	ôé¨¥ûÁqûóeïÿ§\'Ãş™%÷I	ãÿII¬ÿ\'¤\nıŸU õI¥ìÿ¥Õ\nÿç•(üŸ–-ûRºÄÿ¾$‘ÿ]Iâ?jbåÏFx*Nàôğñ³ã\0\0~ÿ\0µ´|\0š™hkiHST4BŒvN¿Á›]ÿöè‘ÿÿÿ¸ÿÿÿ¹ÿşÿ¾ÿıö®ÿøç‡ÿèÉNÿÎ£ÿ®}ÿ–fÿ`ÿ‘gÿšpÿŸw ÿŸv%ÿ™q%ÿ“iÿdÿŠ`ûƒ`àva\'¬d\\/xEF+P!\"\Z;\'++%\0\0~ÿ\0mlK\0onL\0fdE``?/e^9p®bóÔ±Yÿıò™ÿöåˆÿíÌHÿÙ¬ÿ¼Š\0ÿŸn\0ÿbÿcÿ’i\Zÿ˜p ÿœt%ÿœs\'ÿ—n#ÿ‘eÿaÿ…`ì|c#Âoe.Š_]1cMN/L>>(B21 02/!\0ˆÁÏ×”Á×Ç”ÁÃİ5!ÎA>,ÌÌ¡§2`ãşÙ9ÿïlRıX­ÖUSÒØ€ÁÈÿBšèÿ)ÙRÿgæËÿŸU¬öF>Ğ·²ÿ{Åş·Ç‰}©O?_š¢5\'3Å8?&Æ$ÌÛGÏÓÚZİF__ASSCZTOOÅÌL•A^N˜ATDˆ €„yø¹ädE˜€à2×MŒ±HŞ9+ÿÃúÿ}	ÌÀ ø?5K˜°Dƒ,—Æ­0AIüïŒıß\'}¯<Isu^šQeJ’yDD¤©Ÿ¯³“½¶™¢’¬¬¨7//Ğ&&*@û \0 8`dd”—csvÖ“ñõ70›Ğ¾|û¤ˆÿ“SÙşOÏâZt@–èÿÉébÀûß/ù¢\"^yWN¢AĞÒÈès7??#[{{Mc33U--1))!nNN6 á`+°9\0 €;;+“†º4¯³³Zj’]Ä†‰‘/§gğüŸ”*¹ÿw&ˆ«W<U 3%%Á,1\"ÂÌÍÇ×ÈÚÅIÇÔÜTUC]]ZJ\\\\€ŸŸŸ‹ƒ……™…‘ì/&&& fÄê\0€\0b@L@E¬ÚZ²âÎ.ºš.S&¥Işlˆ“½^š 7/3Ñ<#:ÆÒ= ĞÔÚÉIÇÈÈHICMURFFZXˆ—‹‹••…dÔË K!–ãv\0@\01`@GprjhÈÊ¸;i9$GšdÅÅØ¹††Z›¹ºê™™ªêhjÈ(JK‹\npó±±±°}	²˜f1Ü \"\0@Ø\02„è~ %RÚºŠÒ&&ªŠÚZr\n22Â’|@q ¥œÀEö-#ºåÄ:\0 €p\0& ¯ØXY™ùøø8yø¸¸9¸€±A}ÊŒÔ8\r!Â\0„K/#Ô`\nf`E³I\r¥\0 Bf0b±˜h@Œ\0hÀ;§\04à\00\0ŠˆÓt8ÿ\0\0\0\0IEND®B`‚'),(6,'prepaid','PrÃ©-payÃ©','',5,'','',99,NULL),(8,'free','Offert','',0,'','\0',8,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0gAMA\0\0¯È7Šé\0\0	ãIDATxœ¥—kl×uÇsgfgöM.—\"W$Å—DY’%ëaIqdËI\ZÃ“¦\r\ZMƒ¨›¶A5Š¢uÑ¢Aû¥@›\"…QÀH\0H#*š4ãZE®%:6%[oñ)R¾—»äîìÎûŞ~XÙiü‚Ğ`€™s0÷ÿ¿çÜsïÿjÜƒ}ã@áĞ`[â_ÚA\'’R)jÿøÖÚ““Ntæ^şÿ(3>,p¤ËÜõç;O®xKıùÄÓo¬ø‰Wn7¾w§±\r‘Zu£Æ¯\n }Xà‡Š\'É§2&?_ö.ÿÛõê_í³íõOõ$wkIu_!­\rìì0Ó©âHmÌUâÛ3åøÒl38óòŠ?È_…@Ûoõ§ÿùG7Ï©\'ûåC]öç³İQeÿáh{×ÏÎöGØ]\nijHe6-‚ƒõi¸sŞmN^/¾1•8öŸ·İïÖ òÿÊ@z>¿%÷•/=.şlßİÎ\\\ZŒ\"0ì†ÍÀ&ZÕ\\fˆ*—Y~õ$ÿó½É¹ïœ_?^ñ¾¨{É\0O\rd·¿ğXñìâ÷ÓJU²J…Û•ò*åÿ¾RÑóJÉ·”’sJÉ%¥dY)µ®”jª_¶5×ŸQ“ÿQÏìÈ¾ĞšÓûM¯ã›{;~b¯ñò§Ÿiì*<’ÕQÄĞ‚Ö 5Aó\0´6(_>‹•Ë#LH¡%£ã ÎŞÿ½»4ÓöÈ¹ÛŞqêJ`Ø4w}ùˆıÒ\'ÿ²Ö›\Z¶ÁK‚ğ!5‰ƒÒ@5%Cdà\"@ƒÆÂMNıéS4géyø(šPw³~„Ôà<;wŒõÙ—ó‡OÎ{/îÈ<û©ÂüúÓµ]©ş¼,¿ª³òv±ça%ƒ:56¦o’*Z„â€ÙWN±<6Š¦…t=xğ¨ÍX}e¶uMmqÏ%ºÆ*Á‹ï#ğ‡ƒù¿ùÊŸD¿WØï‚¯S‡WÿÁdòGóÜxeoyÒá<š)ñ«,Ÿ›¦c÷fˆ|Œt’ÚÜ<kW§qWxì(F*JA<Ò =’ TÛ{şœ˜X£+ïèµØúwŸÉ|{ÏjI +¼J‚ßï£}k#¿Q¤t@§±´AÔôhÛjqãÇ×\0IñNˆ|Ğ%Ù.Ï\\¢±P¦÷Ñ}¤Jİ \\_U­ŸÂæ2ÁØúÖã·‚€@xrKşéßığñô€R‡ä0‘xœG?Ç–Ïı&í»ÿ˜Âıyz]ÃÎ*‚õ:*è{t3BA†ûX9Ú·mÁÊeØüĞnÌl‚·@?OıÆAÙ#5ÒKja¶û7üëK¡¼¤Ö×dÿõğgœM\"!Áhû>ŒöNŒb\nTé¬¢j/£Å3i™–d‡,-`A…¹¤ûŠ”ìÁ´m®8Iùü*+*tïÏ¡%RX±ËÔk«ÚX%<fÜ—2wÊíF2†0ê /\"+,v°r= ™Ÿ¡ÿÈvgâDB´$ˆ4ˆ:ˆ<ˆ6ğ<ĞtĞnA4ÎìKM–ßÙ÷G[†NLv°ÈşşÔÇ˜jöCi{OW§4AJFÜ>ípı„Ä¯/qğ©\Z¥ı@Xkõ¾HŞO‚tA8 ÖAÌá€¬âÜ¸ü‚Iè(}­+ïB3ÍC·Mz{Ó›JzyÄH%m	:4W®œÎ²<À¯„	ÎjDcÕ\'Õ¡%%$<PÍ\0]€\0ÂØ‰X¹&¸3–bõZšÍxüª…‘l€6h>¨$™vK´[æ ¡i˜ºPK:·Ç“ôív9ğÅ*šÎü•wŞLHb·AºS‘Ù$Icš†Œ Y‘Tætª³yDØGìÚl:|•½_õ ac·À•Ê-@1š¦R†Â† !ÛÕí&ä>NnpˆÜ!Á·»¶Aõfúü:e‡ú²Oìy(²<‘\'i\r3¸ãAòMJİıd3Î¼ŞäÆñë=ì@àƒò@Ú€Ò\'tB3Pªîlè€DD€\Z‚ôQ Ù<É‚Mr‡	†Ñj9¿aÔ3?8Æø9ö¡WT§&0:;9ØÅèwk$ÌEz÷øàFïf@ù>õ5“PS\r½h‹ÒáÎä“ııM4HX`[µÂoÕ[†)¨<`„ô´—ÎqklŒæ—iâÏß!^X [sÈ¯E¼=£(¤ò1x\nâÆ‚âÂk‰øØLí9İ#÷áBö¶”BËÎÇ 9`Ù`X´ú2·z]­~W>È(\rÍN¡ÕO0÷zÌğª‡½VÁ]\\À^]!½¸J¸3¦Üé¡Å€R,^LrêMqûÄRóY½Sİ™µ>9”Õ‡‹İ^KWhëÈ€Ğî’-*j}«ø®/\0Ñ‰¥^ef´F×Ä:©…eŒjêu´0 ë…Œ[Yr›#rÅYŒŸÎóÃkŞ©ñzğ¼\0xuÕ9vóVgÑl”Í8— \\‚¨AÂrë=¬@´QÂˆ’Åídz]ªn#›E´·ƒ®£+…ŠÁ)ë aáªÍä¬£kŸ\0p³ÏÜŸµŸ(`uww{`j`x o€h—*ywöJŞ}\"Ğ4m‰òÄ5Â‹&¥-Ûadtt€ÓäV2âNšû÷×1Å•ŸøÁ”;:Zöş	¨¿sû«~XÙÊ?iE{§º¦ß*‡¦â%x§$Ü%BÆÜ%ªãiú?ökP*ëSY™ãõş4[÷»¸\\:İÎØ”h>7Yıº\'ÕÙ_ÒË¼ªAwÌ=h	I¾€¦Vmõ1ZKÆªwÖA16 z‘é‹	zoÖ1+UnŞçÍnÉÀ¡€}÷opõÍ<ã“iXûö\\#z¶µªß#É®®gs¦±»àfG4\n¹àAÙÚã[zP´|	X› éN3?Ÿbf©Â-µÉ¾‡šl-5¸x®©é4ßš®¾8ºâı-Pş Ià[ó~šÚH‡—Û^_5Éê–ˆ! %Óš5¨—ÁÙ\0§•°rÍ(m\nhï—ô?±s¨IPœ«ÀÌ‚Ås•Zrÿ\Z¸ñß§ŠÆ…Š¼„V§Jï¯-fŒæšá)¾B\nÜjÔÊ°±ÖÚå|0\"‰­$õŠÁøxÉéVâÚ7¯W;·ü=0û^°½˜\0zGBâ·2ñP1ùHWJˆTZ’oóÉæ\"l;Æ4$JAš\rƒZÍ¤VKàx‚;Nœ\\¬Ÿ=~§ù-OòğwÉ\"ğµmñøÁ‚ıÙûÚ{‡3Öp>¡\'-t­uÙ‰¤†AÙœ‰\rÿÆÕuïòÛkş‰¦ä§ÀüG\r~/ŞÍĞcÁöÎ¤±­-¡õè\Z6@ ğË^<_ñålSwA›÷2èÿÄæ.¶òÚÀ\0\0\0\0IEND®B`‚'),(9,'internet','Internet','',0,'','\0',6,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0†zTXtRaw profile type exif\0\0xÚuË\rÃ0Cïš\"#ègÊ\Z§ tüÊpŸúA”èø^\'ma%oÑ‘\0ú)ÓybÌ¢,c–NîiRNWL¦Ó {°¯E¿ó‡fè8Ã#Ğ°c×j×ÃÄ´´ÑhåñF®’·ÃşäÏ??¶,J+\0\0	éiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">\n <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n  <rdf:Description rdf:about=\"\"\n    xmlns:exif=\"http://ns.adobe.com/exif/1.0/\"\n    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"\n   exif:PixelXDimension=\"32\"\n   exif:PixelYDimension=\"32\"\n   tiff:ImageWidth=\"1\"\n   tiff:ImageHeight=\"32\"/>\n </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                           \n<?xpacket end=\"w\"?>#âL·\0\0\0sBIT|dˆ\0\0pIDATXÃå—[lÕÇsÙ]ï®×öÚkc‡8vœÄML.`Óc’ „”k‚O)­Z©TğĞ‡\"µRÕ\\ŠÔ‰¤­\n--Ğq\')Lr±Iâ˜8v|Éz}]Û»;—3gfúà‰IÀIAô­#ı5š‹Î÷›ÿ÷ÍwÎÿ÷Cù2/·´|7‡nEïQå*OÊJ×uªÊ©ª6îù~—+¬¿	á¼yøğÓÆÿàúëTæ¸Ê#Eıû›ohÖ®½n]hù²jJâB!±¬Az¢@ß™Qö½Û™?vècÍ‘Şï#!åç{ö<>ı•\0ÚÛ¸S‡v|ûşoÅn¹©YŸÈæĞpY±tñü;¿{æ/4µİ„â{„u<—W^îï¿ñ%=oÛ¾\'ÿy±ñµKß°áÁŸÕÖ]öøöíÅ–5T©ƒCÌL•‹IÆ4ö8Èó/ídñŠµDâIÛ%›³YQeK{£vå×¿9t çTêªĞğĞ‡{¾À†M?şIkÛ?}ô×ß	ï;t„iÃUcàìÕ55¼·û-fİë7Şˆ•ŸÆStôP˜5µEdÇÓœ8=ÄÊ†EÜqûµúá®Sí‰Äj94¸¿ã¥`Ã†n­­¿üÅ?m(²·ë$Ñªšk#¤Ó½”¢¢ÓS“Ä¥8‹åH<ÏÃœc$3ÊØÙ3Üyû-”\'¢˜¦‰m;Üÿ½\'ì©‰Ü]{÷şöÕK´µ=-N„‡^xá‘ŠDq€\\¾€#\'Nö01cÒÒ¾\0×u±KH²cèÎ4m-kPU\0ÏóÈår!ËòƒşaJ\nïÛ÷˜y.úY€po»ïædI\"6/Q\'=’a,\'Y²b>àª¦¡ª*ŠªPšL±får,ÛF8ÎÜàªŠ¦iH)©¨(áúÍ«’¨îCu ­íÁh4®¿ùú/ãš6Çæû>Ï=ÿd¨„õ×n$‹_\0ìHÃv¨‰\núN÷òÒ®´\\±ŒšTKë.\'YVJ.—Ã0|¶İ÷„á:Zêœ8àûÎÖ¶6‡uıÓÚü÷÷IÖ­eÓ–›‰Eãó_Nïãû>G{ğm÷ÜšXDÇÉI¶¿ÑÍ‹¯íAQ<ÏC×5\Zk\"¾ïl=7¾~ıÑÈ½7nm	¹®ËGG»Q…Îşi¶|£ÏU	¢ÎûHwîFËêJ‹çÒ¶¨\"ÎM­\rŒŒe‰Ft|ßÃ²ll!¸¦u¹v²\'s/°ós\0š¦­oXZÃ/{šÈe+‰‡UÖ\\İåHò¶B¢H» ¸ã¸é’\nJ‹KæŸ•$ŠX^WÃÎ×wQQ¤8\Zâï¯¢iI®”­¡\'e*\ZZÒDScUu+‘¾Ši;Ì\Z‚l^`	‰%$¦-1…Ä’TiÑ‚½Äó<®km¡ë“\"á0wn^ÇxA¢ªZÙ‚\0ÑÌøwß°J}†|ÁÄ²%†å`˜‚é¼`|Æf:o“7†í ø>‘pxA\0Çqğ}İ3éHó«§şŒJ€ç/Xª¦æ\'µì™×°¢Ü\'\Z´Ö¯`lb‹“fUQæŠÏóp]GJârŒ¦Æ†Ï}½!íÍ«83œA)[†tUP•ü‚\0¨Úød6_VQ½„aÛ%2>LmUµU%\n|œaÒ‰|¤ë!¤Ëî±éô|ÒÛG¼¸˜{ïº\r)%¶mcÛ6ªª \"™šÉ‘ŸÍãûŒ_¤y]§û3$\"\Z–\\}åêù\'ñxŒ-Íu$ü)K7mò¦a\n,?Â;ı*gÃWĞmÔ2›/`š&–eÍC<õÇ±¸¾‘‰Ì”¯*~ç‚\0ÒvíÜ,—*`X•ñÏÌ\\šÆmíM|smÅš¦`ÎL¯a	Ãrè8tÓ4çõqO/ãêª“1Ò}CyÏõŸ[@QBoŸì:‰âyhŠÏ¾#½H)?W\\å¥t|¼1¼`\n\n–˜+VÛ¡/3×ùÃÀ4Mfff)OVV<&Ó(Jèí§ãááı²®¾5”·½¶5kôƒ}¥Ş8ÉR<ÏÃº^÷ñ“ìô(Vğ+Úbî·´„ÃÒTˆšmŞÑÑ1ÔH)}ÇúÌÂÔôoöî}r÷E\'#)ÔGtu-“êdŒ“ôöavvv^éL‡pàÀ§.ç\\ÈÍP(0ƒŞ¾3ì:t†ˆ#§‡ó~ô’’ááı2U±jp gèÖ›¯\nM>•“’X!o½ÓÁWN-Ãv\\ì 1YÄ²çT0LšªuLÓälz”ÒË\ZùğíƒFvbèáÎÎ§\0ëR+¢ØÈH×DqI},=0±nã¦uº\"\rŠÃ „`çî˜©õ\'°>8[B\"„ƒçXÌæmš*%ª¦20’çPÇ){,=ø×ãİ/¼¸€hA€89Ò	U•õŸlÜØ¾J¯ª(a÷{ûÙu<ÑÔ€#D\nOXø…/Laˆø=}ãÜ; 2Ã§ß8Şıâ³€ä\0æÅ\0\"@ˆfºOy24ıQ×xsztR-ª¬Q–­\\ƒê»8ÂÆ—6Ò6	+’bİgQ2ÌªÅeÔ¥âôrOtÈÁşÏîİõ\Z`2`_lM*€ò@ÉX,¹¸~é¦»ËÊj¯©ZRMmãÒP2UFQQ=¬afÁ`rtŠ³½ƒ2;–%›ììï{÷ËšMY`*Ğ$0x—ÚDˆ²óT\nÅ+««W7—WÔ_”Ô(ªÓPÂ®ç9/\raÏNNô=vTJk\n˜\r4hÈuğ_7&\ZJD b \0F‚¹ä\\\Z½ ·\"°Ù\0\nİ3ÀhpíÙ­™\Z,	 Š…\0õ<\07\0°ƒ`Óççû+oNÏÒÏ®[\028û_d°ÿ\0˜„o**\0\0\0\0IEND®B`‚'),(10,'credit_note_out','Avoir Ã©mis','Ce ticket donne un avoir de                       ',0,'\0','\0',99,NULL);
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
INSERT INTO `PEOPLE` VALUES ('0','Administrateur',NULL,NULL,'0','',NULL),('1','Responsable',NULL,NULL,'1','',NULL),('2','EmployÃ©',NULL,NULL,'2','',NULL);
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
INSERT INTO `RESOURCES` VALUES ('0','Printer.Start',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2008-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n\r\n<output>\r\n    <display animation=\"scroll\">\r\n        <line>\r\n            <text>PastÃ¨que</text>\r\n        </line>\r\n        <line>\r\n            <text>   Bienvenue   </text>\r\n        </line>\r\n    </display>\r\n</output>\r\n'),('1','Printer.Ticket',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2007-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n<output>\r\n    <display>\r\n        <line>\r\n            <text align=\"left\" length=\"10\">Total.</text>\r\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\r\n        </line>\r\n        <line>\r\n           <text align=\"center\" length=\"20\">Merci.</text>\r\n        </line>\r\n    </display>\r\n    <ticket>\r\n        <image>Printer.Ticket.Logo</image>\r\n        <line></line>\r\n        #if (${ticket.ticketType} == 0)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Ticket : </text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        #if (${ticket.ticketType} == 1)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Refund:</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Date  :</text>\r\n            <text>${ticket.printDate()}</text>\r\n        </line>  \r\n         #if ($ticket.getCustomer())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Client : </text>\r\n            <text>${ticket.getCustomer().printName()}</text>\r\n        </line>      \r\n        <line>\r\n            <text align=\"left\" length=\"15\"></text>\r\n            <text>${ticket.getCustomer().printTaxid()}</text>\r\n        </line>  \r\n        #end\r\n        #if ($place != \"\")\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Table : </text>\r\n            <text>${place}</text>\r\n        </line>  \r\n        #end\r\n        #if ($ticket.hasCustomersCount())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Convives : </text>\r\n            <text>${ticket.printCustomersCount()}</text>\r\n        </line>\r\n        #end\r\n        <line></line>    \r\n        <line>\r\n            <text align =\"left\" length=\"17\">Article</text>\r\n            <text align =\"right\" length=\"10\">Prix</text>\r\n            <text align =\"right\" length=\"5\"></text>\r\n            <text align =\"right\" length=\"10\">Total</text>\r\n        </line>      \r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        #foreach ($ticketline in $ticket.getLines())\r\n        <line>\r\n            #if ($ticketline.isProductCom()) \r\n                <text align =\"left\" length=\"17\">*${ticketline.printName()}</text>\r\n            #else\r\n                <text align =\"left\" length=\"17\">${ticketline.printName()}</text>\r\n            #end\r\n            <text align =\"right\" length=\"10\">${ticketline.printPriceTax()}</text>\r\n            <text align =\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\r\n            <text align =\"right\" length=\"10\">${ticketline.printValue()}</text>\r\n        </line> \r\n        #if ($ticketline.productAttSetInstId)\r\n        <line>\r\n	        <text align =\"left\" length=\"42\">    ${ticketline.productAttSetInstDesc}</text>\r\n        </line>\r\n        #end\r\n        #end\r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        <line>\r\n            <text>Nb d\'articles : </text>\r\n            <text align =\"right\" length=\"10\">${ticket.printArticlesCount()}</text>\r\n        </line> \r\n        <line></line>\r\n        #foreach ($taxinfo in $taxes)  \r\n        #set($taxline = $ticket.getTaxLine($taxinfo))\r\n        #if ($taxline.getTax() > 0.0)\r\n        <line>\r\n            <text align =\"left\" length=\"18\">${taxline.getTaxInfo()}</text>  \r\n            <text align =\"right\" length=\"12\">${taxline.printSubTotal()}</text> \r\n            <text align =\"right\" length=\"12\">${taxline.printTax()}</text> \r\n        </line>\r\n        #end\r\n        #end\r\n        <line></line>\r\n        <line>\r\n            <text align =\"left\" length=\"16\">Sous-total</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printSubTotal()}</text>\r\n        </line> \r\n        <line>\r\n            <text align =\"left\" length=\"16\">TVA</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printTax()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line size=\"1\">\r\n            <text align =\"left\" length=\"16\" bold=\"true\">Total</text>\r\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotal()}</text>\r\n        </line>    \r\n        #foreach ($paymentline in $ticket.payments)      \r\n         #if ($paymentline.name == \"cash\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">EspÃ¨ce</text>\r\n        </line>  \r\n        <line>\r\n             <text align=\"left\" length=\"22\">PayÃ© :</text>\r\n             <text align =\"right\" length=\"20\">${paymentline.printPaid()}</text>\r\n         </line>  \r\n        <line>\r\n            <text align=\"left\" length=\"22\">Rendu :</text>\r\n            <text align =\"right\" length=\"20\">${paymentline.printChange()}</text>\r\n        </line>   \r\n         #end\r\n         #if ($paymentline.name == \"cashrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Refund</text>\r\n         </line>\r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"magcard\")\r\n        <line></line>        \r\n        <line>\r\n            <text bold=\"true\">Carte bleue</text>\r\n        </line>   \r\n         <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"left\" length=\"22\">Numero:</text>\r\n            <text>${paymentline.printCardNumber()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Expiration date:</text>\r\n            <text>${paymentline.printExpirationDate()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Operation:</text>\r\n            <text>${paymentline.printTransactionID()}</text>\r\n        </line>\r\n        <line>\r\n            <text align =\"left\" length=\"22\">Authorization:</text>\r\n            <text>${paymentline.printAuthorization()}</text>\r\n        </line>\r\n         #end  \r\n         #if ($paymentline.name == \"magcardrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Mag card refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"cheque\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">ChÃ¨que</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"chequerefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Cheque refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperin\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Ticket</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperout\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Note Refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"free\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Offert</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"debt\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Dette</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end \r\n         #end \r\n        <line></line>\r\n        <line>\r\n            <text align=\"left\" length=\"15\">OpÃ©rateur :</text>\r\n            <text>${ticket.printUser()}</text>\r\n        </line> \r\n        <line></line>            \r\n        <line>\r\n            <text align=\"center\" length=\"42\">Merci de votre visite.</text>\r\n        </line>   \r\n    </ticket>\r\n    #foreach ($paymentline in $ticket.payments)      \r\n     #if ($paymentline.name == \"cash\")\r\n    <opendrawer/>\r\n     #end\r\n     #if ($paymentline.name == \"cashrefund\")\r\n    <opendrawer/>\r\n     #end  \r\n    #end\r\n</output>\r\n'),('10','Window.Title',0,'POS-Tech point of sales\n'),('11','Ticket.Buttons',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<configuration>\n    <button key=\"button.print\" titlekey=\"button.print\" template=\"Printer.TicketPreview\"/>\n    <button key=\"button.opendrawer\" titlekey=\"button.opendrawer\" template=\"Printer.OpenDrawer\"/>\n    <!-- <event key=\"ticket.change\" code=\"event.change\"/> -->\n    <!-- <event key=\"ticket.addline\" code=\"event.addline\"/> -->\n    <!-- <event key=\"ticket.removeline\" code=\"event.removeline\"/> -->\n    <!-- <event key=\"ticket.setline\" code=\"event.setline\"/> -->\n    <!-- <event key=\"ticket.show\" code=\"event.show\"/> -->\n    <!-- <event key=\"ticket.total\" code=\"event.total\"/> -->\n    <!-- <event key=\"ticket.close\" code=\"event.close\"/> -->   \n    <img-width value=\"128\"/>\n    <img-height value=\"64\"/>\n    <cat-height value=\"300\" />\n    <taxesincluded value=\"false\"/>   \n    <!-- <printselected value=\"true\"/> -->    \n    <!-- <taxcategoryid value=\"001\"/> -->\n    <!-- <pricevisible value=\"true\" /> -->\n</configuration>\n'),('12','Ticket.Line',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<line>\n    <column name=\"label.item\" width=\"125\" align=\"left\" value=\"&lt;html&gt;${ticketline.printMultiply()}x#if ($ticketline.isProductCom()) &lt;i&gt;*&amp;nbsp;&amp;nbsp;${ticketline.printName()}&lt;/i&gt; #else ${ticketline.printName()} #end&lt;br&gt;${ticketline.getProductAttSetInstDesc()}\"/>\n    <column name=\"label.value\" width=\"80\" align=\"right\" value=\"&lt;html&gt;${ticketline.printValue()}#if ($ticketline.getDiscountRate() > 0.0)&lt;br&gt;-${ticketline.printDiscountRate()}#end\"/>\n</line>\n'),('13','Printer.Inventory',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line>\n            <text align=\"center\" length=\"42\">Receipt sample.</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">You can change this template</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">in the resources panel</text>\n        </line>\n        <line></line>\n        <line>\n            <text>Date:     ${inventoryrecord.printDate()}</text>\n        </line>\n        <line>\n            <text>Reason:   ${inventoryrecord.printReason()}</text>\n        </line>\n        <line>\n            <text>Location: ${inventoryrecord.printLocation()}</text>\n        </line>\n        <line size=\"1\">\n            #if ($inventoryrecord.isInput())\n            <text align =\"center\" length=\"42\">In</text>\n            #else\n            <text align =\"center\" length=\"42\">Out</text>\n            #end\n        </line>\n        <line></line>    \n        <line>\n            <text align =\"left\" length=\"17\">Item</text>\n            <text align =\"right\" length=\"10\">Price</text>\n            <text align =\"right\" length=\"5\"></text>\n            <text align =\"right\" length=\"10\">Value</text>\n        </line>      \n        <line>\n            <text>------------------------------------------</text>\n        </line>   \n        #foreach ($inventoryline in $inventoryrecord.getLines())\n        <line>\n            <text align =\"left\" length=\"17\">${inventoryline.printName()}</text>\n            <text align =\"right\" length=\"10\">${inventoryline.printPrice()}</text>\n            <text align =\"right\" length=\"5\">x${inventoryline.printMultiply()}</text>\n            <text align =\"right\" length=\"10\">${inventoryline.printSubValue()}</text>\n        </line> \n        #if ($inventoryline.productAttSetInstId)\n        <line>\n	        <text align =\"left\" length=\"42\">    ${inventoryline.productAttSetInstDesc}</text>\n        </line>\n        #end\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>   \n        <line></line>            \n        <line>\n            <text align=\"center\" length=\"42\">Thank you for your visit.</text>\n        </line>   \n    </ticket>\n</output>'),('14','Menu.Root',0,'//    POS-Tech\n//    Based upon Openbravo POS\n//\n//    Copyright (C) 2007-2009 Openbravo, S.L.\n//                       2012 SARL SCOOP Scil (http://scil.coop)\n//\n//    This file is part of POS-Tech.\n//\n//    POS-Tech is free software: you can redistribute it and/or modify\n//    it under the terms of the GNU General Public License as published by\n//    the Free Software Foundation, either version 3 of the License, or\n//    (at your option) any later version.\n//\n//    POS-Tech is distributed in the hope that it will be useful,\n//    but WITHOUT ANY WARRANTY; without even the implied warranty of\n//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n//    GNU General Public License for more details.\n//\n//    You should have received a copy of the GNU General Public License\n//    along with POS-Tech.  If not, see <http://www.gnu.org/licenses/>.\n\n    group = menu.addGroup(\"Menu.Main\");\n    group.addPanel(\"menu_generic.png\", \"Menu.Ticket\", \"fr.pasteque.pos.sales.JPanelTicketSales\");\n    group.addPanel(\"menu_generic.png\", \"Menu.TicketEdit\", \"fr.pasteque.pos.sales.JPanelTicketEdits\");\n    group.addPanel(\"menu_generic.png\", \"Menu.CustomersPayment\", \"fr.pasteque.pos.customers.CustomersPayment\");\n    group.addPanel(\"menu_generic.png\", \"Menu.Payments\", \"fr.pasteque.pos.panels.JPanelPayments\");\n    group.addPanel(\"menu_generic.png\", \"Menu.CloseTPV\", \"fr.pasteque.pos.panels.JPanelCloseMoney\");\n\n    group = menu.addGroup(\"Menu.Backoffice\");\n    group.addBackOfficeAction();\n    group = menu.addGroup(\"Menu.System\");\n    group.addChangePasswordAction();\n    group.addPanel(\"menu_settings.png\", \"Menu.Configuration\", \"fr.pasteque.pos.config.JPanelConfiguration\");\n    group.addPanel(\"menu_printer.png\", \"Menu.Printer\", \"fr.pasteque.pos.panels.JPanelPrinter\");\n    group.addExitAction();\n\n'),('15','Printer.CustomerPaid',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total paid.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotalPaid()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line>\n            <text align=\"center\" length=\"42\">Receipt sample.</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">You can change this template</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"42\">in the resources panel</text>\n        </line>\n        <line></line>\n        <line>\n            <text align=\"left\" length=\"15\">Receipt:</text>\n            <text>${ticket.printId()}</text>\n        </line>    \n        <line>\n            <text align=\"left\" length=\"15\">Date:</text>\n            <text>${ticket.printDate()}</text>\n        </line>  \n         #if ($ticket.getCustomer())\n        <line>\n            <text align=\"left\" length=\"15\">Customer:</text>\n            <text>${ticket.getCustomer().printName()}</text>\n        </line>      \n        <line>\n            <text align=\"left\" length=\"15\"></text>\n            <text>${ticket.getCustomer().printTaxid()}</text>\n        </line>  \n        #end       \n        <line></line> \n        <line size=\"1\">\n            <text align =\"left\" length=\"16\" bold=\"true\">Total paid.</text>\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotalPaid()}</text>\n        </line>    \n        <line>\n            <text align =\"left\" length=\"16\" bold=\"true\">Pending.</text>\n            <text align =\"right\" length=\"20\" bold=\"true\">${customer.printCurDebt()}</text>\n        </line>          \n        #foreach ($paymentline in $ticket.payments)      \n        #if ($paymentline.name == \"cash\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Cash</text>\n        </line>  \n        <line>\n            <text align=\"left\" length=\"22\">Tendered:</text>\n            <text align =\"right\" length=\"20\">${paymentline.printPaid()}</text>\n        </line>  \n        <line>\n            <text align=\"left\" length=\"22\">Change:</text>\n            <text align =\"right\" length=\"20\">${paymentline.printChange()}</text>\n        </line>   \n        #end\n        #if ($paymentline.name == \"magcard\")\n        <line></line>        \n        <line>\n            <text bold=\"true\">Mag card</text>\n        </line>   \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n        <line>\n            <text align =\"left\" length=\"22\">Number:</text>\n            <text>${paymentline.printCardNumber()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Expiration date:</text>\n            <text>${paymentline.printExpirationDate()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Operation:</text>\n            <text>${paymentline.printTransactionID()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"22\">Authorization:</text>\n            <text>${paymentline.printAuthorization()}</text>\n        </line>\n        #end  \n        #if ($paymentline.name == \"cheque\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Cheque</text>\n        </line>    \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n        #end\n         #if ($paymentline.name == \"paperin\")\n        <line></line>     \n        <line>\n            <text bold=\"true\">Note</text>\n        </line>    \n        <line>\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\n        </line>    \n         #end\n        #end \n        <line></line>            \n        <line>\n            <text align=\"left\" length=\"15\">Cashier:</text>\n            <text>${ticket.printUser()}</text>\n        </line>\n        <line></line>            \n        <line>\n            <text align=\"center\" length=\"42\">Thank you for your visit.</text>\n        </line>    \n    </ticket>\n    #foreach ($paymentline in $ticket.payments)      \n    #if ($paymentline.name == \"cash\")\n    <opendrawer/>\n    #end\n    #if ($paymentline.name == \"cashrefund\")\n    <opendrawer/>\n    #end  \n    #end\n</output>\n'),('16','Printer.CustomerPaid2',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total paid.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotalPaid()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n</output>'),('17','payment.cash',0,'//    Openbravo POS is a point of sales application designed for touch screens.\n//    Copyright (C) 2007-2009 Openbravo, S.L.\n//    http://sourceforge.net/projects/openbravopos\n//\n//    This file is part of Openbravo POS.\n//\n//    Openbravo POS is free software: you can redistribute it and/or modify\n//    it under the terms of the GNU General Public License as published by\n//    the Free Software Foundation, either version 3 of the License, or\n//    (at your option) any later version.\n//\n//    Openbravo POS is distributed in the hope that it will be useful,\n//    but WITHOUT ANY WARRANTY; without even the implied warranty of\n//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n//    GNU General Public License for more details.\n//\n//    You should have received a copy of the GNU General Public License\n//    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n\n// payment.addButton(\"banknote.500euro\", 500.0);\n// payment.addButton(\"banknote.200euro\", 200.0);\n// payment.addButton(\"banknote.100euro\", 100.0);\npayment.addButton(\"banknote.50euro\", 50.0);\npayment.addButton(\"banknote.20euro\", 20.0);\npayment.addButton(\"banknote.10euro\", 10.0);\npayment.addButton(\"banknote.5euro\", 5.0);\npayment.addButton(\"coin.2euro\", 2.0);\npayment.addButton(\"coin.1euro\", 1.0);\npayment.addButton(\"coin.50cent\", 0.50);\npayment.addButton(\"coin.20cent\", 0.20);\npayment.addButton(\"coin.10cent\", 0.10);\npayment.addButton(\"coin.5cent\", 0.05);\npayment.addButton(\"coin.2cent\", 0.02);\npayment.addButton(\"coin.1cent\", 0.01);\n'),('18','banknote.50euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\nEiCCPICC profile\0\0xÚSgTSé=÷ŞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆ€ŒQ,Š\nØä!¢ƒ£ˆŠÊûá{£kÖ¼÷æÍşµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sı#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóıxÎ®ÎÎ6¶_-ê¿ÿ\"bbãşåÏ«p@\0\0át~Ñş,/³\Z€;€mş¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}şgÂ_ÀWılù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ıG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púaÁ(¼	AÈa!ÚˆbŠX#™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ğdt1š ›Ğr´\Z=Œ6¡çĞ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRİ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºİ•N—ĞWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªŞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yı‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ı»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠŞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSİ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜¾^€Lo§Şy½çú}/ıTımú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«ÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ı=\r‡Ù«Z~s´r:V:ŞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆİÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)Y3sĞÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Ş2ŞY_Ì7À·È·ËOÃo_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖĞaæa‹Ã~\'…‡…W†?pˆX\ZÑ1—5wÑÜCsßDúD–DŞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ğA*¨Œ%òw%\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLİ›:šv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²şÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæŞ-[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒİµa×ønÑî{¼ö4ìÕÛ[¼÷ı>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒı#¶×¹ÔÕÒ=TRÖ+ëGÇ¾şïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêŞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<ş“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷é7Îİô½yñÿÖÕ9=İ½ózo÷Å÷õßİ~r\'ıÎË»Ùw\'î­¼O¼_ô@íAÙCİ‡Õ?[şÜØïÜjÀw óÑÜG÷…ƒÏş‘õC™Ë†\r†ë8>99â?rıéü§CÏdÏ&ş¢şË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ıêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSĞ§û“““ÿ˜óüï5”‚\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ\n. àÖ7\0\0:IDAThŞíšÙW~ß?¿sNUİ½oßÛ;{ã&QÔÂIÑ6›=‰Çpœ1qò”§¼$€?y<&H¿%AÁ$“`<Yl=cIÖŒ¤‘DJI‘l²÷îÛw¯ªs~y¨ê&ço0àEßfß[Uçœßï÷]Î§ñ4ÆÓx\ZOãi<¿¢!Ş§\n‚ \0ÍADÊ‚j@Ä@ù{Hø{oCTã@ƒˆ\0åK (£˜DP—9à‡H§w×tBØ½K8™B\0Í3Yñ´\nˆ‚‰Êßóâ½f ¶ø¿ƒäÙ¿‹Ö—‹A–cSUEUAÀˆÁÎ„¢ UEÊ¢Å„ åµ¸\0bŠÁ\Zh1IïS<\0\rT£òZ US|OÄ\"^ŠÁØ\n„1¸r)¯K1±âÀhT>KŒ†PüİF<¢D~ñÙ¥¸\r\"ÅÂ¢8TËT•ôÿısÜ›¿ÇÖAÆ?ıƒ·±@PÏLeDR#Ç0şõo÷qG7cOÈâæÎ‘îzû$—^`z÷stÜ#yé\r¦7ŞÃ6ªDçWè}x“j’Syõtp‚8K¼ö,hŠJ&BœCÕ@PN°¢`­’DJ³•œ-Ş£½!£qF»Óí$ĞˆLˆf(®X -yzëß\0§œ®t@ûÛWPq¤éˆ[÷h»)KÍ]n=Z`mæSnîm’Zq“h%!œA´Q$~µi¶ œÇÔ$IY¤’`¾ôK„Ò(°sñÛ\\^ØÃ4g°3íb5E	Á@>,2ÅÖ>ÍøÃ?y@Pğ^0€ÃÒlƒßúµM‚WşøG÷yt8ÄçŠˆry½Í×ÿZø!h‘ä[¨]‡twù&ªú¸PEósé;„?ã\Z¨Çî÷Vñî/ÑJÆìçM…¸…]Z\0Ÿ‚ÄU±MPD çÎ1—Šì«+©X>ŞŸa_*Tì\"+=Ä«BÈyçóˆKşoÑÃ\Zoşna G<»¹Ä•óí²\\±ˆª||k›ƒ~Ê+×6xşr‡·ºÅgwöÙØ:asóÊvÁ´É\'è¤ÔÏJÂ €ŸÂt@öî „/~ŒÆu0œÖXnî‚x–š;Ó*‚\"FëWAª³H¥â\rLBÄa›½ĞekÔb’úSÃ$õ¤ÓççNèÖÇXSô—½“Àı´Ân¶¸±¿N.qÑ(5\'¨\'v–ÎÜ+Ëó,/uY^êÒï€M¸³5¢Q¯òâØ¤Á+_Ş$NªÜ»¿‡Çqwûs¶ûs\r‹ÔW:<ëN5à·ŞÁş¿‰^û‡Esj®`\Zó$ID\Z,Ó˜n³ÏÃñ\ZI%ALÑéEsiqQ— q,x’lÌñ‰Aê5dØ§İ	X£Œs¸¼ĞgnÆECœ«f*)¹¯ÓQI=‚õhğD\"Œ†n?t$qÄò|c#&Ó)“IÆÅÍÙ23„¸âXœM°?ùğóvÀÇŸ}Äk›Ği´ÊaÎ°Á!`×ŞÀ¬½Z4{ío³¦Ê÷şÅwŠL‘&¥ìâ§˜‡×Ï ¥€@ƒŠÅ»*½P£UÓæ½(& Á3ß6˜HãˆdR EJ·êÂßÿå‡ş\nh	©^…Jx´Ûcoÿ„€`ÄÑnÕXYêà¬à¢µI	ÃUkLFC:İ—[\'4*Ï¶#^­ş³òİ¢ÜË—9ÅHTÃ 8#){Ô“¯oõ\"ƒg¢	i®ÜÙ™«Ğ˜­1NZ¬urfj–vİà¬)\'-+È¢*(†këÊLÍ²Ğ\ZcœCÄ0Ò&ÎYŞøÊ³üú¯½Á…Kë(J«^!¨åÖÃ³ç96möÇ	j\n©Õ\"\Z‘²w’!&Ë­!ûi/Mü£w‹ô/áÑœ¢@±Ò+cÌÆ1ÈÙÏGKÎ€*äC&©2Ì,“Ö›Sö·iDv§Å¸¾ÀØ¸rÖŠïÉ)«9Í(r /VĞEDÏ½Â`îËì˜ì„u2SåGï|ÂG·¶xØä8\Z1H½MR‰°\Zø‹Ÿßã8«M”0:ÂE\'rqË\\<7Ã ımD	GÊçœP,éi¨1ˆ*B è“ÓsÊ$JÄHG\Z;\"\'d®M¤S’|Ä³s`\'ÇL#MÚ¤ÉYQó=\\$ùQOğ)ªR2Ã\0êI¾õèpÄö­{ü÷÷oÑiX’ã›$³+<x8¢Q±hTc¶ÇSêµcœµÜ¼½ËRË€¦´Ú-ÖÖ—9œÂÌÜÏµ2Ô<Ë—ÑÁ}T• §e?AËJ±HgS å¿’êÊ‰ï•É#¬ŒàL1Y•cG;Œª]ÔV9Ñ—Q†Qÿ,Í@‹ròù”ŞIŸ·ÿü6Yeqf–<²ñÒ«ô‡S^ìt˜ö÷XYHğ9TâˆƒşˆËó–{{½ş\073?;C¥Ñfy¶Ò-~T”íğ>’mŸ5MSŞ<|Y8k1ÆœMÍY\Z#h´ŠšY ÅOİÓĞãòÛÅ\r\"™R\"F\"23O/_aš¹W²PAq¤YÎ;ïïò³°vù\nÔæXìVY˜k2×_­‘+¼úüQl¸¿;FÇ#†ã”¡2Qa}.aµ!Ö°°²\\På°\r²P<öèÄ£Z-“YÊ(\Z@™¡ìEC,úAxœer0=A|Ÿàæ0v¡‹š)AZxõ`@ÃJÀ²·çIé’i@XÓ%;r¼;¡ÓiğùCn~:¢]­“4ë4jÂèh‡Z»Ko˜“Ë€jRçÆVÊí›ˆmÌÜl ÑšaÔc=ôvNhŸk²Ú¶HïsBÈğ?ƒhaˆjğeéiÙĞRl„Ç\"¨Trªæ\nO\'KL’µ5¤1YJà„`…à:ˆáåAû5èÄ²w0\"³Š3\"Bb9è¥TZK˜¸Ï~ïˆvHÇüå§=^zy•áaŸ÷~v—Y¦5Û¤ğk‹câ\0 M§f™Ê×®,`²mtğ:	vĞlá}ìòUˆÛ YQÚ\"˜bÀ…ä={_ÔÈãÁŸV€–âI™!¸¡¾„VfÑx¨è¢¾W…p•‡´›1Îz*.[Oìg<!äô÷wiÔ|–“¥ë{ˆ1üîïtyıÙïQ¯f\\¾0%Lï‚*/\\ó·NøÆ/ğÖË’h‚ÅSq`âR?‡TÏc*ì2¯ÔğîBz\0:.;›` Tƒe°t*kå1zÜ40å„˜ì>ˆEÅ¡Ù PÊô@\Z`ºxVQUrY#Š2î1|p7Oä#)µV?MiT¦7N#:Kkì^ hÆ+Ï|ŸçŸp»·B::Á›cÁDŒ¬r¯±2ˆëP]Aªu¤a\Z-¤{‰0:j¨|Èqp:¸ÓşÎX’¢á&Ä”#0ë?Eo¢q£[¨¶‹Éï#€—uD`ë‹-ÒÑ€…Í5&½u—K,õ™GÛ;T«N‡F»Á£8ö¦_¥İúç’ÄÁÔŞ(HŒXÅğ*äõeB½3…‘r$&éBâG»eÛ×Ó	(×_´¤§/ú)Ì’S¢€)&\nAôfZC#ÙìJPRÎZÑ1ÂÇû‡´:²0¡1ß@BÀÚœÈåha­ei¡Ãí[=ò d™Ç¡g~/CıëXûªJ%òtbi¹0–$qH}Po`Œå	©hÜ§ÏÍ•3fãŠFW~\0Š®-Œ-]\"%¨–P(…›#¦šB\\aM•“¡çƒŸ“å9+k+¬¬àéd–vwÂáá!ÍÅàş§·Y8W+°Ùxº‹>úğ!ÕX¨DÈÑ x\n÷É¹*±38gÁÄHÔÆØ€R3qEiÊc{¯×rs÷ˆ+ËMní|Áæü9vS:íÖ~À“ŒO0Æ4/m8-gï1}E¤‹b12æ÷ñÚ¯µüğı€Öì›Ô›SDç6Vyp÷!äL‡c–7æA{8[ÀbÈ\'$¤NoCM~F.›™C0Ä‘#q#)b#Ğ#Š%“SQ&ÊøñÇlm½Ë¯/æ¼{ä8lf|<Fİ×øÇ¿úÁ©*`Î|²SKÏˆCC¡ÎÊ‡ LÓŒ@‡Š´‘°ƒÄMˆa<òááCàÚ—61â{f[]yé½ÁjmÕé0GH\r¨z¼ÏÉóô˜†y‡Y÷?Hõ#}•QxçÁ+‘HR\"—A$Èr)^‘ßıÒ27OøşÍMŞÎç¸ù;Oyùë­S</ü€}Q\0\Zğ\nÎ„³Ş`J	Ø;:dëş=ööÙX¸¼º‰è!Ãü|ƒîÂ›KÜÿâ[÷¶¹|u	¥g£)¹XS8Ã…)\"HP„!Çm*æ#fÜÿÅk…işBQ–*ÅwUIÑ\01²²Ü?–¬ª\\÷ÏØŞšãåÕ*f<ÃhêyØ?‡üåŸ²¹ö\\ÑäOEAĞ€ŞT¹÷äŞŸ	¡şÉ	·?»Ák_û:¿|m›wvÈ4\"BjxåÚ<÷ïŞâúŸ¾ÃîÎˆ+Wç±XŒ(¨GÈ1%Ø:“áL3g=Ö\n\Z 7×‡gIuÌ|© æ‘!øğÁ‚8Ô8rMÁ‡Ò8.Pl”¦Nø¯ûßØŒ¨6`œç%“\'lqÕÇŠ/dÜùì6Qsn}ól_`uı<¾÷N‘á!KİÇı[cdšÛ%¾öõ%Œõä4ü\'LäuBé:¡ğPŒxDr¬€â±6gĞ?&McªÕ1	ûòoPbL“zbØ=!Çx\\gq>#e2\rXÃ±Gƒ·o½õ+lÇÿû¨Ãïÿx—o´Æ\\X<äê·¾{Ög\\şÌñA„,KùÑÀ¥+W9ÚÛeiyÇg`aùŸ~ôsÎÏ\\ä¸¿Í‹Õyi‰$ìˆÁHœÿ3¦î_!¦…j«°¹(6F…\"xœ±œ°ØüäMî=|Äİƒ„[dyN¥šå\'L‡fj1•Ä3œdÄ&\'.¦ÓNXìÖ~A¼ÿûë·y¸»È[ç§üƒîZipı°Æõë_ğOşÆRáğ„VU²iJ–¥}¼÷Ü¹õ)Ï<÷<!¸tå*üGßçxi–k—k$Ö¡ê@–PMSAı-jù?ÂÊ>Mÿ{ôå_‚´0bã©ÙÿÃXß<\")N¿`¾òÙ¯U1áŒÍor4™Á¹‚®ŒF)¨P©V¨ÚÀŞı˜ıc‹uÒL	aBğSR?å¥Ó”¿÷Õó¼w¿ÃÕ+\\¿½Ç7/,ğŞG¼¸Ø,ĞBÁ=&ETë5¾ü•×ôO˜iÏrãçï³°´B{¶ƒ Ì´Û4[3¼tiš•[M21ìd\r/çÈåUŸš¿‰šUD ±7±z‹ùÚ÷ØŸVÁÔ™0GÎcÿ\"7>r8X`uc“CP°êI3az¶cê®Kwn•å^\ri „Âg-c}q‘õÅE@¹<[„óKœmJÉôğz²K\nKÏ‚Ïœœ`­„z£ñ)‚+/\\£?~H­éJİßİ#h¥šfÔş6©ı\ZQ¸^–˜¢Z£SùoÄ®Ç¬ş!¿‹£\Z˜¤+än8Ùc¡Sg¾Û¡–¬İ\'G‡l‰c<Ì™¦)y|–3N™‡ÏÒ\ZÃ¢® ú¡Ô;§B/ÈMĞ¿ÿ‡Hç$Md°Oë§ÿ‰á3‹û·oóÖ·•›7oÇ1¹÷4ulsïıO‰ŸYçó­»ÔªU®\\½r‚’ á>¹ûÈì·P”säºDÚ\"°ˆ±uŒ)PÆëU‚0H—h5Ò,gĞ;&„@0¥ß›0ß©rØ÷¯d£”İ£2ä0rÚÚKVSÀ]©xˆkUÑ³ğŠ0í5Ø¿ƒY¿ÆÆåË¼÷Á\r¬µ<z´ÃÚÆ*»;ÛLFM*IÌ½GÇÌ[%Ë”ıQ¯4Kº%Û(o^x§ıÅÏ$ÿ&â–‰Ì6U7Æ¸C†„œŠ›Pq1GG\'ôûSDó3	.¶ğ(¬^e£Ñª\nƒI¹I[®üàıÿIc±‰ØJagqE‰\"èdHè\\Äm¼ü¸	ÚW~BÆôú¿#o¬â—¯ÒT0®Ğóİ:ûî°¼0Çöö6Å.m¶99>Äg’¸Âƒ­\Z­\ZÕvœ)0úŒd3o™€Y@L†µ]b7ÆDY¹5æé6³˜éx“\Z\n´U\",ƒı>»‡;ÊàdJ:°L‡)CM„¥¶%Ş»ÇtÜ¢rå«ˆue&Ø‚!j naæÌ¥w „Æ.r|Òxj»ÃÖÖ€76¦S4‹f£BlÈût›	ııÄYIšc­ÁçCöweMÒ<Å»:şÔW*eµ\0æä!È6²X›‘OSB.¦„N3gšÃ=êéšN-X]lq\rØ4ŠÖÉÁ5“‘eÈ§Hí¨Œ³©6QŒØRÀ	¹b_±d÷”ş1÷¾xÀÚú2W¾|ôƒ¹şgÁ›o¾@­1ƒ5PI,Ó‰§ZËğéšEDÎ1ß­\Zl|‚h§”{…y©B=&^†hc‘€‹‹	¡Ø„¹X›€£û·á0Bs‹f…X*Ï[ â±N·õ]©`J—‚ÍGĞX„™åÂÖ‘B4;NŠºÚYvÊh|¢g‡\"ĞòœÀcøÌ4}¬¬‹”İzlAE)Õ£œm:‡õ-LUÄB0TŠ½Â\'=4/6HÔ£{ŸÅélúøŒCÈÀØòŠ-¯mA§å	‘ÓÓ).ü&Ì½ô‡$0øŸp¸ŸÆÓx\ZOãi<§ñ4Æ_ÍøÿµDg·ÕHåU\0\0\0\0IEND®B`‚'),('19','banknote.20euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\nEiCCPICC profile\0\0xÚSgTSé=÷ŞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆ€ŒQ,Š\nØä!¢ƒ£ˆŠÊûá{£kÖ¼÷æÍşµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sı#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóıxÎ®ÎÎ6¶_-ê¿ÿ\"bbãşåÏ«p@\0\0át~Ñş,/³\Z€;€mş¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}şgÂ_ÀWılù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ıG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púaÁ(¼	AÈa!ÚˆbŠX#™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ğdt1š ›Ğr´\Z=Œ6¡çĞ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRİ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºİ•N—ĞWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªŞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yı‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ı»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠŞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSİ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜¾^€Lo§Şy½çú}/ıTımú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«ÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ı=\r‡Ù«Z~s´r:V:ŞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆİÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)Y3sĞÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Ş2ŞY_Ì7À·È·ËOÃo_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖĞaæa‹Ã~\'…‡…W†?pˆX\ZÑ1—5wÑÜCsßDúD–DŞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ğA*¨Œ%òw%\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLİ›:šv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²şÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæŞ-[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒİµa×ønÑî{¼ö4ìÕÛ[¼÷ı>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒı#¶×¹ÔÕÒ=TRÖ+ëGÇ¾şïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêŞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<ş“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷é7Îİô½yñÿÖÕ9=İ½ózo÷Å÷õßİ~r\'ıÎË»Ùw\'î­¼O¼_ô@íAÙCİ‡Õ?[şÜØïÜjÀw óÑÜG÷…ƒÏş‘õC™Ë†\r†ë8>99â?rıéü§CÏdÏ&ş¢şË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ıêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSĞ§û“““ÿ˜óüï5”‚\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ\n/¦o~\0\0¸IDAThŞíši]×•Ÿµ÷™î<Õ\\$‹IQ”5ĞšÜm»mµ3·Ó A‚$\r$?&Ÿó%? H#	’t\'AÛnÛ±l©-YÕ%Š3YópëÖÏ°÷Ê‡s«Hu~Bs…{oİ{ÎÙgïw½ë]ï>ğ<ÇóxÏãy<çñ×4d’fªªgÿP@-?pöÈÙ§öRb\"‚TAyzŒW@¯ŠˆGP\\‘áDÈ½GQÁ£X)±ªÊÑq-<ŠÌ¯.RÏÏ¯àUA• 9·ĞdµPM9ZU²4çÖÿüc–ß¸ÁÁŞ.ÓÉ€—¾ÉÂÊ¯Ê$s§9‹Í„á4§‘„¤¹ã>. å@e>Hd©MÕdŞÓŒõ¬¬,rØà‹‚Ån‹şpÂx:eu±Íx:Ã»c<ŠaœeDV©\'–<ŸÕšØ¸ŠŠ™O ¢\nƒ‡ÇAÀÚÚÖZ@±\"ä^9::f2\ZÓl5é.tÈœ§pŠ³út¹¬åÖñO~ü1ç6.q¸wÄ¯7\0˜fAL2öOfTBËxœñoÿı¯IDX¨ìb¤\\¯\'ÃE$0üÓñW*ÌF¶î>¤Õ¨2®×¸ç!Flïàf)ÇpËö÷˜ÌRÚ	‘<¥°!&ªâçDøÑŸş„Gw#\n¡z¤Qçoşğ]—z¤…ãÿşéŸ³õd‡Ø*yòÒ¯ğÃ¿ó]¼*êL‰&ç•°Ş`Ø±w°Ép0 Z«¡@ \nj„WåñÑ˜…FR®²*ˆdŠˆaoÔ£\ZéÄ}úy§\'â˜¥Å.h‰”o½ı\Z6°\0,­,¢€SÇòr#Šw9N‹Ü{D\"™÷øÑ1ã{Ò}ñM2{m^¸v™å^›ƒ½Şû³÷ùÕ~É?øçÈ\'ïÿ†{¹öÖ7¸úòU~ûáMn}ô)—.ŸgõµË8¯ˆ*ªŠzG…ÔkÔ9â(&MS¢(Âœå¾*ç:5\ZIÈ½½!…/g1¶¢ªx•0Ÿç£ˆKh-ÖZÂ  ¢0 ,A…†Z°OœÄÄf\'–L\rµ$¢–­z¸Ö$;Øäàƒ?áğÃaDbÈÛßy“k/^¤Õmså¥Ë¼ğòE¤YÆ½›·±¿ó½wXXèò­ß{‡4Œùè“[s^(y	„0°ï88œpt4âøpoÎt ĞŸd¨*Ih	Œ›b\rÃ¼N3Ùa±~€•‚ÍÑÆæ”xÊ^Ë4ñ\néìQ²Á$÷Şâ˜2sËTØÂÄëà·¨…ˆ‰5iIº§çißgÒü¨±%›ârG,ÊaÿŸe¬¿|k\n4êU:Mníá½G0ä³1÷n}B\\©Spã¥x…lV¥HÇh£N\0à¼2Ë)qa¡N Ê¼{yNåWKRBxUŒĞhUğÆÀ¼\nˆÎ—ä±Dæ„n“në\"\'“!‰uL³Ä)èâÕ‘j(0b0¢$ÖĞH”êÉOÑaÚz“ÑdÆÃ{O8¿±F>£ÖÒëÔç¡x„F³ÆşÉádÊŞí[ŒN¹úoòå§‘ú€N¥…ËG˜YE^’ @¯­6Væùü¯ÿñ3FsS¹ÚÀoögFğrZ6ALg}0\rªrÌ”¼ò,c±q8›±Q«‘«ò µç9N\n#^^ËÓ)yçÂ/~úkLQğÍï½ÅîŞFG)1hPB¢ÂQxO¥Ş¤È3Ú½%^zímşâçÆ¯~ûjÊÎqW~¿h9ÌëkYNŸBúT\0Hyç_‹™‡ØÎ‘(Î+…/pŞS=U+YkÌÔ¨ùMâhƒsä<J…Øo£²V!Y¹„WÏ;ËT>e·»É“{OØüâ¯_å`<eÿxˆXÃx0`tÿc\"?¥ˆ[Œf)V”[·X©Ew6Q ÖêFï|ÿo3JS:T©Õk¨R’ài:ë©ö‘Ò§úŒ:ı­È©,*g_@„f¥…è1Ö„„~dé\ZšÓ”m¼=‡,Vm¶‡Ûœûá¿bé»ÿQsbºì¶¾Ãö£Ç<¸u…+ç8¿xGP‰œã|paÌ°u™q­E\0£YNPip¸·ª,¿†Ï3ŒµTCî\n€³šß¼–7¬Ou¡¢s˜=Ş+…*N•Â—«_æ8×là<8Ó¡ğB,Ë„R v¡ÄS±‰š.U[4İ’õË„İ”ù9ÇæÖ!oŞãÒúßkƒ…ü®ÈéÔ+hQ‹<Ï©÷¿$Õ€^·ÃZ¯EáKõY]8O6`Œ°µ}ÄæımÂ±cpwï<ªspZ6NóyŠ™¯óé$Ì&~~Œ?UŠ\"Ä2¢(F	®JT©F	¸G‚UÖ	Ü.h‹A—›®@ÅàU™ğÕÇŸ°sR§\\¿²ÊKÂtûZµ.Ç_ü¦ë¿ËòÆ\n“™RÏ\'<ôKäÇ.ÔY<¿ªä…RëöXİX§(-›rã»oq|rD\'Èğ³	2GËü†Kÿ\ZÜÏôv9\r…êY;àÜü{3ÇJæ©S\rRfyËû´C‹ä›äÁ:Fã\'(\rğø).WÎc¸+ÊáÇ?eïãŸÒ¼ø6/œoQ¤²1wvjdîqõkl¬#=–¯†lmnÑ8ĞÖÕºeÚºH[+^±¦$Sç¼£Ó¨{OÁÍÆh\"\"§lwºòrÚØ<CòL+ôl”ì|Š¼rQgCÔö¨G¡vQ!(6Õj–ÁÙ?Ü¤×êpø³ÿJó.\'´bE‹1ï=r¼}¾Ãú²²ß¼Š¯/ğêï4¹ëCr…Ê…5ŒĞm&Âñ¬\0)pÖ–Õ[K˜c-·Ÿìö…Z-aoëˆKßj–pŠõÓw3Ğ9¼ê2N;2ú§ßrœÏB‘u†’oâU)Ì*ÎôPuH±‰Ø:ëçyøè6rğä³1»ƒ1Æ8›cÅä)‡nY­Gàr‚@ˆk˜º‚;·òøÎ(²² {‡/Š²”Î;™¥Ü»û·oÎÎşÕJ¥óiwWjö²-=-‰hÉ’FJuÇ¼Şûù„ùyé)K¡]Ôã\\N…œÀmcüÂ¬Â\\!’?BU ì€ñÜÿâ#i.­a‹Ik‰­ÁD\\_mrç`ŒÚ€^à¸·İgØX\'/\nŠÂ1ØŞåøÎ=4ÏÑ<£ÿÕ]¶¶Éò‚Ü+iáqª8çqŞ£.WEi–òTœ²¼›ë€Ó^]ÏRâ)ôYCaŞ¶\"ˆ2–¡pˆŸàÂU-›©X7ÙrÂğ`‹ŞJJõÂ9ÒÙ˜;7NÜÛ ªD8ú\'ût._g·iå}ò¼à7Û˜³bÀîaÃÇ»3¬÷h2*…„TÒ”£\'[´W—q¾£µ†b–ÑFÔ¥Ã-kÑS!$óìS£AUÎj>s©›{ç{ù{kæºA•–%ô³)&,@+ˆëãM•Ã)Ş\\}óŒ÷n#¶N:úT)&HkƒJ¥N½µÆİñˆ[ùˆµN‡|vÀIhH³”k­\ZYÁhû½ Éfº€#Ò“q‘š€Ô+‹IÀp{9¿\"¨w\\Š¯¿{¤B6\ZRiw¦À³q&ˆô)4ôëÖÖ<åaT(‘5äEH»ÖÆÛÎ<EÀ›LGÇÔ»Ëä\Z+×˜HxÑtÈÁÖ}\"+tV.r²ıšÍèïqóóF8Mp6bsZ§èÒ¦lM›ô5 2QO3›0ö°?œÒ­„L\'\0äiÆXg´[UâPhG“ŸöÏ(œ§µ¿üàçåïLÏ¹Á+ä{J~`öONŞş\0uZ# vé{v\rk„FWéoİ¥ÖZD]Î—7?àÅER)ùş]¦ãa’÷hk‰‰›Rëµğ^™H’œqó\nı“#ú“	™µ…ç‹*lfÂ¸p:Gc8%9 @T©°^ãó÷>¦Õ©âÂ?ûvY‚gaş¬Ïö¬şÿ««¯sÏˆœ•Æ™\né­÷Y»ş‘óå‡‘,ìWr4\\¥Ñ8|’òğÓ÷(²—_|\r™İ¥’Ô0Æ‚:l\"ÖĞ(”­<ÃyÅT+ÌfQ³Š¢¤õe¶†5&hQ°R‹‹EVBO>N©%}oX2gÇÊF‡Ê\r’X1a@Ç¨j©ÏzæÍémk™ûÏ’¤¸tFCgxüœ+¬E:áğşM|Q°şâ\r*vH!=¬ëSHÌÅ×ßÆ8Oœ4ˆtLæ7˜Î&\\}åÛ|õÙ{e+~ùMF_îä9—¯mp÷«\'Ø(âÒù<Şeo÷\"+ÎrBk9È#£hš2\nBPåd<£\'líî—“ç„ÒÇä•Z‚	b¼/°6œWåê¥ì•3UtZî@úìo=äèpŸÁpDgm¿ú2^•Ü+Õî\nµŠE_Åî³½yÄÂÕpsµèuF cœ¶@sòtBT©3P­wˆ“\ZƒÁ>I½N7H¦T£F¯É(Ë‰gû¸x‰l:£Ó¨€\n™Bì<Ro0©Ö*´Œg<KI+e›oƒ€ÂÔÙÛŞ%¢ÃŞQŸë¥¨7óu?[égSÁÈ³\nP˜‡Üıò/yı;‹æ—£_—¡÷t6^ápïş­Ÿr°µM÷Òkˆ¦à3ŒÛÆKo;ˆÛDMÕ”…Ş*õ¤F·½D·µH»Ñ\"®6YmTˆk	İÅ6«ÉŒºÃÅğ„@aˆ	|^à\nÇ,ËñQ QL%‰µ@\"ËXóíoQ­´¹’„£!”i,E	âß»ÍÖÃ»˜³ş@YZ»@Fe³¡BuñÙà€BÁª§  zõ;´/¿DåÒxüÙdŠ„¨/bgÖ\0‡à°Ö’$ul„1qR#c–’j%&-•jÄš{‚F-œ\ZjÖr4J9Ê<m…XchYØNégŠ/(ŠRXWåBh#ªÕ\Z¸éÉÉó5zó_üè ê9Úßc:òtãDXZ;Ïƒ/nÒ”lxDTo!eff±Tšbu„ªÇK@÷qvñÄÀÔS–c1T0@(Pq*B-26=†õ«0KYZêr®^¡—ô–{¢„êXZè²œ„¬U#»Í§„Txïó¯øÕ_|Î£‡{üæî&ÑÂbÙË3›\"àŠŒt6%Í\0xrÿ6¯½:W{ÊÆ•ëüùŸügÚ«»t_x™­â½’ÌKd-,?¡Fpf\r#8Y%\"›,Î•ïÅZ¬X¬	ÊFÛŒª*û€úœq÷\rtëˆ¤Zjø¤V!vŠW¨U*¨w(B\\‰©D!6©ÆzÖãøÀòñÇï†B q’”|§@á”{w8>D	¯¿ÁŞş­Ş\"[ï28Ü;s€j6ÍV—îµ·ÑÎ\Z€¨G¤4OTbDS¬5Uğ&³]r7Ã22À#¤ˆ‰±6ÄX¦ln0EÓÛTçø¬‡MÔFåÄ†ÆRÀ\Z¬ší6V \n-Vk\r¡……N”]aç8çˆm›ÃédR\"\0àó¯pïş&Ÿ}õˆô‡ßçƒ_İd¹2¡UğŞsï³_W›„aL­Õce}ÍO~BxşUFûÈ\'Cz7~@Ql15kXÛ¦êöHe‰Aêq,Î 	-m»K¯SÑMæ~2Ş—ö”zÏÉ´O1>&®*ÑgÔó.±]g\\xÔ9ÄX´(J64Ëğb1%WcQ‘¥9¢å¾¢\rü4e0j†0îÅIé¨*/_½Èõ«\'3~üóxıÚUÖ[ÂÏŞçİ¿ÿGü÷ÿğoøÆ›?àÎgï³¸~™(°|şëÿÍ†I8¸û!QµÅádDÔ¼D(`uÊ 8G’íÑìL¡–„hlè»&Y>âÀyºnÂ(KI|•‰sìd9>îĞ—)5-H±ØêœsxçğFˆâç!Œc¡PÁ™rÆ;‡‰c*•˜BÁ„£iÎÑNŸKqƒËï^¢Şnp÷/?gÿ˜ÕÕF(=À½ƒcXhÕi¶\Z\\¸ò2nÿ\Z&´Û‹ï>aqeƒí»7©7z¬\\ÿ]p•zÉ§DIBî Å˜€	IWzœ–FÒ§R©°ê.ZaßQà¸ğôUæ;Kj4^eZY\'2–ÀZ‚ ÀJi_õ¥í<\"¥!ãœÇªGç¥¨¢…c4Ë¹¿yÄÔ’T«DaÄË×/œ™%‡ıcşãÿşå?ù{|òÙÆı}G1µfï=İf“lr„f–n­ÂÑ£›$ãàóÂ$fúÅÏ0QLX_Djí#â\0_]Åë2Ç³‚Àšá}Èá8%J›Xá£*aá%@D×¯ áQ\\ÃŒ§g„Š`ƒ\0CX‰ï#QT¦µD‰%Š4ÏÀ–¶°ÔfÔøí§°\\‡Fç:ãÊéÆˆò³_ş–QšóŸşÛù½o½ÂÇÿëßqë=Ï÷ÿàÊÈ{B¥ÖÀ»kLc¢\nQP–9T—;DÁ\n¢Š3ëX ğ\'ä$,b\\Š“.¡/÷*´Å‹ElPú6BT9ÛßS-í·SƒâÔ½UÄÏë=`TÁ{¬@Å\nkİ*+í\n÷o\\\'whWË½ºZY\"Ç©zõs¹;—BêQ_`ƒ¸”¹³	à1Æâ½§PøìpFhÀ»˜ Â\Z‹5‚±jÊ›ñª¨(ª+ïr2…Â{\\RLgv¼™[T™‰!r‚Î}ÇÂ+Ìİck\rêõlRœs¨*õV(¹Ô±sùÖë´˜¥ŸÜy@h&8õ$Q•W¯\\ÃA‰\0AÎdoùjkÏlñ0©~m[L¼BlKøI¹­uÚ1Š<5SO¥ò‹gÜ$™?õF­…¯=|açûuY!Å\\›ørÛëTÉÙùK7Û„åÂ™¨B§]£×Œ\rgwÄQÈÁ½àÆ,-­°y¸Ïë×^şÿLŞçñ<ÇóxÏãy<çñ×)ş¼sè€®I¢æ\0\0\0\0IEND®B`‚'),('2','Printer.Ticket2',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\n        </line>\n        <line>\n            <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n    #foreach ($paymentline in $ticket.payments)      \n     #if ($paymentline.name == \"cash\")\n    <opendrawer/>\n     #end\n     #if ($paymentline.name == \"cashrefund\")\n    <opendrawer/>\n     #end  \n    #end\n</output>'),('20','banknote.10euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\nEiCCPICC profile\0\0xÚSgTSé=÷ŞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆ€ŒQ,Š\nØä!¢ƒ£ˆŠÊûá{£kÖ¼÷æÍşµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sı#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóıxÎ®ÎÎ6¶_-ê¿ÿ\"bbãşåÏ«p@\0\0át~Ñş,/³\Z€;€mş¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}şgÂ_ÀWılù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ıG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púaÁ(¼	AÈa!ÚˆbŠX#™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ğdt1š ›Ğr´\Z=Œ6¡çĞ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRİ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºİ•N—ĞWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªŞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yı‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ı»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠŞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSİ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜¾^€Lo§Şy½çú}/ıTımú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«ÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ı=\r‡Ù«Z~s´r:V:ŞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆİÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)Y3sĞÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Ş2ŞY_Ì7À·È·ËOÃo_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖĞaæa‹Ã~\'…‡…W†?pˆX\ZÑ1—5wÑÜCsßDúD–DŞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ğA*¨Œ%òw%\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLİ›:šv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²şÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæŞ-[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒİµa×ønÑî{¼ö4ìÕÛ[¼÷ı>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒı#¶×¹ÔÕÒ=TRÖ+ëGÇ¾şïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêŞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<ş“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷é7Îİô½yñÿÖÕ9=İ½ózo÷Å÷õßİ~r\'ıÎË»Ùw\'î­¼O¼_ô@íAÙCİ‡Õ?[şÜØïÜjÀw óÑÜG÷…ƒÏş‘õC™Ë†\r†ë8>99â?rıéü§CÏdÏ&ş¢şË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ıêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSĞ§û“““ÿ˜óüï5”‚\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ\n0:É+’\0\0­IDAThŞíšYsdÙqßyÎ]j/\0tènô:İ³±ggáĞ)Ú™=PávØ¡P„üYüüb)ü`[z°\n-Ë´DÄá¦™áØ³öô¾¢±…ZïvNúá^zşB>\0¨Â©{ïÉ“ùÏş³àÄNìÄNìÄNìÄNìÄşaš$ÉTAPUTDÀs¼HÊÿ³u¸}òO‘ÀB`k×ˆ b@ÊkéB/ByADÊßF@FdvÄ+ên}·½S= €HùpŞ*Š–Ÿ÷ğì*ñË×)?sÿî}şèş³ÂK¯ğo~ÿ÷P ¨öi†[ß 8–üæâ—_\0àñÆ÷?Ù\0U0‚)o(‚Íşi¸EÓ	Òh¢Ó1š%H·£>^c/ãûh‘!óKèğñ³²†Ç¸ ÀÎ÷ÊÍyA0(bLéàÒ]¨×Êi•\'$\0ñ¾|O1¼zT•ŞÒ\"—ßx“ öF9W¾¶VJ •\'³ÿû®ˆFÈ\\§ò2ÜytÀüÓ©e.Ş¡²&ÛÓ…ßû·×ğ[Oµ ò)¾¿‡N‡àõAs$\náÉCèö`0‚­ÇĞì€†H!Ö\"€*¢ ^qªh–#aªl~ü÷ì|ú§^~ƒS¯¾\nãı]>ù«¿`º÷1g^x…kÿâ_â\nW:¤º–ú‚,§	Ù´r–*j:ñÛ¿Æä‡ïRlïP{ñ*Ş—Ş;z 3­\'¬Î°;ÖºOØ´ÊP]8E¸¼Š	,* (Ö9ÜpŒÊt\nlyÓç)#NsWÃØÄ\Züa?`ç—Àky†‡?şŸoßÀŠâ|†.ÏùèEÊ¥×ßb°·Ãæ—áß;Åõ«—ÊlØßÛcüğ>qÔâ¥•%;ëÀõòÖG ªÔ¾óMjßù&†dŸŞÀ­oàUÅ©A*‡¨cªÏ‰ î(—Ä`‚ÓiÃ™e¨ÅøÂ£\Z„*&Aª`-¦c\Zu$qn‘ÿäş\rê+´°c6>ú_~Lwí\">ğH²}ë3\\³ökÿˆ‹¿ş=^ùş¿¦Ö™gıÇ?¢˜L*ü‚Xr¾uı2ï|óMšóœÇ³¾‰aùÒO¦¸ÇOˆ^x³±±†§£U–\Z»„&£Ÿ¶1bˆ¬)£ ú!Ó§˜Ú>Ö{Œ§öò·ğ“\\.´\Z1°[Ÿ˜0-b$ˆ0¡lÍ³úú5š½ˆ¨}İ<Á„!b-{ë°Ö°òâ×JœPKï¹—pŸ~ÈÎ­/H[Mîß½I2påô*\ZÕ06D\"O	üş8\"Á«BRûÍï\"aÀsøw¿û*…÷ Š+¡!Ì,ŠÕ+ÔWÁ\ZÄF3Ÿ‡S²(d±–³v¨¸ƒCÔš\nÎÁ§8‡¾ŒF¼b:H²CÔØfîÚkL¶ûC	‚Ö’Œ‡¨j½ÓTA³·„†/o}Nçü¾û½ßæÖŸpããñ·Çt;©U=f%®Ê	4°cÎ­t8»ÜïËt˜­O4ÉfåÉŸ`ÚçèRŒH:ÁIH½3•\Z½@ÀLJ/ªõÄa¢j1R¯!Í¦Ûçq©À\n¯¸é±V_dàš«+äµHŠ‚¸Ù\"#jÃ!E^ \"\\¼ò<·¿üŒqÂ£Ûë\\{á2ªŠW% %ïu–×Uõ¯\nO	lGàu„Tï;ï1Æ`\0lƒ,Ëñ‡É«Ô-Úq€&äÓÙ=¬NÚ¡Q±\"EŒ¤QGâ‰BT<ÉÖS²\'ë˜$`ßßÇÄ:í“<¼CíâV—ùøÎÇ$À;Ï½\nFğbèZåîÁŞ9Ôy¬	X^n3½^ƒàAğ«›§\nÏrãÏ¾æW\\ä½V¼DÊĞaáìe¬Sk606@â~rˆÄ^@‹Y˜CÚaYŸ¹(Òh‘~şÉÖ:.ÏÈ]ƒ\"ËğêA3ÔNqŞ1>{–ÎÆg£:¾Èy2Ü¥H&khôY»x…Çî°»»ËŞÁ”[·¦°ñô)\"å~¾\n‚ZÖ^#ò•]\nÇ9cÌc;f‰G«%ë#’£Ä,]}	,ŠN\\\nÙ	!‘$GM0»·„öÂó¨/Èó”Â)>ÏÉÛ-ö‹”Ó¾Ç ;¨½êFkçx<qe~‘4°óè‰‡…ç®rº·Heìlï€ÏXX[`±hSOÏ¢Û<›ÿ\nØjóGÀxD‰Ÿ\rÿ#äWÕ2‡+ĞRU4j¡ÓZ\0¸Ã]4cº+HÔÀ¤»E¹6A*Å£‡èhLá•¡S¦AÄVĞ_˜ãa‘BrÃœÂÅ›‚<]¡5)Æcê÷î‘å9×q°ı”¹—iŸY£VoĞêté5\"®.Z^yùçºÊR·^FšÈ1|Ö	ÇœTı3|¥:ù’qÎ²bÆÑ«ˆ÷Hs	ï=~û¶9bÑIÙ{Ó>š§HÔ€Æwİã|}\0î‘ø‚‰+è·ô³”9…»»[<ßìnn³Õn`–ŸgzpHØ< ÊBz].×ØßŞ$¸wÄréÿfÙT±¹3Nùéµä]Âz@oğJµÏÀ{_‚ jyúÿŸÆÇ\Zy&\nï9®GNÈÇˆN@\r4—Ày°1šŒñ“AYß§ıªÄ9tzŞ³Ğl }R§L\nG¡$).OèÎE5v“1‡Sz9²³/ÓÜ;d<‘ä[4Ò”¦…áAmÏÓ=‰ê_ëÖ|‹Õ×ÖØİrx`¸võ‚TU Zè«&C:W9GTf½‡s~Æ°¤Êİ² ÖÁÔ`´é-2°54ˆ‘¸ìÜE«‹¨sĞ\\@Ui!¼ó×hRx:O;/x˜gÃC:aÌÓNƒOiFœY\"½}ğQ\"O°™ÒêõÀXTŠVL¯<¨¹Ö<ËKgé5CöÓŒ¥Õeª³.‰Ğş–måq¾—@!Õâª;ÚÄvEÀtæ ŒÁÖÑlŒI’’$MûHRØ¸lm½B2À¦c¼Y-ÆOFø\"\'ÛÛ¦Óë2š›ÇÜøœ¹ë×1KKdwïßùEÔçR\nc›M|2ÂL†H½7Gt½LKUe0qÿ³\rŠé”Ñá„NÏ_X+S Ì•#:{œÿ%÷+_KeV	¤êğŠ†=ğ)bÃ’­iğN˜ä®ï ˜í1¯¿öMÀ &d¹ÓckĞg!/pÓ„ÉÆ:s]Vi¤)óŸ}FLh0Åc¦{L7/ÛîèÅh€i¶g©[>šâ&#zL¹øú‹ûög ?£Âe\npL~*pó¢Ï ş¯T\0ï<â¢APƒØ2ÏûOĞÖiH|¹µÏ‹KóôtJ²|\r¦´ÖĞ•ˆ‡ÉˆÅ &Ùİ¡Ö;E~óšyŠXC‘$Ø0ÆÔšíd1Âöv	òE:gc$™n=%Œb\\QÌR\Z10NyõÌyÌòiêáÓ/şÏ¬Âªàñ³T.E†²Wv^±Æ¦ÜÇ¡õ«äŸƒäL3e8Zg®ÕD:«è`ZK³ôB$›ğx2àÜj™à†Îv— ?ÆˆC³ã=~°­µhœ¿Lmé4^•là˜î@ÔØf:< é·iZÁ1n<š‰%e¤*{yÆŸÿÍßñB¶é5Û3ªohîÑ‰çÎÏZàÈ\Zkªİ53.ğ+|±â\07ï~ÉÏ>dıÁM~ò‹Ÿ•QÒ^FGûœ›kñåæ.D1}oéï<))qsñÆÎˆ|kƒ°3O‘fˆ\r)}Š<§õü+t×®Ğ˜ëÑì¦½xÖù×‘è\"õF“áŞªEˆj	äUˆB\\«1IÆüäıÏùäÆc6Íq¯cœ/›cJıÁš²ÎW\\¿ÔÛ¬)ëƒ˜\nNDÀ„<\\Ê«¯|f«Ãx<d¼y\\FM–LÎÊ\\‡÷Öxüè6/^ı\ZŒ HÁåà=.IÈÆ}¢Ğ¢Şc½CLH}ş4šgø,Ã\r%ôPïÌcêuütJ6£FğY‚1ö˜¤ÌÍÏÑh·xnÉQ³‡¬¬.c€÷1–#0T•J\0)##,E¥ÑEÆ½›_`¬áÂÊÅª­+q$KS>øèÎŸ]ã7ßf0¡™gÑu©—juŠ³¯âÃZ©ù4!éïSìoö–ÈÓ¤$TÆbÃ˜â°t»å3’ü4gôø._09ì#EÊhñÎõƒ¢vExõŒG#4Z Í M3œs¨*†\n)K6+_i‹=Zn•Sïİägïş/æ{K¸Âñá/ZED©Æ^\\;O£Ñ¤·´ÊÍ»w±EÆ•œ_EEa´‹©”`†[„í9â¹9âS«ØF‘‚°ÙDz+½Uüd\\†¶€å(ì6êÄs=‚0 lÏ‘÷wPÍÓ«ìüòl|ğÅ4”Íõ§äIÆÃ6ûÓ9v67qÎQ@ñh%HE\"j¿!+¡µ€ĞluPU––WYZ>Ã_ÿÅŸ’iA¬¥æ÷ÂÅKÜ|pŸO?~Ÿ3Kg8-uĞ_ka½‡\nPµµ„nB½AÌpkB€à‡CòR%8õ7È&Q¸‰úŒ8Ü#ˆ›ØF‡l´‹&°ØF‡d°sBO”¯/4¸ö;osøx·~ï=Eá	Œ˜™¯Ğmo<æáİ›Äq×Şúõ²¤ˆĞ[Z¦(\n\\Q ÆÒ[ I&Äa\\’$7áÂ¥—ˆÜŸ”\'.V1É>¥``@\nÁ5OaÇ;øÖ)jKh³EºµYVf—°TS±A€J@>™`»g™¿V#hFn_Ä=ı%6ª•N5¦Ô&‹G€c|U¦¦ÅE°µ¹MÔŒñó5œ+ÙbPÁ2ÿÉ&yÎƒ[_ğæõ71„ªVÏ^àïßû«kÒ¾ĞF+ÔõÑ\"‹†-\\‘¢šblzXRLQ±%ñ²ß>ı\r0–t8D}NÖ¡ŞBÓI)Z¨ÃÚk…ÎµK˜3¯ãl›ÖüˆöƒmŠÑ„ÂZ¬/ƒj›)Fh6HLÄGû†Úû?Æa¹ºr¦*ÉPb»s¸¿ü3òÿô¬ap°Ë{ïış.?ÿ»¢ŞãÒ_œ¿ø‡{DQÌ;oşâSõdDZ E‚i´0q¦»õàtë=dºW¦×`³N´O!ÆàÒ)EáËIêŠ\'r	âc-Rëàl•µ=Ä\Z\\Q„¦ê1<†ä6+bËË‹\\şÆó\\{ñy.\\Zcíê5ŒÆ:\"İELmóè>ß_Â|ãÛlÿğpç`ı»·Ùü³ÿÆÊoı6ıß§±²HöÅçÜúà—,ã7Øşè}lrñ÷şRL!¨Áx»ìÂä	şö†Ãğ›&…Ë¿…¤C4jR¤SÂF¯ŠD1šL1~BÚavg—ñGdª\"`.ÏñyJ–fˆ:œã\n‚Z×°AXJø\n)nZ§¶jñ\r#F0İyìoáFû}îGüâ½¿æi«ÁÜê\Zf‹°#Öâ²”µ(BÔl`ÂZ£^JÛ“ò¤‚\Z4OW3@`ÒÇœû>šõË©Ïê·!ŒZlŞ¦6¹[>€+È\\@n»xWPä–<‹J}ïˆ‚{sNs¼÷ä®ä,HH>“ôÉû‡øáÍOo²÷á=âÃ)WÛóLnßEÓ¬ìåv÷t˜Ğ\r:AÌ…w¾ÃÎßşˆîéŞØöãû÷±.f0&ît	Î^\"ßİ£¶°ˆSÏt· ˜¬cÛ=ë uºFLDî!×ÿ=:|€º¼ÕÚp÷Ïé>ıcÒa†«¿F6÷&Åx#|:d0¹À\\+c«Ô8¦¡ùxÄhcÑÁ>a`©ÏõÀ{$Öë˜¼€á˜ÚŞ.ßÿîÛ­’ñ¯ãFc‚Ú|©ˆ€§T\Zç/²ÿş/è½ñ“Ï>aùoS$)F@÷w4ÏÑı7a‚\0†Ø(&¹û!ÑåW	Â7·ˆän£µ9&õk¨©aê×°õ.>!yüË€ûù£ù”ñâ+\nµsW‘À€ÂôŞv“acé»ÿ×ÉsO–ç¤Ûi.!¨u°y:FGCÅ	ùhD\\o ‹ó¤Ù4d’ä_*‚£±´\rj—®Ñ\\=Ãâ›ï°ùßÿ„åòÏ¨-,0İÛ#\\XÀØ’¼l·:;²4Á£ÄókqDà¤}‡¶—ñÑ\"²¿ÎŞ­‡ˆ	ñyÎ™î<öÔy@0»·.ıs’(£Vr©!.¸-<q³Áâõ¯ƒ±øªíõ^ÙíoÓŒ\ZÔçÆ\Zëûè$¥Çˆ‡àÔÁòÉÁû—?åâYhv->l-Ì•å}8\ZªT\\àxFÿU…P•ÙPdÖDÁmïS¬oC”ß\r²¼é‘ˆp4JWEı!^KÆ(‹çÌÆSq*º Zr&çğ›Ûà²™0q4Ö]¿Ôçf÷UìéE¢óg*rëò_ÿğñÁ)º-Ïko¾ÎÛßúÎùŒ1³q—ÌnôL³ûÌøLª/<ˆeÛàõàAlI™ŸÕ“TQÅ,_ÄéQÃeé*=ªW(¢ÕÈèèoïğƒ!bmU´ŸınÀÑğ¦ªÎ£ê±…+u€ê$kõ:ˆP¯)µZ@§İ®ötò\r™;±;±;±;±¸öÿ\0Ï\'éA’·£„\0\0\0\0IEND®B`‚'),('21','banknote.5euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\nEiCCPICC profile\0\0xÚSgTSé=÷ŞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆ€ŒQ,Š\nØä!¢ƒ£ˆŠÊûá{£kÖ¼÷æÍşµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sı#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóıxÎ®ÎÎ6¶_-ê¿ÿ\"bbãşåÏ«p@\0\0át~Ñş,/³\Z€;€mş¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}şgÂ_ÀWılù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ıG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púaÁ(¼	AÈa!ÚˆbŠX#™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ğdt1š ›Ğr´\Z=Œ6¡çĞ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRİ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºİ•N—ĞWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªŞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yı‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ı»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠŞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSİ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜¾^€Lo§Şy½çú}/ıTımú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«ÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ı=\r‡Ù«Z~s´r:V:ŞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆİÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)Y3sĞÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Ş2ŞY_Ì7À·È·ËOÃo_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖĞaæa‹Ã~\'…‡…W†?pˆX\ZÑ1—5wÑÜCsßDúD–DŞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ğA*¨Œ%òw%\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLİ›:šv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²şÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæŞ-[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒİµa×ønÑî{¼ö4ìÕÛ[¼÷ı>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒı#¶×¹ÔÕÒ=TRÖ+ëGÇ¾şïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêŞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<ş“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷é7Îİô½yñÿÖÕ9=İ½ózo÷Å÷õßİ~r\'ıÎË»Ùw\'î­¼O¼_ô@íAÙCİ‡Õ?[şÜØïÜjÀw óÑÜG÷…ƒÏş‘õC™Ë†\r†ë8>99â?rıéü§CÏdÏ&ş¢şË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ıêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSĞ§û“““ÿ˜óüï5”‚\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ(Ï;nİ\0\0‡IDAThŞíšÉš\\×qçqÎr¬¬¬U\0\nIÉe’6mKä¯µêGğxÙ›~€~ƒ~Şyáµ?»ÛnËmÙ²LK\"%\n\"A€ \n@ÍCÎw<C/nV¡îşzëŠÕÍºyo\'âÿÿGDÂ•]Ù•]Ù•]Ù•]Ù•ıû49\\øßtÓàï_üš\'Ïs­ˆ|õ=ï­‚\0`¬ÇÖœÁy«? ”¬1¤“Ñå©Ÿ¤ş¼Ã{2_OhÖÖ7Yë÷Y¬ç¿ÿÍÿ Ï3&YÁÁyÁ÷ÿä÷xïŞ]!¸ÜÒt2¦Ùn/OYZÎÇŞƒÇ#xpxŠ²¬ì³é¥y£ÅÒRŸÑh€óv{‰,›RV–¥å5F£<7:¤³	Zk¢F›¢ÈP:$ˆbDJ)¼÷ˆ(¬ss_x˜;îäè9xW;Z)”@š¥\\œ5‰ã„í­m‚ D€v…6ecp­)›ë}ğÔ¥~ñáOùİïıÑåG@øèóşóı!\rÚÑ†®ÈlÌiŞÁ„šÿöŸŞ%‰\"œ-™LF‡çA@FŒÏPJœ>ñ4ÚÎOHšb5äìxB\'\\¿q›¬*p¦ª­¡Ş¨A)©Á’úŸ=¦*sğï4\Z	AĞê,q|¼Ïİ»ßd©»ÄÁ—Oy¼·ÏîÍm†gCïì°½¹†ÀÜD)œwJ/NÛ:8O7aŒæ$m³Ù:åØ4qJ‚\0QB7è!K½´Vp{g\r£®¡%£·ôXiqû{”Öáçö]¡İLh%«ıe™NÇ„Qâ8¤¬,Á{Î°÷Å§Œ\'c¼5XcèöúDIBUVx½ş\nUQprtÀöõ–º]î$·¿ó»œØôV‘Öiå_H{ï¿‹Mi\r¡\'ŞÓĞ§å:à)ªfP1# *¼Óˆ(t¡X\0›(Ö)¼IXàu‚ÒšIš3V ãKº…™ñÙ/‚V7wé­nÒ_^b<™RU†³“C¾øìcœ÷ 4ĞAÈæöM&ãIš‹Óc¬5´;]BGôvnĞİºÁÒVÉáÿüÂP-°-¨À#JÈÓ÷?úïşÁ Rƒ “ªÅfëˆ´Šè%cËˆ”F”Fi…ˆ%àkĞòÔQ†!¢5^º(4Ş{N3zK1A ĞJ8<P•ZIçxZÍ„v»…Vğãı#‡Ï¾$i4©ò”¸Ñ\"³Á3Ÿ“D!išÄt{+TÆğæîmN?dÒlrr°Ïá8ã`”QzÆSvç¿HÃgÏÁÃ7û”(<°ÜIøıomál\rBJ*\nòşM¡Ö2Gf‡ÇáœCDĞsP:ÌètbÒÌ!¢¿Ô&«<q3\"/Jš*¢2õ3¥±8cAjªŒeïË/xğÉ¿1NsÂ0Ä9ëÛ7ñAB‘?A+s“£c’Ví`48¦»¼B6¼àÚÎmV¯ßd2²÷ìò”2İçÍw¾µà³\0A¸s÷îËü¼}k…ÿòç¸ !ïë¼ğŞ“å§\'\'5PÎZ”ªiODH³ŠF#\"Ô\nc\r(àb8E´ĞjF„î€Â]›Ó•B)\rsü°Îrÿ£3¼8­ÓªÌYê¯ÒlÇÌÆ¨¨‡RB3iÒk4é7[¤eÁÅxL\',/¯5[¤“q½“°ÉöF‡ƒÓÇG-z½¥šÑ\0u™Şÿu/,.çÜJî\"õm¥ç”5¿o­áô|Æl–ÓL\Z”Æs­7¢+úÍcÚqŠxG¡vp¢Qª~‘ÔÙƒ8=|Êt2@á‰ÍúĞ\n3ü”Ä>c6<#Œ\"¶VÖPŞ„!KaÈÊrª*±UIÜépv¸OQJ¸q}o\r•1uâ_bÀb“—ÎXh_ÓÑÂ/x¡2íëYcQ ”¢×	A(ÍÍ)“âŞyÊê\Z®¹§LìÍè‚Òô\0Ö»o}@6¹àèÙ#”·,olâEQL/X–ûÓ=f¹6¦„ío¡¼ci¥O•e¨¤AO)†ÃãÑ€i¿O»·ÌdpN:›ñğÂs^4ˆ‚[™Å~ğ‚È{éÔ_üƒ s\\ŞœŸs³@ÖÂ£òPå,5•m‘g¥u„‘%·\nMD¤…B¶±JpÖr~´ÇÙÁší.ımŠ¢ VµşÖ¬ŸN>¢ê¿ƒ£¢(g3ÂVh$Íñ@eì}ù˜ï|÷{´–ûH:c¹×!Šf,¯¯9ûü&<ß¸ ¯Ì\n%Š0jı`J)LU¡µÆYK¥:œ\r¢ à˜ èblˆDËTU{.m-­$¢ª!i¶èolG!‘ó \nç•w¨P›á4BM.htÛ´VVî#a@>Ê‰Ú]´°Öğúİ·ĞAˆ÷nY’³qg‡şRD;ŠQ_ß8/œ²üÆ\"Â:‹©¦¬ğŞÕQ\08çjêó(ÈÑŒ1²ŠW-’`FäOT­Ñ­}qŸXA:>c:MÇÄÆ œãd6ÁXƒWŠ\'ÏŸ‚ó,õn2NCŒsŒÒ	ºÕb:M™ZÇãg{\04š-œuˆ€òğ³IÊÃ,åşãÏøÕ¨âÜÎe½¼\"d†uşËÿ±’š³=pŞŞ90©ª&ŞUˆ6„ÅT%Îƒq\0ae÷-fãÎŸ“O.È³œ¢ÕAYËñÉko¼-rLbqï‚_>:#ÏrfÓ):Œj\rÇÃÊÖuDÕbG)Å»»´\ZQ hÄ	½^{qÚê7ìì%\nxe¹(‚R5Š[kÁƒ1QŠ(év;(QhåˆdŠ+¦86@bÀ„8Ãd:âüËhñTÖQ\ZÃ$OÁ9îìì’W9K¯×§L¹±å¹±ô1Ê\r1³}-ˆ¯«u@œ$TÆà½G©š¡Ö7ÖY^^!ˆ\Z †v§³Ø†z5åñk¸ÿ\nx1æÒXkêôñ^¯G#Nh´šxI@Eèh—O<A9SM”³ì?}Œ×ŠFáœ%N¬³D.(áb0€0$¦iÅRôV—.xûúgô¯í\'MZİ+ë›lnßDkMœÄXcpÎbãáıGüâã_‘„-öRÎN‹^<fÿ²^Š\0ùµ»‚„!AX¿¢fƒÚŸUUaòs”s4£¥_bz>`6ÑÛºE~şß»…Ü|ı›MîÑl´æZDÈL…¾T„OI¢€(lÑY}\rg»èxDàú \'4\Z\r´ÖxW‹´\"/èvûõz¼g·³vï[=İãZåPÓ)~~úÁ+!ŞóJEô¢Lğxœ³˜êÒ{õ+­u°¢Àbeë+†g\'lîŞÅ«1ñúš’ÌÄxQä¢0EÁR»Ã(b­c<›0\\Ôz£ªğŞbœå¢øºkß&\rş\Zªº†qÎbLED‹ôôÎ¢µF)E% bZkì}ú¿ØzûÎb3êkBè[—¯eI_Z}õ¸ÖšP+Fû{œ~ù9¶ñÁ:Jk\"]Òhw˜\rÎÑ„.åèÑ—O—UI´²Ê$’%³t†xHâ„V«I³Ñ ÇôÚM:«÷ê.’^A«€0QR÷t ëk©â¬Å;Ç~ôC~şÑO8;`ú=ÆUUw¹W€ ÿi¤	QÖNĞŠ$I~ÊÚõn¾ug>%¢;Æ›”ŞÆ6§ÏŸ0>\Zsğè	½k7ı1ÎYfã!Ç\'GTeA¤ífs`óÖšs(­	ìºú´Vx<UY \"„ZƒsxïñŞÍ+\nïa¥ßçá¯ğğÁs|ñˆ ŒØüÿ4%EQ¢µÂZKéŒÁñ!y:açõ·ˆ’ÚAiÚ^{ç.³‰§±rJ•tĞŞSqÒ\0S\"j^Zûºº\r¾$2{hwB8ûTø&¶ÚÀû¨î’9Ga-$Ìò’êüŒf£‰5QÂæµM´ÒdE†k4X^éÿ_hğÌ\0P•g‡Ïùéÿÿùï‘2aˆGhv{$›¯¯O¾ ll’•Ú¨¤OÔÈ)G»s”Oñ@u£n¦z‡÷çìlêÏ¨˜’´¡Ì#\\òÇ@g-yYÎ#¡bxzDh&Ãœ÷$Í&Î9²éŒıƒSN†š,Í\r‡‹ı©—à¢ğ}¥?&Ã~şá?óîw¿Ç·¿û§ï=&T‚wk*VoÜâxÿ)‡ŸßçâpŸÎJ—|¶?WMœ³”l`=T~ëógm}ê\"à=ÎÕ-3¼ Şcl…3Uø&ş.e9$M3&£!ŞNXê-sıÖm6¶¶éõW¹8?g<\Zl6%·ÖÆ:gÃy^,6½H<OÉó¼§ÑhO§ Bou}á•k$I£ké®¬QÌ¦¸ Æ;‡Š#vï½‡ˆP¶zFªvĞÆyMäp²‰V‚(»loÏ‘¶V‘ÌÑÜÓTG”l¡•Æ«Uxƒ3÷}Nöá¬åúÎ.{)c4\Zñôé3&“İv‹8.ÉÒ½¥eÌÅˆµõÕùç¼ŞhVÕ×‹¡òc?üœåş\n½fƒ­]Òé„Vg‰ Š\\¿¾}ƒg_|ÎÚõŠ,eåÚu\në%¨90¹jˆ3Q´Š“º½İ\n¨h—Ø<gæ6™å%8ïÑu”x‡Ö!ÊQÌˆìBíå‘d´æşOÿ	£#Œõ<İ{Âp0?oÆh¡Óˆ)³-Ìçp13èÁ„Ûoí’Ïf8Ñ!¿è	Zçyó·Şáo¿Çşö¯ˆ¢Wüò£YÙÜâñ£ÜÜ}\r¯5÷ö¯ôö“´—ø‡üqóÎ{`*ƒÁÙ¥\"œ¯Y@)GVµX_RÀÃ³™‡:@Ã}‚˜Ò\n–Ê,óSÌü}Âæï4Úxç8M¹‰â˜0ĞâÉó‚¢ÈIâˆ0è­ôX_Û Õná½Ç-ÉøäÑ§\\¤–»IX§—Ì»ÂŞCY<|ğ_>úœİŠ\"ÇÃàäˆİ×î2ÉÒ”(\niw{Ló‚ÔOØ¸¶ÅÉá>Z}Õ)ªéQ#Şà¤‰´Ÿ‘ec,Î{„¨¾ûK\nõ9Ã4ÀúkœÍvX^ß¡Û¼Åy	†§Óˆ » Pšª2(&ƒ‹ZïÏ7¥ÆV„¡&Áy‡õİ„­k×iF1ƒñ)ı^{ïÁ%şö{ğşßáüì„Ï~ş3úË}šA’¦)›[Û<yø)ïÿÁ3nŸ EIÜéqÿç?¥Ó]Â9‡«Ššz¤æiÅ\'Ş—S,ÊAå×p¾!œ™?¡Y|ÌZ/dZ}‡`0b<\Z29×¾Ø1¶˜’v.Àï<I¤ñ¬µ¸ùä*ĞÁ|ÜÓ¼bÿ,ãädÂÓ‹6UÌt2A	Ù‡§4{×Ù\\i}…v%Šë7wùèÃ!Í2HgÄÍ˜Ç>¡ÌS\"qÜÿ·Âš’4/˜=}Be6á£ù‡¹\"¬gsT#\nrTĞFé$ˆ¼‚“6¡šú}f³w±å™}DQ5©L…©<E~LÕJOœÃ\Zƒµ®®åµÆ\Z[7Nğu‰í›\n©H3ƒhaznéÄŠ7ï¼ÉÉÅ˜Y:!Ë+¸,†¼ó<¸ÿ	eYpvzLYÜùÆ=§ÇìÑju	[]¦“!ÍF‹É¤ bD‡8ç°ÖÄÉ|¦8Ÿ2™Ñ°J¥xİQˆwXé*… 9=+(‹ŞoRVqE!Æ¢(ÄYSG×|è\Zè\0%ªªpòÂ Dñ$Vº×7»üÙïß¥û;ïñøá®>gãöë¬ô\Z_\rG•R¬ml²ÿì);·^ãµïÿG”Ò4;KÜzãh]Ïûò\"#\"Œ))e4ÍËâ\n=DÊ|–\'Já\\_a(EeÎÕœ¥3–7š­I£1õ¸«,Ê,Åy‡³¶®E½Ã:‡U‹¥ùLĞûzB¬µ¦ÕnÓëvˆâ˜8Iè¯.£ƒˆ_5… PIÅ§§Oø­÷é´¢—ipss‹k›Û/	Ÿn·G·»ôRè²1šeÍ‹‹z\"(©\'BJTM‰¢^àyÁ‰à¼`¼Ç{yAn	\",NØÍC½ÌR¬ó_ë>ùùäè²HóÎ¢¢0¢¿ºÊjoi1Œ1ì=yÂ£ıs*Ğ¼¹CĞhÔCUya6¸hÉW…o=–—úUÛÌÕaXCtí˜y!âÇÏÃ³f†¯jÊZñu%‚½T}‹ÿ¯¿1¨7+—‘Ë²Ûãæa÷«µZ¤!\"‹ëY2EÅÆz—²,¿<¸²+»²+»²+»²+»²+ûwjÿ\0•â#ümÂ\0\0\0\0IEND®B`‚'),('22','coin.2euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ\'!G7ß\0\0\ZGIDAThŞÍ›YŒdçyŸÿ,Uuj¯ê¥zŞfé™ÑÃ!).¢6J‘d%¢’H–äD\n²Cp Ä@  ÎE\'à@0JœØÖ$;’hIIII‰ÛÎgéî™é}¯®½ê,ÿ’‹S=”.x¸Ø. ènô©ó¿ç[Ş÷ı¾¼‹/cŒµÖJ©”2:c´ÓÆŒ\nAŞ\"WIešBˆ­dÒ¹‘tS—\\×yÁ¶­€ºB¿›÷(Ş¥ƒ(¥?-£èsJë÷÷|?}ppÀÒ­[lomÑn·éõºX¶C©X$åy”‹E†+\nù\")×Áqn\"™x6ã¥¿‘H&¾cYVõ¯<\0Zë#Jé¯h­ÿşÁAuğâ¥K\\½¶@ÏïR,821ÁğÈ(ÅBL&‚(’Ôë\ršõ*[{UzİûÕ*£#£Ì?ÎĞà\0‰DrßM&şw.›ıªã8«å\00Æ¥T¿!¥úÊ•+WÊ?ùéÓØÃéS§˜›Ã±m”Ç¶pÛØ–e	„°/‚ŒÑØ¶ÍÎî¯_¼L§İfjjŠ¹Ùi,Û=HyŞWË¥ßBÔÿÒ0Æ­õ£Q¤şÛÍ›7OÿèéS,ä9{Ï} ˆ$	7@2™ÀµmÇ&éØ¸n!è`\0ƒ1ÆÈÃk£¤BiÉÚê\ZW˜œdzfË²ß(—ÿE&“ş±Âü¥\0`Œq¢HıÛv»ıoøÑ“”Š»îº‹Z«K\"á)ƒ¸®‹ëØdÓ)¼TŠ¤ëàØ6–p0Bƒ}\0\0£A€Öc4Æv·Ö(¢uÄêê\Z+«ëœ9}\Z/•êårùÿ4\\úBùVÏá¼Å\\ÏÊHş7n|á§Ï>#Îœy@Qo÷è!JSÌg±,/• “Jáºí „À`0Ú€0ú üÂá-ËBk°ãÿÛ\\]cvz–ñÑ1^{ı\"™LÚû÷æƒ ú§É¤ÛşÀh“‹¤úîw¾ûİ­olğĞûa¯ÑËF…a’plËÆulJER‰‰„K£^c·ºE«¶M³^G«ˆD2I&W [¦00N:#ĞZSo4À²xù¥—9:76¶·9{ö,›k«,-,=k~M*9êÁc©d²õ®¦€1Æ3Æ<şşà>âº6£“³tCIÒKÓëui7›¸®ÃXe„#£ä=••4÷o±·şæ&Ç†(”ğ¼$®-°$–eQ=¨Ñ\rDrËa <ÊµëW	ÃáJ…õõ5\nù<ÃC#t:\rÂ(bem“‰ÉIJ¥Ò&ÇÆ>•L&zï\n\0Æøï?{ş…¼º¾Îøä4ÂvPZ±³³‹ñS;63Í‘Ñ!v6n²³ü<½æ	¡dìÈ,©t„° 0ZÅwaÆ(Œ %İn—½4üGO¿—›KKìÔ©“Ï¦©Uw)Œ¢dÀ[ËŒsdâÈ×†¿ì¸¶z7\0ø‹_ÿ¯7–­±©\"eQD£ÙDiE±P`v|-{ì-¿@sç\n²Ûa¸2H>—&“/Q\ZÇ²],K`´Æ}XSB£5€AË„hööjøQ’5ÁÈè›››Tëu†J†*#lïlã¥’lïÏçõÑÙÙ96Zùİ?ï¹¬?çáïÛŞŞúíW/¼n<õ,aÑìtètÚ(£)ä²ÌÏLQÛ[¡µñ,ÍkòC9zš,‘Hƒ›ÁM¥±œ$Âr±ìÂr–‹°l„p±,«ß	,„Ñmpm›Á\\yğ\níú¾ßeblŒT&Ë¥Ë—i5°$åR@FÖÆææo/¯¬Ş÷E€1Æ“R>õµÿùµ‡?üèGi’z»K³QÇuxI—ÓGX_z‰ÁL/_Â!ÂH,Û!Êbu³Nmw•‡ymÅomZÉ~ËÓÿ|˜\ZZK\Zõ.	7¤Ó¤¬Kœ<ûıù³ä\n%’BS®àw»(\rí®ÏäøèÏ}?øè}çÎöŞ‰øÒOúôCçî9‡/\r½0¢Ù¬cY¹lšã3SÜxãFÊ’tÆ#¬-£Ã.–å’òrxéù\\Ó\'&¸ÿÁøÎŸş#,0­Mˆ_à2–î§†¢ÿwVšd&Ç`b—Ÿû!ZZµ„“`s}ƒİm2iR1ÏæÎîC¥báKo;Œ1ÅZ­ö›Û»{¢0Xch´Z¸©4ÅRùé#ì,_âèdKuX]¸D»íiC$#šõ]Ú „ƒ—JòÉO|ˆ\'ŸzöMö‡¿«İÑ§ÄZë¸8jƒ1Ç+qşµk,ÿ¿¸\"`w¿ÊÆú\Z­n­%‘TÈ0Äó<±²±ñ›¯±øvyÀ—ñ…és÷œ#CZAˆ6ù´ÇäÈõƒm\n‰]+I½V¥#“\\¹²ºŞ\"›xÙ<wŸš$w˜hÒ^m­v›L:Õç?ı(0`ŒŞh–À²l„Ğ¬o×ÉdRJ\'él½ÂA£ÀìÌ{)Ñl¶èÆh*ƒÜ\\YŸığÕ·A$½İ½ê—[.N\"E(İnÛ¶)²d’.ûk/2<R!ì¶¸¹^£\\™à‹ïs|ñ³áo~ê#|òcâûŠƒz»Ïõ\rFiÎŞ=ÏËç/b´Ã[Ë8TJ£”ÄÜN‹˜ŒŒ°yó:år‰jµA.Rv¨îï„!½n—……E¤TÔªŒU*¬®m~ùgÏ?ï½%\0¢ |ßõkWOÍ;A/ŒPÚN¥(å²Œ”‹l­^b|$K}‡7–öxß‡>ÌüñiTàß.¯Zf¦ÇÉç³-o+?/e{·×£b ´Á âü7\Z´BËğ¶0BØø~ååuæOÎÒòGÇÓÜZºÈp©ÄÂân\"A†4;JùõVëÔPyğ}o	\0mÌÖ77¨ŒŒà:±€)å²Œ—Ñ2B5®²që&K+UŞûà½¤ÎmM#úÄ&ş…ÀMx}îk–^§I1ïİ–Áq»a”D÷»€Ö7•áÕ—^¡XÈ#ŒÂ±\nù4ÉtNu“vÏgfjŒááa\"m0ê&©¤K Ôî\0ß’ÕıOËFkëÚd½$¹Lš¬ç±½µˆß>`jz’ûÏÀK$°,,+şÂ²ú‡¥uŸøÄBçÚµ››x-ch¶{ôü Î}ˆÛ ŒPJ¢¢ùb™n¨ñı\0ƒ¦j^>…r!ÃÎÆ2¶ãÄÄJ+¤RìU÷™›>ÂÚúú\'ÖÖ×’w€1úäÂã§NœÀ² á8dÓiÒ©¶ãp°y™ÊÄ2…\"n\"…p°X‚XĞæğZpXİ­Xïïl®3=Y‰Ã_)†­İ®\\_ãÆÒ2ZÅOaáº6‰Ì\0k«Ëä³)\Zí\0Zë´«;œN056ÄÁÊ«qKÊ€”’ I\'SÔ›­ñ­­í“w€”òáå‹LOOãØ6©D¬émÛ¢İ¬cG5†+£ñámçv¯Xıøñ•…@)ü˜qMjÒ)Ûvã*o­vÀñùãİ6[›Ûh¢eˆQ’vó\0¿Óàà Ad’Ê\ZÍ.ÓGÏL%É¤=‚ƒ%±‰¤DiM³Õ\"á:äŠ¥‡ï°ˆ³RJlÛFË²qlKvoQ*qÜ$øeRiô/“Kc€Šº Z+.\\ºÎı÷½§ßïW®¯ò§?xÍ[¤ó%Z¾…-Àh‰å&év»Dí*ïÿĞÃ†FFXİ¬’p,B@«ºMä7I$\\ŒÖ}¿APo6«TØÙÙ={G\0D2:áerÀ±cmoÙİÆ&ãS3oæ;}Z‹î·:y»§+)‰BƒFØ½^­mÊƒƒ(¥0–‡ßn’p]rù4İ^DE‚DºÌêÊ6ãêÅ×yõç?#cêÜ=?Ô†ZI,×edÈCöë‡Ö)~04P¤×ë¸#\0”Œ&óÅÚ,ÛÂ¶cßÎ¶,¢î>^&÷æ“6\ZŒŒóŞè_p{$RktØÅ±“ñgO½È£¼­FJª{[,,İdn\"K:7Îöú\nGç¦xá•„ecÛ6F8üüÙŸá‚ûNáäFãB(#T¢”ÆF£-%á¸£	£×uétz“w@øƒI7nk–°BÜæåél6–ªF÷m¬~»3‡˜„1(m0²‹å8ØÃO_àÓã$FIdä“ó\\ûä#œ8>ÍÓ?y–N/äÊÕÌLPëØ|÷ñ§Xİ®“Èpåò%„0ĞXÂuA}	¨m\\&‘L±yã2 °-Q2V˜ÆI%\03xGT¸Õi§ÂÄõ02”&—ÏcúáKWûÖÇPZ!£´ÂMføÉ3ç*¹LLŒ£¢)ƒX	j…J†ÌM¤¸÷÷ƒ’¼vyKnÓîœ8:ÆÁÖ*»MCvpœ«/¿ÎÜñy„[ec§J½Ù#ë¹xI—B.Ãµ«—Èdrh¥™#Ø‹-túÎÚ Ö–ø%¡&„ åeŞ|ú¿Ü;1Z¢eD)tØÆN¦ùù¯18ãîÓÇû¾¿Dôiñ¡#ìzìT‰Ë‹uöw÷Y[ÛáæFßæÊâ6I;¢21ÉÚÚ63Ó“\\½v‹#ÓGi÷\"ê­.™Bç_z‰¡‘	¦gçHÚ‚İ=´†®Zw@*™öo†t_¥ (s˜÷ú2Ş#Î;a“„—åé§_b¬R`~nİÏs(xú *Ò¬Uyíµ7X[İ¤Ûn0<”gdhˆ”—&å¤±øücqóæ.ã „ÁóRx)›­ı³³Sllîƒ/™ “r99?ÏòÊ*ín^¯çßQ\n\nùšÑÆ3¦_èß´Ã\"‰1Q\\÷µÆ²ì~	„R`ÂÂõøÁæ®3ÇîS\\q›Ûë¨Ær\røÀı¼ri‹ë‹oÎht$\rŸ0èpæîÓ\\¾Õc¯z‰¡r¥ae³F¯{‰WbõVìt!¶ Õ¬¡ èaí\"ÀM$6Ñ\nëÔ¶ycÚŠ={¥ZßÎå T¿F¨-¾ı\'ßç¾÷a¤2sü¾ò7R)ã$ÚáÆZİšO*W&”6©„C«’É¤™âÄÜ8¡ •f{·ŠCÈÄH¿Ó¤Ûépr~š ÒìŞzƒù³Ğjµèt}²Ëo\\áø±cÔ\Z-*ÃC›w‘RKFí>ƒÁ(ún,2Ú¾ƒ1a¿´†H	ˆZtıˆ?{ò\'|úSÆq·§;‡²×MçéÔª\\_Ú¥UoPoÔiu$×oî³¹±ÃÈp–|!C£Ù¢¶6Vöèõ\n™Ë77xğ®‡øöãOÓê)^y}r¹ÈÕ›;¤N%è¶·Hˆ!xò	Œå0R©°¶¾Ny``éÎ\"@Ø—Vß‰‰Ÿ¼î“¢ÁÊ»»û,”Ö„a„¥ÚÜ\\«òô3/ñ¹Ï}ŠT*3âÛ<Aa9.JÜZZ¤22L·ÓÄrÒŒU\n¨¨ËÔD‘L&‹qÒÜXÙ#ˆÕÚóósÔ;\n‡NQßß¢”R¼ÿŞYÒ¶¦˜Œ(\r00<ÁØ‘®ßZÃIe\'“ö¸rm£3³—î\0Ë¶^<~ì8+++}½n\rÒé~”AƒR\ZË„\\¹¾ÊŞŞŸü#Bz¡Á4(l°SH©ˆz\r¶¶öP~‡ıFD:¡°m‹R>ÇPe„7._eùú>xnœ±¼äş³Ç¸tåçî§$°€ÊÔJåS\'N39wœòğÃ3g	Úuæfg)d=,ÛF*IÂu0Fú½ï(Ç>?55Õ¾páÕìä‘É~°8z\"9ŒßÛÀq\'›?6’Ùk ¤\"\n{È(D…>–mÅ––%I:•¤Ñ	(òíc	/ä[ßü>÷æäCÉˆ¡ÁoÜØçÁ»ó­ï=ÏÙûïçÊ•—\r(9Ã/_&Ÿd“6å™{FÒjÔ‰‚€V/¤2Pb¿Zc´RiKùówÉd¢éºî3½ ˆ‡ıç/„Á È—\'¸v}Ë²}~`;¶íàºçáyi2ù^:÷}­xî¹óæ§?yÛvH¤<\n…,[ûm&†=&+9Ö6Ø¯6IfJøRPe¦ârùÕ—›=É~óû,]¹@¶0@·İ¡2w/¾²Ø©w¹¹¾E­Ù&\n|FGG¹xé2s³³Ïd2¹æE€Â´ÛİoMŒrqq‘¹¹9qÑ³,‹l6O=¦Jå¦Ïè\ZaFFD2D+…ßiâ¸\n´[]\\~õ¯ßË~ë9¶¶÷Áh\n¹4äJ\nHl–¯_\"ªNßÍ‰ùãœ¶a?Èğ™OœêÊ%\ZªK«íÓ’8i‹B¡ÀÍ‹—œ¦”K“J$i´Û\r–¿•N§Í»ÂÉ¤ûøôôtõG?zr`nnc7o-óÂóÏá‡QòÔWq£mÂ Bª~Å·0©¹MvllÛá±GßCI,!øì¯œÅïvÑZÓé…@~ä`;£%´ô9ia¹TrŠ»ıšë—xà\\¾5MµÑ%áo³»»ÃÎî.33ÓdÓ×8:3]Íz‰Çß’-îºî~­VÿúèèÄ?ßßÛ£T.13=ÅìÌ–(­h5›´V¿ÇÈP®¯…J,Û•š”hú=´‡B¢  \n£Ø$5\n¡ULŸ•AF-ÆØq›E0V´˜œ›cmñ*Rú¸E2SfhvŒ(’lîìrúÔ<Éâ0ÉD‚™©#|óÛóÉ¿ö‘¯Ï;¹ÿ–#étæ÷N?Ñ^Z\\ÄĞJ£•\"R¥)ÏCædÿ ’\n)Æh”Œí,cZ),ËÂ²-ÄmÉ^&Çò^Di(`cë\0©4‘öÁ’·ÅRJ¦¦g1”6TÛ‚ƒh”n/À±l®\\¾ˆ³•2^¿ÄÑ™éöPyà÷ŞÖd(™tÜ„óû•ÑQ6Ö×ãÉí¡¿×g‰c£“tg8¨Öâf¡*Šbú$HkBŒÖÈ0$ğ}\ZUd·ÎÅ««<ù½ïRÌ&‰ü \"©@d!ÃˆTÊÅïuˆ¢ˆ É|ŒV(Ãˆv»†Hsmy“Ár‰r©Èõ›Ëœ»û®ß?>bámÏÓéôïLNNmîîlEJ)dGÀ! cGág`s;ƒúy1\rî‹%!QHÏ÷	ƒ€ÈïRÌ8LVrœ›¡oå`XB`Tl¯ùAì\'ZB „Ç^8N2] J²¼t©#STFÇ,3}d’\'~ü4zäáÍr¹ü;ïÈxÜqœtÚû­Sï¹K½öê«‡r­5JÅ:@EŠ‘ñ¼±qm©F¯Ó$ê5‰ü.:\n1J!ı^œ\"Q€ßíà‡¿ç!BëXJkÃíu!ÛÂ²2\nZQRTîı;dÆévÛ,,,°º³Ïå«•™›šáêõEÊå²:6;û[“““ïØ~@:íıQ6›ıÆÌÜ,/_Ä`P·‡q(©IgLŸû½#lï6ÚMz½N›^·C»QÇïù(­ã(Š¢˜n÷}ÅØÑH­PJ¡¤¤Õ‘˜ÉGé¦N€íÒj·xåü+œ;wãGHerŒ”±-Ã[+|ğá¾133ıGïè’”B\Zc¾áÉ ÏŞ¸±ÈÜÑc¨H!•Ä²bİ ŒÆh˜8ö\0at–ÅKÏBó:e/\"•Œ÷5&^ƒ9;L}šiÛ‘Œè‘Çªœ!˜§¤4ù|ÅÅë¸¶ÀIyÜZ^adxÁbÉ‰	şø;óÅÏÿê…£G~åNÖæîhIJ)}l¿º÷ÜÖÖÖp«ÙbzzŠ cc£Ÿ³BƒBÅ£m´†µåZ»‹Øş6¦»ƒM/AªØˆ¤$4)ìÌ éÁ¼áy,×#ö.8á~§És/çŸ|éó¼xqÁÁFp0üèÙŸñ…Ïşíİ3§O=â¸‰ÅwuQRk}n{oÿ‡µêşàÎö³³³„a| -B”Ñ(İ^€PFÇjRB©hu: bW7™Jƒí`\0„aDId`,Wüà‰òë¿şÏø“ÇÀÉ¹)´åpd|œf£Æù—øÒ¯}~ÿØÜìÇmÛ~õ]ß´,ëU­õÇŒ6EræÚµëLNLH&‘*\"2Q\\ìtÚ@ÅşT%c&¨h+FH¡eHÇĞJÑîúñÖ™1œš`px”å[ËLR*•©ğÊ…×ÙÚİçËÿèÜ\ZùŒeÙ¯ıE¯ÊNVj_ßØÜ|¤Q¯	Ç²\ZÄB¥P2n~¢¹€”H¥QJÉ¥4ÊhlÛA+E£ÕÁ„`Q$™¨°½»ÏÈÈ#C„~?ó3ÓÓæo}ú±çŠ…üßB¬ıe-Kg{½Ş¿[YÛøJ­VMuZ-²bi^¿íùA@¤ÆÂH¢µÆ÷ı8:ú%Óß\nk¶»„a„mÛs	—Œ—\"ã¥Ñ2àÂ×Ø;¨ñ©}Ä?wÏÙ¯ºnâ?!Úoço{]ŞÄ%ı»{ûÿyñæ­û[Í†@kréx’œJ¦è…ƒ!è¯ÒZ¶„øQDÂq°íXVK©ĞF“ñ<ÒÉ	Ûb{w—ÅåUêÍ&ï{ğAóĞı÷½\\(äÿ5ğÌÛİG?0aŒñ´ÖŸÛÛ?øWK·n^ÛØ$|†Š†Ê…ÛSƒ°m„X:f”Q`”Âq:×o°¼¶I¾Xæ‘‡ä3§ßÈf³ÿø†¢÷Nİ÷;ş‘cŒ|¼ÓíıÃ•õ.¯®{ÕƒjìE‘”¸¶`x D*•Ñv‡F»ƒßnÑ‹$ù|‘Ó§Oñ“ó½Ñ‘ÊS®ãü/à‡ïäÁßÕÏıBj•J=ÚíöØ«ÌÔjN»İ&RqQLº©TŠl6Ëèğ,ò×®û¢âÇÀSÀŞ;êÿ¿×ÿO¦á÷C\\İì\0\0\0\0IEND®B`‚'),('23','coin.1euro',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ)€Ãã\0\0\ZÉIDAThŞÕ›yt\\g™æß]jSmRi·åM¶lyK”8vâ8qœ¤ÉFB2ÉÂ4¤ÓÂ	ô0İ3ÃL=L÷è¡OŸ†æ„>M³2„$@ÈNï‘wË²%[‹µK%ÕrëÖ½÷û¾ùã–t73Fu®N©TRİ÷¹ïö<ï{ïğ—ÖºØªµ¼Â)79…‰ÎJyºÍ2dºê”m%lßqE!•Í\'êr©úÆ£ñxİ~`Ÿbò>?ñN­”º½87zßüÜØÖJi¼®2?*´ò©‹Äc~ °-L/\0Ïuñ}I%x~T\'“åÆÖû²mİ¦S©¾S`üJPJu–¦š?ışéó\'[²‰2ëpîÜ(§&9Ú?†\0J¥\nRƒiš Ñ˜MÔ„•Ë[è^»”›W“If\Z™ P±1b­“Ë»¶~{Õêî¿BüÖ µÎÍL\r²4uô#†?óJ³ìÙwœ½x„J`°¡{=—¯£«³L¦t2†%BøA@5PòœŸ\\àà‘N<KÜ\\¿c[·n¦â+:•îœ]µášGº7\\ò—BˆÙß8\0Zkáyî“#½_ªck¿±Ÿ½ûq¨o‚K¯ØÈ»o¹’U˜\Zt ‘Â@ ĞZƒV`X´Vh\rZ Œh„ù¢Ã+{O±çÕÃ¬îÈrûM[p•Áçˆ7]rê¦ÛŞ÷p]2ıœBÿF\0ĞZÛ#ÃC’Ğ}47Öyê?aÿ‰1î¿ï®Ûµ•¸\0)}Ğ\Z!Dh¤Ö€Â4m”\n†‰ô\\´ˆ·œF!4øZrfh–\'|‘\r+›¸şÚÍœ\ZœàµŞ¼w×şíçWw®şŒÂÿµ µ®?vúÄW—¤Fß»ïùgùê7Êİw^Ã{îºˆÖh%®}†ù>R\0\ZR>\rhåRhÂ0ĞJ!LÌ:4g£8®Cÿ¹iv¿~”{îØ†0L|z/ë¯~ÿc;o¸íÃBˆü¯\0OÊæÁ£ß«^û­/³“>ùÉÉ²æ**\0é#LÓŒ µÄ´\" B°L”W¥Rõğ¥$bDm…DH…”a€@IŸ‰Y—\\}‚Ññ–µ¦q\\g^<NwG+:šyşõ~²Ë®åÖÛŞû>3bN½£\0Õ Ó?|ä)NïúüŸ~…Lk;ÿæcï!ahÜr‰ŠS&Lcš&†Á¶\"Ëdf¡ÂÀĞnÕÆŠ· ŒñxR)d }‡Je[”È&}:š“ÔÅcŒNÎsèèi¶o][©’knfbè,ÍMiœœ ¦ÖvuğÒ+G2W¾xÏ½¿w—µŞ\0´ÖÖ¾Ş—¾ÑdÜ÷ÅÏÿh_İÍCŞ€!%…Ù)<ÏÅ0Ñº±xŠh]ŠÑ‰<»ÌÈt²¡{#---˜€RšZà+F¼Ö³³3ÌN£²0À’œ‡[tH¦3œ\ZaíÊ&LĞĞº„óg){\Z§\\emg3Ï<{P‹Ü¶Gøı‡>(„Ş®]ÖÛÍö‡ìıÃ¥é©û¿üçKÛª.~ğFtàQ,, …T\Z+š ‘¬Ç‘O½8LCÛ¥ì¼ñfRñZk„ÖøJb	©Ah@£tX¥Ig²¤³=âr&ÇÎ12ğc66Y$\"^Õgl*O²¾	×qXº¤…‰‡¡±yŞuİFñƒg÷İÿ¿¾×rTkıço·:¼-\0ö9våªæâ§ÿúóß&¨kåáß‚P·êá)ˆE¢†MCK+\'çÈ7²}Çİ¤Q)©2@ï¡7X¹j5­Í-„×07(	hÃ@kRŠ¦–â±÷²PÇÃDcqÜò8Ñ¨I`D©Zõ$£eò¾ÀÕQn¹¦“¯=şØ§ŸinØıvl3ş¹7ì?zªnyvúË\'öìœæ?}âVL­©ºJ•*B˜x~@\"åG¯\"“[¹ñêk¨KDñ‚Z5PšX4J$\ZÅ©¸456†–#j}€&|\\x~!85A[Çz‚†k©šVuÔ3pz˜¾Á„t‘AÀÊ&&HåZ¸ıÚøs?øæ—_=ÜW÷+ 16óQ[ö|é+ÿ›ÿü©ß%O¡”\"Pšˆ©°,“T¶WWèî¹¥-M”\n®ëbY&¶eF0M!JƒeZ5ƒ”H­Ã¡æÓ0@@Sc3ñÆÌUâ4¶µ#”!6(q–4Æ›*Ò¾¤æèdÏ¡WúÑ_\Z€İûö¶Ùzâßşú¹n×e¬YÑ|¼ªƒÖP—Ì’Jgyì§Clêy*¨rúL?ƒCgY(°MÃ0@”¥|ßC+…F¡•DS„€a®¨yBÈ0tLU·Ê±É,ßúÎKØ¶E~v£GÏ`p\"‰¨ÀˆgØµm}½/â™ç_jû¥\0zæß™Yº÷ğ0ï¿ÿf´µ&,ÃÀŠÆxå1®Úõ>rÙÙl–¶Ö6ÒÉ4SS“Œ#üÜMMÍH­àÂ×\n¥T˜ÂV1¬€–¡OÃÄ´l:E:•¡©ó\Z¦æªLNÎÒ’«£2?†R\n[–qJeÚ–-ç’•öÒŞ}¯=ğĞ?8\\Ú\Zyğ‰ï¿À­7m#¯Ck‰6l¤ˆOf›qH¶]Åò¶V”R$	Z[Zè\\¹‚-=—±´­5Ò;tôÖoD+¾.şQÖ5ï×ªö…!L¤” L*—ö–&¤Ô$Û·P(kñ(A 9Õw¿ZÁôæH7µĞµª…©³G<~úLòàd_ï\rºš_uğğ ·ßr%Ã°°L“T:ƒĞ7jĞ³¡©äEct-)Ñµ €a†FFiiÌaâ¢µâ-‰O+…ĞºV$ZiªGTı€ÖÖV¦ç‹dÒ)ê›—±çğh˜˜.p~ªHq¡ÈÂÌ4ãÒ¶¤Æ¤»ê\'?yê†_€t<Ï=ûŒ®õkH¦ÓáI*\Z¤5ÇÎäÙ´yç?¹šBˆĞå*¨‘ğ<Ÿx,F‰‘R\n	(!@J´’H©ĞÂÏŒX&ÇNÃ)YÓ¹Šr©D}6Cç¦TŠEê3):\Zc8NÏ×”óã4u¬duGÖ8{¼÷E00<’¨Ïeoxåå^nºñĞFH_MaÙøZ2ïÔÑPŸ}k³ôQKl02|–Ö¶öy¥UØó×şNÖr(¤\nGë°a2R©,CÃ#¤Riš›\\ÓŠĞ?V!\Zãùßuñ]‡üÄ8±Dš¶Ö¢†sÃÀğHbQ\0üİã?íiLÆÇ¦Y»¶óbF®3£ççY±r3ªvÒF­yá-^ •a„lÁ©3tw­Tau¨f›&ããœ??B¡XB)‰Ô\n¥(…S©Pp*¬X¾œƒ‡r~vSC#\\²q-3²Óh¥ğ%T<ÉÂÜnyX2M}\\5|ù‘¿éY\0WmjÙ:5:f56f©‹E¸É„Ó¤à˜´µµ×Ü]¼éşµ«©”Â\n†!˜˜œ¤­¥	)%¦!@ƒÒ\ZË4qÊK:˜˜šazn¥5R†ÕÀ©8LNNXLNO“Í¤¹îš«1M;\ZEG²†ïRøhEqz’¶%m ”Õ[Øº(\0bqoó@ßi–­X‚0ì`¤F#ÉÖâ¸æ¾R^Hâ5\04Z„WŞ0×ÅFk^È\0¨V]|êIææó,]º”sCáÿRÓ9CsK-¹ë035LÀ6m°”ü–mVø‡’…¹i\ZÚ:XÒ–a`àìæE°~yºkøÜ(«V/›­5w.”J44-CÕ’ßŞÌaHÈZ²SJ3::Lkk{˜0kùA\0–m3—Ï#¥¤©©‰j¹\Z¨Aj°-“ññqòs³9v„Æ¶¢ñ¢Ö;H4#\rZáT|„iá‚B>O4\'‘H·éZ\0ÅŠ×17W\"×ÔğfrS\n­4âÉÌÏ¡ŒóZ«‹ÉOÁéÁs¬é\\‰†°í02:ÊK/ÿŒË·leb|Œ|±H.›f.ŸÇ4\rßg|bœÍdØ°®‹rqÏĞ(ÃÂW0“/ÈNû~@èÀEA˜‚ª/;Å½ŠßPu]rõu .–@)\r¢ÑøÏ1>”³Ğ5z«ÚÔ`†GGØyÍ‹”XRŠ†úîºã%yáÅçA˜LMOSŸÍ248À™ÁAL+B±ì bI¦çòÔe\Z˜˜œ¦µ}§‡F¨Ï51:6ÍºL/ÂÀ÷|0,,ËÂ0EÃ¢\0°#F<Ğ‚˜eÖúU:‹VT\\—œ0CWF„¿Óa®¿\0T %¦ia\0AÕÅ0MU#9Z+´”h­‘J#„àª+¯&‹02zŞƒûğUH‰;;;9?züÜ,A[®SbiK#GœÆŠÆq«UR±8]ë.aÏ¾Ì;‚tT“Â¾ÂàWÊñE…€<âñ’aéÆE×El„Ğµ.¯&{^x®Cc)C6+cã,[º%e\r4ıãRØ¦ÉøøyöíİË¹sçX(9LMOSr*46µ²ïàArLŒO’ÌÔ“MgŸÎ³¦s%çG†é\\µš=ûú(LOÑóØ|E\'¦C\0\"U/X\\#äWJ4b“/T@É0j\n¯ô}ªÕPÁ¥–B÷‚¾¯/&@\rœè?EÇÒ¥a{{„Z’ó¥D)ÍĞÈ0½‡‰F°\"Zš›H§R,ïè`jr’õëÖÒµ¢ƒ‰É	âñ:&¦¦X±b9¯ïİO¦¾úhÀàÀ‰¨…\n|:»:É—}´3G£²(\0ËškkÊ0>Y\nÅm­@…Ò{\"¦p¨ñôPÔÒÈš á”(¥˜š¤1WVZí—Ra\Z¡\Z,ËÜõ×î •JsöÜóE‡ññ	4‚©é	šr99ÊèÄÑˆÅÈèóÅƒCÃ¤2Yl[Ru=¼ªG,Çw]”Ò¦I¥X&·ç×æÈºÎ&¦\'&À4@ûa|Íõ)ægÇPJ†1\n•BàyÕšÇ„%¡äzÄ¢ÑĞx%QRbE,æò³Ø¿—‘‘!â‘(ÇN§¡±¢¹±u]]¬\\¾a˜\r\r’ÍfˆÆã$ã1œì§±¹•5«VR.•(.Ì‘LÆ0MƒÕ—nãå×ÑŞÚB29>E*a,*	ö,ô¯\\Ş±ıÇ{wƒa¢……¨U3\ZaaæV÷V‚ ¨©»aBÔ\Z<_‹FPJ1“Ÿ\"›N…Òw­L\n¡10èïï\'’s#£9~‚jÕÃÙ€%­­æf©¸öì}OÂì¼Ãô¡£tm¼”×÷ì¥â8ô÷÷Q˜Ï351Î‰r±ÉÊjã¹—23:Äu;¯ T(svhŒªÈô/\n\0×³¤Ú’ÌÏÌâùULåsAÉFk2u’J¥Rë¾BGÒÔÚP4ºÖ	NÏåYÒ±,”¼ @jÅääÅb‘L}=‘D’\\®‘x,JÕuùÖ£ß¥­½\rÃ°Ø¸~-õÙ“S¬½ä2²©ÛâÊ;™$[Ÿ#ªcEãóÓS´·f8İælœ–eLœÆ,’™Ä‘E…À‹‡föåË2XÖ’bğìXØ×ëP™Â ½9Îè¹“µ\nğft*eC •É‰ï‹Å/Œ\02À2ÃÔÀ³Lƒl:É‘C½<şãçùÛïdûµ»¸å¶[™gïş¬^¾ŒâÌÛÂ«”ioH“´4qYÂ=¿ŸXª…`Ó¶T«>&Š%«×2ĞwšDÌVcûÀ¿şà=½‡û¦ç¶méâg¯‰!PR>ÙTŒjñ4†!0DØ¸®‹0,ÓÄ0Â±w{ûò³Sø¶ÅZÈ€‰É),;B %Ê¥ƒc“Üöîw“‰…Ü£©>ƒV’k¶ï`ğü$¦¬25:LÕ­ğú«?c>Ÿçè‰´&$Õ’ƒ[õ8Õ‡±I7dÉä\Z9;0BÕsòÇŸé]\0Ë:œ…jâùÎu«9v¸m´®QXÃB+E×²gN¡Ruq=!¶e!j^!jBg÷ºnú8{–ñ‰	NõŸaåêµæ˜Ÿ›ezj†Ÿ<÷<;®İ…Ö’¢ã ´æÜĞ0U¯J\"j²ş’KHåš9?:ÌĞù)rmËPÒ£-gã8òóœJ•İ/ÿåû¬Ş|³Säç+vüùÖ¥Î¢#³~ıwÎLİ³~e£±ûài®º´¸`hûö¿ÁşÃO±úò;ÈççğÜ*®„L/ğÑJ¨PôJbØ1\"\r\\µ}¾§Zuq¤Ëö7`G\"H¥ˆ§2H\rem²ns™t†õ±»÷À®«§EøŒçÜ‰C<xs;½ó°f}Çûñœ2KblŞ¶—{–…BAE\Zº¿óÍûNŸM>ùí¿èİ¹Á^ı½çNòß>óa§üæ ç{ì9&é¾ìfdM.nAP«ÿ\n… ğ|$2Ôı\0·ê…\\>ğ‘úM†’†ˆæñŸ¼@,gÃÆMÌŒ0[öÙ\\¿€t&xuë7­g÷kØÖİHÏÖ-l¿í>û™ÿ)Ì3xøs=kÖ®+-Z\\·feÉ®_õµ³S.Ës6»÷Ÿ@˜f\r2‰ÀÖ°yy•ş0Lah¢Ó01j±HÃá>Ë2@K\"¶…e„I°Î6q«R)”ÒÄ$~`™ë6_Ê›»)‹8åñi*Î/íf×öõÔ%\"dÒ	’‰[n¸•=/½ŒĞÏnşÚÿËøv.Ğ}é¯ŸV£×\\¿G¿û<Ê Ì‹#+Ó²©‹Û,Ksªï( ğ¤¼8á±m3TÑµ‡›ÔŠ:Ìé3ƒüèÙg‘:äRgR)!ÈÏÎ\"½Å’CS´J»9Îù‘Qà™1xfˆ¦”Å¥Ûw`GMzê\\İºóÖ¯ÿRƒ‘›wn_ùÕ_xâÇ‡¸ïİ=|óÑj{€¦IÄŠĞ–‹²Ô>ÁñÃ»±M„F«€À¨zJI¥Ãò¨AÖÔâ5ë7knæŠ«¯ÁaûìùRi¼  T*øWEa‘ôÏ!üYš–¬bÛ–nfòÒÙÂ+°nM;[n¼‰¿ÿæw‰G-2mk¿p÷wÿÒ³Á%k·}¥cåÆŞÉÙ\"A1OoßHÈè„\0„e£\r‹¶¦:.mŸàä?Â);(–=ß÷Q2‰U\\Ÿªç#¥Æ°ìT¡QA€FãùJk\nŠ…åùYÇ¡RÌ“ÔdÊ}ÈÊ<ãÓyxê5Ê%‡¨mĞÑœæ¶ß}‰sıŒâY½·ß~çW~%ÃÑ—¬+wm»ãcÇ*•W¯çÕö01W4A„¯F„âƒm«*çìÀ1|6H¾\n™Ÿm…\ZaÈ\n¶ma B058n•üìs3sŠøJ°03ÀÆÈIœ±ãt¬¿œË7°ÿĞÚW¬bêü-ñ€[î½@I¾ø…¿c<Tnºãşõ\\~eùW¶!¢µ¯½úì¿ò[ùÙı«ëxúÙƒ¼ç®]äÒqDm¸¡¥Ä÷<|¯‚RP-œÒ,DÓm47·R®TBı_I¤\ng\0Tø2ì\Z‹K©Xd~>OVMĞ G@h\ZR1â\rKéë;Ãî\'H&\"Ôçr$uwİ}\'6ñ™ÿøYêâ	–o¾ùSùèÇßö‚Ä¢Vdşş×¾ñ£\'ÿş¾?t«xü‡»ù·ï 5—ªenŸ ğñİ\nA «ÕšëûÌÌ•™qÓTŒD2`Ç1ì:lË\"PŠÀwĞ¾Îi5Eyf¿R!™ÍĞ¼¼‹R~Ã\'Ï204Mçêå\rĞ”‰q×ıï£cífşëø/h­ô²õ×=ú‡ŸúÓ_ıŠLmØH)ò|İögÿı»>ñû;yö¥C\\~Y7ëW4\"e€iÙh;”Ã*Ra¾O.#ë;È H©XÂ-+¤X–…i™xn™¹|™ÀóqÊ>ÑˆÉ‚™\"O?õ*›·ôÀĞ4ëĞµ¼‰Ûï½‡tK#öéÏ¢,ßtãKÿÁ§ZŒñ‹\0À4ÍÏóî\rı½Ï}ñ‘k?òÀõŸŸæôà$ï¾a#Ê÷†|şEPÊ\0xBØb¦Æ—\n¤î\r\Z&J\'ÁW˜&×€Ò$f\"m™ÈªC&¦ioIs÷ï=ÀÀé3üÏ?ş„a°|óï¼òñOü»{#‘È¢6Ä\r\0@$™ÒZßY—L}õK_üÜ{W¯jäƒ÷_ÏÏìcÓ¦5t¶\'Aˆp¢êbÙ62ğñ}aD¢Q*…B¨ÖZ1„aPq«¡ÆoGğŠ%­IÆ…¢ÀŠÎ%iü…i>ø¡ûèÚr9ßùÚ£üğ‰—h[º„íw>öÀ‡>öë[”|ëªloïÁ?yä‹Ÿû£»ùƒŞNs.NŞµèZÙÂòÖÅü,~ ñJ¤6QJâyUÇÁ°,4;\Z¥âT(”«\n•j€‰ÂDPOC}’•ë6°fËVFNç«ı}Üª$–]æİyÿCŸ¿êÊí¿şUÙ·V‡ùùù¿ş·|é™Ç¾µVPå¾»¯¡kİrfçªd[Ôgb¸å22ğ	¤Âs«µ*\0ñDÃ4qË33s_«KgiXº‚LS;§Nöóƒï<ÉÄÔ<íK;h]·ëÔøĞÃ\rõ\r¿¹eé¼.ÿÆ>ùıÇıÈë/?—s‹sô\\²’ÛnŞJ®¡\0‹ ˆj¡},¡ñ«ÑXŒD\"†aG	<buÔ%SXÑåâ<{^ïåÉ§÷ •\"’È°ñòkgoyÏ½ôô\\öÛ±.ÿón˜8t¨÷¡^øéû_xöé–A–4DèZ½„Î•ml\\ÛF4•\"—«Ç44†0YX(¡´bf&ÏÂLŞ£g87	Zc˜6õÍíô\\õ®É»ŞõíM›6ÿ•a¿}7Lü¼[fJÅâí¯½şÚ}‡Úz¤woİÙ3§„ò«xn…XÄ@)eÔH“)p<MSCŠª²èêŞ¨×­¿´¼asÏ¾mW]ıh².ùÿÇ-3ÿ70€­¥RáŠ¾¾S›NŸêœ™mó|/íÒ¶„öë‰B.×8¾¢³k`İºî£Édò×vÓÔÿ\n¾®E@I@:\0\0\0\0IEND®B`‚'),('24','coin.50cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ+´¿ğÛ\0\0\ZnIDAThŞÍ›YŒdY}æçîqc_rß*³²ªkíê½èn Œl˜\Zãbd	1#Ğ€F2²ßæ…±_°3¶x°Çö¸M³ğ°ºnè®^ª«ª«»ö¬ª¬Ê}Œ=â.çœy¸QÕØ\ZÍP@c\"Bº™qÏwşç;ß÷ıÏ¼Å/­uiuñêQ{óhÊ“‡zawwÊ–#½v#÷š¶VQÔT£2PZUÚ»‰ü;3ñòĞøÌ1!Dõ­¾?ñV|h…Å×_}áƒ•ÿÃh>¶–İîÎŠh7»\\™_aùÚ2¦)h·Cš­6·İ6A¡!—M±kfÏsul\rÙâğm9ø•Á‰Ã_³lgç·€Fm{ºÛZÿtĞYù¨¬/Q¼öÚ–VkŒ069ÎÈØ\0CÃe\n9C(”6h4:lol°±ºÉÚÒ:A§ƒi›<úèíìÚ=®»¡·#ÜÑ¿u+wşyyh|ş·€Åb}óÚùiõÉúò™Ü³ß{†k¾ïŞöÈQË:FÆ!Â°B£ $B€Fk	Z£â\0aZìTëœ8şk×—©”³¼ıGÁğ\ZÊ\Zú’]¼ãÏŠƒ;¿\0\\9ûÊ{<«ö…¨µ´÷ëÿó)„ãòÄûÿ\rÓ34jMl#\"\nÃÄ0M„X¶ƒiYÃBèäV´D+…0´P(sıÚ*gOœah(ÏÁCÓ¢t)WŞÿ™üø}ßûW Ûiºóçÿ\\¹(>súÇßğVê<ôÎ‡¦Yİ¡ÓÜBjØƒãØX¶ƒe[˜‹e»˜ÓÁ0LĞ1J)ĞªgZÅ€@k…–W®¬pşôy{×}¸®ÛëÄ_¨Ì¾ës)?üF8wü™’ëŠ¿áÒ¾ûO“û÷óÀ#Ğ®.ÑmõˆÂ€Âè.Z;U:Í-lËÀM¥Hù)lÇÆ´]l×Å4]„0”ŠPh¥’Á+‰Ö\n´FkEÇ\\¸p\rK…ÌÌ+i~İÉùå©#¿ÔaÜê?œ}õƒ¦}3¨ùĞÓõ7Æcÿöwyğ‘»Ù^[gíú…ñ}t{Š8¹vmÇ6PÚÀ¶d&! LÉ<Üàƒ7§FƒV	\0ı‹†<0M®TàòÕªaéÚ‡º;¯~sãÊKƒo9\0gŸÿz!—6ŸŞY8õğ7şá[üûÿôQÊ¹ç_}%{Ä2Â°¹Ó¢¾¹ÌähÓì:ò ›X¶…eÛÓÄ0-DÿGk†“€ oà ANĞZ÷9†‡ËŒï\ZâêÜº³üpPãé•ó?)¼e\0¬,\\¶3Åü·¯½òè3ß{†æcèö6Fƒòè£{î3ÍÚ•3mü|#U&b<Û$Öàx>¦é`Ú£¿Ô\rô‰ïÆúï—¾Òh÷¯ë›Ë !J‹LÚgrvšjSã™G±òÅ•…Ëö[€ìí|V‡[ùÆÓßã?|òè6ºÄÊÀ0m´RÌz‰ ÛÀvÓ8¶ÇÔ{Hù;µ\0Ce\ZÍ6–ã`Z†!†Õ\'=}sZ…ı™ıkâMº7ŞûÄ¨¥\Z.Ñ=ÂúÕècŸıµ0æ™]»ı\'ÿÿÃøƒO|ß5i5Z¤OusƒJ¥LÚV¶CejÖğòã„¡D¡™˜ŞÅÂµULËÂ0-ÓN–€a\"„•”¾\nûô÷AÅğs[%¢_\Z­$J*lËÄ1%Ò)„ë²vù;şÚ\0Ø\\<ïçò™/¾úƒ§Ò÷>öƒå,İnˆŸ¶iïl°1	ß…‰å:x~\ZÛÍ¡µÁ‰Ÿ=Ç<NX[Ásê-Ëõû\0¸‰(2ìşr`Ø	!ög^Ñ_\"â†±èƒ¢úä(AE(áö_*+-ºK_\\»~Òÿµ\0ĞªÍ¢¹qîÈ¹‹‹}à.j›Ûä÷ÒS>±V”ñSB‡8M:ŸÅO[\\›»Â®©\"í¦_ àKÛÇ°S3BÆMbaº?fõs®ª_*¥ÑJ¡ã¥â„/d„g2Lš[+GâÆ™OüÊ\0,Í,\nö÷+_Oşá“ÈP¢ULuù:çOÀ÷,LË&•Na6–mâå†ªIue×q@îğÂ±üÓW¾ÂìwÒ7g>Q‚V]`ôAæ›ïÂHf¼O‚‰0Ò(­ûÕZId!ƒ6)G“šQkó/ŸøVéÿ€õÿümpùã‹×çÍü Å|š­\rl×!•õ¸çş#˜F„¶L„2@hÒÓ¨À 00ˆ0bÜ”Ë;Şû8¦å¢Uï„‡ßà5´ŒusĞBÔ[ĞØ^cd¤’”<\ZMâ´ÑR¢u¢†0ì˜ Ù¬ÌÊÿí—ª€ÅÕ-×õœO~ãï¿Íï}è	ºİ¹¡}DÒfk³N3(±º²ƒi™˜GuV\nA\"fêµM@&jO8h©á£c4­B‚N‹êÖ6ÕÍ-ª›Uê;ujÛÛ´›mÚ­¥SÈ^•êfõF¶€–!(…@¡ÍX)Ö–7Y]ZG«…˜ºKv`”Úâ¹O._»äşR\0\\?ò‰^ck¼26F!—AË˜ÚV•¹³a×PF½†”–ã’š ÛéÑÚœÇNeiîì`¥JÓ~³Ä57…Ò‰v¶¬aÉ\Z\"®aÄ-ToCÖĞQ•kç˜İ3V	xB˜n	-òT×·xş¹“äJy„åòãgNÑj4	Z\rÒù\"2Æuçµ\'~)\0²eç#g^y^<ú®‡‰ƒÄ¢\ZºÍ¡£÷Ó­^¦Z)L`(…åx=á±±Şbyq\r?“C…İŸ“ºı:ï—¾ÆFÇMLÛÅò2¸é<®ŸÇËäqÓEl×OxOÅ8^2‰†é`¥Çˆ»UjëW9w~©©\nÛ˜R)ËCà‡?8M ÛD±#tØüÈ-sÀå…m;½òîïšçíü}:;ä‡ncçÌ	ÖÖ˜Ù3ÎğÄÁÜyC‘6ºµ¶6¶)æiW{Ü÷øıÂC34Â-ûl¯PÊ@ÉâÂ[Û5<ÇÂu,”Vx~\n!6×¶™Ü3ƒÖ`Ã«ĞÙœC!8{q•·İ»À/Ò®7QÁÓ³#¼qú\n÷¤RŒì>ÀòÅãï^Y¸lNÎF¿p\\¿zşnİY-Mch°½=,Ïdp0Eel†ŞÎR…!b)1-›òÈ0~Ö§XÈP(R]^cyi¡t$å{Cñ)¡£íND»ÕâÀ¡½ìšİE¹’§XÌb ‰ƒ€¡,ùb!Éüš«ç†àÌWÙ·»”T•R¨8Æ0Â bz× /.ôº8ƒe;…ËÏİ}K°oÚ½íõy1:3ƒê«­|í›X^†>D­Z#\\.œ›cxĞDi—êÖ&–iáÇÙ¾ô<ù¡!ÎZdlj\Z´•\0Ğ2R\n„è²xå\Z‡ï»$r9å§Ğ*îï%#\Z;]¡±v%#z=Ú-r¹¤Œ‰c‰w‰I¯Ó¥2:D­Ş%BtÜ¥×î‰é»Gï^ú…°mÿÈùs—9úÄ $–¥yì=õÍˆfåúE403]&“ñ©×{ÌÏ]åmïxÕ«‘­TğòƒÈğ2Z+„R		\n\Z”˜†Â0-Pı½]Åı­MŞü´F˜½v“^«Š—ÎròøöÎK…ŠUß6X´vÖÑRaZA$‘qLØÚ$]\Z¢½½rä–H0[pöl.-32:Ü· Fr3}ó²ïÈƒì;ü\0ù”@u×™;‰ÙC9{ìU6WÖ±¼W.-±ûĞŒ›;@\"]e–l¬m102Z!0íä{„‘0°R%ª±­4ív/å‡!J&ËZ˜j5QÓ¦À´,dv\ZTÆf	‚`Ï-ĞnvÆ1ML;ÉñC`Z6‚„ñ›ëĞÁ\Z–Ñ\"“ËpÇã4·Ö™Ø¿ŸÒøÍ ÅÚÒ*\nãÍˆHe\"T´&IÓ®WiíTiloÒjµÈæ[;U¢ ‹ãyÌ]Zdb¢ŒT\n%“MÆ\Z“V£Ş—Ê\n×‚X*â°‡òè6\Zã·@Ë²e»ıäF\'ÍHœ0l²¥\n¶_ÆIeq3°ÒtÛ-*CÃx)Zu»º—œÉ™—İôüoÚ^I©œÇ–%°Íˆ İ`şÊq¢µÂò²T/àx–ãrun‰ÁJG	ôó0évº8K+„V *\n°—n«Y¾%Š”e™ $ı°©$`b\Z*nb¸~bF›üà\0‚Ó´©”J\\>{n»ÇÈÄX?×KÈTèPÄa€R1¶å€(3CÎ\nñ=›ù«ËìšªšºÍÙÉq\Zµ&)Ïê‡%\Z”F¡1,›N£•,Ças}›b!CÇH©Áp±è¦n	\0m\nyÃDÆ\n­MZ[K(áá¦}^?ñ\Z¶—bpd˜L¾Äæê&#cS¨¨Eu}‰ìÀGN „Õ &–s¯½ÊæÆÙl\ZÃ2ˆ#I©œch¤ŒF`Ú“Sƒ,.lPÌ‡ÃÀvlæŞ˜gp¨ˆ’-ûnPR©4‹ó+d²)ÇâÄÉ+ÌL•n\ZGô¤ukBHi«‹a¦µ0QJÅ°<wš±±<R6P:ScYbácè«—NqğÎ;ØÙØ$í4Y_^áGöÁÍ,O ” ³³BÄ<ú;#c}³2:õ*fCHœT/•¦\\Ì³½4—v1-“«W—¹÷®´R(J%vÙòrl¯¿ÎÀ@Ó2X^Ø`÷{QRƒaE!Ahwo‰ÇÙ–a˜˜·Ä±g_bòàQ´ø•üÊ$ÓTÆ¦8ÿÚ}©L©c7Ïì½´Zp¢”AcsKo¼ÎÌÁY”¤Ob‡8^Š\\e­\râ(@kçA·İÁvlÓ Óêb™Rj¤Œ;¬A QˆŸN±½Õ %¦™Dë†abÙ&®goßÚ6è[K¥œ\n»H%	‚\0¢&†›B)	f†¥åÇŸ}{¼„a@G`§ƒÚv•Z­\nZ²³~KWéõ$Ù|u£û£$\ZV\nu±ST#LÓNrCÛqˆ‚˜0’h4JÊ„?¢ÛóÙZ[Ã÷]¼´ÇÉW8t`œ(–(–í±½|ÜÀÀÒ-PÛÚ˜33%ê6Ï÷;Ü~ômè¸…“.°‰¤`{ñ\"¼ó1Ó@İVÇ2IçŠ¤‹*%Ÿùù5êõ:¥á¶¶6IrÈ¨“4>´JT_%6WKËAÉT˜XiÙô:Ò…RIcDc ”\"Ubkñ\Z~Æ\'ŠbV—«”Š”Ò¼üÍ5²ÙÌÜ-q€iº§ó£»¸pæ<~½æÕ—^%[\ZÄ´=.Ÿ½È{Ş÷ Z…¤ÒiĞr…]³ ™\\…8È¹g_9Áıïx˜\'Şû½œã2ã“üLº?Ø$æ6l—¨ÙÆ²P’0èâ8Âô:¶m!#Ùïi,Ë¤×î!eL©œåØ±óÌNWn*ËX©q÷Ùò§o©Ö7:/îÙ³K_¿¼ˆeÚ¸¶æĞ]‡(æ,\n~G¿ÇX†EÔ¬ƒ0:´ìÒªî A³Ú ˜÷¹çá£„!47Ö8{ü%‚ú–)aˆ’1R%•`¹9¢Î¦í¢µäÜ¹\rlÇÁ†1¦ a~•Èd7?Äúõ«d²iª;-–·Éõ}8^\nÃ-bØ>õòÕo	€ÙıGN„2]óL¦‰íú8nL.içñ}ŸDäõ·\Z-Ñ2@kEÄA›Í•r•<–W$jmbŠ}ûÆZb â^âĞ‰.z–…ah~ú“SJYü\\­¹+(•´Ö¢(ÆtR´uÒÙÏşì\"÷Ş9•t—„Àv-ü\\¨Û¤Xµ{û½·@ÊÏFZxßOåœ?y’s¯c{k‹•¥eü¬GE7õº\"	8”ìGÛ†a0{û]IË+î¢…@Ã´QB`\'Yk´ì‘*ÍĞ«-b;\'_9C¯^¥è‡8é<J	<×\"èôˆÂˆ8™=ÈÖõ9ü”Í+\'æ™É“Éx7ctË€ÜÈÖ®œ¥29ûı\\e$ºåDH+õÔáÛ÷ë×N]dÿ¡)FG‹K¤3éş`+…!×Ç\Z-#èïíQ·ƒF¡â‹W¯!±ÑZ²gÿæÖ‚dİüİê5Â^‡ïûEj;:8E·Õf{c‹N³*ÆöS8)áÙ}ì¬­°³¹Í«o¬`«˜áÁØ)¤T ©l77\nëz{K=õK¥Â•éGxì_YÊ¦½‰V§C:åcšv_)ºh%¹}¿©aÙ\Z0ˆQ2À44*Q2fjfŒŸşÓ1Êƒ%¦§GØ»{€0Òôê[¬¯_æâë—¨V›<8Ne ˆ”É.¶ëüè…Üux‚ƒ{Y_«RİØáÚõ\rVÖ[Ü6S!›KaZNºL\'R¸®Iql†êÚ]™_:üø~»u\0lÇ\rıö—¿4³G|ş™ïü”÷}èİÄ±BÉv½E}{É=ûQZôãú¾åe\"r¤Fõck!L~ÇQV¯]ã…g_¥^k#´BXƒ9šÄul”Ô‰–Ğ)“æèíûÇxñ•«½€n/Äw††óÜqhË2A+LSàgó¬/]c|rœôĞAÎ<÷mrS|ÉOg‚_º/pøè»¿üúsı_‚Ngpk{aöÛÓ: 4PÂ=Ïîwr“îŒ–ñ›ä¨JÉD‹Á‰	F‡“ë2	@”N:ÀA·‡Ö!Âè(\0\rq’òl::M·„1Zq£M‚Œ%¶x•ÚÊU„VÇfino!Üò†“Ûıå_©3Tš¨®×Ïêo}íÇT*©dpÚ%Ë„‚êfíçÖ¾ê‚L€ˆÃdë’Q’ç÷ÿªŸú()ñ2e6¶V—ë¸ÅIv¶›ÄfTqieè…’Êô,½d¬‘RG¡†¦iày6©”àğİ·‘;Â¥W¤½Êìç÷º§ú+\0ğ÷‡Ùl{§Ü6ÂÉãçÄI¸K}k›Õ\r„Ğ¸™t’\Zh‰”áÍ¾h,Ç§Û3¸<·ÎÒbêN‹(Œ°ı\"ós¨8 ¶İf`l˜Ævi¤YZi\ZÎ?ÏàØ8µFŒ”òæÓ²qËqÈsî{”«§Ã*<];ò—¿–æh¾<Ò™Ü{Ï§VÚí¨ÓdmuÓJ‚’\\1Ï®=S„‘I­ZG)M¨$h0ndzhÜÌ§O^æä³ÏQHk|§Çêâqqñõ7ƒ ¸rş—æÖ‚6/ıä½Æ­ê\ZÛ[Ûtzf!ËÄu,üTÒ—Ì²í½‹F­ÆæZ£]Ş÷©ñİ;¿\0æ/òG_şë§?ò	S4ß~áõ‹bÏÁ)<×%¨€F}‡ÕÅ5†FÊ˜¶…\0:Ígaû%¶V×™¿x£ÂMy¸®ƒaÚdÊƒøÄ4$™´Ëğhâ¶P”Ê>•)ßc` CÜk1<RDc™¸®M*å’+å˜ŞS˜æøÿ·š¸ıñÿºÿ¾÷ş¯_û	‘\'?şÙ?]XsŸ*|~ğ?¥ÙéaŠ!4¹b…áñ!¤2èv\"Zõ:©´…Ö`ûæN¿Æı£‰H×\Z­!Ÿ·q¼,×.ÎÓm´XZ¬SßéJ—–åR«G·ÌòZty”«×[4;ò=¼”C®œ§2µ»°Ÿ“Ï|“ÊìıOí½çwÿô-9\"#„ˆ~òÓŸZl>—/fùÖWŸ¡Õiàú>¦í £˜^»ÃµKsØ^švW1è˜v»C*í÷]_²“aâçËôBÉğÌ^R®flz’8h³±Õbp|‚f­Auù\n÷=r?Ë«–]S‘Éx”‡+ÏÂ8È‰ï=EaìÈsã·=ü)!Dô–;¸{¼öÄïÿç\'ëíÂÏÊEŸŸşø$Ëk\rP¶c’ÎúT††Zs}~N«EuñÙ\\Šµµş_™d{³F…,Í¯²xéÅR\ZEÜí21=ÎêFËT”‹©âõí*CCvïb`|„‘ı İ^şÎÓ¤ÇïúÙèşw=921S{ËÏ	î™ŞxßÇ>óş†ÿj»VWg^çÅc¯‘HZåBaÙ0:Z!—Oc\ZšN7âÔÉ«\\»¶I;ò8õòÒ…\ng^:Î®Û¦Øuğvº`eµI*íR®d¸ræ4¹¬G~p˜µmRi‡ÒĞ\0Ã3{¨Üö+Û¼üo*™ŞóÕ}Gßÿş‘‰ßèQY­µûí¿ûïŸ»xêGŸÙ=é{Âğ8p×A†3˜¦Íâå†Æ2¨8F«˜ İb{«cR™4q,Y[ÚDJI¯18˜gy1±ÀããE^9~•Ã‡ÆpSi¯¯â—xä=ïEŠ—?ËFUö†ö>ò…»üÏ	!~³GeşuşµŞó¿û«/¤ÕÒŞ}{‡pÓ&öÎ’O›XVrŞWÆ*–È(L”a?TE\n\'ÑK–íà¥\\üB…te\nÜA.?Æü…sÆ_š>üØgfÜı¯wXú_TCñ\'ß}úN=ÿÃO–¼Üm·ãû)ÒÅ…Ê®qØEF:NBO%UÿÄG„Ò‰×7˜n\Z\'•ÅN—°R%ºÅÕÓ/±º¸ˆSœiLì¹ïKßöÄŸ	!~;Ëÿ³\'Eâhú¥ç~ğé³¯üø£íµsÅé‰‚)“/æğ„é“Î˜f’÷¡B€Œ4\n…íºVšV#`éÊ¶V—X]ÚÒ“‡Ş›ıÛ÷½ãÏ-Ëşí{`âÿVk‹—?xùô‹^¼|öÁÍÅs®Ûb÷şİø6˜:¤04†aÚ´\Z\r<?G§İba~…f­†íôÈî;¯8şÂí÷>ô•ÒĞä×~]3şà_€QÒJ=°¾páèâå3‡VW×w·›íaèœocÛ–á¤ã­¦3Ù+c»œŸ9ğ²0ŒßÈCSÿ‘TÃ?P\0\0\0\0IEND®B`‚'),('25','coin.20cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ-\r8³¶\0\0IDAThŞÕ›y^WyæçÜí[ûëî¯÷½[Kki­ÖfÙ’m,aì`„`“TÈB255Ee*T¦¨l•)RP3Y&“È†ËØ&F–µXj[RkW«Õû¾~ıõ·Ş{Ï9óÇ×qæ$ÎdîŸ·¾åç<ï{Şçyß+x›/cL³VÁüÒ½ƒR¨*XëQa®YJ+e´r¤\r,i­j%fl7>Œp®Fk6^@X—…3o÷ó‰·iÑõ~aù]º<ı‘rv|_)7[“Ï,ÈâZ–™™y‚ drr;D\ZEccšx\"NCc5ÕéFâ±¨.ËÚ•œ_óFÙw¾Ö½yçK®ë.ü› ˜Ï5çV&~)7?ø•¿Óæç¹r}œÓçïĞu×qh¨OPÛPKº®šˆ#A@6[f5›ce!Ãìü*Gèä©ã»Ùwô\03+†“§\'š{ıÚÑw~)]“˜ù7€1&9vçâ§\'‡>[X¯ó|ç…~N¥owOßËáwÑÜ’Fx1t v£|„CØF•P~Üšâµ3×»7ÉGŞ„­¸tö*óË\"S×±ç·½÷#¿/„Xû7€ŸŸ{dmúÍ/Î_Ş),-N¿ü&_şú€ÿø³ÓØÒÆ:ô±½8ZùÛÒ­£Ñ¥%´*¡B…eÛè°ŒA31™áf?	[Ó¾iÕMõæÖ(W#‰ÍŸyèñ§^ı€Q¾›»òéüÌŸ¿uùõÄ‰Wnsùê8Í­­|è½}<õ¾÷rî•Ó<ôÄqtàcPH!ÁŠ ¤\rB\"„DØqŒ*¢JŒÖhUÄhQ\nŒBH¸72Å×¿qšá»S~hşÄÍÍ¯6şÚîı~s[·ÿ¯\n€1&²6õò—G.şÜsÏ~¯>OıÜ»x÷»O40tm€®m„ÊIT#¤…Š8±jŒ¤…´#•°<Œö	‹Ká ƒ<Fk@¡U€Q*p\\Ë‹2<<É·¿ñ}ÜÈ†]}\\º¼ô¿Şó±_ûŒ¢ô¯€_ÌÆs“/yúöÙ|á÷¿#ŠÊâwçgq¼z2#Ä\\éØDÒ›¸ğê÷8ğà.bÉZ,Û©,V•VaG*,&, ıZù`4FWv_©\0ív£CĞ\n!@xq^8ñ\Zµ	›ıG÷›Ó¯O?³i×{?±uÛöüı®GŞÏ‡UXö2Cßüã¡K\'?ğ+Ÿû+‘îhãşè³T%bÌÜ$ô}bÍ;¸|u‚É{£Œ.â¹’B®ÈôÜ2BVtbıïÒö¶‹1\Z„…éÆA„´R‚´Ñ~‰§<HuSW_>P÷Ë¯}í¯^¹ì½m\0hU¶rÃó[·û?ü+¿şŒ8öø~ãóŸdyb‰ÙÑQ’õ½”2Ëİ¾Ëà­1zûš8vl«ªáäK§0º²Ã°œ\nı`´Â„%ŒV!1Z¡UXù¬°Âa½õÈÚH¶ní¤±«“™{ãâ‡›?üò·şğ·–ç­·€ÌèÉ.ßşÌşü3<öÎøù_ú0+“cä2Só%ğb\\˜¥§-Âûüa|UÅÄl‘¹Ù%¤]Es]’Ba\rcB0\n­JëÉ´„Qe´ò+\0é\0íçPå<BZëab¨€†”a#¥…\nZÛšIÖ7‘Ëú<q|Ãg¾ôß~ñ£÷À¿­©ë/l//\rüåï}ñëq¯¶ßşü\'™º7‰Ò>±¦½LÜAJC[k’x,I>S U×@$’ 3?Aº¾	×ƒÅÙYê0„0€¨ì~P\0TN‹õ7Fct¸ÎÑë¬‘Òv¶íÆÑ¡O,æ‘Ëf©N%…P™‡;Ú{_8ÓmáGÂ€ÕÅ)Iyü\'{µîìõy¾ô…Oä–ñ‹Ğp}à:+e›†úZjb„Eªi–­™¡¡½ƒ°´JÇ†n†‡¦–¨o¢²»	}´„\rZ£C¿Bw)1@Wr€Hi¯ça9H\'†AÒÚÓÅüì2GŸx¬®.~áüÉ¿•?\0üÅ³?¹4qıØıÍ¾ğ»?KqÕ\'·V$šJ!›»RÙ×ŠeÛxMX^#RUO6SD–†hnï¡´:‡åÔrÃJŒÛQaYªK§Â	:@H‰´lŒ D…9fıë€åDP~@Ç¦Œßãİo=öGÿó‹?ùCP\\LXzísúÕWåCõqèğ^–æsX^ùbÀ¡e<K\"-´Æ²mÜXevl„úúZtgdj‘ÓÏ~ƒM;¶ ìSÂªTˆÂv+lXwË«BX¤AºQ,Û­MR®‡‚‹V>¡_Ä*¯¡T€-|jêj©kk•{6Å>÷•/ıfâ‡@ån|`ìö•ŞÏòŸ~ù”®kCŸÌü8;¶µ`¹6¶Åñ\"4ÂhåãÚšB¡ˆ>­Íì9²—¦\rÛß¢wål÷A‡$kıˆ” Òö–e¹HÛE:Q,ÇCX–B‚UÊ†&(áç³¤jRø¾äè;ê½rêùüÀ\0—=#ä§éM=¾›î\r›Èg–¨ª‰ƒÖ¬µ”r¹\nµÆv]¤Å¥	òX±…²!iëì&‘ª«ì¬g&,U˜\0 Â²AJ¤ã!¥\rÒZÏú6B:Xniı_9ÂhtXÄ¨(¥BŒ	ñ×æ‘–¤§¯ÎFëS/~ó+Ş€í–÷åfní}áô]>ıÉ÷PÊ­‚Œ21¯XYœgÿşıLŒÏaÇª‘R”–	e\n¬‚´™œ¤¾¹éÖ ¬H·ß¬\'AiU 1„Ê\"›Í±²’edx†¡¡yŒŒ „DZXë• éTî‡å…‚ÏäÔWŞ¼ÉÕË×1å5tX&ˆãÅªéÙºyï¹_ß÷P^Ë|p~jÚ¶›Mİ…U„Œp½ÿ\rİİänQ›N£\rHikÜÉòÔ4BXØ5[‰ÅJe\r¶·¾‹ÂŠ\"x…şF–óø%K¸¢DÂU´6¸ÔÕ¹œ|éUVVK•d©Bº hŸPy”ü€ï~ëEÎ¼t––æZ\Zšø‹¿>C)—E„°Ù¼«Ï.e¦?xß\0LMN¸“cÓO¡fÓ–ÇÃXQìˆä±\'sáü\r\Z;ÚÙ´g?Swo´É-”îİdxàU6íÙÊÆ]» X¯ş¤»·•Ì¯…ÖËZ£à—YY‡°lqw¼ó\'¾õ<Bå1F£U	$-¤Yåê…~öînã\'>vœ–Ş#D¥âï~„gŸ=GXÌ\"¬*\Z{¶`\\÷ÉSçî¸÷Àüø­-KKËÅ²F\nC¤ÅvÓ¼yö;wnÀvk‘„øF©ª\'•Š°ñàQZÚjééİFXğÉ®¬ layá`t\0Bb´@kıçyñoNpûòMæÆÆ¸xúu–—×\0‰e4?²Ÿ\'_£@‡ ÈN°´¸JUÜ¢µ« ìc[¶íÑPíU±2;e»DÜ€æ:¯ãşË¶Ü\0u[öYb-òêÙA::›B’+^xîæ}‹æö.„)bÇZ˜›Z\0¡1XÜ¾pTC+·¯²2q›[Wo“Ïe×õ}¹RÜ˜\0%.ú›zxúã?ÍƒeÇş}>ö‰ê4~1Ö†®˜D«2F$X}7‘æÎ¥Ëtoh\'Tæ-ÏÀr#”r96ïŞÂğà8Åå;-©È\'.í»/\0œòôîd^xå\nO?¹Db‚½îág>ñãÌÏ­ò—_ù:/şÕŸ±y×FqÎ¿rŞı›0Ta†éÜ¹—æ¶FŠkË@EíA‹ş×Î²ãà>jZÑAXÑåB`´!‘jB‡ş[	Ğ6>¶›dvğM„ã131C2faŒÂ(­A‡!Åµ\"Æ@cs3Ósø«cÌÍ/±ÿ±‡¹ráÌîû Ím}ıÌy\Z›ÓìÜ·,—ªšzzº[Is[=ü÷ïæ‰ı­›9óÒIš;[É.å(2ÄÒuh\"L\rŞ£¦¡µ²xiƒ1hUæÁGöO6®3BaÖ#cUñ0¨ D²ºšlÆgqz„Dmw/_¦µ£ \\\"(ğ9Œò™Â¶‘H”RÉ\';7AMM=õvÓÓ^¿õ¾\0ˆ$¢W®óÈá-@tEÂ\"ìuí.(¯–)ÎŞ 3ú&»öö¨ÉÑ		A²óSóh/Še[ F•+g¶Ñh¿Œ\nj«p½¬­hƒ‹A#$Œ^¿Î¦rëìÄ“q¤€Ìü,h…_(àûF‡¨Ğ°²°€íxh­	E¹XÀq=ìH\'QÕqÇ`X®_XX£©)Š•3XŒòAù`‰º¤íPßİKUc7Bk\Z›Ó8‘*ò+£Ø±‡9Èõ×ûÑağÈz¹+¤SÑù–S¡3«,,®bÛ¤eôæ5jÒ\r,ÏMS]ßÀÍË7iio ôÿŞ?ğ	JE\n…¥BiÛd3y\\×F›Êÿ8^ŠDTÔß\0–“ÔaH\"ÇŠÖ!İ$ƒ@#`°œ*@#­Êb\'¦héj][{É.-påüEüÜRšpàÌº^7;*ö—†°Œ¯ÇÏÎâ%R\\9÷:İ[{¸Ùÿ‰D”HÔe ÿ:-­µ @‡>*±İ(óSs¸‘N4ÎôèÍMU£PÅ,ƒòÉûÀÛr]i;•¸DS.ä(•7¯Ü`qv–¹{¸6Ã;SäJ?¨8¾åBìÜ$³+YöŠ½ÇaW„VTˆÑ~åt ‚‰ô„~	éH—rÌŞ½I÷öƒÜ8Oª¶\nK“Ï¬€1¨ÀÇÖ\n7fâŞ]êêSxÉZ†nR•Šc¹.Â‰ CÖ?í{Èü¦\nl/R±¤ÖïøeÅÌí3´¦º°€ç(â1¿œgtàñh@/32p?;KÒÕ˜ „ıõ8-Q,¬qõüÂ €1 B¿ÂÒ©¢œ™ ”.¾ûûo\'kËK$SqÖVWq]‰Vªò{AˆÑšH¢–‰¡;Ô5Öb„ÍÊâÉD¤ª%E,â÷Ç\0i­VWÇ(‹!(|úÏÓ°ñA$!5\rM$ªSlßÛÇå«¤ÛÛØ÷Ø£äòY:ú Z•F8îº™aÀ@[fàµStô4!…©\ZÀ¨\0\'ŞD93M(#œøÚ·8ğ`/v$Jfa‰hÔ#–H0|oŒšT­BT€QHU…eRu5ŒŞ¡:i!–e!¬ªœÇ‹¥Vï€ĞÌvw·2?5‹Vk\\½6ÊÄŠƒ¿:…¯EzIÜôÎ|ï6­©\"õ© Y_Ã‹º¬dòÔ·´sóúİŠ^KİäŞğ<±X­F•±\"U(¿@©œçäß>Ï‘Ãq¼R:”ŠkÔ¤«pãI¦‡§I×Æ	ÊeÂ b¬2;½BSSÕ-]¼öÊëlìLc\0/a“ÏÌ\"¥3{_\0øe9ÒÒÑÄÈ½I,7ÉóßzÇŸxar¸UõX^Š3\'ÏPß\"9ğÇ*‚Å‰`J>hEKG¦œÁ±ƒ7±,A,f“H%p<T£¶a37vƒ×¾û*ŞB4\0i¡uåXŒÄ<œX‚åå,1Â@jªZ·24p–Ş¾nJ¡dqt˜T•G4Å‹\'‘nËssÄbîÈıå\0\'zc×¶Vf\'ğWGùè\'‘Š29ÅâRÀ•ş{\\<Ç½;‚Š~KtlmE®{wm]HF-Šóã(¿HGOïıĞÓ\\¸Âğ­»•ø”†Îsûâ~¸7–\0:(ãDä——‘B tÀêÒ\n–0h¥ñKeüb+ÖNqi‚¦®N¾ıÌ«ìèm¡ÒX^aÇ™¸s‹š¶Şÿ¤ìÿÇïÖ]J×T™x,\"¦fÙÔÛG.›aii•±±¡yÏÓ€ÛrÑ*Äã„¹yâµíV3ÄëZ¡Ï–=;Öı|Aè—Ù²³—H4Òo¾ü<Z•9tì0JÂRXÂà&Û¹y‚êšª\\$_1ÂÆ¨0I·43vo„­;»YÈhFï±iOH/âá%\Z‘2D9‰G.İ¼Dã%cUçúèeøÆm¤%¨ª©aÏCG©ªN²mÏfb‰ªÊ©5¨–ã½Õ÷³m‹•Ù	\neM¤ª®¢å+ÍÜh\rå’Ï¹Ÿ£¶.Á£#œ¶ëáDbx±8UÍ[˜¾ml)(D‰Á*ƒ‚ÚÃ¬õS×ÙÍ7şê${·ÕƒDâ1RMØÉ\r,ŒßCAnó¡ŸºtÖ(VêöáÃ[÷Ÿyé56lßÆÜb‘ºÆ4ãCwÙ¸½›Õ•EŒŠö+¥¬òâïkø2é–\r˜Ò­J›Kû˜°€tjÈÌä—©k¨%V]ÇÒü:ôÑ¡B%„eNLá+ÅÔ’¦¹-A>“!]\'_‰Gmj[ÛY™Ÿ¥ª6É‹Ïg{›C}kÙ…	¼h„hu#Ò­fnğEº÷<r»ª¶yô¾ „Ğ¡¬ùvCc-™l©ÖØ}h­]­ì=°ŸTuÑ¸‡0ªâaJ!*}ViyoùÕ–4•ò2Q\n™	PEœh”¦ÖFâÉÉd[(+ \Z‘Ø2$šŒ1tw†\r-y_ø>Û{›˜^Ì“nï$Ùº±[ı|ÿÌ=RN™æ–ZR{!RG$ÁKu#„áöÕË·îÛB}\0’Õ¾9<rö³{ìIœ»Ì;º¶#Q„¾Qv¬¥RX !@°†×kõuÉº¶¦¸ùf?–0Dc‘·¢ ¶Gúa™R ñK%fÆg8|°‹ÙùeNßÎ³k[›7·2tgŒÛÏ!³Vbï–4±xÇñ(…šñ©¶èÃIöpëâwéÙ}8—îØ÷ÍÎû\'ˆÕ6ß5ìü~_Üúå¯¿ÌÊØMê:7ƒ0è0 Ÿ+0|í[vìDjƒK,ŒÁ…VeT`Œ!bçéêiAëJ¯?ô‹Kb»)Ê¥2Ë³+„%Ÿb©ŒCl¡9¸¯ËñH§\"%Ÿ_\Z Ÿ/¹lê©cçÖ&Œ 5J‡”¦.`	…Œ÷`¹63£#ôî~èûuMíw \0„*¿:÷¥k§.¼ûèÓŠË¯õs¼£¡…Ñº7µãzºÒ¿C¡ÊEË(?À„%Tà£ƒ ¨­¯E« \"‡UˆV\nÇ‹#l‡Ö®\rŒß¹J*%ŸË“¨J‘Ë,#l—rÙ§£³‘–®6–§fplöºt–8‹ã:T×¥xúàc¸u»¼|†¶&İ¾÷K¢’˜~°ÆH¬ªáTàõ~¯¬­}{¸ğw¯ĞØİ€V:$jÒä\n‚ù©i?¤TV`Ù)+&GşƒÚÓÂ„Hããº)4Ò¶–C¡ei)—ê\"»¸Œ&†«#[¬bv¡DÍæG¾=†©ß‹°ìJ[İòĞJáy6±x„ÚÎ>d|AyÌÒ<­=»¾¯n>õCu†„á¡w¼ÿsãÓv)İfÇ#ÇyæËËjv	”°‡Üj¥•5<OSİXV•<PH‡ ,‡@ÔĞî.g¿ßÏÍ»‹œ}éûX®ËğµËøÄ/åY^^%³œAÉ8Cç™›áVÿy:¶lemqéx`ÙØÄãâÉ-[÷m:ŒÁ§ÿ;LKS}©¦uÇç„áİu\\ïü‡ß÷\'\'¾ùª¹ôú›8¼“ÿı‡ßÆ²+ÎPmc\r›û¶h‹©±)B¿€å¸`¡bŒ©Ìşx\rœş;úvµ²ÿÁlëë%æ9”Jeœ$4ÔJÊ+Ã8‹*Î2wï-M	º;j¨rVºG:š\'‘ô*…’cKÆ©ïŞH¤a¶c¸xâÏ¹y}Ü¨Øæ?±ïül@¢­§ï×}ßÏß\Z»71ƒ·Æ©®‹¢ƒ2…µåRÙ±)2‹+Ø¶	ò)–‰¤·ĞÿwÏ²©·iUÔZ›góŞ>²Ÿ•‘aff²,Ì¯RÓÙËøÄ2551ª»öáTu³²&8ôcáöà#!¥B/êQ×ÖJªe+ÒrïêYffrì~âgnõlİóë?Ò	!Äâæİ||×‘ŸÊŞ¸4È/ú).¾x\n£KX2chíî¢kcùœb~fr~DC=F)¤	¿;F,_	\n1ÊÇ¶4õÍD<ÉÎƒû¨­SSÓHˆÅâÂ*eã±HmBøš¸IWnn ®­‰t÷N¼ôÖV—™ŸœfÿÊzôÉ!ä#2Bˆ7ú¾ë7¿3˜XÈÓ½s7^=ç”ˆÆ¢„å2¹ÕUÂüb%æ#)fg³ókä³s¸‘Ø[s?F)¬HùÕËs3Ş[âõ“§ˆÄc²«ôtÔ18Vfme‘DÜ¦¶µ‡é±aêšjimŠÓÜÑLÃ¦CÄš²–™åÒ™³lyàXĞ³ëÉ_B¼ñ¶Ì	!Œí¸~ô=?ó«KAopåê]ûÒÿ½3,ÎÌ\"e/YC¢º\nGZ¨@±47’ìÌ ™\"/¾rËxÉFî.â%Ò^ä}}‚}ÿ;°¬®¬á9†ı7qí~@P×µ—ù©16ö¶“nm£¾÷^İA¦‡8uâ«lÛs H5íşUËvş\\TfoşÅ—}¿ce¶ãşwcŒ:ùü3¿ı_ş÷Ã:Äõó±’µ8ş–Ñøå\0×6Ô§Ó¸Ñ(¢Tâ\'>øCwÆ¸~mÔ$¶Ubq±é™Ql+ÏÒÔyjjS\\»:È¶M\räŠ³”ıñdœë¯Ÿ¦¼:A¼éÇ¨ßray_y™‘ı<ü®ù\r‡>+„ø½ÍIQiŒùéáÛ_üÖŸşVò±ƒiªª\\ì¿ÇÎ}ôlÙ€ã¸Üºx…Î\rMå\"h]ñU¸ŞÔXK<İB9Ÿ%3=FP*`´ÇE\nA¢:…ëEI4tIo+E17ÍÉgşš†ÆZ¶şØZ²¾ç3Bˆ¯üsõşÛ3+lŒ\0ç³ËöìWÿ`ãìà+¼ÿıG(‚ñÁqZ»[èØÔ%~n•0(¯KâJŸBZDR•.O)»€òËXMâ%ªqãõ8É¤W_\\fäêY†Øvà8ÍÛŸ\Zòb©çî—ö?ÒiqcLğwo]ûÄŸüÁï9]ñ=q˜TºšÌJˆcğ	¢ñ¶«L|‰ÊŒpim™ÜZš¦6¤´0Za9Q¬X3ÒI ,‡üò$—_y«gûÙ~à{ŸøA²¾ûËÀ½Ÿlÿv¿/ ƒZ«ß¼yíÈ‰¿şS+\\ºÁ–ivØIu]^¢\Z!¼x-Ò«FX6ª´ÈòÈUÖVtîyéD1ªLà+&î\\åÔw^afl†GßÅã?©š;7¾&„üUàÂJù·õcŒ<jŒù…¥ÅùG/_8Ÿ8û]f‡.!P47&éÚ²\'^ÍÒÜSSóØºn’Öú8¹l•¥–#İ´ŞCïdÏÃ¹xUúğ?€SBˆòÿï	`3ğ^ài­ÕÁ‘ágqf‚©Ñ!–g)\n„aˆ°,RÉ\ZZÛ[èìì¢¶©†æ@Hy8|üaâüŸ»ş¤ËÅss‹z\0\0\0\0IEND®B`‚'),('26','coin.10cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ/]Û8*\0\0IDAThŞÍ›i\\×yŸsîÒİ·—éîÙg€Y€+A$H”D‰-Ë±Y¶E%Nb)qÉ)—Jå)§ü\'±«\\•*[QhË‰*’ãØ¢©0’\\²hR¢Q‚H€ H€Ab\0³/=İ3Óû]Î9ùq›°Êe9†E)êªşÑ}§æô}Ïù¾ï}ßï»‚áËcƒŞª–é`ûnÕ©j××&Í!µs•Õ5§ÑòCÇë¯õL®d3¹ëmå¼ÖS83¼cê5)Å²\"úQşFñ#ºñ¾V}ãkóç> tı¨›tJ®l°µUce¥Šƒ\"Ú,-WÉSìqiÖš´#‰íÙn$6¯ïìîıÇ¾261ı!Dù\'\Z\0cŒhÕ«“­Úâoê£¶”\ZµšøÖSÏPYYEµà¦È—ò÷ã¥“[t:vØ,osíæ:›keÆÇû9rx’l6Ã•««¦8¼ctÿ;™˜y¬T,\\B˜Ÿ(\0¢0è¯®¼ñ	¡ªo·Ë…›o^åü‹/!ï:ÀÄıæqİ$H”Æ	;€!0ªƒÁ ›uVÊ›¼üòuÎ~Ç–¼÷3$²9n®f6óÃşø¾‡~úÓéLzıÿ;\0ÆÑ¬Wn–_ıt:ïíyıìËâ…§¿ÊôÌ¼óAÒ©¹|cşf!$Aƒc ´ÂhTP#–D…VÊ5¾ûÍ3\\zí*ï~èD²Ç¬oå/ßóş}bjçà³?ìiøGPİjdZ›—ËÖk¿¹¶¸”øú—¾ÈÃ»¸ç=ïÆK\'0Æ¡±µIo©BÆ		BtÖ`tÔSƒ1hÆè#FkŠv³ÁO|—¬«¸çî½œ:[ö³;Nüş;ùùßëÍg\Z?V\0Œ1ù¹Ù3Ÿ-•Ô‡¾óµ§™»t÷ÿâû™œ¢^­ct£mTè“Íç±l!%BZoı0£ƒø4ÀÄ \0Z«îç.TF€Ò0wc¯?uŠ»Œ²0¿Éª™yòÿîßÿ!ÄÖ€òJÉß:ÿx&k¿çkO|I\rå¸ÿ§dsµN®7Mc»‰ß®“ìcqö\"{Î £\0\'á!-‰o ã]ÖQH­¢n8Œ1€…V …JuøÚW¿ÇP1Es³inlô~ó=üÕG÷ìÛ»q»÷#oçM?×Ø¾ù…tÎ}øñÇşHÌìáÎ{!…ßª±¶¼ŠL\r°º²A4ÑH|ßgk3¢¼º‚Ñ\ZÒÁ`Åá Ì­SŸ\0ƒHËEHi»ÛFX	ÛÉğsÿô!d2E\'ŠÄdiíá§ŸøÃ/øífîGÀvm;57wî3½Eçá¯ıùãœxäßs[+kl–+„VN«C­²„í¦HX!ÅŞ4Íí6…¾^n^[@8‚8Ö… \\.ÈB&@8ìø;!1ŒV1N€´,„´ÑŒ±8vÏ†ÆGqÓi†zjÿ§ßùÏ¬”·So;\0«5±º|é“;‡ô£_şoÿYì¿sSSÔË«¶661ªßj“Ë¤èíIàdÆY\\¨`LFâ¹i	„!»»B8qrì¦)íøºL „ñÎKË‰OƒewÃH ±9rôéşQvL\rŠ„ÿÆ£ÿã3ŸşäêFM¼­\0¼tşÒñŞ‚øígŸüßbp´ƒGS]]¢åKŒÓ‹ŠB©Ù9=…\n„“GšMú†wÓi·ˆT‡ŞÑi–çßŠtÖ-@‚´»B\0òû®½£h@#,£\"¢HsøÈ4­ÈæÄİbõoüö·{ñøÛÀvùrÏİ3öcõµÙT»¾É{Şÿ0&ğI&SXR1{ñUŠC}8\n„E¾oËqY¼~‰Ş‘)PmvL°xı:ÂNtwĞ MÆ€Qİ”laŒêÓ½qâÜabØ\Z­CL‚	Q~å?¾šJò÷Nê¿<váâ¥·\0‹ÚG³™ö‘¯ıÅ—yèçf«R¥V‹¨T›467Øø\0^ÚCZn\"‰Á`YšòJ™±É2Ù~LØDÈ$~}³»£¦K\0-ÄõŞŒQiwÁİŸ\'â¼¡#Ğ\Zè(@G>ZÅùAG*¹ëè>²ı;94•8òşêGh\0æn^®óÉï|é/å‘£ôööÓª¬FšêÆé|u2mì‰L	T“¥ÒéaPãòµu¾ñÄŸ0sü~„é²AT	X ‚˜ø`T¼ë:ŒÙ¡ŠĞJ¡UŸ#0&bà´\n0Úà%^F²ÿà¸Üœ}ñ“Ÿûó¿\Zø¡\0Ønl|TšæèÊâ\rîy×}Da€›Dµ+ô\r\râyi„e#,AHÄ²mÒÆL§˜â½ş%úú1ˆ¸ÔI#d|äMÔMİĞèò\0h¢£èGˆ?û­Ğ‘@ÅåSH\"¿ÃØhV¦ñ¾öhíâ_ô\r@½^÷Æ‡Ü_=óÜ79xì\0–åú©Q&ƒ4Iªå\nBXØ–…RqK)ˆBŸPCj¤1ŒŒâtY 1*ŞA\"ts óThl”Hræ»§»ÅÁ „ÄtK§\0¤í€ôèt\"–ç–Xº±&BëˆĞ÷çÈñ»ØXºö««5ïÀVuõ©ão¼ô\nûÏ>Zæ¸zé^Æ¢4˜e«ÚDÚİZHEŠN«Œ`yn–ÒàPœÈbbß´°Ç¼ñq”vUŠÈïĞ\\¿Fuu)>öÚÄIOE±”p{n‰ZµÂÊJ…R	eà‰?{\Z­`H%`pb†‰şhü±ßûİGn\0cŒP\\ŸŸµF†{H¦ÒXv’öæ\"–Làå²l®Î‘Éyñ\nKz´œD–Jµ•HS«Vb\r â7ÂîÒ[Ö†HC§Òi„íMü­køµ%Vçæ)ö£¢0®Z#mË!jm1wáÏ}ã$7®Î±µÑ›Oqïñ½<şçß@\nš¤{ûİ9huV_ÿ ù~9ú·^ößõåWŸùnéÁ£…{_»ò:İp2øõ&À-•X»ÉĞ®»©•ñ•å&h·7in×Hz)\Z-Ÿï{[Ú‚°@«W‹W?Ã™ï\"é\ZîàıC½HÛÅhÅÊJ…İ‡övCÃ`929Lcí2µ^=…G~æ^Üd’DñkW¾Coo/a±0·ÌÈÎaR¦ÃØìçŸ¹÷±?yª”ÿÁ\0š›våêÎÙ‹orÏ;¡£\0épİU¶Ö·ØuàÍ•×±R#H™­Ü1Áæú\ZéBbdèl×–C¶§€QAlzÜÊôÇ<ÂÑûï İn©Áú«X‰4Rk¶·\ZŠŒÑHia¥Æh¬¾NĞÚâÚÕeî82¢H‘Dc;IĞ3û&¸ôÆÃ£ƒ„í\n£{O0˜ûëå×¾6ıƒ\0ø;C £ÌÑòÒ\rY÷5n&‹Æâµ—Îrú»çØuğ\0®›ÂNd°S}TV–ˆÂ€V; ²º€ãd¨Î¥³µÈåó/ÅdGÄõüV²&ŠĞQHÂxé\"BZX–M)”ØÒB+…L”hUçim—iÔ[ÔjuGn)HƒÀ²-„m3:1Bc»W‹°M²0À±¼TÒ;z[!PHª#+‹›ìÙ3\Zl×ãà=‡9öÎ{@i^yş•Õ¼ô5?F«ÑfùÚ›ì=zÛëkäJ²C{¸zù[(`\'–¸FÅ  b“D€ÆÁ¯¯Ä®‘´¨omÑ7XÂÛqCCmùMìD’k×–Øx\Z­5JiqyŒ#-2¹,\n	*DG¡ÙŞ~2s¯¹-\0z·nV9»1xÉ–Í¡ã\'è´šèÎõE6¶\"Ç§™Ÿ? ·”fùÆÅş\"¶åÅ,N02ÖF ŒaNc¤…\0æ¯/±cr&ì {†Ùš¿€“Î\"Œfm}›ûèÅo·â”bÙ€!ôÛ$³„„~D¤4„Fù‡\'èŸ¯ï¾­* t4º<¿L¾¯¯{ÒDœÈº¥Uß U¾ÂÖüyÒÙc£yZ›k¤¼““Dn?o¼|d.×µº¢·¼O0\ZÑezF´q0Q¤—F YZXg`té$ƒˆ°YÅul–×™˜$#¢P‰£VŠĞï`ÙİğÑQ3GL@qxR¨ÑÛ •J+åZÌôìd—šF]K‘éÉ)M‘¢gh\ZËëg}y‰B_?n2Áü¥7¸û§ŞËØäçN>V¢kué·T/B£#Ÿ°ÓD8ILÔA&SH	2Q ¶r0ØÉW®.195JDË&æ]aØ!ô¤´ê5</JÅC·±l›vÛ/Ş\0¿Ê÷$q’©xÇ¤ƒ6†(òÁ¨,Kã$=¶7VPÆ%×›Ãu’XÒbúğ,\\½È×Ÿ|mÉ.Õ™\\Ìøtlr›¨³e;X¶Ãìå9¦÷NÄ!bçiTpR¢0Â„©¤ó7‘X‰,~m!$Ò²X[^£Ô›&Bt¤0Ú Œ¢‘º­°¸¶M:íaY¦+FA Y™¥ÙjĞ“ïåâ+g(“/xØEc»A…Í«7/“-xßıÆŞ¿Vçi»¨ ‹;O»r	ËMb¢€«—nò®÷İ°“„Í2F’^šòÚ:…R	cˆ \Z8^/Õo’ğ<´R\\¸pÃ3ƒoÅ\Z›P’2¼=&è%sm?ğQ*ıN«Éâå—ĞíeR²	6˜Ş³×24\ZÛÌ^<ÉÈî½ÔªÚ•ë4+ËäK%´ßÄ‰Öà‡P­Ôyõôé[jP…ízË¶1:Œ¥´Ğ “Ô*«HËÆr“TË[ôõå}£5Q¡µÁN¤	šÛ¸^\Z¿Y\'hu(²¥ã`4a»—tÚ·@¡\'Wñ²Z­:‘’,İ\\ÁM÷¡Ãüà8™şIR=ıŒLäÆÅ79şĞ»\ZÙ‰D‘ÈÑ?6FØñÒ£‰\"›`{ï>õevïŸ¼Õ	Û\r,ÛAHI}k›ŞR/BÚØN’°¹‰›L\0šµÕ*ù|ª+…\rQâ$<üV8‰+Kkd³	´ÒhÓõe’­ÕEáVn\0^˜¤V©`Ù_~‘şáAìDË+R^)ãë</<óÓ‡g Š0F°µ²€“JÓjûD~›êF¼nsk‰Ë—–Ñ¡&é&ã>€%l•q]Ûq)¯–)öåÑZ#¤‹Š,+KõF‡TÊ+T¤BÈ–hTWq›°Uçô©‹œAk°,„AÚõí\nF&o€Sç®ŒŒĞX+sñÜ9z†Ñş6éŞ:ÍÅ‘q®¾ô,÷ÿì#Jı€ ¾¹ßµÊFö!ˆ4ë+kl”+ôl×*xù<¢[»‘)‚féz!Y™_¥¯¿€ŒÑè(DÚ6RJ|¿Út“[„e»8é~}\'™bs³—tpÛ¶R\"¥Nš•eJuõöä°	Ïy…Aç–)ö	=ô\0ó³³¬®Õ¨×;œ?ùc3ÓXÂÂrbŸÎ¹ì½ënŒ¸¶MÿĞ\0öY|ó„¼ûıóĞÏş4/=÷<íF…­°“i@Q¯7I%®¤°Dlƒ£‰BMÔm¨\nË\"•ëA)°dÜS8a‰=ÓC Ä-õézYÚÛU,âGÏİ\0ÃŞöÙFCkÛvÈ÷x¤M2ßC£°~ó2ıÃ£¤S),ËA·ê 6×6â0X_\'RÍZ“\\_Ÿ@«Då³ëƒ$ÓY¢ ƒËvi7š\'Ñu‡&l!í&FE± 5–%H÷ía{åFZ¬Ušˆ°A>ŸÅ²í.ÅÖ¸^ë7.Ğì½¼ÁÙÛàÆVáJ­Î\ríæÒëW0Z102ÆÈÄ8ÍééØÍA »W­[%Ó¨›«ËxY/öó»BHZ6Y/°st¶×°„`s£J_­Akƒò7qÓ´R(÷\r¥)$^O‘H	tÔÆ\rgO]àÀÌ(Zé˜]j…m[$òÜ¼ğ\"É\\~.=zèÊmğá¼kãò­SÓ²ğÆef_òâ7ñ2™.3ì:üšîÑºŞ9ñ›q¸ëÙ	)°‘’„­5œd\n!%^:EÛ÷cU\'íÚ&F\nB?$\nù|–(Ò8I¯4M£|™ÈØ¼ğ½×9zxi»X‹´$–íà$Ó(íÒØ®ï:õè¿üØÆíU!Ì™‹õ/EÚVë5M~ —S;ÛÍÉèĞÇM§AÄ1\n\Z‰ŠûıZa”:¸åíËÁ?4·ë4WÏa§Mä·ğ²F§ÆYXªQk„Ô«UÚÕu–×¶ñ;ã»FY,·ñú§hn.Ğ¨Õøö7N³o*O:›ÆM:tèE`a;’Lÿnn^xâ@Aùô~éï›!°Ğ…ıÊÏ?såõgnŞû®{§yúÿìW†°¬·º8_“Ğqãâ-cgàxğA mLH«‘âÓÏ¢Ã6B\n‚.‘I¥SİÄe¡Â¸+\\_‹¸rm™ØÇÆZ…ÅùUföO -‹¯¿ÂÒÂ\Zk+eîºc‚T&ƒÖŠD*‹±‹,^|“ı\'©qf_ùSš&}ó½ÿêãÏğ±ÿxû¦è`)×º¾Øşüğà\n©7\Z±ÊÒŠ­õE.}HtÚ-Œ\nQúû\Z Ã,Ó;<Lïğ(éB‘L!O®XBÚJ:a4èø4İyd7‘`ßŞúKi^:ù2§¿ı7Ş¸B>cs÷ÑİX¶…\nCŒ64·«´7çhûŠÌĞA–®\\ÄN&©ø}ŸÏ÷µş>SÔş{gìÏ}çåå;qçèãòe>ôá\"SÉLš‘©İ¸E~xg<÷£CP!(­lŒPZà¸IFvŒ€1(@·Ô© ‰t’D¢µ½—í¡¹U!™É¡ULe‡{Ÿ£İj¶[]S5î&iLÜ;’¼;OÆÊîæÕ/şƒ;v-NÎ|î‡jŒü‹_~dmq¹ş©¦oëBf¯_Å¶œD†tÆ#›k«4\Z¸~«0N‚ÂáÄùÄ¨nßÁr]’Ù\"v*s‹¬H\'ËÂ\\™òÚ&ÉÑnG¬—[¸¹¬W-ê_ôÒ	S”Ëu„h£±¤…”Û±qnÂ&3v”ß|‚‘‰Qí‹O½çŸ|dí‡î\rçÏ|na©vî®ûòÒh>‚KJê[®¾zt&AïĞ0Òqp’YPşßxÿF#…ÄNõ1}‰“O=ÍÙçN²xsòê:ÒNRÛ¬â&<¶+erÅ\"&h³²\\¡¼z/×ËÂ›çİ½›v`ƒmÛXvÜ‹´m‡D*EÏğ¶ªêåkÌÎnŞıÿçîÿƒGd?}î^³úô·úûÜÔ×Ÿ=Ë?ÿ×¿„ˆ|2Å16×—Èô¨¬Ì“L:¥H¥“„Atd¶€•æÍÓÏ!Ô6Sf0J37»JONÒ¨µYš[ ¿/K„lo5Ø1>Àå7æÉåx™4õz¡5½Å,¶ë¢T„cÙ c‘Ø‰7tßù‹?ÀË—ÚÛÎ¡wÿì/|äÔÛ60µkê´ğÆwa±níäËO<ƒ—Ë€\nĞ~‹N³É¥óçql—TO	i¹„a\'vÒœ,%Ö–ç˜œÙ‹\n5JA>o!İ^¡„ï4Úá¦ŞK»Õf×şiJ#“vÜEÂĞŞÃÌ-n³°XEJ‰tlÜ„M¶8H²8Ãé\'ÿ€şá>Cjçï>ğĞC§ßÖ‰ÁRÎ8ş3Ÿ\n)=¾ºÑ6ãcşâOÿ’@	™LŠ™ƒ‡±.õj…ùk³¤silÇÅr2,\\z…Áş”î.)$é\"ù¾!jÕ6Gî¹)5;&Ç\"Çü\\…Bf­ÍÚµóì¿û8—/¯20˜Ç’nÂ%‘téé!3v‚¿úü(2o^‹?ôÀ‡>•ï2o+\0\0=¹öO}è×~=Wš~öÜ¹ëŒôeøüı©B/Bh‚0Öøë¤ÒiÚ:sW¯¶Ê`Ù4ÚAÜÜ´b½ßjtó,/ÌræÔ¤°S6®Ÿ\'Wì£î{lm,Ğß—ÂÍ±¹zƒ|OŠñÉ>’^’Lq·x€W¾şEÕ¦\r?û¿ş~=_ìkÿÈ¦Ä¤tkw¿ë?²kÿıÏ{ù²Ù;ÕÏgşà²²ZÅq–-Éå‹ô–ò,]¿—½N…Z­ÆÊR™v\'Ä²Ú)²µ|ƒH[Xaƒãï8Nº§„&…-Ccı”—®“ñq½\'I&aHe<¼´G~d?Êâ¹/~Ó)›âØágï{ï£I¤ÒµÛ ä_}á?{áÌ³zğÄ$Ë›d‹ı<ôŞû¨,­QÈ;´¢4	QÇr\\Â äüËoĞ¬5ñÒiTĞfÇîi®¼v™êú\n¥Ñ1fH­ºÌƒİÉW¾t’ïßGn`’³§/±ºx•şÛ_Æ-îes}‹“ÿë¿ÒQÙÑ{Ÿüà¯ı%o9Çífæå“õ[§¾ù•ßL:íÄğ`/•ZÀÁcG8rç•åm<l\'‰Ö!BZ·†$‚Ğov\ZíQ_WQ¢®í™H8„Í\ZN¦€[£Óò9ò{Ô–¯“šòMñ¾ß¿ÿá÷ÿ^O¡÷Ç;*ûımô¹×~æÉÿşé‹¯œÜ³oWŸJsm±ÉÑw2µw’´OÆjÖ\ZiÙqOCGD~“(h#¨ @Ú6QÏ&ÒY„tP2‹LôsåÅoñÚ©çé„¶ÙuäËw?òè\'ŠÃ{~à°´1FüC©ß–qùN»Ñöä7>ñ­¿~êã×.¼P˜Ù=ÈÃx™<®mp½Å¡zK½d³i´˜(­Pa„ñ|°´ètnº€í$Y¼t™›o^`enLÆ¥™Ú³9¶ïÁ?¾ï¡÷ıdŒËÿmÄ+åµÉ‹¯œù³ÏóÑ‹g¾SJX¾\ZÈshÿÃH7¶±•å046I…­*él¯4L§ºÆ•s¹9¿ÊÜì<	Ñ$m=ğğÆÌÑûïİóXÿğŸ¼&ş®Gfæg/àåSßşÀù_<º¶p­TY[Ä–Š”— ñèÍz\"Zí€„-ÙªûmŸ.{öìfï¡CÙÒøÙİwœøÊø®™ŸüGf~ĞCSZëáåùÙCÕòúİkË‹‡n\\»2YÙXJDÛ¹ÅÕ²£H„CCcµƒ‡÷­¤{G®ç\nÅ×\n¥¡3;\'w½&¥ü‘?4õø\\õŠ!ø\0\0\0\0IEND®B`‚'),('27','coin.5cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ09Qà+\0\0²IDAThŞÍ›yŒ\\×uæ÷-µ¼Ú»«»zo²I6W‘’(S‹em´äE‘#)£ØãÄ\n\'¶\'\'	‚`f2±‘È\0™ 8±1^åŒ)‘bY²vŠ)R¢¸“½ï{WWuíÛ[î?ªI	ƒÁŒ©ØP¨ªW¯\nu¾ûs¾sîy‚Ÿâ¡”@¯’r¨÷(§¶×kÔìR®ShFTJÏDy†¿¨”ZöĞ¦JÅÒùXkÛÉh2u˜B¨Ÿæ?£•jAÉ¤ç<äåW®Ïœm~ó¸X_^¤äJæ–ÒØƒò\\ZÃ,ú[#tõvß²\r_\"¥T´5»^rN§z7?n%ÚŸŒ„ë?\r0ÄOØøÙ¨|Î+¤Î_|#yâ•—974Aİj!µc[HvöÓÕÇ²|àÚÔ«5J\rÅâÂ<K³s¬Má•rô&BÜxğN¤ĞX÷µe4+ù}ü®kS?w\0(éµI×şİÜôè#Gşş¯Zææ°{yÏû²÷Ú½D¬ H”\0İDèÊsJ¢¤D(4¥<„Ô5––yıĞQÒCÜyÃ5tíº†ù¢\\×“[¾ºuçö/Ç£¡µŸ\0ìzõn\ZÕ¯ÿÇ¯mö‰§ØõpğûIúvz©šÏ?Ñæ¢i€¨æC)¯ùc‹PÒ¤ƒ0L·ÎkGO052Ê­7¿+c>]íÛğw6÷µ¿øï€R* \\ûK¹sG>ÿÌWş*PêÚÎCŸú$Z;=S¯aF„Ú{ºmAt4¤‹¤Bå”(Ïn¾÷”]C)…+‡#·¼ÈİwÜÄø|¾.[şæ}wİş\'BˆúÏ\0¥T·ñ÷cO|ícçÅşà¿±½İ¢¶0ô$®cˆ%¶´£[1ŒPÍ\0İ\0Esõ…Ö|–—Wßn2Bˆ&+Ü:h>”ç¢œ¸6B(2¹?ü×g¹é–›q…PËEíû7ğ#ŸMÄBÅŸ	\0µÂz‡Ïo>öú?üÅmÏ¼1ÄşôÏaü\r\Zùç¢ÃèV„DO?z(¡™fÓ`¡’M°Ğ¥”tY»ˆiúğ…Â(İÀ-®c˜~\ZCKG¹Å9t]\'Ö’à‡/!\nÓßåÒ|åÈƒ|tpKçÊÕÚ£]¿W\"†OôÄ·şú¶C#ËüáŸüÜ³/°>=J1›Á©×šN0\Zk;Ãğ°‹ëH»ÖÄ[3K5—!=5ÂúÒ<…õÂ_ œ]f}i_$†#5VV2¬Œ’_/\"…Ffm¯^ãC· \n0:ŸfOwğ¶cO>úèøäBä§€ô<¿’îßÿà»\\œå¿÷[äO¾ÀêÜ,ùì:Ò±Ñ?ºiâTKÈz·˜¡¶:g„»x)4\\§Áä‰WY§à™äÊ6™Ñ‹d×ÒTê6Ê’¯Õ?ô†O§Y![©SÈeIOLá–òH×Á³®İÚCwG’¥ŠÇµ=ƒ¯?ıÏkÛ¶ÿ§âBæ‡Ÿ}ì‹ÿòüQíô{ÔÇNR÷ÅéØw^£‚+İÀ­•Q®ƒi˜ø¢1ü‘8Êu˜bÛŞk™9y”pÿ6:zûÁu(®g‹nhÔ×3]G\'p*%ZQjµ\n¥l¿OÇ©T°L&À†Q®ƒîóqafŸeöÄa¹İùÅG¾ğÈŸşDPH/Ş²>ræ¾úµïhüáïS<„JvÔ5…4~ŸI(`KÄIvõĞ¶i±®‚‘º&H¯,’ìêE÷(®.Ó¹i ü„ Ú’$ÒÒNe-‹íByu%t–ÖÖYÏç©–ë¸Å<kã£H-ÈÄ…a¦ç^ƒº+±u?¦K~e‘ıø°Öyíyæ•[~b\0”óÙX@W_şæ_ü¹õ©?şL½E)½J¾PE×À­ä(-Î¿@ee–âÌùñóØùJJPŠùé9Úº»@7Ğ­0Hyå÷‹™4®TTª\n+sø£QÂV„_grlY/Ó5¸“Á7Q)•Ü»‹Ş¾.¥Sw<Î=ıËÏ\r{·11<Æ½÷¾ßzé»_ÿòk¯½û‰\00õ_Ÿ~ş‰‚»°£Õ ’Ë‚tIì¸U-€§¤td(ÑL‘Á¾DİŠ€¦±¾¶JGOHE~i•èdvf¶™tƒõ‰‹ø#1ªKS$¯Az•Â:áDŒ®Ş~òKh†µRËe0£-˜á¸6kÓãtîº–†Œ¾ñÛ¶ö\"bm\\wo8ùÊs¿şo ¸ºÊO\rÿÁ·¾ı8¿ñÙß 49„S­P«ÖiÛ±¡	NŸ9OUXd“‰\\ƒÙlƒé…,C#cœ8ñ#Ã£ônÛJ’H¥†Îèé79øÎ¼ò#´H+“o¦áºç&±k\r–Ç†ÉŒ†X]ZA)Xfnl§Ñ ,52“£lîi#’êâäK¯Ğõ²ødƒ~âL8üÏ>“úÿ`ü¿>ô­O¾öØ·;oúè¯ V\'‘R¢&‘ö,Ë¢R´I´u°cÇ J±!n$x^Sñ)¯¹ÒJ¢¤BHÉ¾ë÷#¯½×m`h (©èß¾å:h\ZHÏmº‰ô¸ùŞ{‘®Kkª;ÿãÇ©–*x™yÚû7Q*p3—hokÁ´˜Iéï ZûØÙí<ûìãŸşâ]1 ‘[	«ÒÚ§ÏŒ‹÷à.ê™`&±ÁëPN•…yzwìA)µ‘O6ô½¦7\rPª)|.k~ÏEÚupê˜\0®DyxštÑàyhJ 	!4tİ\0ş E9“A¯It÷c‡Û(e2X~î]{X±}4Æ/àd—Ğ”Ç‡îû°X¹pêÓ_ÿæÂï\n\0wÎ<¶9µÿfŒF‰Z!‡çyx\nbıÛ@Ó)d³´$“ïPy4•ŞÆê¤ç5B½\r\n²yÎsÁµ›Ï{E\"hHÀ	Ãduv†€!ÅâÔ<Amf˜dª©›PÍ³rê¡ é‹P[£ıšıÄ)nÎ-Mßù®\0ÂøØ+Oÿ€÷ßÿ^¥Œnú°â-øâ­ºN>›!ÕÛG#»D5»L#ŸnÒ_ˆ\r}/@yMb\\a Ë†jZózMMGI·ù])µ‚±:5B4ÀŠ·P(×pV¦	%ZĞSdrUT!Ãûñï8ÀÄÉ7hdWÑu“›nÚœ9û±«À+çZêùÕ÷eJURí	ìj	,•ê!Ğ¹¡øb-tîÄ´\"ø#	¤ĞYœbnìßLƒ´ç\n8l°D5ÿÂÆk¥\nJ\neøX¿Dkª(Jfm­–\'#ZºIOŒ’°ô¦k,–/¥V©€]»Ê¾ƒwS\\œ~ßÏœh¹*\0$úÎôÄhgçİè^ÃÀê\Z@	pw?šé#kE¡ûĞ\rƒ`(B÷–í$»û:s†b¡p…Ïê²k¸ÎCŞäeÊ!6bˆP\niY9OK{\nÃ\n³º¼L\0+ƒH’ô…“Ä-©À¿é\ZVF‡HúlR­Q\\_˜ÒÜ8­ƒû·sèÈ;¯ÎãÀâ¥Æoa`†âøâmh~‹`¬…R¥ÂÔØ0S£Ã,-.\\Y1¤Ä\n¹îÀÌP.PJ6ı[Ê&å/»ÁÛí$”’Í²Ğ\rÃbáì1Ú¶aD“¤g§‰š`Ebx8é¡Ó$;;PBÃìdeø<–ß ê!tÍ{™}ë8n.i¥³»ÍhÕ®Rî\ZeÓÀ\0 ĞÃ1´€…4~úIÎ>?!S®T9uô++«i’»w1yêx³á!D ÏÛXq…rífV¸œ!¤‡Ğt\\tÖgFèŞµÍ Ÿ^&hê˜ñ$`}ô,ÉŞ¦«´nbmäÑ€†nš(©˜;õ…J·°†rmvìÛËòä¥½W¥„tí|¶T;‚¯™ø[:¸ñôšF h—.bç ‹ÓÓTKE¬H„ÀÑsi<·&ô·K¯\r] 6b„ Ù¦eø14xG7Rih‡\n2¹²Š™ŸÇiTQÂ¤I- î±Ö6„’Ô­6ÖN&iˆt´PS~T­LÛæ­$ÎÏ^ê¥ròù1|f“Æ\nCH¦Ş¤ìeFC:]ı›Ê»r^ñT\'«ÓMà²ñ‚Iˆ& B€€@·Z¢º¾‚’N1KeišÉÉ\"á0‘P­^&d…xáÕ7Y=û:±dF @-ÚËÊÉÃ„ÃwÜGÁä—‘2áhœzİé¹*\0´b˜€†ĞšB€Ö<×4\\lB3@JüÑJ6•Ÿ“-7Ú\\r#38ÊĞÍ@ù,D õÂµQÕ2•\\§^AÇÙÒÓA[P#\ZĞ°9:{û¸ëÖXZ/144FA†(\\8F¼5Ãü¥!¦G\'ğ ¤‡–h§^©´^\0š ¨&p¹Qé „Ö|\ro÷óšú÷ísŠf*SMƒ\\6‡6ó¼R(·ĞÍËu„/€fú¡Q¡º¶Hzn\Z¡<,CĞ¨7°×W¨eW†‰W«’Ú:H)—¥QÊsÃş}ØËÙç$`êèf€Zrù3GÙ3ØƒÏïC¹.>Ã@x^ğêt\0\ZTÍ¨­û›\"Å®6Ö´¦ß^6|ce/7!DóMgvf–M[®4A<§ù5İDé&H—å‘sØRLµáóä—æ±Âa\Z¶ƒ”’ôì4\r	ñ®^Â”Â³ìÙ³ƒùõ\"ÅºG%ÜÍâ‰C„[M¦9ffñ\\l%®NÕUúuÀC6ÊÔ³+xv•Ùi\\»Ö¤ïJzW„ŒT 6üİó\\„‚@(º!]”Üˆšf!]²3c‰!SÇ¡°8O¬EĞïÃÑL4€Ø¦ˆzåyb	„n é·\\·‹\'_}‹¥Ã?$•áß´ƒõŠƒ:”8:~¿^»*\0„®g1}(é!mV”Ö~¦.m.¾lêw¡ 4”¦£]ÎxšÆÅ×²í¦÷¢\\ïJA$4­¹+¤›(·[Êaú|Ä\rY/ƒ¦á¢ãæ×hØ³³øMƒX(€²kH)š&4L+„]¯¡G[Ø<ĞÏJ®„íxØ¶K]\"\0=¡’ËbıÙ« ô-$S)Ò«—{õÓ0Ñtc£xq6bAÓj…h‚¢är9f&\'Ø:¸íJš{;N(Ğ\rd­Œc×	YAÜJ»V£°¼Hzvšš¤Q.Ñ½i¡H_4SÊmœÍ#¥ÄoY¤×rìëKrjr‰  8tšâÒ5ÇÃ“™Ÿ#\Zµ®\n€•tvlp÷vÆ/]j*³jeÃå¡–vÖ²Ù+\r%‘‹pê`ui‘çşñQ>ô±¡<‰Ú¨|.·Ç„¦!4Çn û-¼F\r¯ZÂ)ğµ¦Øzó­´D-„gS(”šå3\Z¥ÕE<¡áº.”(×aun‘dª`(ŒçºÌÏ,³¶š¡³Õ¢£§J°<9ÊÒjnìª\0(Êç;¶lcil=hQË­P+—A(:{zğ\Z6µJe—PNá6Px¼üÃğÖñc<øëŸÂ9^èÍ\0¨Hé¡„~%XêÒéQ¯U‰n¿_ €¨W°+%*Åıı()©g›ûK³s4ÊE’å‰	ˆµÒ—P¨ÔĞ5Áj:GĞòú	uö5mY\\¤o`àüU)ÁáñÅ7·Ş6àÚéYÃk”‰vö36<B½˜\'šLG¨Ö*äó.•bÙÉ)Öæ¹õ÷ĞİÕhM—P\n¤İt#BÉæ> òĞ|”]Á-Ğ„@Sƒ±ñ	’mmˆ@Z¥ÂúÜ4ñÎ.4½ö“Ï¬â¡îŞ„YÏãÔØ•2`¡:– ­»kó*óc4\\×š[~óª\0HvtçëÚ²e\Z½Ù\\‰öÖÛ·o¥áJVçY˜£P(cèĞ±ÿÖ[‰ÇbMšoÄ!´fFpí¦ï_.…Às6ê€j	PZS¬L095Gog®ë²V¨Œ»ŠeBñ*¥jF½DK{Š Ï ²8M~-?à#“YGÇğ<t“`<¯­—‹O?F<d-ßõÁÏÿÍ÷ş×À½¯_?ôÒ¡×Ş{ß/|üÅgŸáW~å9øt¾Ş>úúú›Ô–î†8Ò›†+Õld˜>†ÎĞÚİK ¦XÈáS.¾@\0%4ìFm#Gç2YŒ–>+Ì¾ı×â7tj™evö§ğ”ÇÀîİ¸èD<‰é÷“™\Z\'·¸H!_ ^,á‹Å	›zü:ŠØÀ.\0ÆÎC3¯İÿ‘;Ö¯º#4>“ù¾ŸŸ¦î4ŞŞØD½£’uš:@y~­¡•¡ÓD,?€R.Kezá³<tİ©¢B×ÑÃqâ¡\0Şú2>SÇ)f1ı~t+‚W¯RK/ád—É.Ì+iïHÑ¿w‘pn¹Hk‚ZµNny…ˆå§µ³ğ¶ëH_8A9½ŠÖŞ÷ıw×Óı‡:9}ç=wrøù6ÊøN[¯Pu\0²)ttå‹§ÅcD;7‘Y˜£¶8Iû¶]`Å™ë‰Ds·H5ªHObÊÒ±Q¾\0z0Œf˜H×¡¾:¬•Ğ\r¿©¡{6…µæ†‡8óüóX¡ J3Hh6SI»eÒŞ 9¸-ÚÆ«O<N²=9mµ¥½+\0~ó“)/¯7¾–Œ·ª©Kç©{á9Í~¦7]@Ó®ôñ<Ïcñ­£´vvnëdufªY’ƒ¸ºŸ™ã¯êîÄŠâIE©R£œÏaÅâN ù‚H×Aº.(…áµ`-\Z‘X„ÌÜ<Á¾-$úúéÛ¶•r¡ÀùU›ÉÕ[Û$:ÚIŞt/S/=ÉR®¢Êïk÷}æwËïzcdó÷~süÔ©å?xO|ãÀğ¡ÜFsŠÃ­£T3²{FˆÙSÇiß¼	_$ÁêØ~Zú¶á“¥3Çèİ½İŠ!ıaÆ½€_Eh\Zë‹s¸ùrsÓ¬M\n)U³XÒ§QG7B©,·B´­é‘QFó…L\Z±²ÀÖM)¶Şu/ø-şõÛÒn™Ë}üåoş›v†>pûu«kşî¿,,­‰·1<>±Ñ²nnZÔ—åå2ÓCôîÜ…J°xö$!Ë$šh¡Zk>s”­ÛĞM“†„Ù£/°íúëhMu0½˜&’êfj~•r0k%˜¢aÛàÚ(ÏA¹J*”çQ.U¸8¾Dºl#bí”F.pìÄnŞŞÃµ·ßBìúƒùúÿ@ÇÑâyç=w¯ş›÷»¯½åScóoİ°w;/ÿğG8Òk5šÁÒÔ8—^}‰dw?šÏÏÌé´v¶ŠD(Umr£géÚ¾ÍğSwaùÔkôîŞƒæóSrMÂ<¯=ı4]± ›Û\"×V©éV²%¦Æ\'º4Â™ÃœŸáÒR’ÒÙÜŸ¢­‘á­çãÙÓãÜ¾¥‹×ï¡ûƒŸ }îu^zéÑè[›nûğ7~bóß8zËÜÿôâŞk=õÔ3|ú·?‹g7(eÓè¦-ÒÎÒ…“nîB³âdó5\ZóéÜ¼L?EÏOqè$Ûv „ ì–Ş8DßÖÍ¸RñØcOÓ•ŒŠÄÙ½css+lÚ»—Rv\r…¡ÁÈés½[)z“cL¤óÜ¶©½×nçÀgÿ‚qşô7fGOGµıïşĞ¯~âõŸè€Ä‰Ç¿ıÇ«—N~qÛİ÷ho}ƒûïÿ0–a€aræåi8×İyª’\'?;A²\0İ$W•4ÇhíîEè:…š¤2uÖî”Ğ±­F~ô#“œ½8ÁæTı½tö÷!*9\Z•*~ÓàÍ…RÓ8qü4=±ûúÛÙ²}×ÿÊgğwmå«ÿé³ø\r]vlÛıÅÿëÿ±$~l\0<Çóô+_?æáÿÃ/süèq>ñ+R^MGiÔêT*UF^ï>ˆçy,,ç1V\'HnÀˆ¶²º^Å[¢%•B÷(bú•§éßÜ…]«±¾°È±Ó#ŒO/‘+ÕP†fx®‡!½–D˜öö8İ›zØÿkŸÃß1À£ÿùó¬–jlŞú¿ô×Ÿ6M½ñãÚeü¸ê¦ŞÈÎıv¹\\é>üO¼ıãçÑoÿ÷ÿÒ/ •F£ZaâÂ9=}ÈD?Ã¯>G{H\'¾e+Â`vvsm‚xW7fĞ\"c›¤=MwG‚Z!çzè¦ÁõÛºéX\\ÍSª5Ğ¤D3M,]ĞšZl¿ş\Z¶>ôƒoışg(j~¶¾|àã¿ùÛWcü»\Z“[í8õÔ£^:Û¿õ9ÿè9nyßÍt…}øœ*#csœ~şy~é‘O¡b]¤O¿†°k´tv ›Œ 8rŠx\"J}cÓUÙ6ëÙ¶cS­6Èe\n”ª6>SÇç3±‚&]=)¶½÷6:ïzˆòòßıó?CDHµw¹ã“|´u`ÇUÉ½«AÉj~=zêÉïşı³ÿüÏ{àw¾ ÖVWğŠë¼ïö›©e3ÄÃÍ>b#—áÜ©‹ÌqßGïGôìdòõW¥!+€k;x:•b‘Üz‘F¥JÃöÈÊB ¥\"òÓŞÑÂæ}ûè~ï=˜©-Œıè	¾û­GÙ´¥OÅ6_óı_üÌç?J´ül%ß9*ûêßûÒË}ïó©-[÷<ø\0ç¿A{ÔdÿMïÛ&¿8‡pj†®\\f–ó<ÿÄSüÚÃ¿HµZoæöõ,NÃ&»’¦Ri ”Ä\n˜4l—îvRƒ;hİ³£s€êÊ2/üÏ Óp±ÁúÖ÷Şõ7wıêoşìGeßyŒ^ºt÷¡G¿ş•Ó‡_Ù~ó½÷qûÁ;¸pñSg ¯ƒŞTåÔIÏ-ñ®cÛxv§V§Q.QÎÒkD˜&ÑöÖôÖ.Œ–vìÜ:g_ü§Nœ$’ˆ’Ø¼sôöòwúw_÷ï7,ıÎc-½Ö6vâÕß}öñ\'™½Ô²wÿ>îûèC¸ÖVÓè®M,%aYf³.Ò“H¥š-x»«Ä„†Iyvœs¯¾ÂäÄËO¨wëú–Ûîùê¾[oûr4Ùùó1.ÿÎÃ±í—Ÿú—Ï:vôác/>›LDƒÜ¸ÿ:n¼ù&Úº:h(ÓGMšèH\\!0ı&~Ã hêˆZ…åó§gnt„bÍ&°åÚı™äîıß¹ãş_ş;Ã0~şn˜ø?o™)Uê-k3¼ùê+M;sıø¥­Ëé´0œ:ÉñDŒdÄ\" A£V£b»Ê5¤cÓ™l%Ø–Rö®lÏÎ½§¯}ß§:;ŸôYáŸÿ[fş¯÷AoziißØ¥‹ï©¯¯íÍ®­ÔªÕN\\\'j\nLWJÇ\n­µlÅZ§‰äùÁİ{N¶wuıLnšúß÷Ö,£\0\0\0\0IEND®B`‚'),('28','coin.2cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ85…XW\0\0@IDAThŞÍ›yœg}ç?Ïó^}÷ô=÷­94’%K²%Ë¶Œ.kÀ` Y\nÈÂ†…$›J¶6»`CU*»›e7›Z6°ÄccÆØÆøB‡eY—uæĞh43š»{zú~¯gÿx[2©JÕ\"ƒwUÿ1=ïû¼ıû=¿ãûı>¿¼Á¯¥“/G´â\\“ImNéÍ¯eWR¥|ñİ2{qİ©RvíH©RÉ\Z‰eDë~±riüx¤uxyè=)½ÑßO¼‹Ú¹%áÌœÜ­ÇëîVë+·å²k;gÏ2;»@aa	±¾FUùxºBÃ2\Z’éê\ZëI´·c†\"¯¬«ûV/Lş°ûİ?Ø>8â¿éP˜<Rvñ#¡XäùË—o9øôÏõG_EÄ¢ôôÑÒßM}kÉútË@j¥n)O5_ ”]e~j†ÜÅ)<Ç¦¾³î­İ’Ò^šŸ^úVÙJ=tç§ş¤ò¦s@ñÕ\'õPsÏíÊw¿±púğÀÏşáaiûŠ]ï|ƒ7ì ÜØ‚Ô4\Zøşk œjğ§ò¾B€çàTJ¬NMræ¹½,¯¸ù]w(3‘_šÿÜ¥¥üï»ïoÜ7…Jãõpä?­/Ì~àÙÿù·ø¡oı½{Hl$(\\èû(ß!AP^ğxßG)ï5ÇxJùßCy6ÒĞ©¬,päÇO_[gdÏNægæ³qÛg¿8ö[u@iöø4ÿvìÇ?h›:wÛîıíÃ›‰ò<„4P€À»ú(¥‚š_”~m#•BI-0Ü÷‚|<ß©€kSÊ®pàÑŸ¨‹Ó³qàòâjáwüë/=úëØ ½Ş«ãî÷«åo<şõ¿NÖ÷öò¶O†D}#Bš ü«o!E°ë¢f¼üR* @JÄ•ıP^ğ)R‚!$f$Fß–MhÊçäŞƒñ‘í›>øíüïgıâÿ[ø+cZµXºáô±ûû‡Å{şè³´lºß®\"M¯]¨@j(!¨À!W\"@NQÊÏåãz>™©óxëR}ƒØ…<N¹ˆ/M*¹,ÍC#,ÂŠ†I%\"xÊçğŸd`¤O•Ö_^X\\{à–ÏÿwïZíÑ¯õ%ôû.ÚÿŸ<Î‡>ÿy]ğò9ò3øJa—J¥ˆvôinG*+4\nå9T*Uœ|–rviYÑ8‰¦ÖVVÑñ±Öó %¶ëSrªTÖòDÊ.Â4(jq´µUÉ$;ïz§û…hiŒÜŸŒê\0_|CSÀË\\üÂÊÙ£¹ï{r÷Ÿÿ;=#”æ/²<y«mPºPc;Fª‘µù9–FO“èèF“¸K¥P wi‚¹3ÇqC1LË\";z\n-^ÇâØ\"‘¶­(ÌMihbşÜI\\i2Ë“S^™¦¶\ZB)Ò}½dW‰Z¼åÎÁNïÁ—Nï}CRÀ/gn­.^üÙÃÜ¹ûsŸ!¾ázVÏ¿J¨©Í2‘N²šab„c uf/]âÕ^àİ¿İ°¨äsxå<³ãcŞ´! R(`ç×†…[- }+™\"7?Gª¡ª/Q•V,F1›A9UtÃÀ2-4M\r%”`ú¥0+¹Ò©‰Å;ïúë÷ıF#ÀÉLw©jñ©}å¾†w|âã¤†o¤py\Z=Ù†»6‡›[DÄ0¬0F\"0Bİ$™LPßÓÇØ¡—híë©1ùüôŞt+†n\0=ÃŒÆ)æÖ˜;}7—ÃL¦ÈV¹¥ËÄÚX8}œÒò\"‘Î!ıø1d8F$¤áE›(—‹,=MSW\'•BÁĞò;nhn|ô\'§&s¿Šmòÿ	k—&u-ıâ¡Çnïß4Dãu7QY[Åu%šª ¬0™’ËØ‰Œ<ÍêÒBÓB Ìé¶NÖU*ÙEôH¡›h†R!©æs¸¶[.Š˜hØDÒØ™%–×p\nñx„¶‘M„\"aRõuômè3ŒãT9»ï\0-MX‰z¬†Ò­éöîôÿü7é¿‰ú]™©±OÎ{…ë?ğQ”¯È_!n\"—/1qî<¡Tš®í{h¹b.ÇÊÅ‰\Z¸óPÍÖİ71qğeò‹‹˜¬,,”øBguôÊ‘ ÔÆˆ%±—ˆ%ébúĞMMèá£giİĞ°\"±$ùéI\ZºûX)\nVf¦‰˜«£Ÿ®æä\'†ÚR»mØK“ÂGşå¿ÿ·äÃh‘$•ÕÌTšù‹S,grl{Û¿ ­£“d,L]}Šî›‘n	åVÀwRÒĞÙÅÅÑs„ã²yÎz™Ñ{™:ô\"ù\\¹3¯²05E)W$·¼ÊôÑÃ¬]œ$5™›Àˆ%XY\\æÜK{ñ”†cF¹pp/mM4µ¦)-]&{a‚P}#f\"I¼g˜ë:\ZøÆ¿ºGüZmĞH4Ş~ùèŞÛ4İ ½m‰IPXÍ`‹Í;6#<çj8_7f¢	t+@u„ïQ*U14¸õö[)•KsÂ“h,Ni=KSÛ=(§‚µ±ŸR©Œê#\nó;÷Ş‹Ğñ¤ÎÍü2ãò+ûèß8HÅ7ĞœuœRúáë(Ù>ëSc4mÙÅúä¹[ºÖí·Ï¾şĞÍ?;ò½ï{>|”ÂÇhèè¤w áyW^ĞOD\rÁiµÏ$(;ŸÃ\n‡pä:„­MéFbá86Ó$\ZM¦Ğ4x<F4CIÃ2RÃ\nÇĞ¢IVí£c°‘îãÒÉ“èv‰Ö7rò™§I„uÈ/Ó°y‡QâO_w\n(·²%{æĞªkï¸ÊØ‚›âê­~ë¾T€ı5=@x€ĞLÆì£±§A´Ô òkYH|å½Æ]\'€ÑB€f \"qÊ¶ËÚÉƒ´l‚†.&ö>GWg#F,eêÌ=„cû„ê›È,gIto Ùºí\'Ÿ½{ëë‹\0©ß}ò§\'vßõ„	6Wê‘ª¶ÙBKÏ®\"Ü*JH”r8ò³§Ùzó®À`BÈ`Qc‹ÊGÖÖRMGÕH’4Cäsyò“ghÙŠmbìÙ§èêi!Ô1ÀÌj••ñsômìgÇû?À¹ã§Ğ+Y*k+Ôuoˆ™®}÷5;@ùUéå–v.=EzÓõ 4”ª]*DC-äU	By¸•†i€ÔÀÂ¹X–N¬±%X»‡•Rå_uB{\0i\ZR7fˆõL–ÒÌ8é[°Ó/<IßP¡ö~¦Ç§0Çhln@8e²KLOÍaÅâèøD»6Œ™»şÔ]ÚµE€0[W.\\xK¤±	³.|t¥^¡¯ÔŠòPÊE(…Â÷Òw@|ßå…‡b÷ûß‡P*¨\r¾^ÿ_Ñ\0¤(ğ‚$Â³:3³<KóÆ-”ÁÂË/Ò»i«µ‡±c\'	åfhêîÂhéáÂØ4‰ê2·½ûw0ãuÌ_¸„‹!ÌğmqKk½Ö¨Ÿ?q(Ú¹iS\0•ªñs·VéC)‚*/4”‚j!‰[©³01JCC’Î¡¡×„Ï¹gµZc£Ü m¤ßEX1–f.A9OÃàf\n—ì‰}´\r Ó=œ=tŒ¤(QßÓ‡–îáìá“D¥‹¡¬8ç_=«Ay©¦ˆïÓpmPî\'gÇFiŞ8~e÷…vUáR\"ğkl^ „Äs}å Ì]æĞOgÏ‡>Œ4£ú‡B <ÜjPèt³Ö-TPL5“Õ¹Y]P×7D©T¢4u†tÿd²™KG_!mVH5§õ­œzå8Ñò\n©–4E.WàÔñs$ÓM§Dª»›R±øû×Vª%áçV‰56‚”¯Ñ¦+ùz¥#ønPõ¥¤´²D8‘@)4ƒ¿ÿ »ßùvB±$J© +\0¤\ZJäJ¸h\ZJh¸Â ”ˆã*»XÀ.Â4½È™Ã‡A×	·´!Ú}éi±NSw\'V÷¯>CÒËqç{ï Ò¹¥KsÄ[:hNÅÄ5!§T4}×ÆŒÆ®¶©@Áô‚–%t@CH¨¬g0švŠ²ïÑï1´y#Í}ÃÓü Nàû5Å(H¤¬%\rìr•J©DfîRÙX–ÅÊôÖV³dIsO«Óã„Ú{8üÊiRƒö¸†U×ŒLwóòOÑß§jDq=ÁÔK‡ØĞ×‰‘¨ÇŒFB×¾¯6„èÚ/©¸~\rôH	B\\3°+”£»E”aÿ“OĞØÑI×æÔ´¬à-5„®#3èíºğ%q]CİÍÓŞÛA]DÇP%O£÷­ì|ÛÄ#F(J²±‰[÷Ü@º©S\'Æpô(G~òıõ:±úÑx”éÓÌœ;O´.‰âT*×Ø´¦i 4¥ü „…\0å^É”ĞğÏñ°L…Ğ\rö=ôÄc1†·ßˆºRìÔk-DyÊu‚ÔñÜ`\r-„V]ÃÍÎS]cåü)D²	w}…†úªÅ/hKLUÏ¦¸¶†…Ëà–aıÇ‡iIhÄš[Ğ:7rîÀAú;wnR\nğ¼m×ä\0)–©×®BøŞ/iù¤À÷*¥\"¡h_H^zôûtlfËÍ·QSëëJjTm?\08BüRJù¸¾@sòøÅ5ŠK‹hÉf\Z»{q/ORÈæ%É¬æ=z‚ñ3£4l\"–ˆ\n[(¥ˆX:7ÜºƒO šº8ñÌ³4%Ãh¡–)Áuñ\\—ªí\\#TşQ©‰ j_1üJH‰kÛTò\"‰8¶ã°÷;ßdÃíô_w=W`¢Ğ0äùŠüÌ—NE9•ZMp±ıšXZ-Q\\/mm\'ÑQåksó´İp™ùyt¿J&“¡±wˆT2Š(dğ]Í0¨Š´õõÕÃìğ»´Å ih#ËnˆÊzI%ŸÃuœã×º1QãÕbØ¯Aa\rÛq¨KDR)ò™^øÎ7Ùvç;iîî\ræJ\r8®N…ñC/QßÔô¥@3QÂÄ-æÈ^!T—Bz.n¥ŒmÛè±k3©rŒŸ>Ogš¸,ã­-¢Ü*]A·B˜±(k—fØ¶m3ûÎ^Â>ã¢\'S,Ìgğ³YD86~M]@Gl[èTŠybÑºàÀB\ZT\n9”Òˆ$¢¬LOpüù¹å#ÿ’X,r]””©£<Ûö‚já)¬ç‰$“µ´x®‹t*Vç±êê¡\\Àõ\\d(Æbf•…¹­‘&fÏ³õ¦D’	*«K‰x6º¢º¾†føRÒÙÕN2bpäø;\rÇÑY¯ÏÏÍ^¢\\±+×Â«HcåÕ¥\Z3+İ\"¤¹øKµêrÛ?ˆáØ”V)eæ).NSZšÆÎ­ Ùe3uú­CÃ%ƒâçÅOÓÛÇ” \\åyx¥u\"†¢¥»KØ¸¾ ZŸÂs]M“H3ŒïNR²^´‘n•íƒì=q§\\&ì•éïj@‹%É­®¢)O]“<Ïÿû–¡VÇGA*J«Ë¦áæf©›´wwaêÓ4K“„#Q,Mb˜:šxÃÅÓ§éÙ4‚òıÚ¡HJ•µULËàµh‰zD]3m“ˆ\Z¬ÌÌaØeP\n¯ZF·ÂAA+Ê³ï¹VVièéÁÉehïnçüB†RÉ¡0L?œ$;=ŠÄ¿}MĞ4™Mtu•&&p*etÓÂ°tD8ÒB×¦…°Â+ŒE‘‘2EÆë‘á8˜!JÁÆMÔ!t#h§J¡„F>_\"™nAxÒ´ğ4‹Âü–¥qñÂ*!Òœ®(i…B`Æ“EŠ™,VsaébY&ÙBÇvY_/âU«„“	Jë%ìb¾”òK«×T”Ró\r6ÿ\"·Vx—ïÚœzşYÖ(U]<ÿ\n‰qÀ© ¤$¤ëèšZ/xksìØ³U£ÆB) èHZ,g=è\Z¥Ì\"sg=7NOs’æ\r½d“éÙ%ÚÓI’Bf‰£‡ˆ7·áåV°İ4˜]\"ˆâ–+?‚ÕØÆÄøJˆ½zcËü59@Jé)¥Å·¼kuì4›Şú*ÅnµŠ_­¢ì\n¾ç ØÕ2]Åw\\ÌX§\\FH\rkÀÜÔOË†!ğœ ğ)„@\Zà	UÎáÚUÜõZ¸+lqû;ï ŞPÏÊÌM	“ËKkd±I4¥	%’X‰Ù©1Ç.aš¾˜¦ICº‘Åµ<º¡#-½,=ûñºÄ¡İ_ü¦wÍ¢¨r*?¼îİïÿ³½÷µø·ÜHÈ0kUÜ¯…±ïÔĞª©C¬ËçOaZ!¤”¬—`ıâmCøšI1³ˆ%|»‚rªD»ñí2-nšH,Œ³¶D2ÁH5Ñ^@(/Î¢á#<×W$Ú»ˆ%¢—Y\\Ì1·¸BK*F¢>A¬¥b¡Lie©ĞÒZÿÃ×%‰I3|²±«g_ŞV¬ÏŒÅJy¯iû\ZOĞŒ\Z‚6@·X>wœ¨’lë`my‰Üè!Ú6à¦@÷ª´¶¤P^ 	zÕ\nN>‡)\\<ÛAêV$Œ(fÑœªœÃĞ@3Mìb?¿Föò<®ãàÛULé3>y‰¦aSïäÄSOÓĞÒ°÷–¿úŞ‰×­\nWó¹¯İúÑ{g¿÷HÛ¾‹RªVÌüÚ¹¾^cÉ\ZJ7Y<}Œˆ)ˆ÷’™Ÿ§<7IÛÆëğC1.¾ô<-mXV=Vº‰‰ãUŠ©!ŒÒ´z¬Êµ‘†‰fX3„oWY˜¹ÌÜJº¶V*ÙU²¹\"¥p§/.°m¸“hc##ÎüÔEÇÔµÿüëŒä²/´wví/ëaæO­´8W…L¨UuÏ3Ìô+ûH¦¢DÛºYššÆ¹<Aóğu¨HŠÉ§£­³…p<‰2C,M\n§X0€]Å«VÀ\"ßu®ÊêêJ«4-Â‘mé:<Ïeif¼29rvœ¾Æ–áêFv°÷ÓÖ‘>\ZÙüÜ¯å€dÿå”Ë÷ïùÀ=¼øô³xN	áV_“µtÏ÷ñ„`úà‹´ôtc¥»˜¿pÖæiŞ¼ª«ÿé#ô\\¿3Q‡#\rÎÿô1’!(.Ìà+ŸRv…j¥J¹\\Á)©ä²A´Ùe<ÛœìØ”3+LcrôNR&J×xùé½¼÷-Ôndq¥HqşI“û7~ôß«_ûlpñì‘—µâê·Òxõé\'QRh±¦S-™»0Éú¥IZú±\ZZ™#ä®“¦`+¦÷şœŞ-›ĞÃ1*JcâçOĞ=Ô‡K¢Âu,œ>E(\ZCAfq™B.Ïå‹³ày7(ä)­®0ašgv…¢G}O?é®´X˜oü—ïğ¶-=ŒŒôbnØÆ¡ü€–®¶o7\rüŞõn)—ûRWkãÜÙÉÖç.‚ˆ[¥œÏ3ñâó¸ÒÄö3G3\\R=ıš„½e3^GYF™xæ)z7\rjj¥ Âœîç$ö?ö8v!G\"Å“:‘DœÉ³\\š^b~!K¡ìB$Aª³‹»·‘4=VóE¾úµÿÃÛû¹y÷Fš÷¼›ßù.Édd®³¿÷Kİ¿ÿ¥_iŒîW8ö¿¾²\'ÑX÷ô+/ˆ¼ÿß|\Z_„¨®Ìkí X²™½p‘öúÉ2k%–ícpë&ˆÖ‘wt.<û8#;·¡Åë)x!&Ÿ~”»¶¡kù2ÿã¯ÓÖÕJÿæazÂ¬¹:íõaJù2ë Ç¹q¤“ï?ò&g¸ç¶Ílİ>DãÎ;8säó\'•·ÜrÓ»z?öå¡©k\Z’:ô·_ü‚fê_™Yà-wİI\"Õ€¯›Ì=Í©½ûyû~–Åã„ªY\ZÚ;‘VˆLŞañĞ/Ø¾¯c)SfñĞóİtF,F±êsä‘GèímæèÑs<6†r\\©8a]Ãµ]ÊƒÈ†F23³ô¶Ô³óú>ºûÚIm¿•ÉÑYÎ=÷4Ã;·ßwı}õ+oè”Øó_ıÓ¿lliºôÔ(ïùÔ¹8Es{z¢Ìr†³û0´uˆP²	·Rbñì)zGÑë›Yœ[fåÕƒÜ°\r£®‘lÁæôc0¼¹© *ŸÉqîì.^šgfyCahÄ¢aºÚéél\"\nŠE©¿émİwŒ©¡÷ºÁ/ßò¥oİÿ†É½ôí¯k¹©ñû#šßØì¢xï§?ISs³çÏ!«E*ëë„Z:Ğ£qVÎbhÛfle079MaêÃ»v ÇëXÉ»L<õ#7öÔÆhÊsñ\\œ*®ëãNÕÈ®£kÍ«b%SD·İÎÁü˜…±sjx¸û+}ôÜû÷\rwÀ•×O¿ü\'÷GÂı“³‹Úõo¹şë6\r›(Ï¥ª~ÿaÚ»Ûi¿q7ÙåÊã§Ø°û&J¾·¾ÊèŞ_0|İ\0¾¯‚ÃPÏ»zbì¹^ÕÆ÷¼\0e{.šğ‘Réİˆoá¥ï>Du}ÍŞ1òÀuüõ~+£²gü¯¼päàßäóù6+™äö{?†ï8ksÄRõ(Ãbîr†\'¿õ ï»ç˜í½”ÖòœÛ¿vnMÖNÈT`¬ë‚kãT”k#<çêğe´­«mçåÈOR×X¹kç»ë3ÿá‘ßê°ôé|{pîìñ¿Z=}·\rÓ=²‘¡×“jkcòÈ«¤ëD4A(#¿²Êá\'!œˆ²õæ¬v]¼j<ß®¢|ßõFjî@Ö53w~œ³û_fe~‰Öş¾uŞ°ë/®ûİÏSŒËïìûz~âä³çÇ¾a–VâaC¤ÛÛèºñFš‘Rréì(1/O\"İˆW.áùÁÈ¬³E3ƒÔñ=…f\ZèÉFŒ†fJ…\nöïcüÈ«ä]¥ê;»\'›†G>78Üÿ\\ËysŒËÿÔ8?zîÁoÿîÙıÏ¢ÙT7Çœ‚ŞÚ§m «¹ƒºÖÂ!u¤e‰nâóø¾Â.(¬fXcöÌYæ—V‰·uº^\"u°gó¶oïºû÷¾I·¾ù~0ñÏ(Jògßú»İ3gOİ]\\˜İjgfj‚TÄ\"ciİ²p]‡BÅ	x€çã{\n_Ó1›;1-ãpCgïşæŞŞGoşØB¼ù2óÏFÅÔDäèsÏ4IÓÜF¥ø–ñã‡åúÊbƒ¼Á®:İYÏŸZú‘¦æÖÕá»üp¢n_ÉSGoyëÛW¢é–âıış/|¼Ö‘§„\0\0\0\0IEND®B`‚'),('29','coin.1cent',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\06\0\0\0wŸ\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEØ9-šøD+\0\0\ZµIDAThŞÕ›wdW•æ÷>—>³²2Ëû®6j£V·¼C´H ØË\0#f\"†ØXËšbgYfØe@ì€pB+‰Á\rV#‹|·Ú¨Õ’Ú¨ººº«ºlfUzóÌ½ûÇKµ˜fi†­ˆŠÌŠ|¯òïœóïœ{¯àwğ^Â¯®~`éĞSù¹»ãn½±N\ZÆù:ğûr!\Z‹îÓBOŸsa}ğœsWb}Ãß5«ö»x6ñzıãfavÇòÓşÁ©ùâGl¿‹:–Œu%±|…\'m|×Gú-@ƒ¬-¦Z,Q-3U°lûëÛßñ¾÷øÿ\0­µX~ú>8»ÿ©(;zQ~¨ß ğ™~á(GŸ9Duy‰¨)±ÒI²]i\"‰$¦!i¶]*å\Z­v@Â‘ôôå\Z¥(¾0ÂÙ³å¢¾¾ó?z›Bÿ^pòş;¯Y>~â–tïd¦¿_î{äI{èAºRÎİ¶ñÑ\"ƒc˜±$F\"M M´×\r(íûà¹Í*•Â*SS³¬-¬`;6©¾>>LÍéèÔµ».ÿ³Ë?ğç÷ÿŞ\0Pš>4ôÂOïøk§äİƒc£æ“?ü>KGsá®K™<wNï(Ú0AZhi ,!Â¯×J¡ı6BtE+t£„n–Gu­ÂÔ³GX›_&5ØÏ}Oók-ïÿé3ŸøxşükçşYØı7ÿõÒrÓıÉÎŞ?öëûÅÁ‡äª·\\Áğ9›ÑXQpRHËi!¤)Â¯!M´ßV\n„bàµÀo¡›eĞ ë%üz:À\\©‰êŸ8¸Òİ?øÎ¿úŞOŸ|56¯ôÆÇ¾ù7ÿÑqì¯m¸hgöÁ¯|Q¤Åux]ëÁI‚“D#†Ò@tˆNt0ÂFÖx÷*¼Gk0ìğHÃ2éíÍíJRš>)Îß¹%şôSûß}ó¿|w?şôc¿S\0~ö…ÏÜzşeçşûF¥yà[ßâÚw^Ãø•»ğ=—ÀóÑÂ@hÊG ¦!\Z­|„¨Ğ‹W­à7ªi€ò	|\rè ÀŒ§PfÛ«22ÜCåô›Fûœ§^8~õ[¶®~øğ‰ŸÿN\0øÑçşó­o¸æòò	ùìî=Üô§ï\'ÖÓG»´Fàa+…Ò´1b‰Ğ«B„¯Z¡/üÜ0ğÛMĞBHÖVŠÔ—°ÒİxµªíÒj¸,MMÍõQ;ÉbU“íËÓ3Ø\rv„ÇJ;®šzüÅS?]øÕç?õË¯¾ä/ìÙkÌ=ÊüéJÑX]3‚4ÍĞã€0%Ê÷	š5Ü–Oee‰xW~Û£U­3»çq\n\'g¨WÊ”g¦I²23C4™i Ú-¤e³º\\ PªĞ=4‚ßjb81â™.„i9$2iú!öÏ,l»tÓú“»8øº\0ğ£Oıë[·MŞY*¬Æ§÷îæ†~İlP+ÑBbØa˜ã·QnmD0s#8=#`Yœ:zŒá|O±øÂ!†/¿šŞÉõÄ²=àµ±âI¿I$Gè\0¯T ™ëFµ\Zd’Çbu~ş±AÌX‰”[5‰weHDŒûÛÿÆKzï;°XXxMøò×½lKvOª»+ÿØwñö}ÕnÓXœG[1Dà¡<ÏÕ½ëˆOlÇéÊƒ[C Yš™&âX$ºó\"52N¼+‹F\"µ\"’é\"p]V§à{>‘TŠº«ğ…‹ƒÛ¢İhb&³ÌØK»Ù\"‹ \0#™¡vz–üØ(ãI#úÀ3ÇŞñ·ÿåc_½íŞGıßÆ6ùÛ\\´­¹çËÃ“½}ó›¼ùß‡ÔùS(+†Ğ¢k˜ÄÄºÏ½T.‹h—QÍ*2’ÀˆÆXxññî<†íĞ\\+Ít!dHx\Z¥‰õ\rM§‰÷bKÁé§ˆ¤Ò8±(©lŠ®¡aÒ½}ôŒ¢M“QïŞG,j‘p#“ë¹ñÊóz¿şµ;¾üÛFÀÿ€Ç¿óùçíºüöşøÇbÃEç“ß@s­ˆt¢8‰8v,†v+Ì½ğ,SO>Â‘§v£…DVhĞ(H&¢í&\"“§Ùò\0\\\Zå\n¾ÒÔ—ç)/.`à{.Bäúú˜?z3\ZÃŒ§¨,/ïÊ`\n)¥Ù\ZM#ÛÃÂrtÒæMWì±ˆıGŸ8ı×€¡şO›gŸ8zŒM»Ş„_«¢cÚ6V:K2bì¼¬¿ä\nÆ¶m¥ĞÊå¥y”i`ÅS;B`E8ºçi*K4*Ö¦^ ğ}*ó§É­ßD£°LµP İ¨“¤4?‡‰hƒå£Gø‰3?=Ãğp×^C±XEW–õÉl†÷Üt=[ªúUsÀŞ¿ıô…#çnıÜãwÜ!/zÛ[ˆ÷öÓ*,!\r,;EZÒ‰ L„Å‹ßDš6B\Zœzö ±xŒüè\0™\\†d*[*ø>é!ÜjišG¼»¿QÃ°b™Ò$²İ´VWP2±¾aæ§ÓÓ@š&íF‹©½û¡í¦yü0£;v2ıÜáu—å’÷>:_œÿ§l4ÿ©GÎ;ïãªQ3—–Ùµm\'ny\r´BÚF4´#„¢^#¤‰òÚ\'ƒª,#íÒvX9~ŒMWíBk\ni“îDçû:¤ÂI$H÷ö¡µ\nAT> ÑOïºõh­ˆesDòıÌìßË@.†ÓİËüñäR6;¯yuJ‡¦/›Ä¶m®¸òBóW÷Ëï~E)päÑ{ãÉÁ±w>õ“Ÿrño‚f#–ÀŒ§0¢‰3}¼0 ‘¦J}ÃD{Å¥©tİi|­C¥¾QaS$ğÏ @‹Ì3€ ñÍ§}†‘ÑìN&3†‰&+\'g©Öš8ƒãTg§ÙöÆ«lû_zÿÛã¯€¾ôÍ¦Ä˜9t”Ñ;ñÛ-0m¤i#m!B+„4@Ê\0í6‘±Iu~†t>‹}é:–+¿c8g¢ü±@à‡×v~[¾`ñÀSôA2ËÌó‡éKb©$e×¤±8ËHŠÑK¯biê­Â2‰®4c›×§?|ó+Àˆç®›ì>1|ŞVD4…ö=¤i!-»ÓàH„añ@¡¤vHÃB’…§g` Ô†Ê„º_ë3á¯\ZªÂŞA«\0í»! \Z6KG¥ı$¤rÌìßK_ÆÂI¥XXkâ-ŸÄI$B‚Uğâ‰rC}¸³/rÑuo~«uİYpø‘»…e×ï}r›¯¸2t\\à!¥D˜ŞòeÏíû/wqÒ@˜&…¹Yò!\0ZwZ`£Ó„wÂ_H@„÷\n£Q2£ŞhQ>ÌÈäÊ3ÿÌóDº{)Ödi|OÒvX+¬Bq–\rçn†x†¥©ãlºøÏ¿şÖ¿øâ¬\0ˆDc;LÛ3sô a˜Èh<d{d„Ä&„$„awø”kMRù¾ğZÃ\n\r×oCØÿkæ¾ïÂ‡²mªååÓ§è;gí@2»o7}Ã½Ø™nVVÊXµÙ|RyN=”Û$‘Ë‘İ°…ŸG/Äv\"ôôt‰™_?°ã¬\0X¿éú ´$„ÒÈX\n!Ù˜„i!D\'w1Ãp–\Zt€îc­X –NaÇ! :x9Ï;)Œ\0J+Ç´(V©-Í2°a#mWQ<~Œ‘õÈHœÂé%l¯N<C:1N*¬¦«+ÒP\\\\ãèô\"éŞÜâ<ƒ6ˆúÊÊõg€•ê±\Z…zÇÃò…FšVè-·‰~‰ĞDÇˆÎCxu„4†ÅüñôLLv†Ë¥Ù!¶Î‹!8„+çúH;Fn|#ZZØÑİcc¬,,³zò$naX*ÑÕËô©™ú,ÉT#gm©H¤zŠównDu÷S›fbëv¤e[g¥Ü¶›-/¯èë0¬3†Ò\r—¨0¤…4P2š@:V¦§Øxé%a¹#4RûnGû«3úAk PÂ3‚[^Dz\rWÒ®¬XQÊ…\"ÉXí¹Ô\"iÙ}€d<Áà@+–†î¦géND¼7’ãô3OĞ;Ğ&30I>jeÏ*Z­öæÚÂi²İ])Ñw¦lqŸ4^*æ(tN†v©€Òê*ñtúåP\',™Z«t8\nÓ^mÆ¦M»8‡!,ÇF®€èJÚ8–ç+²œ{ÙÅh)8~d\Zeê™CdaÙ(+ÎÂÜit½†cA<Ç°¬Íg€§ÄöÀ´‰Ä¢a×Ö©ñÂ0ÃHx‰Õµi†Ä/óÙŠĞ¬”ˆ%â8±Xç\Zy¦:„rÙ<Sûe<‡‰@«‚aH¼z4ÖV1œ²^ÂŠÅ1cq|ÏGj…!aÃ…ç“ìíç¡ïÜÎX2À²gŒ…»é·šôŒöa˜QÇÀÔjûY*I¤0L3¼Ä°AÊĞ{:8“÷¨ ÃÜ:œîvÊâéãÓôŒ½,l”:3€B„z\02c€\"¨¬Ğª¬ïcX6~y/Ğ¸”+uÚåb‘t_N<†\nªYgdÃ$½“c<p=°‰Ù½{è$Ş•Aj×haJ!Eòì\0PÁ´‰Ğj´€ mi„\ní7<2xgæï6ÂØ´)‘¾Ññp±£“2g~YvÚ5\Z+óa™5\rlÛÂ­×Éá¹™î•R+“#ÖÇ´LÌD\ZL€-;·ñâJ›c=H>ÒÆîêa± <Éé¥2NÔ™>+\0¢ç@,¢Z®€ĞhßëèøN	ë¤Ò@«°DÍZÈô†A½V%ÍvHNuòŞÿGKZÚ´«k4‹Ë‘8&Úk£V«Mku™ Õ¤U©ĞÕ“#ÚÕ…âŒÎ¦…òÚ\n6n?‡§Ü‡išø\n¼Xn¹ŒRš•â*±häÀY9\'ã¬ÌFvŒ5Ì—×R”‹ªÓµ¡Â²Ğ‹i™ØÑX‡éE˜/§‚PiMku	-\rìhÕn¢4,/¯Q(U1\"QÜz…DW†H*…[^\rÉ–ß(ŸÊ+EÆÆ©7]<Ï£={]˜ei¡HlhœâÉòqò¬\0p++­h:Ãêr!ô •\nM?³‚#Ğ:\03BP<…0ÍN%D’ITĞÉûßğ|T€aH”RDR)‚föÚ\níÂA£Jw>‡j·/Í\Zì(F$úrG’	¾ëÒplCëF825´,rªDo.Ì\r±vê†ï¶Î\n€İ»Ÿ›×‰ÊmãUË¡ÓïÉéÀsIP8…VF¢!$Zi6Ãé™™NyìDO§j­Á°Ğ*ÀŠÆ* ¨®aáôÓ=8Dw¾·Z&jK¤ \0¥ñjÜÊ\ZBJüFRa•To?««%Æ7®ç¹éy@óR{F4ƒ½6Ù›?+\0æ*ò.åyªorœ…©ãá C„ù®0ĞB†!ïU1bqìŞ±p8‚F(¡ñq²™íZ¯Ù`yf\Z­ü2ÑZ†aà7ª¨v3‘F5«Ğ(Sœ›Ã°ÓF)ŸæjÕn …î¢µ¶ÊÚÒ\n©¾¬ M2Á4LV*ÍNc©ˆõõ3»X\"sTú¢+ï:+%ø¡÷^S{ÃsÏ®^pı\r¹}¿~„‘£•‡@P˜=ÉÌş=B&A«! ‚°‹\Z­f4‚´l<7 5É\r‡+ÁJ!c	ÜFxÔFµ]¤E:*ÅUæ§3<Úp¢”kM¼b‰¨mšF£†0-¤¡{x¯¼Š¯|¬ˆÍ\\ÉCª\0Ÿ ^#sÉ.ö>úc“Ã«çø“µ³‰½÷®[¯¹ù#Ÿœ¿õ[¨æ\ZXq´RôÒ?:ÔYÛï¬ê>Ê÷C­ ÂV„v¥„éØ˜N·İÆ´B•B#H¡PZ¡Ü&ºQ¥¼¸Àº­›0¤bõÔ]İYê\rO†|á˜˜‰«‡R/•)ÌÍƒ€ÑMë\" âØh¯Ö\Zgtíïş€ÜEn}ECÑñõÛ›ÎêÌ‡ìdRêf•î¾Ş0ÿ…zPZ •Fi^.¦ŒÄ)-,Ğn6ˆwç©–Ê”NŸ\"‘ëÃ¢¶¼@£Z#Œã•\n˜©nt£‚‰„ò9ˆ%Ø™<–e M‹z±@$•BK¼6Ê´É¤bnÚNœ\'÷<ÃDÒ¤/ab%ÓÌ«$va:¨9ÙO~ûş§fÏz\"ô—·ÜòÄ?_¸ğÂm<xï#•BgªãşÆ®‚—JbpfÀ!L‹•™i´[\'72J­´Fuæ½£Ãhi²ôÂ³˜ªMwOT€D#(†%šN##±0’\0¿\\D5ª!Iõ\râÕ*õ\nÕBåÃ/à$hß§\\®püÄë‡røÍ&©®bÿİ÷0¶q¢på\'ş×¯x] Q«öŸÜ¯sããœ>|İ®£/l`”\níïh{­ËaéÄ	LĞ50Hei‰úÂ)ú6mF§öí&Ó›ÇIe0Lƒ QÃH¤ÀmbdzV¤‰aK-V&‡a[H©q«*K‹4juF·lBJÉj[0»\\Á[]!7IŒ±TöØĞmjOF>ûªF>ôÙ[¾öì‘S…s†ºyàñgQõ2úLI§w:=;ÊÌóGˆ˜Š®~–ç—i,¢gx_HNîy‚¾á>œ˜C­Öàôİø‡W«†„ê‡İŸFœ)·2šÄ°tàxN:ƒ“î\"ËÓk5OKşá\'¿à=Ox‘mWrğîŸ³şü­…ÜÕïùÚ«`ËÆ¡öøeoüÜWş÷ßéş|7{Ú*-† (&ğ}¤aúĞ!ºóiÒ}ıÌÏÌAu…Ñ!Zdnßn†7L`Ç“´<˜;°—üøX8\\1paµ^¡¹¼@sq–âÉ´Ö(¯ßlàV+¡¶šÕ\n…µ*>Ù\\†{ïºÓ­31>@jòÚ}ˆI½Zò?—™ØÖ~Õ{„´Öæg?úáÙa¿Ğç\'R¼é\r;É­›DÆR¸m×h¬Éöæ0#QVæ¡U%?ÔOİ“,:ÀÈä(†¡)c,:ÀØöíµrù}OÛºT6Gyi	øh·E²§Õ¬£¯Ñ ÑhRk´q˜8gÒmğ£ï~Ÿ}Ïåß½w‰î,î¦Ëxì{wpÃM7,v_óáa!„ÿª\" Ó¾ú7~ğæ››Zt{¢w?¼—ÆZU\rµùá‡¤^©`QYZ\"n+òc£T=ƒÓG0vÎ:¬hŒ†ˆ0ûÌ>F·nAè€j# øü~F&yî—¿`ÿ}÷c-T£Š)óG°27ÇÊÉSTëM¤”xZ2´~’Vq‘o~õ6¿0ÍŸ¿ë\n’=9bÛ/ãÁÛïàú¯uK\r}ÓocüYí{ä‡ßûÆmŸûo7_·k§ğ¤ÍÛoz+§_<Áä¹›¨y&ÕÕ\"Úségµ\\§83ÍºMëZQQQV{šñÍÀ´Y­iªG0´n­\r~õíÛyq~•Íë†Ù¾c\"š ß›K®ÖH\'ÂŞ§ŸC>w~ÿlëMó®·^D$•\"¶õîûû{¸èÜQ-¶}k|×;şä5ß&§µ6¾ıWù÷÷}ço{Ã…[D¢\'Ïøv°bT——™{qŠ±/Å´,ZÅEºzr`X4Ú‚µ20>\n¦ÉJ% }ú8CëÇQ¾OEÅ8õğİl<wÅ¥÷Ü÷$Ó\'–0,ƒîl\ZaJªJP.¬¡›-Æ†ò\\{á²]q„ißz1ÿêa6æMmôNşbò=ÿæ_!‚×eŸ ÖzøÛ_øë½}ã«=—\\²X.Ë5».!êÄFX[kğüıŒŒÒ31IP)Ğ,—èêíA8Q–‹Müâi&\'<ŠïP:ø8ıƒ9´a¡”Æ Ìù¥¹EÊ•J-}¹4]é8B\nüz;™$²ş\\~ö£{¹l0BtÛ•Ë£×ğ!ÄìëºQRk½ıö/}ñ\'~p[÷p¾›L>ËÛn¼\Z?\03p‰\'cÏ RyÖ¦Ó?:L£åQ/W°´Kfp%,–K.Í÷101Jàyh·×„DAGm\n”ë¢•vÛ•5×\'1:†ÍpßÉö±4İ;¯.¾íß$„8x¶ö˜g½µTˆƒZë7ug3?ûå—ÿçpaqY|·XâÚk/eÓö-Ã¤\\®³vè’Ù­¶‡§MšÅe²›7ÓÖõÂbi–‰Q´ï‡}Eà†£5¥PJƒç¢ÚÍpç¹ø«+ˆHŒôÖLZæÙ;oç¢su|ç›gGßöş_‰ñ¯j«¬Öºg÷}÷ŞrËgÿûMÍ¹‘èÉsşÖuìºîä‘XÔ«u=¹—uçm&Ù?DÉ³8½ï	6ïØz»İD#B ¼V8ğÔ\Zİ¬£Ü¸mÇ!>2Áš\'yäÇ÷l­241ª»v½÷G“o¸îÏ„Ëÿ,{…µÖ¢¼¼ø?¾õ…Ïìïß7ÉP_7Û·mä¼ó62Ò“FIÄ6|ŸZ+ ¾¶ŠaÙôà7xõ\Z\n‰j7ğÛm¤íà$“8™,¥J“‡x‚êÉ“l_×OdÇëŞúî¯dF>ùj·Ï¿&ÛåµÖ;ï{ú‹ßüÒ®Ü}ÿÒğ}6ÑÓ—ã¢›Ù´u=©t\n)†òĞÒ\"hÔPÍ*A³	Z¡„b§3á†¨jƒÃ»÷0ul–úÒ\"zÒ¤¶] FŞ|Ó£ã;/û·Bˆı¿Wç´ÖxÿÑı»?óıÛn}ô\'?–ÍFƒÁd”¾l\Z3art€á‘~rÙ4Ò²¦D$Æòâ2‹‹ÌÍ.á6ZÄÜ&	4Ù\\–ŞËv©±«o89~Ş…ŸşÏkyhâ5?2Óâ­õÒÚ¿ÚÿÈ¯oüÕ=÷Ê=?@me™¸eĞqHFÂó6\Z_8h*Jã™ˆE,ßÃä—±ùª«Ôú.ıY<Óu+pÏk}Zäu=3ÔÃşD+5Z*¬|èğÁgó‡ø5Ï9N±°^‹T\"I:“eËml½àR&ÎÙ´’Î÷|Gqø†¢ız>ãÿÚ»çÍö–ˆÉ\0\0\0\0IEND®B`‚'),('3','Printer.TicketPreview',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!-- \r\n    Openbravo POS is a point of sales application designed for touch screens.\r\n    Copyright (C) 2007-2009 Openbravo, S.L.\r\n    http://sourceforge.net/projects/openbravopos\r\n\r\n    This file is part of Openbravo POS.\r\n\r\n    Openbravo POS is free software: you can redistribute it and/or modify\r\n    it under the terms of the GNU General Public License as published by\r\n    the Free Software Foundation, either version 3 of the License, or\r\n    (at your option) any later version.\r\n\r\n    Openbravo POS is distributed in the hope that it will be useful,\r\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n    GNU General Public License for more details.\r\n\r\n    You should have received a copy of the GNU General Public License\r\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\r\n -->\r\n<output>\r\n    <display>\r\n        <line>\r\n            <text align=\"left\" length=\"10\">Total.</text>\r\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\r\n        </line>\r\n        <line>\r\n           <text align=\"center\" length=\"20\">Merci.</text>\r\n        </line>\r\n    </display>\r\n    <ticket>\r\n        <image>Printer.Ticket.Logo</image>\r\n        <line></line>\r\n        #if (${ticket.ticketType} == 0)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Ticket :</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        #if (${ticket.ticketType} == 1)\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Refund:</text>\r\n            <text>${ticket.printId()}</text>\r\n        </line>\r\n        #end\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Date :</text>\r\n            <text>${ticket.printDate()}</text>\r\n        </line>  \r\n         #if ($ticket.getCustomer())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Client :</text>\r\n            <text>${ticket.getCustomer().printName()}</text>\r\n        </line>      \r\n        <line>\r\n            <text align=\"left\" length=\"15\"></text>\r\n            <text>${ticket.getCustomer().printTaxid()}</text>\r\n        </line>  \r\n        #end\r\n        #if ($ticket.hasCustomersCount())\r\n        <line>\r\n            <text align=\"left\" length=\"15\">Convives :</text>\r\n            <text>${ticket.printCustomersCount()}</text>\r\n        </line>\r\n        #end\r\n        <line></line>    \r\n        <line>\r\n            <text align =\"left\" length=\"17\">Article</text>\r\n            <text align =\"right\" length=\"10\">Prix</text>\r\n            <text align =\"right\" length=\"5\"></text>\r\n            <text align =\"right\" length=\"10\">Total</text>\r\n        </line>      \r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        #foreach ($ticketline in $ticket.getLines())\r\n        <line>\r\n            #if ($ticketline.isProductCom()) \r\n                <text align =\"left\" length=\"17\">*${ticketline.printName()}</text>\r\n            #else\r\n                <text align =\"left\" length=\"17\">${ticketline.printName()}</text>\r\n            #end\r\n            <text align =\"right\" length=\"10\">${ticketline.printPriceTax()}</text>\r\n            <text align =\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\r\n            <text align =\"right\" length=\"10\">${ticketline.printValue()}</text>\r\n        </line> \r\n        #if ($ticketline.productAttSetInstId)\r\n        <line>\r\n	        <text align =\"left\" length=\"42\">    ${ticketline.productAttSetInstDesc}</text>\r\n        </line>\r\n        #end\r\n        #end\r\n        <line>\r\n             <text>------------------------------------------</text>\r\n        </line>   \r\n        <line>\r\n            <text>Nb d\'articles: </text>\r\n            <text align =\"right\" length=\"10\">${ticket.printArticlesCount()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line>\r\n            <text align =\"left\" length=\"16\">Sous-total.</text>\r\n            <text align =\"right\" length=\"20\">${ticket.printSubTotal()}</text>\r\n        </line> \r\n        <line></line> \r\n        <line size=\"1\">\r\n            <text align =\"left\" length=\"16\" bold=\"true\">Total.</text>\r\n            <text align =\"right\" length=\"20\" bold=\"true\">${ticket.printTotal()}</text>\r\n        </line>    \r\n        #foreach ($paymentline in $ticket.payments)      \r\n         #if ($paymentline.name == \"cash\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">EspÃ¨ce</text>\r\n        </line>  \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>     \r\n         #end\r\n         #if ($paymentline.name == \"cashrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Refund</text>\r\n         </line>\r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"magcard\")\r\n        <line></line>        \r\n        <line>\r\n            <text bold=\"true\">Carte bleue</text>\r\n        </line>   \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>  \r\n         #end  \r\n         #if ($paymentline.name == \"magcardrefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Mag card refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"cheque\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">ChÃ¨que</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"chequerefund\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Cheque refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperin\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Coupon</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"paperout\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Note Refund</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"free\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Offert</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end\r\n         #if ($paymentline.name == \"debt\")\r\n        <line></line>     \r\n        <line>\r\n            <text bold=\"true\">Dette</text>\r\n        </line>    \r\n        <line>\r\n            <text align =\"right\" length=\"42\">${paymentline.printTotal()}</text>\r\n        </line>    \r\n         #end \r\n         #end \r\n        <line></line>  \r\n        <line>\r\n            <text align=\"left\" length=\"15\">OpÃ©rateur :</text>\r\n            <text>${ticket.printUser()}</text>\r\n        </line> \r\n        <line></line>            \r\n        <line>\r\n            <text align=\"center\" length=\"42\">Merci de votre visite.</text>\r\n        </line>    \r\n    </ticket>\r\n</output>\r\n'),('30','Printer.PartialCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">Caisse partielle</text>            \n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Paiements</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        #foreach ($line in $payments.getPaymentLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printType()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line> \n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        <line>\n            <text align =\"left\" length=\"32\">Paiements :</text>\n            <text align =\"right\" length=\"10\">${payments.printPayments()}</text>\n        </line>\n        #if ($payments.hasCustomersCount())\n        <line>\n            <text align =\"left\" length=\"32\">Couverts :</text>\n            <text align =\"right\" length=\"10\">${payments.printCustomersCount()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"32\">Moyenne :</text>\n            <text align =\"right\" length=\"10\">${payments.printSalesPerCustomer()}</text>\n        </line>\n        #end\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printPaymentsTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Taxes</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getSaleLines())\n        <line>\n            <text align =\"left\" length=\"22\">${line.printTaxName()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxBase()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxes()}</text>\n        </line> \n        #end        \n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Categories</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getCategoryLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printCategory()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line>\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text align =\"left\" length=\"32\">Ticket :</text>\n            <text align =\"right\" length=\"10\">${payments.printSales()}</text>\n        </line>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Sous-total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesBase()}</text>\n        </line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"22\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTaxes()}</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>  \n        <line>\n            <text length=\"18\">ClÃ´ture:</text>\n            <text length=\"24\" align=\"right\">${payments.printDateEnd()}</text>\n        </line>  \n    </ticket>\n</output>'),('31','Printer.OpenCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">Overture de caisse</text>            \n        </line>\n        <line></line>\n        #if ($payments.hasFunds())\n        <line>\n            <text align=\"left\" length=\"32\">Fonds de caisse :</text>\n            <text align=\"right\" length=\"10\">${payments.printOpenCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"22\">DÃ©tail :</text>\n        </line>\n        #foreach ($val in $payments.getCountedCoins())\n        <line>\n            <text align=\"right\" length=\"12\">${payments.printCoinValue($val)}:</text>\n            <text length=\"10\"></text>\n            <text align=\"right\" length=\"10\">${payments.printCoinCount($val)}</text>\n            <text align=\"right\" length=\"10\">${payments.printCoinTotal($val)}</text>\n        </line>\n        #end\n        <line></line>\n        #end\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>\n    </ticket>\n</output>'),('4','Printer.TicketTotal',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>   \n    <display>\n        <line>\n            <text align=\"left\" length=\"10\">Total.</text>\n            <text align=\"right\" length=\"10\">${ticket.printTotal()}</text>\n        </line>\n        <line>\n           <text align=\"center\" length=\"20\">Thank you.</text>\n        </line>\n    </display>\n</output>\n'),('5','Printer.OpenDrawer',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <opendrawer/>   \n</output>\n'),('6','Printer.Ticket.Logo',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0Ò\0\0\0\0\0\0ø(cë\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0a\0\0a¨?§i\0\0\0tIMEİ%•dFÏ\0\0\0tEXtComment\0Created with GIMPW\0\0IDATxÚí[KÅ ÔÆû_™·z‰1µµMºk†¯‚9¥DIùQæ|Ÿs&k\ZhZ’uPrqhKqBÉ9Jÿ„wÄ:£2?­[ÆP3Ò#¦UĞ\r½ÿ¿Z£DâjÍ;*PDÁÎÛ;ù®¢ixğ`-2ğÌĞYd xk×(VŒZG¤\'¬²¥·’k9¾Ñƒ¥ìv€Æ·åwß¢­³½ö;\Z…¿ÑOZN¢°ì­óæTcÖËC$gêáûÄß(¾êÒn$\"ÊÿEÇò\0 Šò9¼ô¾íá„Úğ#ÿäDœo¯tÀ³ÂÉÂ¨wq‚HòöU9ÅÚµv6\Z\"Ê«¸¬¤ÊNÎÂ1¢µWÚİ¹xo\'ğˆ”’ˆÌíS}%é:=#|‹Ïƒ7<›š§–K_¶s*í¸½dáô¾rS*ÕÁ)øA	Õ õÈT+”P‘ğ®|n)²á»6X\rä§2ğËJrg:‰Ïk•HèuHqšÌ\'exË\'|C–;À‰øŒTjX¯jöÎ¤9i•ò¨½%ğÿ¿Ìrëh†ºvá™¥zÇöY<§Æk~¸å“TVîĞ©ÖGéçts±m<–UŠ±¼¬f)²İÁÁÀÂ.fL»C†V=ö³†Hgí™V±ã¢h®eeK.I[6xG;äµöU®~£t$-­¥²ÎÄ·¦ıl#Da§\'ı\0\0\0\0IEND®B`‚'),('7','Printer.TicketLine',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<output>\n    <display>\n        <line>\n            #if ($ticketline.isProductCom()) \n                <text align=\"left\" length=\"15\">*${ticketline.printName()}</text>\n            #else\n                 <text align=\"left\" length=\"15\">${ticketline.printName()}</text>\n            #end\n            <text align=\"right\" length=\"5\">x${ticketline.printMultiply()}</text>\n        </line>\n        <line>\n            <text align=\"right\" length=\"10\">${ticketline.printPrice()}</text>\n            <text align=\"right\" length=\"10\">${ticketline.printSubValue()}</text>\n        </line>\n    </display>\n</output>'),('8','Printer.CloseCash',0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2007-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n\n<output>\n    <ticket>\n        <image>Printer.Ticket.Logo</image>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"center\" length=\"42\" bold=\"true\">ClÃ´ture de caisse</text>            \n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Paiements</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        #foreach ($line in $payments.getPaymentLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printType()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line> \n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line> \n        <line>\n            <text align =\"left\" length=\"32\">Paiements :</text>\n            <text align =\"right\" length=\"10\">${payments.printPayments()}</text>\n        </line>\n        #if ($payments.hasCustomersCount())\n        <line>\n            <text align =\"left\" length=\"32\">Couverts :</text>\n            <text align =\"right\" length=\"10\">${payments.printCustomersCount()}</text>\n        </line>\n        <line>\n            <text align =\"left\" length=\"32\">Moyenne :</text>\n            <text align =\"right\" length=\"10\">${payments.printSalesPerCustomer()}</text>\n        </line>\n        #end\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printPaymentsTotal()}</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Taxes</text>\n        </line>\n        <line>\n            <text align =\"right\" length=\"42\">Total</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getSaleLines())\n        <line>\n            <text align =\"left\" length=\"22\">${line.printTaxName()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxBase()}</text>\n            <text align =\"right\" length=\"10\">${line.printTaxes()}</text>\n        </line> \n        #end        \n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text bold=\"true\">Categories</text>\n        </line>\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        #foreach ($line in $payments.getCategoryLines())\n        <line>\n            <text align =\"left\" length=\"32\">${line.printCategory()}</text>\n            <text align =\"right\" length=\"10\">${line.printValue()}</text>\n        </line>\n        #end\n        <line>\n            <text>------------------------------------------</text>\n        </line>\n        <line></line>\n        <line>\n            <text align =\"left\" length=\"32\">Tickets :</text>\n            <text align =\"right\" length=\"10\">${payments.printSales()}</text>\n        </line>\n        <line></line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"32\" bold=\"true\">Sous-total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesBase()}</text>\n        </line>\n        <line size=\"1\">\n            <text align =\"left\" length=\"22\" bold=\"true\">Total</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTaxes()}</text>\n            <text align =\"right\" length=\"10\" bold=\"true\">${payments.printSalesTotal()}</text>\n        </line>\n        <line></line>\n        #if ($payments.hasFunds())\n        <line>\n            <text align=\"left\" length=\"32\">Ouverture</text>\n            <text align=\"right\" length=\"10\">${payments.printOpenCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"32\">CÃ´ture</text>\n            <text align=\"right\" length=\"10\">${payments.printCloseCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"32\">Fonds attendus</text>\n            <text align=\"right\" length=\"10\">${payments.printExpectedCash()}</text>\n        </line>\n        <line>\n            <text align=\"left\" length=\"22\">Detail :</text>\n        </line>\n        #foreach ($val in $payments.getCountedCoins())\n        <line>\n            <text align=\"right\" length=\"12\">${payments.printCoinValue($val)}:</text>\n            <text length=\"10\"></text>\n            <text align=\"right\" length=\"10\">${payments.printCoinCount($val)}</text>\n            <text align=\"right\" length=\"10\">${payments.printCoinTotal($val)}</text>\n        </line>\n        #end\n        <line></line>\n        #end\n        <line>\n            <text length=\"18\">Caisse :</text>\n            <text>${payments.printHost()}</text>\n        </line>    \n        <line>\n            <text length=\"18\">Sequence :</text>\n            <text length=\"24\" align=\"right\">${payments.printSequence()}</text>\n        </line> \n        <line>\n            <text length=\"18\">Ouverture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateStart()}</text>\n        </line>  \n        <line>\n            <text length=\"18\">ClÃ´ture :</text>\n            <text length=\"24\" align=\"right\">${payments.printDateEnd()}</text>\n        </line>  \n    </ticket>\n</output>'),('9','Window.Logo',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzô\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEİ;ÚÅá\0\0\0tEXtComment\0Created with GIMPW\0\0EIDATXÃ½W}lSUÿİ÷^Û×ulX`Àø(u¡clÌh\"B†QPQ„d \"$dÁ¦Ñ˜1‘OÉ>˜2•\'n¢ c0‚FÈ€	QQ7èp@WX_Û÷ŞñhéÛ{íêL8I“öôŞ{Îùı~÷Ü{ÙÚüéç[.lVd9‹pïL-õfO]É›6«N’|™Œ1\0`÷(>îëÛ·Ağz¥,ÆENDğz%ÈŠ\"ãÁA€Õ*âNA‘Œ1ÆÈİéÎ8‹X¹$I2$	93¦áá‰NØív˜L@Æd)ª\n—«µÇ\ZqøH-şnmƒ(Š \"£„À2™Aİ«eŒÁïàÃŞAvÖd?lCãZ~½ˆuëß‚ËÕ;…êŒ3À¢(â»ƒ•˜š9IãÅÂÇ¥¦8ğUe9œ9^I \'twx½¾Ü[†ÄÄ„˜ƒö„È›ù«!¨9tD‡$>Ğçóãí‚|Üo ƒŒˆbNcD„Ö!ŞfÓ¥Ñ@Ÿ>ñ¨®Ú«[TUUp‡³çZàñÜ„0D€ÙlÂ¨‘#˜˜ «”ˆPßp«V¯‡(Zôrf<nÜåjÇ‚Üå¸~İ\r‹L‹Jç1ï™§°vÍ\nMŒ1L46[EÑ\'à•$dgMÑL\"\"p‡æÁïÀjc¢à³/ö!)i ^œ?O+8Ç¤Aøó¯V½$¯„´´4°1ÆĞxü$:=7c]píŞ³×PÉÉÃ4z\n% (\nx×-xÅÕÁÀß\n·nunÏîâ¾û‹E\\-ªÚU…ªª\ZßmõÇ–¬ĞÛ½\r\0vû\0<;w\0TU£µõ2\0úOı£W	0Æœ<å…¡d.x//[…æ³ç{lÑQ[q,æóù°|i®®Ùíü))dYÑˆ-ÜÛåıÿ	(ŠŠ¸¸8ïD„²’í;&@\0{**5ó::®¡áx“‰^Q`µŠ8Põ-&f8uğJ\n·`ñÒ×ñş¦-8}¦Ng\Z\\íWQ¹o?L&S\rPDÂ\rİÕ5?`ğ xuù\rÌADJ‹¶bÑ’×P[×ˆ£uàîPQ<ÏC\rk‘A64ÉO³ÙŒâ]ŸbÛbMõáß?)Ş†qcÇD½çqw/‰\"~9Ó¬;õ2&8‘šê€ª’ÑÅÅ»vcga©FháÂ,.ÜŒ1©£AD†\'*?løèïr¢™S&é¶ÏÜ§gÁãñàÂÅß5	Øíÿúù4\0`BúønÍèvsfÏD]ıqüÓqMwiÑÇ³‡í×À¾ \0øüş¤Œ1\\½ÚwßÛ„úÆ&,ËËÅ+y‹#Î_’·gÏµ„’\0~h²£ 8Pòù¡(\n2&8up†TËóàÃ>ññ6ÌÌyß<„£µ\réÎ4ÍÜàú³gå öX®ßpß¥ yDJAp0Ïsh:y\n©)Œ1\\W}´ÎØÚÚ†CÓÉS`ŒE¤##}<JË*`±˜‘(ŠX›¿å»?×(º§öê¹y\0`6›±}g	ŠJÊ5ƒ‰Øí ËrôNh±X°uGæ>Ÿ‹Ógš#\"ô·]¾‚êšïC¿ã¬V|\\XŠÒ²\nİœÃ?C|¼ÍX„FÕuuyÑ¯__<ôà88FÔç7Ün|]Uç6‹^š•+ò\0\0\'šNaÍ´=eJötŠ…çh·âhseY†Ûİ	“É“É«UûRúPg§§Ç‡ioß‚  ÿ~ºƒ\0\r<\\[[Û(«(â^X¸¨m¶8üqé’ã_î¡k®c}«\0\0\0\0IEND®B`‚');
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
INSERT INTO `ROLES` VALUES ('0','RÃ´le administrateur','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.customers.CustomersPayment\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelCloseMoney\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.EditTicket\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <!-- <class name=\"sales.ChangeTaxOptions\"/> -->\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.debt\"/>\n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.BackOffice\"/>\n    <class name=\"fr.pasteque.pos.forms.MenuMaintenance\"/>\n    <class name=\"fr.pasteque.pos.admin.ResourcesPanel\"/>\n    <class name=\"fr.pasteque.possync.ProductsSyncCreate\"/>\n    <class name=\"fr.pasteque.possync.OrdersSyncCreate\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPrinter\"/>\n    <class name=\"fr.pasteque.pos.config.JPanelConfiguration\"/>\n    <class name=\"button.print\"/>\n    <class name=\"button.opendrawer\"/>\n    <class name=\"button.openmoney\"/>\n</permissions>\n'),('1','RÃ´le responsable','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.customers.CustomersPayment\"/>    \n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelCloseMoney\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.debt\"/>    \n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.BackOffice\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"button.print\"/>\n    <class name=\"button.opendrawer\"/>\n    <class name=\"button.openmoney\"/>\n</permissions>\n'),('2','RÃ´le employÃ©','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n    Openbravo POS is a point of sales application designed for touch screens.\n    Copyright (C) 2008-2009 Openbravo, S.L.\n    http://sourceforge.net/projects/openbravopos\n\n    This file is part of Openbravo POS.\n\n    Openbravo POS is free software: you can redistribute it and/or modify\n    it under the terms of the GNU General Public License as published by\n    the Free Software Foundation, either version 3 of the License, or\n    (at your option) any later version.\n\n    Openbravo POS is distributed in the hope that it will be useful,\n    but WITHOUT ANY WARRANTY; without even the implied warranty of\n    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n    GNU General Public License for more details.\n\n    You should have received a copy of the GNU General Public License\n    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.\n -->\n<permissions>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketSales\"/>\n    <class name=\"fr.pasteque.pos.sales.JPanelTicketEdits\"/>\n    <class name=\"fr.pasteque.pos.panels.JPanelPayments\"/>\n    <class name=\"sales.EditLines\"/>\n    <class name=\"sales.RefundTicket\"/>\n    <class name=\"sales.PrintTicket\"/>\n    <class name=\"sales.Total\"/>\n    <class name=\"payment.cash\"/>\n    <class name=\"payment.cheque\"/>\n    <class name=\"payment.paper\"/>\n    <class name=\"payment.magcard\"/>\n    <class name=\"payment.free\"/>\n    <class name=\"payment.prepaid\"/>\n    <class name=\"refund.cash\"/>\n    <class name=\"refund.cheque\"/>\n    <class name=\"refund.paper\"/>\n    <class name=\"refund.magcard\"/>\n    <class name=\"Menu.ChangePassword\"/>\n    <class name=\"button.print\"/>\n</permissions>\n');
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
