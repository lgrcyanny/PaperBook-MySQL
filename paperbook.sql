-- MySQL dump 10.13  Distrib 5.1.44, for apple-darwin8.11.1 (i386)
--
-- Host: localhost    Database: paperbook
-- ------------------------------------------------------
-- Server version	5.1.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brief_comments`
--

DROP TABLE IF EXISTS `brief_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brief_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(800) DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `score` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `literature_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_BriefComment_User1_idx` (`user_id`),
  KEY `fk_BriefComment_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brief_comments`
--

LOCK TABLES `brief_comments` WRITE;
/*!40000 ALTER TABLE `brief_comments` DISABLE KEYS */;
INSERT INTO `brief_comments` VALUES (1,'I like this paper',1,'2014-01-05 04:39:46',0,'',15,98),(2,'Great Idea',1,'2014-01-05 04:39:46',4,'',15,98),(3,'no problem',1,'2014-01-05 04:39:46',4,'write',15,98),(5,'big table is great',1,'2014-01-05 04:39:46',4,'hadoop',15,98),(8,'no problem',1,'2014-01-05 04:39:46',2,'big table, hadoop, cloud computing',15,98),(14,'no way today',1,'2014-01-05 04:39:46',0,'hadoop, big table, write, i like it, great cloud computing',18,98),(19,'comment here',1,'2014-01-05 04:39:46',0,'hadoop,big table,write,i like it,suck',18,98),(20,'brief comments here',1,'2014-01-04 10:45:48',3,'great tags',1,95),(21,'brief comments here',1,'2014-01-04 10:48:42',3,'great tags',1,95),(22,'halallalalal',1,'2014-01-04 10:51:49',4,'good hadoop,hadoop,good',1,99),(23,'jad;;a;;a;a',1,'2014-01-04 10:52:16',5,'haha,hadoop,no way',1,99),(24,'Nice hadoop',1,'2014-01-04 13:35:16',4,'hadoop',1,98),(25,'Nice hadoop',1,'2014-01-04 13:37:25',0,'hadoop, write, hadoop',1,98),(29,'I like hadoop',1,'2014-01-04 13:48:48',0,'hadoop,     trim,      nice ways,',1,98),(30,'open hahha',1,'2014-01-04 13:49:13',0,'hadoop,write,trim,nice ways,mmm,    ,',1,98),(31,'witch wizard',1,'2014-01-05 04:39:46',4,'hadoop',16,98),(32,'hadoop, google',1,'2014-01-05 04:39:46',4,'hadoop',16,98),(35,'nice hadoop',1,'2014-01-05 04:39:46',0,'hadoop',16,98),(37,'no problem',1,'2014-01-05 04:39:46',4,'great today',16,98),(38,'i would like to do',1,'2014-01-05 04:39:46',5,'great',16,98),(39,'Hadoop is great',1,'2014-01-05 04:39:46',4,'Hadoop,  HDFS',16,100),(43,'Commen here',1,'2014-01-05 04:51:53',0,'hadoop',1,101),(42,'HBase is great',1,'2014-01-05 04:51:32',4,'hadoop, Hbase, Hello',1,101);
/*!40000 ALTER TABLE `brief_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_config`
--

DROP TABLE IF EXISTS `global_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `literature_type` varchar(20000) DEFAULT NULL,
  `rich_comment` varchar(500) DEFAULT NULL,
  `reference_type` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_config`
--

LOCK TABLES `global_config` WRITE;
/*!40000 ALTER TABLE `global_config` DISABLE KEYS */;
INSERT INTO `global_config` VALUES (1,'[{\"name\":\"Book\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publisher\",\"editors\",\"isbn\"]},{\"name\":\"BookSection\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publisher\",\"book_name\",\"editors\",\"editon\",\"isbn\",\"publication\",\"doi\"]},{\"name\":\"Journal\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publication\",\"volume\",\"issue\",\"doi\"]},{\"name\":\"Conference\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publication\",\"city\",\"doi\"]},{\"name\":\"Thesis\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"college\"]},{\"name\":\"Online\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publisher\",\"book\"]},{\"name\":\"Report\",\"info\":[\"title\",\"year\",\"authors\",\"url\",\"pages\",\"keywords\",\"abstract\",\"references\",\"publication\",\"volume\"]}]','[\"Problem\",\"Idea\",\"Experiment\",\"Contribution\",\"Improvment\"]','[\"Mention\",\"Related\",\"Use\",\"Compare\",\"Unknown\",\"RelatedLike\"]');
/*!40000 ALTER TABLE `global_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `literatures`
--

DROP TABLE IF EXISTS `literatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `literatures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `authors` varchar(120) DEFAULT NULL,
  `year` int(5) NOT NULL DEFAULT '2014',
  `pages` varchar(20) DEFAULT NULL,
  `abstract` text,
  `tags` varchar(300) DEFAULT NULL,
  `keywords` varchar(300) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `publisher` varchar(80) DEFAULT NULL,
  `editors` varchar(100) DEFAULT NULL,
  `edition` varchar(40) DEFAULT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publication` varchar(100) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `issue` int(11) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `doi` varchar(40) DEFAULT NULL,
  `college` varchar(40) DEFAULT NULL,
  `references` text,
  `cited` text,
  `file` varchar(1000) DEFAULT NULL,
  `accessories` varchar(2048) DEFAULT NULL,
  `score_avg` double unsigned DEFAULT '0',
  `score_count` int(11) unsigned DEFAULT '0',
  `add_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Literature_User1_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `literatures`
--

LOCK TABLES `literatures` WRITE;
/*!40000 ALTER TABLE `literatures` DISABLE KEYS */;
INSERT INTO `literatures` VALUES (85,'Book','Cloud computing, a practical approach','T Velte, A Velte',0,'','Cloud Computing: A Practical Approach provides a comprehensive look at the emerging paradigm \nof Internet-based enterprise applications and services. This accessible book offers a broad introduction \nto cloud computing, reviews a wide variety of currently available solutions, and discusses',NULL,'',' dl.acm.org','ACM','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"76\",\"title\":\"[76]-Bigtable: A distributed storage system for structured data\",\"type\":\"Mention\"},{\"id\":\"84\",\"title\":\"[84]-The Eucalyptus Open-Source Cloud-Computing System\",\"type\":\"Mention\"},{\"id\":\"83\",\"title\":\"[83]-A View of Cloud Computing\",\"type\":\"Mention\"},{\"id\":\"100\",\"title\":\"[100]-Hadoop HDFS Architecture\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"p50-armbrust.pdf\",\"type\":\"application\",\"size\":\"841KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/p50-armbrust.pdf\"}','[{\"name\":\"HadoopHDFS和MapReduce架构浅析.pdf\",\"type\":\"application\",\"size\":\"889KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/HadoopHDFS和MapReduce架构浅析.pdf\"}]',0,0,'2014-01-05 04:22:41',1),(84,'Journal','The Eucalyptus Open-Source Cloud-Computing System','Nurmi, D. ; Comput. Sci. Dept., Univ. of California, Santa Barbara, MD ; Wolski, R. ; Grzegorczyk, C. ; Obertelli, G.  m',2010,'124-131','Cloud computing systems fundamentally provide access to large pools of data and computational resources through a variety of interfaces similar in spirit to existing grid and HPC resource management and programming systems. These types of systems offer a new programming target for scalable application developers and have gained popularity over the past few years. However, most cloud computing systems in operation today are proprietary, rely upon infrastructure that is invisible to the research community, or are not explicitly designed to be instrumented and modified by systems researchers. In this work, we present Eucalyptus - an open-source software framework for cloud computing that implements what is commonly referred to as infrastructure as a service (IaaS); systems that give users the ability to run and control entire virtual machine instances deployed across a variety physical resources.\n\n We outline the basic principles of the Eucalyptus design, detail important operational aspects of the system, and discuss architectural trade-offs that we have made in order to allow EUCALYPTUS to be portable, modular and simple to use on infrastructure commonly found within academic settings. Finally, we provide evidence that EUCALYPTUS enables users familiar with existing grid and HPC systems to explore new cloud computing functionality while maintaining access to existing, familiar application development software and grid middleware.',NULL,'Web services grid computing middleware parallel processing programming public domain software resour','http://ieeexplore.ieee.org/',NULL,NULL,NULL,NULL,NULL,'Cluster Computing and the Grid, 2009. CCGRID \'09. 9th IEEE/ACM International Symposium on',0,0,NULL,'10.1109/CCGRID.2009.93',NULL,'[{\"id\":\"76\",\"title\":\"[76]-Bigtable: A distributed storage system for structured data\",\"type\":\"Use\"},{\"id\":\"83\",\"title\":\"[83]-A View of Cloud Computing\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"A comparison of software and hardware techniques for x86 virtualization.\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"Google三大论文_中文版.pdf\",\"type\":\"application\",\"size\":\"3MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/Google三大论文_中文版.pdf\"}','[{\"name\":\"Introduction.pdf\",\"type\":\"application\",\"size\":\"2MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/Introduction.pdf\"},{\"name\":\"play with fire.mp4\",\"type\":\"video\",\"size\":\"72MB\",\"extension\":\"mp4\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/play with fire.mp4\"}]',0,0,'2013-12-24 11:39:50',1),(83,'Journal','A View of Cloud Computing','M Armbrust, A Fox, R Griffith, AD Joseph',2010,'10-20','Cloud computing, the long-held dream of computing as a utility, has the potential to transform \na large part of the IT industry, making software even more attractive as a service and shaping \nthe way IT hardware is designed and purchased. Developers with innovative ideas for',NULL,'Cloud Computing','http://dl.acm.org/citation.cfm?id=1721672',NULL,NULL,NULL,NULL,NULL,'Communications of the ACM',20,19,NULL,'',NULL,'[{\"id\":\"\",\"title\":\"Amazon.com CEO Jeff Bezos on Animoto (Apr. 2008)\",\"type\":\"Use\"},{\"id\":\"76\",\"title\":\"[76]-Bigtable: A distributed storage system for structured data\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"Coudera Hadoop_For_Developers.pdf\",\"type\":\"application\",\"size\":\"32MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/Coudera Hadoop_For_Developers.pdf\"}','[{\"name\":\"Introduction.pdf\",\"type\":\"application\",\"size\":\"2MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/Introduction.pdf\"}]',0,0,'2013-12-24 10:55:01',1),(76,'Journal','Bigtable: A distributed storage system for structured data','Jeaf Dean',2009,'','Each cluster serves a set of tables. A table in Bigtable is a sparse, distributed, per- sistent\nmultidimensional sorted map. ... A Bigtable cluster stores a number of tables. Each table consists\nof a set of tablets, and each tablet contains all of the data associated with a row range.',NULL,'','','Google Inc.','','',NULL,'','',0,0,NULL,'',NULL,'[{\"id\":\"\",\"title\":\"Google Map Reduce\",\"type\":\"Related\"}]',NULL,'{\"name\":\"bigtable Google.pdf\",\"type\":\"application\",\"size\":\"221KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/bigtable Google.pdf\"}','[{\"name\":\"taobao CDN.pdf\",\"type\":\"application\",\"size\":\"800KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/taobao CDN.pdf\"}]',0,0,'2013-12-24 10:55:01',1),(86,'Book','Hadoop The Definitive Guide','Tom White',2012,'','Hadoop got its start in Nutch. A few of us were attempting to build an open source web search engine and having trouble managing computations running on even a handful of computers. Once Google published its GFS and MapReduce papers, the route became clear. They’d devised systems to solve precisely the problems we were having with Nutch. So we started, two of us, half-time, to try to re-create these systems as a part of Nutch.\nWe managed to get Nutch limping along on 20 machines, but it soon became clear that to handle the Web’s massive scale, we’d need to run it on thousands of machines and, moreover, that the job was bigger than two half-time developers could handle.\nAround that time, Yahoo! got interested, and quickly put together a team that I joined. We split off the distributed computing part of Nutch, naming it Hadoop. With the help of Yahoo!, Hadoop soon grew into a technology that could truly scale to the Web.','','','','Oreilly Publisher','','3 Edition',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"76\",\"title\":\"[76]-Bigtable: A distributed storage system for structured data\",\"type\":\"Mention\"},{\"id\":\"84\",\"title\":\"[84]-The Eucalyptus Open-Source Cloud-Computing System\",\"type\":\"Compare\"},{\"id\":\"100\",\"title\":\"[100]-Hadoop HDFS Architecture\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"HadoopTheDefinitiveGuideThirdEdition.pdf\",\"type\":\"application\",\"size\":\"8MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/HadoopTheDefinitiveGuideThirdEdition.pdf\"}','[{\"name\":\"taobao CDN.pdf\",\"type\":\"application\",\"size\":\"800KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/taobao CDN.pdf\"}]',3.6,5,'2014-01-05 04:18:59',19),(87,'Book','The hadoop distributed file system: Architecture and design','',2007,'','The Apache Hadoop software library is a framework that allows for the distributed processing of large data sets across clusters of computers using simple programming models. It is designed to scale up from single servers to thousands of machines, each offering local computation and storage. Rather than rely on hardware to deliver high-availability, the library itself is designed to detect and handle failures at the application layer, so delivering a highly-available service on top of a cluster of computers, each of which may be prone to failures.',NULL,'','','apache.org','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"86\",\"title\":\"[86]-Hadoop The Definitive Guide\",\"type\":\"Mention\"},{\"id\":\"84\",\"title\":\"[84]-The Eucalyptus Open-Source Cloud-Computing System\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"HDFS Architecture Guide.pdf\",\"type\":\"application\",\"size\":\"289KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/HDFS Architecture Guide.pdf\"}',NULL,0,0,'2013-12-26 04:24:44',15),(88,'Journal','Hadoop high availability through metadata replication','Wang, Feng',1986,'37','Hadoop is widely adopted to support data intensive distributed applications. Many of them are mission critical and require inherent high availability of Hadoop. Unfortunately, Hadoop has no high availability support yet, and it is not trivial to enhance Hadoop. Based on thorough investigation of Hadoop, this paper proposes a metadata replication based solution to enable Hadoop high availability by removing single point of failure in Hadoop. The solution involves three major phases: in initialization phase, each standby/slave node is registered to active/primary node and its initial metadata (such as version file and file system image) are caught up with those of active/primary node; in replication phase, the runtime metadata (such as outstanding operations and lease states) for failover in future are replicated; in failover phase, standby/new elected primary node takes over all communications. The solution presents several unique features for Hadoop, such as runtime configurable synchronization mode. The experiments demonstrate the feasibility and efficiency of our solution.',NULL,'Hadoop, Distributed Computing, Big Data,  high availability','http://portal.acm.org/citation.cfm?doid=1651263.1651271',NULL,NULL,NULL,NULL,NULL,'Proceeding of the first international workshop on Cloud data management - CloudDB \'09',0,0,NULL,'10.1145/1651263.1651271',NULL,'[{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"},{\"id\":\"85\",\"title\":\"[85]-Cloud computing, a practical approach\",\"type\":\"Mention\"},{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"Introduction.pdf\",\"type\":\"application\",\"size\":\"2MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/Introduction.pdf\"}','[{\"name\":\"MapReduce- simplified data processing on large clusters(Google).pdf\",\"type\":\"application\",\"size\":\"384KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/MapReduce- simplified data processing on large clusters(Google).pdf\"},{\"name\":\"taobao CDN.pdf\",\"type\":\"application\",\"size\":\"800KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/24/taobao CDN.pdf\"}]',0,0,'2013-12-24 15:53:16',1),(89,'Book','Map-reduce-merge: simplified relational data processing on large clusters','H Yang, A Dasdan, RL Hsiao, DS Parker ',2007,'37','Abstract Map-Reduce is a programming model that enables easy development of scalable \nparallel applications to process a vast amount of data on large clusters of commodity \nmachines. Through a simple interface with two functions, map and reduce, this mode',NULL,'Map-reduce, relational data','http://dl.acm.org','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"},{\"id\":\"85\",\"title\":\"[85]-Cloud computing, a practical approach\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"Hadoop Architecture\",\"type\":\"Compare\"}]',NULL,'{\"name\":\"HadoopHDFS和MapReduce架构浅析.pdf\",\"type\":\"application\",\"size\":\"889KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/HadoopHDFS和MapReduce架构浅析.pdf\"}','[]',0,0,'2013-12-26 04:24:45',15),(90,'Book','Scientific Cloud Computing: Early Definition and Experience','Lizhe Wang ;  Jie Tao ; Kunze, M. ; Castellanos, A.C.  more authors',1989,'','Cloud computing emerges as a new computing paradigm which aims to provide reliable, customized and QoS guaranteed computing dynamic environments for end-users. This paper reviews recent advances of Cloud computing, identifies the concepts and characters of scientific Clouds, and finally presents an example of scientific Cloud for data centers',NULL,'QoS guaranteed computing, Web service, customized computing, environment reliable computing environm','http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=4637787&tag=1','High Performance Computing and Communications, 2008. HPCC \'08. 10th IEEE Interna','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"85\",\"title\":\"[85]-Cloud computing, a practical approach\",\"type\":\"Use\"},{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"},{\"id\":\"76\",\"title\":\"[76]-Bigtable: A distributed storage system for structured data\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"HBase Schema Design.pdf\",\"type\":\"application\",\"size\":\"1MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/24/HBase Schema Design.pdf\"}',NULL,0,0,'2013-12-24 15:58:42',1),(91,'Journal','Cloud Computing: a Perspective Study','Jongwook Woo, Kilhung Lee',2010,'137-146','he Cloud computing emerges as a new computing paradigm which aims to provide reliable, customized and QoS guaranteed dynamic computing environments for end-users. In this paper, we study the Cloud computing paradigm from various aspects, such as definitions, distinct features, and enabling technologies. This paper brings an introductional review on the Cloud computing and provides the state-of-the-art of Cloud computing technologies.',NULL,'Cloud Computing, Grid Computing, Cyberinfrastructure','http://link.springer.com/article/10.1007/s00354-008-0081-5',NULL,NULL,NULL,NULL,NULL,'New Generation Computing',28,2,NULL,'10.1007/s00354-008-0081-5',NULL,'[{\"id\":\"\",\"title\":\"Here comes haas, access on June 2008. \",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"Nimbus Project, access on June 2008.\",\"type\":\"Mention\"},{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"deankeynoteladis2009-13245019669447-phpapp01-111221151545-phpapp01.pdf\",\"type\":\"application\",\"size\":\"3MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/25/deankeynoteladis2009-13245019669447-phpapp01-111221151545-phpapp01.pdf\"}',NULL,0,0,'2013-12-24 16:15:12',1),(92,'Book','MapReduce Example with HBase for Association Rule','Jongwook Woo, Kilhung Lee',2013,'49-54','The paper illustrates how to store and compute association sets of Big Transaction Data using Hadoop and HBase and then, shows the experimental result of a MapReduce algorithm using HBase to find out association in transaction data, which is a Market Basket Analysis algorithm of Association Rule in Business Intelligence. The algorithm sorts and converts the transaction data of HBase to data set with (key, value) pair, and stores the associated data to the HBase. The algorithm and HBase run on Amazon EC2 service using Apache Whirr. The experimental results show that the algorithm increases the performance as adding more nodes till a certain number of transaction data. However, it loses control and connection when there are too many IOs with more than 3.5 millions of transaction data in HBase.',NULL,'HBase, NoSQL DB, MapReduce, Market Basket Analysis Hadoop','http://link.springer.com/chapter/10.1007/978-3-642-40861-8_8','','','Forth Edition',NULL,'10.1007/978-3-642-40',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"Mention\"}]',NULL,'{}','[]',4,1,'2014-01-03 16:05:55',1),(98,'Book','Bigtable: A distributed storage system for structured data','Jeaf Dean',2010,'1-10','sdjfksjdfasj;dfjs;kf','hadoop,write,trim,nice ways,mmm,great today,great','sksk, skjdk, skjdk','http:www.google.com','write','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"86\",\"title\":\"[86]-Hadoop The Definitive Guide\",\"type\":\"Mention\"},{\"id\":\"84\",\"title\":\"[84]-The Eucalyptus Open-Source Cloud-Computing System\",\"type\":\"Type0\"}]',NULL,'{\"name\":\"Architectural Patterns.pdf\",\"type\":\"application\",\"size\":\"468KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2014/01/04/Architectural Patterns.pdf\"}','[{\"name\":\"HadoopHDFS和MapReduce架构浅析.pdf\",\"type\":\"application\",\"size\":\"889KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2014/01/04/HadoopHDFS和MapReduce架构浅析.pdf\"},{\"name\":\"Google三大论文_中文版.pdf\",\"type\":\"application\",\"size\":\"3MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2014/01/04/Google三大论文_中文版.pdf\"}]',3.42105263157895,19,'2014-01-04 14:50:45',1),(99,'Book','Hello Analytics','Aitjper',2010,'','sdjflsadkjflkasdjf;laskdf','','','google.com','','Great Orilly',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"85\",\"title\":\"[85]-Cloud computing, a practical approach\",\"type\":\"Mention\"},{\"id\":\"86\",\"title\":\"[86]-Hadoop The Definitive Guide\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"MapReduce- simplified data processing on large clusters(Google) copy.pdf\",\"type\":\"application\",\"size\":\"401KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2014/01/04/MapReduce- simplified data processing on large clusters(Google) copy.pdf\"}','[{\"name\":\"HDFS Architecture Guide.pdf\",\"type\":\"application\",\"size\":\"289KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2014/01/04/HDFS Architecture Guide.pdf\"}]',4.33333333333333,3,'2014-01-04 15:59:22',1),(100,'Journal','Hadoop HDFS Architecture','Jeaf Dean',2014,'10-12','We describe the architecture of HDFS and report on experience using HDFS to manage 25\npetabytes of enterprise data at Yahoo!. Keywords: Hadoop, HDFS, distributed file system ... Yahoo!\nhas developed and contributed to 80% of the core of Hadoop (HDFS and MapRe- duce)','hadoop,hdfs,learning,algorithm,i like','Hadoop, Distributed Computing, Big Data, 大数据, 分布式','google.com',NULL,NULL,NULL,NULL,NULL,'orilly',10,3,NULL,'',NULL,'[{\"id\":\"86\",\"title\":\"[86]-Hadoop The Definitive Guide\",\"type\":\"Related\"},{\"id\":\"88\",\"title\":\"[88]-Hadoop high availability through metadata replication\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"Grid Computing\",\"type\":\"Mention\"}]',NULL,'{\"name\":\"Mogent系统通信机制.pdf\",\"type\":\"application\",\"size\":\"679KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/rentongwei/literatures/2014/01/05/Mogent系统通信机制.pdf\"}','[{\"name\":\"Chapter 6 Consistency and Replication_2012.ppt\",\"type\":\"application\",\"size\":\"825KB\",\"extension\":\"ppt\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/rentongwei/accessories/2014/01/05/Chapter 6 Consistency and Replication_2012.ppt\"},{\"name\":\"分布式计算复习.docx\",\"type\":\"application\",\"size\":\"3MB\",\"extension\":\"docx\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/rentongwei/accessories/2014/01/05/分布式计算复习.docx\"},{\"name\":\"02 Mobile (Demo).mp3\",\"type\":\"audio\",\"size\":\"5MB\",\"extension\":\"mp3\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/rentongwei/accessories/2014/01/05/02 Mobile (Demo).mp3\"}]',3.33333333333333,3,'2014-01-05 04:25:07',19),(101,'Journal','HBase and Hypertable for large scale distributed storage systems','A Khetrapal, V Ganesh - Dept. of Computer Science',2006,'10-20','Abstract BigTable is a distributed storage system developed at Google for managing \nstructured data and has the capability to scale to a very large size: petabytes of data across \nthousands of commodity servers. As now, there exist two open-source implementations','hadoop,hbase,hello,no problem','HBase, Hadoop','http://cloud.pubs.dbs.uni-leipzig.de/',NULL,NULL,NULL,NULL,NULL,'cloud pub',30,2,NULL,'',NULL,'[{\"id\":\"87\",\"title\":\"[87]-The hadoop distributed file system: Architecture and design\",\"type\":\"RelatedLike\"},{\"id\":\"85\",\"title\":\"[85]-Cloud computing, a practical approach\",\"type\":\"Compare\"}]',NULL,'{\"name\":\"Architectural Patterns.pdf\",\"type\":\"application\",\"size\":\"468KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2014/01/05/Architectural Patterns.pdf\"}','[{\"name\":\"HadoopHDFS和MapReduce架构浅析.pdf\",\"type\":\"application\",\"size\":\"889KB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2014/01/05/HadoopHDFS和MapReduce架构浅析.pdf\"},{\"name\":\"Google三大论文_中文版.pdf\",\"type\":\"application\",\"size\":\"3MB\",\"extension\":\"pdf\",\"path\":\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2014/01/05/Google三大论文_中文版.pdf\"}]',4,2,'2014-01-05 04:52:41',1);
/*!40000 ALTER TABLE `literatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) unsigned NOT NULL,
  `cited` int(11) unsigned NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
INSERT INTO `references` VALUES (49,91,87,'Mention'),(47,90,76,'Mention'),(46,90,87,'Mention'),(45,90,85,'Use'),(52,89,85,'Mention'),(51,89,87,'Mention'),(42,88,87,'Mention'),(41,88,85,'Mention'),(40,88,87,'Mention'),(79,85,83,'Mention'),(78,85,84,'Mention'),(77,85,76,'Mention'),(35,84,83,'Mention'),(34,84,76,'Use'),(28,83,76,'Mention'),(50,92,87,'Mention'),(73,86,84,'Compare'),(72,86,76,'Mention'),(58,98,84,'Type0'),(57,98,86,'Mention'),(67,99,86,'Mention'),(66,99,85,'Mention'),(84,100,88,'Mention'),(83,100,86,'Related'),(74,86,100,'Mention'),(80,85,100,'Mention'),(85,101,87,'RelatedLike'),(86,101,85,'Compare');
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rich_comments`
--

DROP TABLE IF EXISTS `rich_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rich_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `score` double NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `literature_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_RichComment_User1_idx` (`user_id`),
  KEY `fk_RichComment_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_comments`
--

LOCK TABLES `rich_comments` WRITE;
/*!40000 ALTER TABLE `rich_comments` DISABLE KEYS */;
INSERT INTO `rich_comments` VALUES (62,'{\"Title\":\"great Idea\",\"Problem\":\"no problem\",\"Idea\":\"great idea\"}','2014-01-05 04:52:41',1,4,'hadoop, no problem',1,101),(61,'{\"Title\":\"I like hadoop\",\"Problem\":\"No problem\",\"Idea\":\"Idea is great\"}','2014-01-05 04:54:41',1,0,'hadoop,hbase',18,101),(59,'{\"Title\":\"Hadoop great\",\"Problem\":\"No problem\"}','2014-01-05 04:16:36',1,4,'hadoop,hdfs',19,100),(57,'{\"Title\":\"No problem\",\"Contribution\":\"great\"}','2014-01-04 14:49:52',1,0,'',1,98),(58,'{\"Title\":\"Yes Nice WAYS\",\"Problem\":\"HDFS High Availablility\",\"Idea\":\"Idea is great\"}','2014-01-05 04:16:14',1,0,'hadoop, Learning, Algorithm,hdfs',19,100),(56,'{\"Title\":\"Kes;; lsoe\",\"Problem\":\"dfjlskdjf\",\"Idea\":\"dsjklasdj\",\"Experiment\":\"i4itoio\",\"Contribution\":\"sdfjlkds\",\"Improvment\":\"dsfjlksdj\"}','2014-01-04 10:52:46',1,4,'hadoop',1,99),(55,'{\"Title\":\"great\",\"Problem\":\"nice\",\"Idea\":\"nice\"}','2014-01-04 10:50:38',1,4,'great',1,95),(54,'{\"Title\":\"Nice\",\"Problem\":\"great\",\"Idea\":\"great\"}','2014-01-04 10:50:14',1,0,'great tags,hadoop',1,95),(53,'{\"Title\":\"Today\",\"Problem\":\"no problem\",\"Idea\":\"idea is great\"}','2014-01-04 10:41:09',1,3,'write,hadoop,big table',1,98),(14,'{\"Title\":\"Cloud Computing\",\"Problem\":\"test\",\"Idea\":\"test\"}','2013-12-26 17:30:44',1,0,'',1,84),(15,'{\"Title\":\"No way Cloud\",\"Problem\":\"test\",\"Idea\":\"test\",\"Experiment\":\"I like it\"}','2013-12-26 17:32:31',1,0,'',15,88),(17,'{\"Title\":\"I like it\"}','2013-12-27 02:09:17',1,0,'',15,84),(18,'{\"Title\":\"MapReduce Great\",\"Problem\":\"MapReduce Great\"}','2013-12-27 02:49:00',1,0,'',15,89),(52,'{\"Title\":\"Like IT\",\"Problem\":\"NO PROBLEM\"}','2014-01-04 04:57:35',1,4,'',1,98),(50,'{\"Title\":\"I like big table\",\"Problem\":\"rith\",\"Idea\":\"idea\"}','2014-01-04 04:56:26',1,5,'hadoop,big table',1,98),(49,'{\"Title\":\"I would like to do\",\"Idea\":\"idea\"}','2014-01-04 04:44:20',1,0,'',1,86),(48,'{\"Title\":\"write\",\"Problem\":\"no problem\"}','2014-01-04 04:43:33',1,0,'hadoopnice',1,86),(47,'{\"Title\":\"I like it\",\"Problem\":\"wrirt today\"}','2014-01-05 04:53:48',1,0,'',16,86),(46,'{\"Title\":\"I like it\",\"Problem\":\"wrirt today\"}','2014-01-05 04:53:48',1,0,'',16,86),(45,'{\"Title\":\"I like it\",\"Problem\":\"Hadoo great\"}','2014-01-05 04:53:48',1,5,'',16,86),(44,'{\"Title\":\"fuck hadoop\",\"Problem\":\"suck hadoop\"}','2014-01-05 04:54:41',1,1,'',16,86),(43,'{\"Title\":\"I wander yet\",\"Problem\":\"hadoop\"}','2014-01-04 04:31:40',1,3,'',1,86),(41,'{\"Title\":\"Great Hadoop\"}','2014-01-04 04:30:46',1,5,'',1,86),(42,'{\"Title\":\"Today\",\"Problem\":\"HADOOP\"}','2014-01-05 04:53:48',1,4,'',16,86);
/*!40000 ALTER TABLE `rich_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT '0',
  `sign_up_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lgrcyanny','lgrcyanny@gmail.com','06e00c339da4debb5c29fb2c216028ab401632bc','610221195374','Cyanny Liang',1,'2013-12-25 10:59:36'),(2,'lgrcyanny1','lgrcyanny@123.com','9bace480f29b2f8c54e7152a31cd88d072eb0ee9','366119282857','Cyanny Liang',0,'2013-12-14 14:05:40'),(18,'james123','james@gmail.com','7a00b0836230504d026724f13b2c0c9349f7315b','1227013892771','James',0,'2013-12-27 03:52:28'),(4,'lgrcyanny3','lgrcyanny3@123.com','1e436f64b463dd7b5f8ff1c287d341fe188c7434','1072216847367','Cyanny Liang',0,'2013-12-14 14:19:53'),(5,'lgrcyanny4','lgrcyanny4@123.com','42e7de2052f78e90a248c355d7c1c57df0b12505','1175016904811','Cyanny Liang',0,'2013-12-14 14:21:16'),(6,'lgrcyanny5','lgrcyanny5@123.com','3f5c787293d72b9c6c70a42f0d56a1f2cb4d4f2f','959777772964','Cyanny Liang',0,'2013-12-14 14:22:57'),(7,'lgrcyanny6','lgrcyanny6@123.com','9a4289d370e7ff31217c203d11b06629a765a2d7','1152264735780','Cyanny Liang',0,'2013-12-14 14:25:53'),(8,'lgrcyanny7','lgrcyanny7@123.com','2019df9c0bf0e8f8eb62d945442a8525e9251f1e','744784746496','Cyanny Liang',0,'2013-12-14 14:31:47'),(10,'lgrcyanny9','lgrcyanny9@123.com','1f57fb80e99bb2ff8be61ad21a3914a8a970f4e2','756061636539','Cyanny Liang',0,'2013-12-14 14:35:01'),(11,'lgrcyanny10','lgrcyanny10@example.com','1cd9034875e8ffea75e1f52b913ef809740eaa90','561566861881','Cyanny Liang',0,'2013-12-14 14:39:32'),(13,'lgrcyanny14','lgrcyanny14@123.com','b0b83a9983611ef19735f386fa8f9e8a25345368','762421474905','Cyanny Liang',0,'2013-12-14 15:11:14'),(15,'wwzyhao','wwzyhao@gmail.com','f5ef9828ad1cf762027e0f428cc6e4bd9d542cac','343710474018','wwzyhao',1,'2013-12-25 10:59:36'),(16,'fengyibin123','fengyibin@gmail.com','0a4a01d6dc2aa97bfadc93376be135a015e79c57','1260146040482','Yibing Feng',0,'2013-12-16 07:16:56'),(17,'white123','white123@gmail.com','94aa857b196c9c94dbca5660f71faa50a7cd9529','487259964559','White ',0,'2013-12-19 03:07:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-05 13:01:18
