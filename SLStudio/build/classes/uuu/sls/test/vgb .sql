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

DROP TABLE `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL, 
  `size` int(10) NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `photo_url` varchar(250) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(45) NOT NULL DEFAULT 'Product',
  `brand_name` varchar(30) NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 能量豐茂洗髮露',1000,2000, 10,'https://s.yimg.com/zp/images/E6E5919F99D5960A28EF22ED1E0D5D3AC42C2431','潔淨並能強韌髮絲,適合脆弱稀疏落髮傾向頭皮及細軟髮使用.活絡髮絲健康,促進頭皮血液循換', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 能量豐茂凝',150,930, 10,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/131/21/N011312125_t_01.jpg&v=5abe0cbc','強健頭皮滋養髮根，減少頭髮斷裂，洗後有清涼舒適感,.增加頭皮健康環境，強健髮根,不需沖洗', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養奇蹟洗髮',1000,1600, 5,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/118/14/N011181401_t_01.jpg&v=5993e885','染燙後專用,極度保濕具護色功效', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養奇蹟潤髮',250,800, 10,'https://tshop.r10s.com/e4849160-ec8b-11e4-8128-005056b73023/upload/Davines/gg.,250jpg','修護潤澤髮絲,適合乾燥,缺水脆弱髮值', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養奇蹟潤髮',250,1200, 10,'https://s.yimg.com/zp/images/D6EB0E3DC30A87C87D21C3BC6D9BB28BD8EFC392','適用燙染髮後,需沖洗,極具保濕護色', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養奇蹟酵素露',750,1000, 10,'https://tshop.r10s.com/e4849160-ec8b-11e4-8128-005056b73023/upload/20140715/DAV01000995-0.jpg'
,'乾燥缺水頭皮 極度受損之脆弱髮質', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養蜂王乳強效菁華',500,3200, 5,'https://tshop.r10s.com/e4849160-ec8b-11e4-8128-005056b73023/upload/Davines/hh.jpg','頂級修護保養頭皮,加強補充礦物質與維他命,添加高度活性成分：頂級蜂王乳', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 滋養奇蹟菁華',1000,4000, 10,'http://d30211wr5689p1.cloudfront.net/pdimg/05240081/05240081-01.jpg','深層修護保養染燙後極度受損髮質,幫助重建頭髮結構,亦建議燙染前一週使用,保護頭髮結構避免受損.', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 純淨抗屑洗髮',1000,2000, 5,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/118/13/N011181378_t_01.jpg&v=5993e2e4','淨化皮屑專用,頂級香氛：薰衣草 / 沒藥 / 鼠尾草精油', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 純淨抗屑凝',150,930, 10,'https://img4.momoshop.com.tw/expertimg/0004/919/143/12-1.jpg?t=1525190221015','深層抗屑養護,針對頭皮屑有效調理,潔淨抗菌並維持頭皮健康', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 平衡控油洗髮',1000,2000, 10,'https://fs1.shop123.com.tw/200502/upload/product/2005026435pic_outside_126565.jpg','潔淨並調理頭皮,改善油脂分泌過剩困擾同時清潔及鎮靜皮脂腺', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 深層淨化洗髮',1000,2000, 15,'https://a.ecimg.tw/items/DDBX3VA9005U07D/i010001_1462948282.jpg','深層潔淨頭皮與髮絲,溫和去角質.適合因外在環境污染造成的壓力頭皮與頭髮使用,使頭皮恢復生氣與活力', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 深層淨化強效菁華',500,1800, 3,'https://www.5866.com.tw/images/201508/goods_img/3989_G_1440112179329.jpg','深層潔淨養護頭皮.於洗髮前深層前鏡頭皮,使後續洗護能更有效吸收,並促進頭皮細胞健康,防止老化傷害.', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 康敏舒緩洗髮',1000,2000, 5,'https://tshop.r10s.com/e4849160-ec8b-11e4-8128-005056b73023/upload/Davines/e.,1000jpg','潔淨並舒緩敏感頭皮,減緩頭皮敏感搔癢之情形', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 康敏舒緩強效菁華',100,1700, 10,'https://f.ecimg.tw/items/DDBXCUA9008HDMQ/000001_1508404091.jpg','免沖洗高純度菁華,減緩頭皮發紅,敏感與搔癢', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 樂活紫菊洗髮',1000,1800, 5,'https://www.5866.com.tw/images/201312/goods_img/1330_P_1386110218473.jpg','有效溫和清潔,適合所有髮質', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 樂活紫菊潤髮',1000,2500, 5,'http://d30211wr5689p1.cloudfront.net/pdimg/05240083/05240083-01.jpg',
'保濕潤髮霜,適合所有髮質', 10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 樂活全效保濕',250,720, 10,'https://www.5866.com.tw/images/201401/goods_img/101_G_1389293792628.jpg',
'頭髮和肌膚皆適用之免沖洗雙效保濕霧',10,'Outlet','Davines');


INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 樂活頭皮按摩露',500,1600, 3,'https://s.yimg.com/zp/MerchandiseImages/F0DABFD0AA-SP-5931933.jpg','頭皮按摩專用凝露,滋養並促進微循環,增加頭皮彈力韌性', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯 埃及紅花全能清潔露',280,880, 10,'https://www.5866.com.tw/images/201508/goods_img/3999_G_1440118211344.jpg','珍貴有機埃及紅花油,讓清潔露的質地極度溫和與滋潤,具有強效保濕,抗老化功能,能夠保護肌膚彈性,維持秀髮年輕.', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花全能清潔露',900,2400, 10,'https://www.5866.com.tw/images/201508/goods_img/3999_G_1440118211344.jpg','珍貴有機埃及紅花油,讓清潔露的質地極度溫和與滋潤,具有強效保濕,抗老化功能,能夠保護肌膚彈性,維持秀髮年輕.', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花全能潤髮潔夫膏',150,880, 10,'https://www.5866.com.tw/images/201508/goods_img/3998_G_1440117783280.jpg','含有機埃及紅花油、有機向日葵籽油、有機荷荷芭油、有機乳油木果油。潤髪潤膚保養適合所有類型頭髮/臉部肌膚/身體肌膚', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花全能潤髮潔夫膏',900,2400, 10,'https://www.5866.com.tw/images/201508/goods_img/3998_G_1440117783280.jpg','含有機埃及紅花油、有機向日葵籽油、有機荷荷芭油、有機乳油木果油。潤髪潤膚保養適合所有類型頭髮/臉部肌膚/身體肌膚', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花全能清潔露',900,2400, 10,'https://www.5866.com.tw/images/201508/goods_img/3999_G_1440118211344.jpg','珍貴有機埃及紅花油,讓清潔露的質地極度溫和與滋潤,具有強效保濕,抗老化功能,能夠保護肌膚彈性,維持秀髮年輕.', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花高效修護霜',200,1200, 10,'https://www.5866.com.tw/images/201508/goods_img/3999_G_1440118211344.jpg','珍貴有機埃及紅花油,讓清潔露的質地極度溫和與滋潤,具有強效保濕,抗老化功能,能夠保護肌膚彈性,維持秀髮年輕.', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'達芬尼斯埃及紅花高效修護霜',1000,4400, 10,'https://www.5866.com.tw/images/201508/goods_img/3999_G_1440118211344.jpg','珍貴有機埃及紅花油,讓清潔露的質地極度溫和與滋潤,具有強效保濕,抗老化功能,能夠保護肌膚彈性,維持秀髮年輕.', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人油',50,800, 5,'https://d30211wr5689p1.cloudfront.net/pdImg/05240018/05240018-01_W478H359Q80I5P.jpg?DT=20180207143058','絲質閃亮，秀髮易梳理，抗濕氣，抗毛燥 ', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人油', 135,1680, 8,'https://ct.yimg.com/xd/api/res/1.2/Pfb13TU.F.DgR334qBFJOw--/YXBwaWQ9eXR3YXVjdGlvbnNlcnZpY2U7aD01MDA7cT04NTtyb3RhdGU9YXV0bzt3PTUwMA--/https://s.yimg.com/ob/image/1a8d360c-52d7-4257-b0f7-dc2fda1115bb.jpg','絲質閃亮，秀髮易梳理，抗濕氣，抗毛燥 ', 10,'Outlet','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人精華噴霧',50,540, 10,'https://b.ecimg.tw/items/DDBX7KA9006JZ6D/000001_1478485553.jpg','適合所有髮質 提供加倍清爽的完美滋,ㄝ含珍貴蘿蔻油的免沖洗菁華噴霧乳，特殊豐盈與滋養配方具有增進髮絲柔軟絲滑光澤度及優異抗糾結的潤澤效果，縮短吹乾時間、防止熱傷害並提供長效自然的髮型，質地更加清爽，吸收更迅速。', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人精華噴霧',135,1080, 10,'https://b.ecimg.tw/items/DDBX7KA9006JZ6D/000001_1478485553.jpg','適合所有髮質 提供加倍清爽的完美滋,ㄝ含珍貴蘿蔻油的免沖洗菁華噴霧乳，特殊豐盈與滋養配方具有增進髮絲柔軟絲滑光澤度及優異抗糾結的潤澤效果，縮短吹乾時間、防止熱傷害並提供長效自然的髮型，質地更加清爽，吸收更迅速。.', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人洗髮乳',280,780, 10,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/136/12/N011361299_t_01.jpg&v=5b221979','適合所有髮質.含東方多種植物果油配方，可讓頭髮髮質柔順光澤。 ', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人洗髮乳',1000,2400, 10,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/136/12/N011361299_t_01.jpg&v=5b221979','適合所有髮質.含東方多種植物果油配方，可讓頭髮髮質柔順光澤。', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人輕髮膜',250,980, 10,'https://tshop.r10s.com/201/f38/22e8/e50b/0033/68a0/9026/1173e8869f2c600c737442.jpg','適合所有髮質.含東方多種植物果油配方，可讓頭髮髮質柔順光澤。', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人輕髮膜',1000,3600, 5,'https://tshop.r10s.com/201/f38/22e8/e50b/0033/68a0/9026/1173e8869f2c600c737442.jpg','適合所有髮質.含東方多種植物果油配方，可讓頭髮髮質柔順光澤。', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'東方美人柔芙霜',1200,1200, 3,'https://tshop.r10s.com/abd/dac/ba6a/a961/9006/681c/8f71/1189e8b15854ab3a294904.jpg','奢華的質地帶來深層的水嫩滋潤效果', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色洗髮露',250,700, 15,'https://s.yimg.com/zp/images/F2E1C28230146F345F56907AFBF3489616C93473','可修護染後受損髮質,展現秀髮豐盈光澤,並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色洗髮露',1000,2100, 10,'https://s.yimg.com/zp/images/F2E1C28230146F345F56907AFBF3489616C93473','可修護染後受損髮質,展現秀髮豐盈光澤,並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色輕髮膜',250,800, 10,'https://s.yimg.com/zp/images/DD2389399965F010E8F61089CE394A6E368044F2','可修護染後受損髮質,展現秀髮豐盈光澤,使髮絲柔順不糾結.並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色輕髮膜',1000,2500, 10,'https://s.yimg.com/zp/images/DD2389399965F010E8F61089CE394A6E368044F2','可修護染後受損髮質,展現秀髮豐盈光澤,使髮絲柔順不糾結.並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色強化髮膜',250,1200, 10,'https://d30211wr5689p1.cloudfront.net/pdImg/05240073/05240073-01_W478H359Q100I5P.jpg?DT=20180507161831','可修護染後受損髮質,深層滋潤,使髮絲柔順不糾結.並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色強化髮膜',1000,3600, 10,'https://d30211wr5689p1.cloudfront.net/pdImg/05240073/05240073-01_W478H359Q100I5P.jpg?DT=20180507161831','可修護染後受損髮質,深層滋潤,使髮絲柔順不糾結.並使髮色亮麗持久', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'霓霧亮色菁露',150,1120, 5,'https://www.5866.com.tw/images/201509/goods_img/4091_G_1441340346193.jpg','適合所有髮質.含東方多種植物果油配方，可讓頭髮髮質柔順光澤。', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力洗髮露',250,700, 15,'https://s.yimg.com/zp/images/B76C547E1BEE7519F129628D8B1309ED045EE5AD','有效清潔滋潤髮絲,使之自然蓬鬆,玫瑰油萃取物賦予極佳光澤', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力洗髮露',1000,2100, 10,'https://s.yimg.com/zp/images/B76C547E1BEE7519F129628D8B1309ED045EE5AD','有效清潔滋潤髮絲,使之自然蓬鬆,玫瑰油萃取物賦予極佳光澤', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力輕髮膜',250,800, 15,'https://s.yimg.com/zp/images/E169C7519EC98C6D7AB28FBB093D092B51DA89C5','富含杏仁脂,可深層滋潤受損髮質,使髮絲柔順', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力輕髮膜',1000,2500, 10,'https://s.yimg.com/zp/images/E169C7519EC98C6D7AB28FBB093D092B51DA89C5','富含杏仁脂,可深層滋潤受損髮質,使髮絲柔順', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力強化髮膜',250,1200, 10,'https://s.yimg.com/zp/images/E169C7519EC98C6D7AB28FBB093D092B51DA89C5','富含橄欖脂,可深層滋潤受損髮質,使髮絲柔順', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'暖暖彈力強化髮膜',1000,3600, 10,'https://s.yimg.com/zp/images/E169C7519EC98C6D7AB28FBB093D092B51DA89C5','富含橄欖脂,可深層滋潤受損髮質,使髮絲柔順', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甘露水洗髮露',250,700, 10,'https://s.yimg.com/zp/images/7A3EA97B9F7F948D8F2D24326A19D625C27E76FC','深層水潤洗髮露,能夠鎖住水分,長效水潤', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甘露水潤洗髮露',1000,2100, 10,'https://s.yimg.com/zp/images/7A3EA97B9F7F948D8F2D24326A19D625C27E76FC','深層水潤洗髮露,能夠鎖住水分,長效水潤', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甘露水潤輕髮膜',250,800, 10,'http://edge.shop.com/ccimg.shop.com/240000/247100/247162/products/1403545713.jpg','能滋養,撫平毛燥受損髮質.使髮絲柔順,絲滑不糾結', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甘露水潤輕髮膜',1000,2500, 10,'http://edge.shop.com/ccimg.shop.com/240000/247100/247162/products/1403545713.jpg','能滋養,撫平毛燥受損髮質.使髮絲柔順,絲滑不糾結', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甘露水潤魔法露',150,1120, 10,'https://s.yimg.com/zp/MerchandiseSpec/2D2B290788-SP-5931698.jpg','免沖洗配方,深層保濕能讓髮絲柔軟不扁塌,使用後自然亮澤', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'四季活力洗髮露',250,700, 10,'https://s.yimg.com/ut/api/res/1.2/o_HZNENwaq5Ai.E0iB9xyA--~B/YXBwaWQ9eXR3bWFsbDtjYz0zMTUzNjAwMDtoPTYwMDtxPTgxO3c9NjAw/https://s.yimg.com/fy/d6ca/item/p0049153417637-item-4064xf4x0500x0500-m.jpg','活力洗髮露,泡沫細緻綿密,溫和清潔頭髮,適合每日使用.', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'四季活力洗髮露',1000,2100, 10,'https://s.yimg.com/ut/api/res/1.2/o_HZNENwaq5Ai.E0iB9xyA--~B/YXBwaWQ9eXR3bWFsbDtjYz0zMTUzNjAwMDtoPTYwMDtxPTgxO3c9NjAw/https://s.yimg.com/fy/d6ca/item/p0049153417637-item-4064xf4x0500x0500-m.jpg','活力洗髮露,泡沫細緻綿密,溫和清潔頭髮,適合每日使用.', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'四季活力輕髮膜',250,800, 10,'https://www.5866.com.tw/images/201508/goods_img/4003_G_1440328600014.jpg','質地細緻的輕髮膜,適合所有髮質', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'四季活力輕髮膜',1000,2500, 10,'https://www.5866.com.tw/images/201508/goods_img/4003_G_1440328600014.jpg','質地細緻的輕髮膜,適合所有髮質', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'四季活力護髮霧',250,2400, 10,'https://im2.book.com.tw/image/getImage?i=http://www.books.com.tw/img/N01/120/62/N011206208_t_01.jpg&v=59c4b658','免沖洗護髮噴霧,保濕同時滋潤秀髮.適合作為染燙前的護理', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甜愛捲俏洗髮露',250,700, 10,'https://ct.yimg.com/xd/api/res/1.2/bQAtQGI.wFPUGeHHVGg6ng--/YXBwaWQ9eXR3YXVjdGlvbnNlcnZpY2U7aD02MDA7cT04NTtyb3RhdGU9YXV0bzt3PTYwMA--/https://s.yimg.com/ob/image/cc05fdb3-02ea-4511-b1c4-99b09b5b95fc.jpg','能讓捲髮保持完美捲度,使髮絲柔順輕盈有彈性', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甜愛捲俏洗髮露',1000,2100, 10,'https://ct.yimg.com/xd/api/res/1.2/bQAtQGI.wFPUGeHHVGg6ng--/YXBwaWQ9eXR3YXVjdGlvbnNlcnZpY2U7aD02MDA7cT04NTtyb3RhdGU9YXV0bzt3PTYwMA--/https://s.yimg.com/ob/image/cc05fdb3-02ea-4511-b1c4-99b09b5b95fc.jpg','能讓捲髮保持完美捲度,使髮絲柔順輕盈有彈性', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甜愛捲俏輕髮膜',250,800, 10,'https://www.5866.com.tw/images/201508/goods_img/84_G_1440329836238.jpg','能使髮絲展現柔軟彈性與光澤,使頭髮自然蓬鬆', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甜愛捲俏輕髮膜',1000,2500, 10,'https://www.5866.com.tw/images/201508/goods_img/84_G_1440329836238.jpg','能使髮絲展現柔軟彈性與光澤,使頭髮自然蓬鬆', 0,'Product','Davines');

INSERT INTO products
    (id,name,size,unit_price,stock,photo_url,description,discount,class_name,brand_name)
VALUES (0,'甜愛捲俏精華乳',150,1120, 10,'https://s.yimg.com/zp/MerchandiseImages/E44F45E002-SP-5931795.jpg','免沖洗配方,可加強捲度紋理,使頭髮保持柔軟彈性與光澤.含天然聚合物根瘤菌膠,擁有極佳保濕效果.', 0,'Product','Davines');


CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` char(10) NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `addressee_name` varchar(40) NOT NULL,
  `addressee_email` varchar(50) NOT NULL,
  `addressee_phone` varchar(30) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) DEFAULT NULL,
  `shipping_type` varchar(45) NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_note` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fkey_orders_customers_idx` (`customer_id`),
  CONSTRAINT `fkey_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `size` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`size`),
  KEY `fkey_order_items_products_idx` (`product_id`),
  CONSTRAINT `fkey_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkey_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
