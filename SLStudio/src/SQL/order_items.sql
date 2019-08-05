
CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `size` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
--   KEY `fkey_order_items_products_idx` (`product_id`),
--   CONSTRAINT `fkey_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fkey_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
