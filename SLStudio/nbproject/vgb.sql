CREATE DATABASE `sls` DEFAULT CHARSET=utf8;/*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `married` tinyint(4) DEFAULT NULL,
  `blood_type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
