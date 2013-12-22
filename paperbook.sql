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
  `user_id` int(11) NOT NULL,
  `iiterature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BriefComment_User1_idx` (`user_id`),
  KEY `fk_BriefComment_Literature1_idx` (`iiterature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brief_comments`
--

LOCK TABLES `brief_comments` WRITE;
/*!40000 ALTER TABLE `brief_comments` DISABLE KEYS */;
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
  `literature_type` varchar(500) DEFAULT NULL,
  `rich_comment` varchar(500) DEFAULT NULL,
  `reference_type` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_config`
--

LOCK TABLES `global_config` WRITE;
/*!40000 ALTER TABLE `global_config` DISABLE KEYS */;
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
  `year` int(5) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `abstract` text,
  `tags` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
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
  `file_path` varchar(300) DEFAULT NULL,
  `accessories` varchar(1024) DEFAULT NULL,
  `score_avg` double DEFAULT NULL,
  `score_count` int(11) unsigned DEFAULT NULL,
  `add_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Literature_User1_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `literatures`
--

LOCK TABLES `literatures` WRITE;
/*!40000 ALTER TABLE `literatures` DISABLE KEYS */;
INSERT INTO `literatures` VALUES (1,'Journal Article','A performance analysis of EC2 cloud computing services for scientific computing','S Ostermann, A Iosup, N Yigitbasi, R Prodan',2010,'30-40','Abstract. Cloud Computing is emerging today as a commercial infras- tructure that eliminates  the need for maintaining expensive computing hardware. Through the use of virtualization, clouds  promise to address with the same shared set of physical resources a large user base with',NULL,'cloud computing, analysis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-12-15 08:20:11',0),(2,'Journal Article','A performance analysis of EC2 cloud computing services for scientific computing','S Ostermann, A Iosup, N Yigitbasi, R Prodan',2010,'30-40','Abstract. Cloud Computing is emerging today as a commercial infras- tructure that eliminates  the need for maintaining expensive computing hardware. Through the use of virtualization, clouds  promise to address with the same shared set of physical resources a large user base with',NULL,'cloud computing, analysis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-12-15 08:20:49',0),(3,'Journal Article','A performance analysis of EC2 cloud computing services for scientific computing','S Ostermann, A Iosup, N Yigitbasi, R Prodan',2010,'30-40','Abstract. Cloud Computing is emerging today as a commercial infras- tructure that eliminates  the need for maintaining expensive computing hardware. Through the use of virtualization, clouds  promise to address with the same shared set of physical resources a large user base with',NULL,'cloud computing, analysis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-12-15 08:23:52',15),(4,'Book','Multi-agent systems: an introduction to distributed artificial intelligence',NULL,NULL,NULL,' collective, Inter Editions, Paris.) Even now, it is still the main reference for the ... Multi-Agent\r\nSimulation: Simulation is widely used to enhance knowledge in biology or in ... can be analysed\r\nthrough five different dimensions: physical, social, relational, environmental and personal. ...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-12-16 07:38:24',16),(22,'Conference',' Cloud Computing and Grid Computing 360-Degree Compared','Foster, I. ; Dept. of Comput. Sci., Univ. of Chicago, Chicago, IL, USA ; Yong Zhao ; Raicu, I. ; Shiyong Lu',2008,'1-10','Cloud computing has become another buzzword after Web 2.0. However, there are dozens of different definitions for cloud computing and there seems to be no consensus on what a cloud is. On the other hand, cloud computing is not a completely new concept; it has intricate connection to the relatively new but thirteen-year established grid computing paradigm, and other relevant technologies such as utility computing, cluster computing, and distributed systems in general. This paper strives to compare and contrast cloud computing with grid computing from various angles and give insights into the essential characteristics of both.',NULL,'Cloud Computing, Grid Computing','http://ieeexplore.ieee.org/',NULL,NULL,NULL,NULL,NULL,'Grid Computing Environments Workshop, 2008. GCE \'08',NULL,NULL,'Austin, TX','978-1-4244-2860-1',NULL,'S. Ahuja, N. Carriero, and D. Gelernter. \"Linda and Friends\", IEEE Computer 19 (8), 1986, pp. 26-34. \nAbstract | Full Text: PDF (6417KB)\nB. Allcock, J. Bester, J. Bresnahan, A. L. Chervenak, I. Foster, C. Kesselman, S. Meder, V. Nefedova, D. Quesnal, S. Tuecke. \"Data Management and Transfer in High Performance Computational Grid Environments\", Parallel Computing Journal, Vol. 28 (5), May 2002, pp. 749-771. \n[CrossRef] \nAmazon Elastic Compute Cloud (Amazon EC2), http://aws.amazon.com/ec2, 2008. \nAmazon Simple Storage Service (Amazon S3), http://aws.amazon.com/s3, 2008. ',NULL,'/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/18/HBase Schema Design.pdf',NULL,NULL,NULL,'2013-12-18 08:55:58',1),(24,'Book','A Performance Analysis of EC2 Cloud Computing Services for Scientific Computing','Simon Ostermann, Alexandria Iosup, Nezih Yigitbasi, Radu Prodan, Thomas Fahringer, Dick Epema',2010,'1-10','Cloud Computing is emerging today as a commercial infrastructure that eliminates the need for maintaining expensive computing hardware. Through the use of virtualization, clouds promise to address with the same shared set of physical resources a large user base with different needs. Thus, clouds promise to be for scientists an alternative to clusters, grids, and supercomputers. However, virtualization may induce significant performance penalties for the demanding scientific computing workloads. In this work we present an evaluation of the usefulness of the current cloud computing services for scientific computing. We analyze the performance of the Amazon EC2 platform using micro-benchmarks and kernels. While clouds are still changing, our results indicate that the current cloud services need an order of magnitude in performance improvement to be useful to the scientific community.',NULL,'Cloud Computing','http://link.springer.com/chapter/10.1007/978-3-642-12636-9_9','Cloud Computing','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'The Cloud Status Team. JSON report crawl (January 2009), http://www.cloudstatus.com/\nThe HPCC Team. HPCChallenge results (Sept. 2009), http://icl.cs.utk.edu/hpcc/hpcc_results.cgi\nAdvanced Clustering Tech. Linpack problem size analyzer (December 2008), http://www.advancedclustering.com/\nAmazon Inc. Amazon Elastic Compute Cloud (Amazon EC2) (September 2009), http://aws.amazon.com/ec2/\nArpaci-Dusseau, R.H., Arpaci-Dusseau, A.C., Vahdat, A., Liu, L.T., Anderson, T.E., Patterson, D.A.: The interaction of parallel and sequential workloads on a network of workstations. In: SIGMETRICS, pp. 267-278 (1995)\nBabcock, M.: XEN benchmarks. Tech. Rep. (August 2007), http://mikebabcock.ca/linux/xen/\nBarham, P., Dragovic, B., Eraser, K., Hand, S., Harris, T.L., Ho, A., Pratt, I., Warfield, A.: Xen and the art of virtualization. In: SOSP. ACM, New York (2003)\nBradshaw, R., Desai, N., Freeman, T., Keahey, K.: A scalable approach to deploying and managing appliances. In: TeraGrid Conference 2007 (June 2007)\nBray, T.: Bonnie, 1996 (December 2008), http://www.textuality.com/bonnie/\nDeelman, E., Singh, G., Livny, M., Berriman, J.B., Good, J.: The cost of doing science on the cloud: the Montage example. In: SC, p. 50. IEEE/ACM (2008)\nDongarra, J., et al.: Basic linear algebra subprograms technical forum standard. Int’l. J. of High Perf. App. and Supercomputing 16(1), 1–111 (2002) CrossRef\nFoster, LT., Freeman, T., Keahey, K., Scheftner, D., Sotomayor, B., Zhang, X.: Virtual clusters for grid communities. In: CCGrid, pp. 513–520. IEEE, Los Alamitos (2006)\nGoGrid. GoGrid cloud-server hosting (September 2009), http://www.gogrid.com\nKowalski, A.: Bonnie — file system benchmarks. Tech. Rep., Jefferson Lab (October 2002), http://cc.jlab.org/docs/scicomp/benchmark/bonnie.html\nLuszczek, P., Bailey, D.H., Dongarra, J., Kepner, J., Lucas, R.F., Rabenseifner, R., Takahashi, D.: S12 — The HPC Challenge (HPCC) benchmark suite. In: SC, p. 213. ACM, New York (2006)\nAssuncao, A.C.M., Buyya, R.: Evaluating the cost-benefit of using cloud computing to extend the capacity of clusters. In: Kranzlmüller, D., Bode, A., Hegering, H.-G., Casanova, H., Gerndt, M. (eds.) 11th IEEE International Conference on High Performance Computing and Communications, HPCC 2009. ACM, New York (2009)\nMcVoy, L., Staelin, C: LMbench — tools for performance analysis (December 2008), http://www.bitmover.com/lmbench/\nMucci, P.J., London, K.S.: Low level architectural characterization benchmarks for parallel computers. Technical Report UT-CS-98-394, U. Tennessee (1998)\nNagarajan, A.B., Mueller, F., Engelmann, C., Scott, S.L.: Proactive fault tolerance for HPC with Xen virtualization. In: ICS, pp. 23–32. ACM, New York (2007)\nNishimura, H., Maruyama, N., Matsuoka, S.: Virtual clusters on the fly — fast, scalable, and flexible installation. In: CCGrid, pp. 549–556. IEEE, Los Alamitos (2007)\nNurmi, D., Wolski, R., Grzegorczyk, C., Obertelli, G., Soman, S., Youseff, L., Zagorodnov, D.: The Eucalyptus open-source cloud-computing system. UCSD Tech. Rep. 2008-10 (2008), http://eucalyptus.cs.ucsb.edu/\nOstermann, S., Prodan, R., Fahringer, T.: Extended grids with cloud resource management for scientific computing. In: Grid 2009: IEEE/ACM International Conference on Grid Computing (October 2009)\nPalankar, M.R., Iamnitchi, A., Ripeanu, M., Garfinkel, S.: Amazon S3 for science grids: a viable solution? In: DADC 2008: Proceedings of the 2008 international workshop on Data-aware distributed computing, pp. 55–64. ACM, New York (2008) CrossRef\nPenguin Computing. Reliable hpc linux systems (September 2009), http://www.penguincomputing.com/\nProdan, R., Ostermann, S.: A survey and taxonomy of infrastructure as a service and web hosting cloud providers. In: Grid 2009: IEEE/ACM International Conference on Grid Computing (October 2009)\nQuétier, B., Néri, V., Cappello, F.: Scalability comparison of four host visualization tools. J. Grid Comput. 5(1), 83–98 (2007) CrossRef\nSotomayor, N., Keahey, K., Foster, I.: Overhead matters: A model for virtual resource management. In: VTDC, pp. 4–11. IEEE, Los Alamitos (2006)\nThain, D., Tannenbaum, T., Livny, M.: Distributed computing in practice: the Condor experience. Conc. & Comp.: Pract. & Exp. 17(2-4), 323–356 (2005) CrossRef\nWalker, E.: Benchmarking Amazon EC2 for HP Scientific Computing. Login 33(5), 18–23 (2008)\nWang, P., Turner, G.W., Lauer, D.A., Allen, M., Simms, S., Hart, D., Papakhian, M., Stewart, C.A.: Linpack performance on a geographically distributed linux cluster. In: IPDPS. IEEE, Los Alamitos (2004)\nWorringen, J., Scholtyssik, K.: MP-MPICH: User documentation & technical notes (June 2002)\nYouseff, L., Seymour, K., You, H., Dongarra, J., Wolski, R.: The impact of paravirtualized memory hierarchy on linear algebra computational kernels and software. In: HPDC, pp. 141–152. ACM, New York (2008) CrossRef\nYouseff, L., Wolski, R., Gorda, B.C., Krintz, C: Paravirtualization for HPC systems. In: Min, G., Di Martino, B., Yang, L.T., Guo, M., Rünger, G. (eds.) ISPA Workshops 2006. LNCS, vol. 4331, pp. 474–486. Springer, Heidelberg (2006)',NULL,'/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/18/A Performance Analysis of EC2 Cloud Computing Services for Scientific Computing.pdf','/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/18/ejs_1.0_developer.zip',NULL,NULL,'2013-12-18 11:32:46',1),(23,'Journal','Cloud Computing','Mirashe, Shivaji P Kalyankar, N V',2010,'9','Computing as you know it is about to change, your applications and documents are going to move from the desktop into the cloud. I\'m talking about cloud computing, where applications and files are hosted on a \"cloud\" consisting of thousands of computers and servers, all linked together and accessible via the Internet. With cloud computing, everything you do is now web based instead of being desktop based. You can access all your programs and documents from any computer that\'s connected to the Internet. How will cloud computing change the way you work? For one thing, you\'re no longer tied to a single computer. You can take your work anywhere because it\'s always accessible via the web. In addition, cloud computing facilitates group collaboration, as all group members can access the same programs and documents from wherever they happen to be located. Cloud computing might sound far-fetched, but chances are you\'re already using some cloud applications. If you\'re using a web-based email program, such as Gmail or Hotmail, you\'re computing in the cloud. If you\'re using a web-based application such as Google Calendar or Apple Mobile Me, you\'re computing in the cloud. If you\'re using a file- or photo-sharing site, such as Flickr or Picasa Web Albums, you\'re computing in the cloud. It\'s the technology of the future, available to use today.',NULL,'cloud; cloud computing; cloud-computing; lista_filtrada; not; notes; print;','http://arxiv.org/abs/1003.4074',NULL,NULL,NULL,NULL,NULL,'Communications of the ACM',51,0,NULL,'10.1145/358438.349303',NULL,'1.Amazon.com CEO Jeff Bezos on Animoto (Apr. 2008); http://blog.animoto.com/2008/04/21/amazon-ceo-jeff-bezos-on-animoto/.\n 2.Amazon S3 Team. Amazon S3 Availability Event (July 20, 2008); http://status.aws.amazon.com/s3-20080720.html.\n 3.Amazon Web Services. TC3 Health Case Study; http://aws.amazon.com/solutions/case-studies/tc3-health/.\n 4.Armbrust, M., et al. Above the clouds: A Berkeley view of cloud computing. Tech. Rep. UCB/EECS-2009-28, EECS Department, U.C. Berkeley, Feb 2009.',NULL,'/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/18/Algorithms papadimitriou.pdf','/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/18/CrackCode.pdf',NULL,NULL,'2013-12-18 10:05:30',1),(31,'Report','Test2','',0,'','',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:05:43',1),(30,'Conference',' Test1','',0,'','',NULL,'','',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:05:25',1),(28,'Book Section','hello','',0,'','',NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:04:50',1),(29,'Journal','which','',0,'','',NULL,'','',NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:05:02',1),(32,'Online','Test3','',0,'','',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:05:56',1),(33,'Conference','MAS','',0,'','',NULL,'','',NULL,NULL,NULL,NULL,NULL,'ACM-MM: ACM Multimedia Conference',NULL,NULL,'New York','',NULL,'',NULL,NULL,NULL,NULL,NULL,'2013-12-18 13:48:07',1),(43,'Book','Test22','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[object Object]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 07:24:25',1),(44,'Book','Test','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"24\",\"title\":\"A Performance Analysis of EC2 Cloud Computing Services for Scientific Computing\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"I love my reference\",\"type\":\"Compare\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 11:49:29',1),(37,'Book','Test2','',0,'','',NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/white123/literatures/2013/12/19/c0861_lecture02.pdf','/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/white123/accessories/2013/12/19/c0861_lecture02.pdf,/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/white123/accessories/2013/12/19/c0861_lecture00.pdf,/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/white123/accessories/2013/12/19/c0861_lecture01.pdf',NULL,NULL,'2013-12-19 03:12:14',17),(45,'Book','Test101','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"1\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 11:52:15',1),(42,'Book','New upload today','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[object Object]',NULL,NULL,NULL,NULL,NULL,'2013-12-20 15:37:33',1),(46,'Book','Test102','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"24\",\"title\":\"A Performance Analysis of EC2 Cloud Computing Services for Scientific Computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 11:53:31',1),(47,'Book','Test03','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"4\",\"title\":\"Multi-agent systems: an introduction to distributed artificial intelligence\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 11:55:07',1),(48,'Book','Test103','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"1\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"I love my reference\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:09:48',1),(49,'Book','Test103','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"1\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"I love my reference\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:12:34',1),(50,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:13:27',1),(51,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:15:11',1),(52,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:15:57',1),(53,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:16:42',1),(54,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:17:32',1),(55,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:18:38',1),(56,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:19:59',1),(57,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:20:39',1),(58,'Book','Test105','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"2\",\"title\":\"A performance analysis of EC2 cloud computing services for scientific computing\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:22:39',1),(59,'Book','Distributed Computing Framework','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"22\",\"title\":\" Cloud Computing and Grid Computing 360-Degree Compared\",\"type\":\"Mention\"},{\"id\":\"\",\"title\":\"Hadoop Distributed Computing Framework\",\"type\":\"Use\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 12:26:25',1),(60,'Book','Test Hadoop 11','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Mention\"},{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Use\"}]',NULL,'/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/literatures/2013/12/21/lecture4 mapreduce.pdf','[\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/21/c0861_assignment02.pdf\",\"/Users/lgrcyanny/Codecookies/Node/PaperBook-MySQL/uploads/lgrcyanny/accessories/2013/12/21/c0861_assignment01.pdf\"]',NULL,NULL,'2013-12-21 14:51:06',1),(61,'Book','Test Hadoop 11','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Mention\"},{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Unknown\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 14:53:03',1),(62,'Book','Test Hadoop 13','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Mention\"},{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Related\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 14:55:04',1),(63,'Book','Test Hadoop 13','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Mention\"},{\"id\":\"4\",\"title\":\"Multi-agent systems: an introduction to distributed artificial intelligence\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 14:55:54',1),(64,'Book','Test Hadoop 13','',0,'',NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"id\":\"59\",\"title\":\"Distributed Computing Framework\",\"type\":\"Mention\"},{\"id\":\"60\",\"title\":\"Test Hadoop 11\",\"type\":\"Mention\"}]',NULL,NULL,NULL,NULL,NULL,'2013-12-21 14:56:52',1);
/*!40000 ALTER TABLE `literatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_daily`
--

DROP TABLE IF EXISTS `log_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `log_at` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogDaily_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_daily`
--

LOCK TABLES `log_daily` WRITE;
/*!40000 ALTER TABLE `log_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_global`
--

DROP TABLE IF EXISTS `log_global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_global` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comments` int(11) unsigned DEFAULT NULL,
  `count_rich_comments` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogGlobal_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_global`
--

LOCK TABLES `log_global` WRITE;
/*!40000 ALTER TABLE `log_global` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_month`
--

DROP TABLE IF EXISTS `log_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogMonth_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_month`
--

LOCK TABLES `log_month` WRITE;
/*!40000 ALTER TABLE `log_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_year`
--

DROP TABLE IF EXISTS `log_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_year` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogYear_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_year`
--

LOCK TABLES `log_year` WRITE;
/*!40000 ALTER TABLE `log_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_year` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
INSERT INTO `references` VALUES (1,1,22,'Mention'),(3,23,22,'Used'),(4,33,22,'Used'),(5,3,22,'Used'),(6,4,22,'Used'),(7,58,2,'Mention'),(8,59,22,'Mention'),(9,60,59,'Use'),(10,61,59,'Unknown'),(11,62,59,'Related'),(12,63,4,'Mention');
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
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `literature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RichComment_User1_idx` (`user_id`),
  KEY `fk_RichComment_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_comments`
--

LOCK TABLES `rich_comments` WRITE;
/*!40000 ALTER TABLE `rich_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `rich_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` decimal(3,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `literature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ScoreList_User1_idx` (`user_id`),
  KEY `fk_Score_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lgrcyanny','lgrcyanny@gmail.com','06e00c339da4debb5c29fb2c216028ab401632bc','610221195374','Cyanny Liang',0,'2013-12-14 13:58:04'),(2,'lgrcyanny1','lgrcyanny@123.com','9bace480f29b2f8c54e7152a31cd88d072eb0ee9','366119282857','Cyanny Liang',0,'2013-12-14 14:05:40'),(3,'lgrcyanny2','lgrcyanny2@123.com','413832b883998cc473a45f96b4774180dd5072a4','82563888511','Cyanny Liang',0,'2013-12-14 14:17:47'),(4,'lgrcyanny3','lgrcyanny3@123.com','1e436f64b463dd7b5f8ff1c287d341fe188c7434','1072216847367','Cyanny Liang',0,'2013-12-14 14:19:53'),(5,'lgrcyanny4','lgrcyanny4@123.com','42e7de2052f78e90a248c355d7c1c57df0b12505','1175016904811','Cyanny Liang',0,'2013-12-14 14:21:16'),(6,'lgrcyanny5','lgrcyanny5@123.com','3f5c787293d72b9c6c70a42f0d56a1f2cb4d4f2f','959777772964','Cyanny Liang',0,'2013-12-14 14:22:57'),(7,'lgrcyanny6','lgrcyanny6@123.com','9a4289d370e7ff31217c203d11b06629a765a2d7','1152264735780','Cyanny Liang',0,'2013-12-14 14:25:53'),(8,'lgrcyanny7','lgrcyanny7@123.com','2019df9c0bf0e8f8eb62d945442a8525e9251f1e','744784746496','Cyanny Liang',0,'2013-12-14 14:31:47'),(9,'lgrcyanny8','lgrcyanny8@123.com','376f103b2b76c9f5ffe3a566d45733896d23a718','352589027968','Cyanny Liang',0,'2013-12-14 14:33:37'),(10,'lgrcyanny9','lgrcyanny9@123.com','1f57fb80e99bb2ff8be61ad21a3914a8a970f4e2','756061636539','Cyanny Liang',0,'2013-12-14 14:35:01'),(11,'lgrcyanny10','lgrcyanny10@example.com','1cd9034875e8ffea75e1f52b913ef809740eaa90','561566861881','Cyanny Liang',0,'2013-12-14 14:39:32'),(12,'lgrcyanny13','lgrcyanny13@gmail.com','e15ecce8fe07b7f0ff8b02a818f9937952b5ed1f','978789057661','Cyanny Liang',0,'2013-12-14 15:09:05'),(13,'lgrcyanny14','lgrcyanny14@123.com','b0b83a9983611ef19735f386fa8f9e8a25345368','762421474905','Cyanny Liang',0,'2013-12-14 15:11:14'),(14,'xiaozhang','xiaozhang@gmail.com','01f0d4b6867167035310b5a7ac2a256087137218','389285910358','Zhang Xiao',0,'2013-12-14 15:29:31'),(15,'wwzyhao','wwzyhao@gmail.com','f5ef9828ad1cf762027e0f428cc6e4bd9d542cac','343710474018','wwzyhao',0,'2013-12-14 15:40:46'),(16,'fengyibin123','fengyibin@gmail.com','0a4a01d6dc2aa97bfadc93376be135a015e79c57','1260146040482','Yibing Feng',0,'2013-12-16 07:16:56'),(17,'white123','white123@gmail.com','94aa857b196c9c94dbca5660f71faa50a7cd9529','487259964559','White ',0,'2013-12-19 03:07:03');
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

-- Dump completed on 2013-12-22 10:26:47
