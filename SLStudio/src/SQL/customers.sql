DROP DATABASE sls;
CREATE DATABASE sls DEFAULT CHARSET=utf8;
USE sls;

CREATE TABLE customers (
  id char(10) NOT NULL,
  password varchar(20) NOT NULL,
  name varchar(40) NOT NULL,
  email varchar(50) NOT NULL,
  birthday date NOT NULL,
  gender char(1) NOT NULL,
  phone varchar(30) DEFAULT NULL,
  address varchar(100) DEFAULT NULL,
  married tinyint(4) DEFAULT NULL,
  blood_type varchar(2) DEFAULT NULL,
  discount int(2) NOT NULL DEFAULT '0',
  class_name varchar(20) NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A123123123', '123456', '歐陽飛不飛','test05@gmail.com', '1977-05-20', 'M',
        '23887838','台北市中華路321號10F',false, 'AB', 0, 'Customer');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A123123132', '123456', '王武','FiveWang@gmail.com', '1985-05-15', 'M',
        '0914547865','台北市中華路222號10F',false, 'O', 15, 'VIP');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A123456770', '123456', '李四方','FourLee@gmail.com', '1944-04-14', 'M',
        '0950156475','台北市復興北路99號30樓',true, 'A',0, 'Customer');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A213555357', '123456', '李四娘','FourLeeWoman@gmail.com', '1994-03-19', 'F',
        '0992546879','高雄市中央路13號',false, 'A', 15, 'VIP');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A22111145', '123456', '歐陽飛飛','test03@gmail.com', '1978-02-28', 'F',
        '25149191','台北市復興北路99號14樓',false, 'AB', 15, 'VIP');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A222111005', '123456', '甄煩','jenfan@gmail.com', '1894-03-19', 'F',
        '0957894513','台北市故宮36號',false, 'O', 0, 'Customer');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('A223456781', '123456', '梅有莉','test02@gmail.com', '1978-02-28', 'F',
        '25149191','台北市復興北路99號8樓',false, 'A', 0, 'Customer');

INSERT INTO customers (id,password,name,email, birthday, gender,
                         phone, address, married, blood_type, discount, class_name)
VALUES ('E279729353', '123456', '魏因諾','inluo@gmail.com', '1894-03-19', 'F',
        '0991546879','高雄市延禧宮1號',false, 'AB', 0, 'Customer');

