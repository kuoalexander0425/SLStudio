CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(45) NOT NULL DEFAULT 'Product',
  `brand_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

INSERT INTO `sls`.`products`
(`id`,
`name`,
`photo_url`,
`description`,
`discount`,
`class_name`,
`brand_name`)
select distinct 0 as id,
`name`,
`photo_url`,
`description`,
`discount`,
`class_name`,
`brand_name` from old_products group by name;

CREATE TABLE `products_size` (
  `product_id` int(10) unsigned NOT NULL,
  `size` int(10) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO products_size(product_id,size,unit_price,stock)
select products.id, old_products.size, old_products.unit_price, 
sum(old_products.stock) as stock
from products JOIN old_products ON products.name = old_products.name
GROUP BY products.id, old_products.size 
ORDER BY products.id, old_products.size;

(new)
INSERT INTO products_size(product_id,size,unit_price,stock)
select products.id, old_products.size, max(old_products.unit_price) as unit_price, 
sum(old_products.stock) as stock
from products JOIN old_products ON products.name = old_products.name
GROUP BY products.id, old_products.size
ORDER BY products.id, old_products.size;
