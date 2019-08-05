CREATE DATABASE `sls` DEFAULT CHARSET=utf8;/*!40100 DEFAULT CHARACTER SET utf8 */;

USE sls;

CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `married` tinyint(4) DEFAULT NULL,
  `blood_type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `customers` (id, password, name, email, birthday, gender)
    VALUES ('A123456789', '123456', '張三豐', 'test01@gmail.com', '1998-09-09', 'M');

INSERT INTO `customers` (`id`,`password`,`name`, `email`, `birthday`, `gender`,
`phone`, `address`, `married`, `blood_type`)
    VALUES ('A223456781', '123456', '梅有莉','test02@gmail.com', '1978-02-28', 'F',
        '25149191','台北市復興北路99號14樓',false, 'AB');
