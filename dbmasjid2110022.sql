/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.28-MariaDB : Database - dbdigitalmasjid
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbdigitalmasjid` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbdigitalmasjid`;

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `idagenda` int(11) NOT NULL,
  `namakegiatan` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  PRIMARY KEY (`idagenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `agenda` */

/*Table structure for table `pengurus` */

DROP TABLE IF EXISTS `pengurus`;

CREATE TABLE `pengurus` (
  `idpengurus` char(11) NOT NULL,
  `namapengurus` varchar(35) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idpengurus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengurus` */

insert  into `pengurus`(`idpengurus`,`namapengurus`,`jabatan`,`alamat`,`nohp`) values ('P001','ANGGI','GARIN','JLN SITEBA RAYA','082319682711'),('P002','SHANDRA MONALISA','DAKWAH','JLN KHATIB SULAIMAN NO 28','0831579926636'),('P003','NANA LISA','BENDAHARA','JLN SITEBA ','0877564534535');

/*Table structure for table `tbl_agenda` */

DROP TABLE IF EXISTS `tbl_agenda`;

CREATE TABLE `tbl_agenda` (
  `id_agenda` char(11) NOT NULL,
  `nama_kegiatan` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `jenis_kegiatan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_agenda` */

/*Table structure for table `tbl_kas_keluar` */

DROP TABLE IF EXISTS `tbl_kas_keluar`;

CREATE TABLE `tbl_kas_keluar` (
  `idkaskeluar` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `kaskeluar` double DEFAULT NULL,
  `jeniskas` varchar(100) DEFAULT NULL,
  `idagendakas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idkaskeluar`),
  KEY `id_agendakas` (`idagendakas`),
  CONSTRAINT `tbl_kas_keluar_ibfk_1` FOREIGN KEY (`idagendakas`) REFERENCES `agenda` (`idagenda`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_kas_keluar` */

/*Table structure for table `tbl_kas_masjid` */

DROP TABLE IF EXISTS `tbl_kas_masjid`;

CREATE TABLE `tbl_kas_masjid` (
  `idkasmasjid` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `kasmasuk` double DEFAULT NULL,
  `jeniskas` varchar(50) DEFAULT NULL,
  `iddonaturmasjid` int(10) DEFAULT NULL,
  PRIMARY KEY (`idkasmasjid`),
  KEY `iddonaturmasjid` (`iddonaturmasjid`),
  CONSTRAINT `tbl_kas_masjid_ibfk_1` FOREIGN KEY (`iddonaturmasjid`) REFERENCES `tbl_donatur` (`iddonatur`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbl_kas_masjid` */

insert  into `tbl_kas_masjid`(`idkasmasjid`,`tanggal`,`ket`,`kasmasuk`,`jeniskas`,`iddonaturmasjid`) values (19,'2024-01-01','Sumbangan Yola',1500000,'mesjid',NULL),(20,'2024-01-04','Sumbangan Hari Jum\'at',2000000,'sosial',NULL),(23,'2024-01-07','Renovasi Mesjid',0,'mesjid',NULL),(25,'2024-01-09','Lomba MTQ',0,'TPQ',NULL),(26,'2024-01-09','Gotong Royong',0,'sosial',NULL),(28,'2024-01-11','Sumbangan Hari Jum\'at',1000000,'TPQ',NULL),(29,'2024-01-02','Santunan Anak Yatim',0,'anakyatim',NULL),(30,'2024-01-02','Sumbangan Hari Jum\'at',700000,'anak yatim',NULL),(33,'2024-01-11','Donasi',1200000,'TPQ',2),(34,'2024-01-15','infak hari jum\'at',270000,'TPQ',2),(37,'2024-01-17','Donasi',1000000,'anak yatim',3);

/*Table structure for table `tbl_pengurus` */

DROP TABLE IF EXISTS `tbl_pengurus`;

CREATE TABLE `tbl_pengurus` (
  `id_pengurus` char(11) NOT NULL,
  `nama_pengurus` varchar(35) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbl_pengurus` */

insert  into `tbl_pengurus`(`id_pengurus`,`nama_pengurus`,`jabatan`,`alamat`,`no_hp`) values ('P002','Wawan','Guru MDA','Jl. Pasar Raya','081232437573'),('P001','Wandi','Garin','Jl. Pandan Wangi','081237473834'),('P003','Wati','Guru ','Jl. Pasar Raya','081237473834');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` char(5) NOT NULL,
  `nama_user` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`nama_user`,`email`,`password`,`level`) values ('2','ini','ini@gmail.com','$2y$10$H9IHVTrp0YewBFdGNz47teM/faVTzUm1tJ7HTFnWhjK/NCpIoad9i',1),('3','lala','yolandassaadah03@gmail.com','$2y$10$VSqHtLSPL8eDZfUgdoyhxuiwPQ2IKqQDtlFGSrTBX6pO.c2gVYqbm',3),('4','wendy','wd@yahoo.co.id','$2y$10$tqf/msOLebS8UuXZZo5WQui7kRLZFzSMz1GZSQy2IAIyON8YooqpW',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
