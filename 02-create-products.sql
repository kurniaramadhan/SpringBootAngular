-- -----------------------------------------------------
-- Schema full-stack-ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-ecommerce`;

CREATE SCHEMA `full-stack-ecommerce`;
USE `full-stack-ecommerce` ;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
   `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

INSERT INTO product_category(category_name) VALUES ('GROCERIES');

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('PO-1000', 'Jeruk Navel Impor', 'Jeruk sunkist dengan ukuran pusar yang besar. Rasanya manis asam segar. Cocok dikonsumsi sebagai camilan atau pencuci mulut. Produk ini dapat digunakan sebagai menu MPASI.',
'assets/images/products/placeholder.png'
,1,100,19.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('PO-1001', 'Daging Rendang Fadagi', 'Daging sapi lokal beku pilihan yang cocok untuk rendang. Teksturnya tidak mudah hancur, sehingga sangat cocok untuk proses memasak yang lama. Diproses halal. Daging dipastikan aman dan berkualitas. Berat produk dapat berkurang 10% dari berat beku.',
'assets/images/products/placeholder.png'
,1,100,29.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('PO-1002', 'Pisang Uli', 'Pisang konvensional akan matang sempurna dalam 2-3 hari. Pisang uli adalah jenis pisang yang paling manis. Daging buahnya lembut, empuk, dan agak lembek. Pisang ini bisa diolah menjadi camilan seperti sale atau keripik pisang.',
'assets/images/products/placeholder.png'
,1,100,24.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('PO-1003', 'Jambu Biji Merah', 'Jambu biji memiliki kulit tipis yang bisa dimakan. Rasanya manis saat matang dan memiliki aroma khas. Tekstur buahnya renyah, agak keras. Sehingga nikmat dikonsumsi sebagai camilan sehat.',
'assets/images/products/placeholder.png'
,1,100,29.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('PO-1004', 'Semangka Merah Baby', 'Semangka merah memiliki daging buah berwarna merah. Rasa manisnya terasa halus dan ringan. Semangka memiliki kandungan air yang tinggi sehingga terasa segar saat dikonsumsi.',
'assets/images/products/placeholder.png'
,1,100,24.99,1, NOW());
